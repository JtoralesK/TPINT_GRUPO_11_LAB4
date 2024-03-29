<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="entidad.Usuario" %>
<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	request.setAttribute("titulo", "Login");
%>
<jsp:include page="head.jsp" />
</head>
<body>
<div>
  <div class="flex flex-row">
   <div class="w-8/12 h-screen bg-blue-800 ">
   <div class="px-10 pt-20 ">
    <h1 class="text-5xl text-white pt-[12rem]">Te damos la bienvenida a <b>Prosperity Bank</b></h1>
   <p class="text-3xl text-white ">Accede a tu cuenta</p>
   </div>
  </div>
  <div class="w-4/12 h-screen bg-white">
 <form  method="post" action="<%= request.getContextPath() %>/servletUsuario" class="flex flex-item  justify-center">
 <div class="w-4/6 mt-[12rem]">
  <div class="mb-6">
    <label for="text" class="block mb-2 text-sm font-medium text-gray-900 dark:text-black">Usuario</label>
    <input type="text" name="usuario" class="bg-gray-50 border border-gray-300 text-grey-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"  required>
  </div>
  <div class="mb-6">
    <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-black">Contrase�a</label>
    <input type="password" id="password" name="password" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required>
  </div>
  <div class="flex items-start mb-6">
    
  </div>
  <button type="submit" name="btnLogin" value="login" class="w-full h-10 border rounded bg-black text-white">Iniciar Sesi�n</button>
 </div>
</form>
  </div>
 
  </div>
</div>

<jsp:include page="modal.jsp" />
</body>
</html>