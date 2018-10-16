<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Notapedidos extends CI_Model
{
	function __construct()
	{
		parent::__construct();
    }

    function notaPedidos_List(){

        $this->db->select('tbl_notapedido.id_notaPedido,
                            tbl_notapedido.fecha,
                            tbl_notapedido.id_ordTrabajo,
                            orden_trabajo.descripcion');
        $this->db->from('tbl_notapedido');

        $this->db->join('orden_trabajo','tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');

        $query= $this->db->get();

        if ($query->num_rows()!=0)
        {
         return $query->result_array();
        }
        else
        {
          return array();
        }
      }

    function notaPedidosxId($cod_interno){

        $this->db->select('tbl_notapedido.id_notaPedido,
                            tbl_notapedido.fecha,
                            tbl_notapedido.id_ordTrabajo,
                            orden_trabajo.descripcion,
                            orden_trabajo.cod_interno');
        $this->db->from('tbl_notapedido');
        $this->db->join('orden_trabajo','tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');
        $this->db->where('nro',$cod_interno);

        $query= $this->db->get();

        if ($query->num_rows()!=0)
        {
         return $query->result_array();
        }
        else
        {
          return array();
        }
    }

    function getNotaPedidoIds($data){

      $id = $data['id'];
       // echo "id n modelo";
       // var_dump($id);
      $this->db->select('tbl_notapedido.id_notaPedido,
                          tbl_notapedido.fecha,
                          tbl_notapedido.id_ordTrabajo,
                          orden_trabajo.descripcion,
                          tbl_detanotapedido.cantidad,
                          tbl_detanotapedido.provid,
                          tbl_detanotapedido.fechaEntrega,
                          tbl_detanotapedido.fechaEntregado,
                          tbl_detanotapedido.remito,
                          tbl_detanotapedido.medida,
                          tbl_detanotapedido.estado,
                          abmproveedores.provnombre,
                          articles.artDescription'
                        );
      $this->db->from('tbl_notapedido');
      $this->db->join('orden_trabajo', 'tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');
      $this->db->join('tbl_detanotapedido', 'tbl_detanotapedido.id_notaPedido = tbl_notapedido.id_notaPedido');
      $this->db->join('abmproveedores', 'abmproveedores.provid = tbl_detanotapedido.provid');
      $this->db->join('articles', 'tbl_detanotapedido.artId = articles.artId');
      $this->db->where('tbl_notapedido.id_notaPedido', $id);
      $query = $this->db->get();

      if ($query->num_rows()!=0){
        return $query->result_array();
      }
      else{
        return array();
      }
    }

    function getOrdenesCursos(){

        $this->db->select('orden_trabajo.id_orden,orden_trabajo.descripcion');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.estado', 'C');
        $query = $this->db->get();
        if ($query->num_rows() != 0){

            return $query->result_array();
        }
    }

    // Trae detalle de OT para cargar Nota de pedidos
    function getDetalles($id_orden){

        $this->db->select('orden_trabajo.descripcion,
                            orden_trabajo.id_orden');
        $this->db->from('orden_trabajo');
        $this->db->where('orden_trabajo.id_orden', $id_orden);
        $query = $this->db->get();
        if ($query->num_rows() != 0){

            return $query->result_array();
        }
    }


  //guarda nota de pedidos
  function setNotaPedidos($data)
  {
    $orden = (int)$data['orden_Id'][0];
    $fecha = date('Y-m-d');

    $notaP = array(
      'fecha'         => $fecha,
      'id_ordTrabajo' => $orden
      );

    if ( !$this->db->insert('tbl_notapedido', $notaP) ) {
      return false;
    }
    $idNota = $this->db->insert_id();

    for($i=0; $i<count($data['insum_Id']); $i++)
    {
      $insumo  = $data['insum_Id'][$i];
      $cant    = $data['cant_insumos'][$i];
      $proveed = $data['proveedid'][$i];
      $date    = $data['fechaentrega'][$i];
      $medida  = $data['medida'][$i];
      $newDate = date("Y-m-d", strtotime($date));
      $nota    = array(
        'id_notaPedido'  => $idNota,
        'artId'          => $insumo,
        'cantidad'       => $cant,
        'provid'         => $proveed,
        'fechaEntrega'   => $newDate,
        'fechaEntregado' => $newDate,
        'remito'         => 1,
        'medida'         => $medida,
        'estado'         => 'P' // Estado Pedido
        );
      if( !$this->db->insert('tbl_detanotapedido', $nota) ) {
        return false;
      }
    }
    return true;
  } // fin setNotaPedidos

  //trae listado de articulos
  function getArticulos()
  {
    $query = $this->db->query("SELECT articles.artId, articles.artBarCode,articles.artDescription FROM articles");
    $i     = 0;
    foreach ($query->result() as $row){
      $insumos[$i]['value']       = $row->artId;
      $insumos[$i]['label']       = $row->artBarCode;
      $insumos[$i]['descripcion'] = $row->artDescription;
      $i++;
    }
    return $insumos;
  }

  //trae listado de proveedores
  function getProveedores()
  {
    $this->db->select('abmproveedores.provid, abmproveedores.provnombre');
    $this->db->from('abmproveedores');
    $query = $this->db->get();
    if ($query->num_rows() != 0){
      return $query->result_array();
    }
  }




  /*** nota de pedido desde tarea revision diagnostico x coordinador ***/
  function getRepuestos_List($idOT)
  {
    $this->db->select('
      tbl_notapedido.id_notaPedido, tbl_notapedido.fecha, tbl_notapedido.id_ordTrabajo,
      orden_trabajo.descripcion,
      tbl_detanotapedido.id_detaNota, tbl_detanotapedido.cantidad, tbl_detanotapedido.artId, tbl_detanotapedido.provid, tbl_detanotapedido.fechaEntrega, tbl_detanotapedido.fechaEntregado, tbl_detanotapedido.remito, tbl_detanotapedido.medida, tbl_detanotapedido.estado');
    $this->db->from('tbl_notapedido');
    $this->db->join('orden_trabajo', 'tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');
    $this->db->join('tbl_detanotapedido', 'tbl_detanotapedido.id_notaPedido = tbl_notapedido.id_notaPedido');
    $this->db->where('tbl_notapedido.id_ordTrabajo', $idOT);
    $this->db->where('orden_trabajo.estado', 'C');//ordenes en curso
    //$this->db->where('tbl_detanotapedido.estado', 'C'); //P=pedido, E=?, C=?
    $query = $this->db->get();
    $respuesta['lista'] = $query->result_array();
    //agrego listado de articulos y listado de proveedores para sacar los nombres y descripciones
    $respuesta['articulos']   = $this->getArticulos();
    $respuesta['proveedores'] = $this->getProveedores();
    //dump_exit($respuesta);
    return $respuesta;
  }

  function delDetaNotaPedido($id_detaNota, $id_notaPedido)
  {
    //elimino deta nota pedido (repuestos de la orden de pedido)
    if($this->db->delete('tbl_detanotapedido', array('id_detaNota'=>$id_detaNota)) == false) {
      return false;
    }

    //if id_notaPedido <= 1 ademas de eliminar id_detaNota.tbl_detanotapedido elimino id_notaPedido.tbl_notapedido (no hay nota de pedido sin repuestos...)
    // ¿? implementar??
    $this->db->select('id_notaPedido');
    $this->db->from('tbl_detanotapedido');
    $this->db->where('id_notaPedido',$id_notaPedido);
    $query = $this->db->get();
    $nroRepuestos = $query->result_array();
    if (count($nroRepuestos) == 0)
      if($this->db->delete('tbl_notapedido', array('id_notaPedido'=>$id_notaPedido)) == false) {
      return false;
    } else{
      return true;
    }
  }

  function getEditPedidoRepuesto($id_detaNota, $id_notaPedido)
  {
    $this->db->select('tbl_notapedido.id_notaPedido,
      tbl_notapedido.fecha,
      tbl_notapedido.id_ordTrabajo,
      orden_trabajo.descripcion,
      tbl_detanotapedido.id_notaPedido,
      tbl_detanotapedido.cantidad,
      tbl_detanotapedido.provid,
      tbl_detanotapedido.fechaEntrega,
      tbl_detanotapedido.fechaEntregado,
      tbl_detanotapedido.remito,
      tbl_detanotapedido.medida,
      tbl_detanotapedido.estado,
      abmproveedores.provnombre,
      articles.artDescription, articles.artId, articles.artBarCode'
      );
    $this->db->from('tbl_notapedido');
    $this->db->join('orden_trabajo', 'tbl_notapedido.id_ordTrabajo = orden_trabajo.id_orden');
    $this->db->join('tbl_detanotapedido', 'tbl_detanotapedido.id_notaPedido = tbl_notapedido.id_notaPedido');
    $this->db->join('abmproveedores', 'abmproveedores.provid = tbl_detanotapedido.provid');
    $this->db->join('articles', 'tbl_detanotapedido.artId = articles.artId');
    //$this->db->where('tbl_notapedido.id_notaPedido', $id_notaPedido);
    $this->db->where('tbl_detanotapedido.id_detaNota', $id_detaNota);
    $query = $this->db->get();
    $result = $query->result_array();
    $result[0]['id_detaNota'] = $id_detaNota;

    if ($query->num_rows()!=0){
      return $result;
    }
    else{
      return array();
    }
  }

  function editPedidoRepuesto($data)
  {
    $id_detaNota   = $data["id_detaNota"];
    $id_notaPedido = $data["id_notaPedido"];
    $id_articulo   = $data["id_articulo"];
    $cantidad      = $data["cantidad"];
    $proveedor     = $data['proveedor'];
    $fechaEnt      = $data['fechaEnt'];
    $medida        = $data['medida'];

    $datos = array(
      'id_detaNota'   => $id_detaNota,
      'id_notaPedido' => $id_notaPedido,
      'artId'         => $id_articulo,
      'cantidad'      => $cantidad,
      'provid'        => $proveedor,
      'fechaEntrega'  => $fechaEnt,
      'medida'        => $medida
    );

    //dump_exit($datos);
    $this->db->where('id_detaNota', $id_detaNota);
    $this->db->update('tbl_detanotapedido', $datos);
  }

}
