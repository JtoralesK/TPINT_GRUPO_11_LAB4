<%@page import="java.util.List"%>
<%@page import="entidad.cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	request.setAttribute("titulo", "Clientes");
	int paginaActual = (Integer) request.getAttribute("paginaActual");
	int totalPaginas = (Integer) request.getAttribute("totalPaginas");
	List<cliente> listadoClientes = (List<cliente>) request.getAttribute("listaPaginada");
%>
<jsp:include page="head.jsp"/>
</head>
<body class="bg-gray-100">
	<jsp:include page="navbar.jsp" />
	<div class="flex justify-center">
		<div class="flex m-4 w-11/12 justify-between">
		    <form action="/ProjectBeta1/servletCliente" method="get">
		        <label for="busqueda" class="sr-only">B�squeda:</label>
		        <input type="text" id="busqueda" name="busqueda" placeholder="Buscar..." class="w-64 border border-gray-300 rounded-md p-2">
		        
		        <select id="estado" name="filtroEstado" class="w-64 border border-gray-300 rounded-md p-2">
				    <option value="true" <%= request.getParameter("filtroEstado") != null && request.getParameter("filtroEstado").equals("true") ? "selected" : "" %>>Activo</option>
				    <option value="false" <%= request.getParameter("filtroEstado") != null && request.getParameter("filtroEstado").equals("false") ? "selected" : "" %>>Inactivo</option>
				    <option value="all" <%= request.getParameter("filtroEstado") != null && request.getParameter("filtroEstado").equals("all") ? "selected" : "" %>>Todos</option>
				</select>
		        <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded ml-2">Buscar</button>
		    </form>
		</div>
	</div>
	<div class="flex justify-center">
	
	<table class="w-11/12 bg-white p-4 shadow-md rounded-md mb-4 mx-auto table-fixed">
		<thead>
			<tr>
				<th class="px-4 py-2">Id</th>
				<th class="px-4 py-2">Dni</th>
				<th class="px-4 py-2">Cuil</th>
				<th class="px-4 py-2">Nombre</th>
				<th class="px-4 py-2">Apellido</th>
				<th class="px-4 py-2">Fecha de nacimiento</th>
				<th class="px-4 py-2">Mail</th>
				<th class="px-4 py-2">Telefono</th>
				<th class="px-4 py-2" colspan="2">Acciones</th>
			</tr>
		</thead>
		<tbody>
			<%
		    if (listadoClientes != null && !listadoClientes.isEmpty()) {
		        for (cliente cliente : listadoClientes) {
		    %>
		    <tr>
		        <td class="border px-4 py-2 break-words"><%= cliente.getId() %></td>
		        <td class="border px-4 py-2 break-words"><%= cliente.getDni() %></td>
		        <td class="border px-4 py-2 break-words"><%= cliente.getCuil() %></td>
		        <td class="border px-4 py-2 break-words"><%= cliente.getNombre() %></td>
		        <td class="border px-4 py-2 break-words"><%= cliente.getApellido() %></td>
		        <td class="border px-4 py-2 break-words"><%= cliente.getFechaNacimiento() %></td>
		        <td class="border px-4 py-2 break-words"><%= cliente.getEmail() %></td>
		        <td class="border px-4 py-2 break-words"><%= cliente.getTelefono() %></td>
		        <td class="border px-4 py-2" colspan="2">
		        	<div class="flex space-x-4">
			            <form action="/ProjectBeta1/servletCliente" method="get">
			                <input type="hidden" name="btnModificarCliente" value="<%= cliente.getId() %>">
			                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" type="submit" name="btnModificar">Ver/Editar</button>
			            </form>
				        <% if (cliente.getEstado()) { %>
						    <button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" type="button" name="btnEliminar" onclick="openModal('eliminar', '<%= cliente.getId() %>')">Eliminar</button>
						<% } else { %>
						    <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded" type="button" name="btnActivar" onclick="openModal('activar', '<%= cliente.getId() %>')">Activar</button>
						<% } %>
		        	</div>
		        </td>

		    </tr>
		    <%
		        }
		    }else {
		    %>
		    <tr>
                <td colspan="10" class="border px-4 py-2 text-center">No hay datos disponibles</td>
            </tr>
            <%
            }
            %>
		</tbody>
	</table>
	
	</div>
		<jsp:include page="paginacion.jsp" />
		<jsp:include page="modal.jsp" />
	
	<!-- MODAL DE CONFIRMACI�N -->
		<div id="confirmModal" class="fixed inset-0 bg-gray-900 bg-opacity-50 flex items-center justify-center hidden">
		  <div class="bg-white p-8 rounded shadow-lg">
		    <p id="modalText" class="text-gray-700"></p>
		    <div class="mt-4 flex justify-end">
		      <form id="confirmForm" action="/ProjectBeta1/servletCliente" method="post">
		        <input type="hidden" name="btnToggleEstado" id="btnToggleEstado" value="">
		        <button id="confirmBtn" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded mr-2" type="submit"></button>
		      </form>
		      <button class="bg-gray-300 hover:bg-gray-400 text-gray-700 font-bold py-2 px-4 rounded" onclick="closeModal()">Cancelar</button>
		    </div>
		  </div>
		</div>

	
	<script>
		function openModal(action, clientId) {
		    const modal = document.getElementById("confirmModal");
		    const confirmBtn = document.getElementById("confirmBtn");
		    const btnToggleEstado = document.getElementById("btnToggleEstado");
		    const modalText = document.getElementById("modalText");
	
		    var actionText = '';
		    if(action == "eliminar"){
		    	actionText = 'Eliminar';
		    	modalText.textContent = 'Seguro que desea eliminar el cliente '+ clientId +'?';
		    }else{
		    	actionText = 'Reactivar';
		    	modalText.textContent = 'Seguro que desea reactivar el cliente '+ clientId + '?';
		    }
		    
		    confirmBtn.textContent = actionText; 
		    confirmBtn.onclick = function () {
		        btnToggleEstado.value = clientId;
		        document.getElementById("confirmForm").submit();
		        closeModal();
		    };
	
		    modal.style.display = "flex";
		}

		function closeModal() {
		  const modal = document.getElementById("confirmModal");
		  modal.style.display = "none";
		}

		window.onclick = function (event) {
		  const modal = document.getElementById("confirmModal");
		  if (event.target === modal) {
		    modal.style.display = "none";
		  }
		};
	</script>
	
</body>
</html>