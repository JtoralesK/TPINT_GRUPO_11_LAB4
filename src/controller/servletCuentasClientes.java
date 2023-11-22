package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Usuario;
import entidad.cliente;
import entidad.movimiento;
import entidad.prestamo;
import negocio.clienteNeg;
import negocio.movimientosNeg;
import negocio.prestamoNeg;

/**
 * Servlet implementation class servletCuentasClientes
 */
@WebServlet("/servletCuentasClientes")
public class servletCuentasClientes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletRequest session;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletCuentasClientes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   /* Usuario usuario = (Usuario)session.getAttribute("loggedUser"); 
		cliente cliente = new cliente();
		cliente=new clienteNeg().obtenerClientePorIdUsuario(usuario.getId());
		int id = cliente.getId().intValue();*/
		List<movimiento>ListaMovimientos = new movimientosNeg().listarMovimientosPorIdCliente(101);
		List<prestamo>ListaPrestamos = new prestamoNeg().listarXcliente((long) 101);
		request.setAttribute("ListaMovimientos", ListaMovimientos);
		request.setAttribute("ListaPrestamos", ListaPrestamos);
		//RequestDispatcher rd = request.getRequestDispatcher("/views/cuenta.jsp");
		int numeroDePagina = 1;
		int elementosPorPagina = 10;
		RequestDispatcher dr = request.getRequestDispatcher("/servletPaginacion?redirectUrl=cuenta.jsp&p=" + numeroDePagina + "&s=" + elementosPorPagina);	
       dr.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}