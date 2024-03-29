package negocio;

import java.sql.Date;
import java.util.List;

import datos.movimientosDao;
import entidad.eTipoMovimiento;
import entidad.movimiento;

public class movimientosNeg {

	public  List<movimiento> listarMovimientos() 
	{
		movimientosDao movimientos = new movimientosDao();
		return movimientos.listarMovimientos();
	}
	
	public List<movimiento> listarMovimientosPorIdCliente(Long idCliente)
	{
		return new movimientosDao().listarMovimientosPorIdCliente(idCliente);
	}
	public List<movimiento> listarMovimientosPorIdCuenta(Long idCuenta)
	{
		return new movimientosDao().listarMovimientosPorIdCuenta(idCuenta);
	}
	public List<movimiento> listarMovimientosPorIdClienteYFecha(int idCliente,Date fecha)
	{
		return new movimientosDao().listarMovimientosPorIdClienteYFecha(idCliente,fecha);
	}
	
	public List<movimiento> listarMovimientosPorIdClienteYTipo(Long idCliente,eTipoMovimiento tipoMovimiento) 
	{
		return new movimientosDao().listarMovimientosPorIdClienteYTipo(idCliente, tipoMovimiento);
	}
	
	public List<movimiento> listarMovimientosPorTipoYFecha(int idCliente,eTipoMovimiento tipoMovimiento,Date fecha) 
	{
		return new movimientosDao().listarMovimientosPorTipoYFecha(idCliente,tipoMovimiento,fecha);
	
	}
	/****Saca el importe segun el tipo de movimiento  ****/
	
	public Double getImportePorClienteYTipo(int idCliente,eTipoMovimiento tipoMovimiento)
	{
		return new movimientosDao().getImportePorClienteYTipo(idCliente, tipoMovimiento);
	}
	
	public Double getImportePorTipoMovimiento(eTipoMovimiento tipoMovimiento)
	{
		return new movimientosDao().getImportePorTipoMovimiento(tipoMovimiento);
	}
	public Long nuevoMovimiento(movimiento movimiento) {
		boolean movCuenta = new cuentaNeg().modificarSaldo(movimiento.getN_cuenta(), movimiento.getImporte());
		Long regMov = movCuenta ? new movimientosDao().insertar(movimiento) : -1L;
		return regMov;
	}
}


