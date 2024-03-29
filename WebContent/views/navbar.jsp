<%@page import="entidad.Config"%>
<%@page import="entidad.eTipoUsuario"%>
<%@page import="entidad.Usuario"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css"></head>

<%
	Usuario user = (Usuario) session.getAttribute("loggedUser");
	String bgColor = "bg-gray-200"; 

	if (user != null && user.getTipoUsuario() == eTipoUsuario.Administrador) {
    bgColor = "bg-red-200"; 
	}
	//Logo rojo admin / gris usuario
	if(Config.isDevMode()){
%>
	<div class="w-full bg-amber-100 p-2 flex items-center justify-center ">
		<p class="text-sm mr-4 text-black">devMode activado</p>
        <form method="post" action="<%= request.getContextPath() %>/servletConfig">
            <input type="hidden" name="toggleUserType" value="true">
            <button type="submit" class="bg-blue-500 text-white px-2 py-1 rounded">Cambiar tipo de usuario</button>
        </form>
	</div>
	<%}%>	
<nav class="w-full h-20 bg-white p-5 flex flex-row justify-between items-center border-b border-gray-300">
	<a href="/ProjectBeta1/views/home.jsp" class="group-hover:bg-gray-200 focus:outline-none"><img class="h-15 w-20"  src="/ProjectBeta1/views/Resources/bankLogo.png"></img></a>
	<div class="w-8/12 w-full flex flex-row justify-around items-center">
	<div class="flex flex-row gap-5">
	<form method="get" action="<%= request.getContextPath() %>/servletHome">
        <input type="hidden" name="home" value="home">
        <button class="group-hover:bg-gray-200 focus:outline-none">Home</button>
    </form>
	<% if(user.getTipoUsuario() == eTipoUsuario.Administrador){ %>
		<div class="relative group">
		    <button class="group-hover:bg-gray-200 focus:outline-none">Clientes</button>
		    <div class="hidden absolute bg-white group-hover:block">
		        <form method="post" action="<%= request.getContextPath() %>/servletCliente">
		            <input type="hidden" name="accion" value="blCliente">
		            <button class="block hover:bg-gray-200 whitespace-nowrap p-2 text-center">Listar Clientes</button>
		        </form>
		        <form method="post" action="<%= request.getContextPath() %>/servletCliente">
		            <input type="hidden" name="accion" value="altaCliente">
		            <button class="block hover:bg-gray-200 whitespace-nowrap p-2 text-center">Alta de Cliente</button>
		        </form>
		    </div>
		</div>
       <form method="post" action="<%= request.getContextPath() %>/servletPrestamo">
           <input type="hidden" name="accion" value="adminPrestamo">
           <button class="group-hover:bg-gray-200 focus:outline-none">Prestamos</button>
       </form>
        <div class="relative group">
		    <button class="group-hover:bg-gray-200 focus:outline-none">Cuentas</button>
		    <div class="hidden absolute bg-white group-hover:block">
		        <form method="get" action="<%= request.getContextPath() %>/servletCuenta">
		            <input type="hidden" name="accion" value="blCuentas">
		            <button class="block hover:bg-gray-200 whitespace-nowrap p-2 text-center">Listar Cuentas</button>
		        </form>
		        <form method="get" action="<%= request.getContextPath() %>/servletCuenta">
		            <input type="hidden" name="accion" value="altaCuentas">
		            <button class="block hover:bg-gray-200 whitespace-nowrap p-2 text-center">Alta de Cuenta</button>
		        </form>
		    </div>
		</div>
       
		<div class="relative group">
		    <button class="group-hover:bg-gray-200 focus:outline-none">Informes</button>
		    <div class="hidden absolute bg-white group-hover:block">
		    	<form method="get" action="<%= request.getContextPath() %>/servletInformeMovimiento">
		        	<input type="hidden" name="informeMovimientos" value="movimientos">
		        	<button class="block hover:bg-gray-200 whitespace-nowrap p-2 text-center">Movimientos</button>
		        </form>
		        <form method="get" action="<%= request.getContextPath() %>/servletInformePrestamos">
		            <input type="hidden" name="informePrestamos" value="prestamos">
		            <button class="block hover:bg-gray-200 whitespace-nowrap p-2 text-center">Prestamos</button>
		        </form>
		    </div>
		</div>
	<%} else {%>
		<form method="get" action="<%= request.getContextPath() %>/servletCuentasClientes"> 
			<input type="hidden" name="accion" value="cuentas">
			<button class="group-hover:bg-gray-200 focus:outline-none">Cuentas</button>
		</form>
		<form method="get" action="<%= request.getContextPath() %>/servletTransferencia">
           <input type="hidden" name="homeTransferencias">
           <button class="group-hover:bg-gray-200 focus:outline-none">Transferencias</button>
       </form>
       <form method="post" action="<%= request.getContextPath() %>/servletPrestamo">
           <input type="hidden" name="accion" value="clientePrestamo">
           <button class="group-hover:bg-gray-200 focus:outline-none">Prestamos</button>
       </form>	<%}%>

	</div>
	</div>
	<div class="w-2/12 flex flex-row justify-center items-center gap-3">
    <div class="relative group">
  
      <span class="border rounded-full <%= bgColor %> p-3 cursor-pointer"><i class="fa-regular fa-user"></i></span>
		<span><%= user.getUsuario() %></span>
        <div class="hidden absolute bg-white group-hover:block w-40 text-center mt-2">
        <form method="get" action="<%= request.getContextPath() %>/servletUsuario">
        	<input type="hidden" name="userInfo" value=<%= user.getUsuario() %>>
            <button type="submit" class="block hover:bg-gray-200 whitespace-nowrap p-2 text-center w-full">Ver Perfil</button>
        </form>
            <form method="post" action="<%= request.getContextPath() %>/servletUsuario">
			    <input type="hidden" name="logout" value="true">
			    <button type="submit" class="block hover:bg-gray-200 whitespace-nowrap p-2 text-center w-full">Cerrar Sesi�n</button>
			</form>
        </div>
    </div>
</div>
</nav>