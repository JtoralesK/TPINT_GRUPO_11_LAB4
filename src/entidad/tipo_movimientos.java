package entidad;

import datos.tipo_movimientosDao;

public class tipo_movimientos {
private int id_tipo_movimiento;
private String descripcion;

public tipo_movimientos() {}
public tipo_movimientos(int id_tipo_movimiento) {
	///tipo_movimientosDao tm=new tipo_movimientosDao();
	this.id_tipo_movimiento=id_tipo_movimiento;
	this.descripcion=new tipo_movimientosDao().obtenerxId(id_tipo_movimiento);
}
public tipo_movimientos(int id_tipo_movimiento,String descripcion) 
{
	this.id_tipo_movimiento=id_tipo_movimiento;
	this.descripcion=descripcion;
}

public int getId_tipo_movimiento() {
	return id_tipo_movimiento;
}
public void setId_tipo_movimiento(int id_tipo_movimiento) {
	this.id_tipo_movimiento = id_tipo_movimiento;
}
public String getDescripcion() {
	return descripcion;
}
public void setDescripcion(String descripcion) {
	this.descripcion = descripcion;
}


}