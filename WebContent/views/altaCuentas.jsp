<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://cdn.tailwindcss.com"></script>
<title>Alta de cuentas</title>
</head>
<body class="bg-gray-100">
        <jsp:include page="navbar.jsp" />
        <div class="container mx-auto py-4">
        <h1 class="text-2xl font-semibold mb-4 text-center">Crear Nueva Cuenta</h1>
        <!-- Formulario para crear una cuenta -->
        <form method="post" class="w-1/4 bg-white p-4 shadow-md rounded-md mx-auto">
            <div class="mb-4">
                <label for="nroCliente" class="text-sm font-medium">Nro de Cliente:</label>
                <input type="text" id="nroCliente" name="nroCliente" class="w-full border border-gray-300 rounded-md p-2">
            </div>
            <div class="mb-4">
                <label for="tipoCuenta" class="text-sm font-medium">Tipo de Cuenta:</label>
                <select id="tipoCuenta" name="tipoCuenta" class="w-full border border-gray-300 rounded-md p-2">
                	<option value="" disabled selected>Tipo de cuenta</option>
                    <option value="ca">Caja de ahorro</option>
                    <option value="cc">Cuenta corriente</option>
                </select>
            </div>
            <div class="flex justify-center">
                <button class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600">Crear Cuenta</button>
            </div>
        </form>
    </div>
</body>
</html>