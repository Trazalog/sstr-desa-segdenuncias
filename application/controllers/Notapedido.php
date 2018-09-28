<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Notapedido extends CI_Controller {

	function __construct(){

		parent::__construct();
		$this->load->model('Notapedidos');
	}


  // Trae detalle de OT para cargar vista Nota de pedidos
  public function getDetalle($permission,$idOT){

    $data['permission'] = $permission;
    $data['deta'] = $this->Notapedidos->getDetalles($idOT);

    $this->load->view('notapedido/view_',$data);    ;
  }

  public function index($permission){
    $data['list'] = $this->Notapedidos->notaPedidos_List();
    $data['permission'] = $permission;
    $this->load->view('notapedido/list',$data);
  }

  public function agregarNota($permission){
    //$data['list'] = $this->Notapedidos->notaPedidos_List();
    $data['permission'] = $permission;
    $this->load->view('notapedido/view_',$data);
    //$this->load->view('notapedido/view_');
  }

  public function getOrdenesCursos(){
    $response = $this->Notapedidos->getOrdenesCursos();
    echo json_encode($response);
  }

  public function getArticulo (){
    $response = $this->Notapedidos->getArticulos($this->input->post());
    echo json_encode($response);
  }

  public function getProveedor(){
      $response = $this->Notapedidos->getProveedores();
      echo json_encode($response);
  }

  public function getNotaPedidoId(){
    $response = $this->Notapedidos->getNotaPedidoIds($this->input->post());
    echo json_encode($response);
  }

  public function setNotaPedido(){
    $response = $this->Notapedidos->setNotaPedidos($this->input->post());
    echo json_encode($response);
  }





  /*** nota de pedido desde tarea revision diagnostico x coordinador ***/

  //tare info para listado de repuestos
  public function verPedidoRepuestos(){
    $idOT = $this->input->post('idOT');
    $list = $this->Notapedidos->getRepuestos_List($idOT);
    //dump_exit($list);
    echo json_encode($list);
  }

  //muestra modal Agregar/editar repuestos
  public function addEditNotaPedido($permission){
    $data['id_orden']    = $this->input->post('id');
    $data['descripcion'] = $this->input->post('desc');
    $data['permission']  = $permission;
    $response['html']    = $this->load->view('notapedido/add_', $data, true);
    echo json_encode($response);
  }

  public function editDetaNotaPedido()
  {
    $id_detaNota        = $this->input->post('id_detaNota');
    $id_notaPedido      = $this->input->post('id_notaPedido');
    $data['list']       = $this->Notapedidos->getEditPedidoRepuesto($id_detaNota, $id_notaPedido);
    //dump_exit($data['list']);
    $response['html']   = $this->load->view('notapedido/edit', $data, true);
    echo json_encode($response);
  }

  public function editPedidoRepuesto()
  {
    $result = $this->Notapedidos->editPedidoRepuesto($this->input->post());
    echo json_encode($result);
  }

  //pedido de repuestos ya existente
  public function getRepuestos(){
    $idOT = $this->input->post('idOT');
    $data = $this->Notapedidos->getRepuestos_List($idOT);
    echo json_encode($data);
  }

  public function delDetaNotaPedido()
  {
    $id_detaNota = $this->input->post('id_detaNota');
    $id_notaPedido = $this->input->post('id_notaPedido');
    $data = $this->Notapedidos->delDetaNotaPedido($id_detaNota, $id_notaPedido);
    echo json_encode($data);
  }
}
