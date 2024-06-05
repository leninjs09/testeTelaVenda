program testeTelaVenda;

uses
  Vcl.Forms,
  PedidosVenda in 'view\PedidosVenda.pas' {FPedidosVenda},
  dm in 'model\dm.pas' {DataModuleConexao: TDataModule},
  Util in 'comum\Util.pas',
  produto in 'model\persistencia\produto.pas',
  cliente in 'model\persistencia\cliente.pas',
  pedido in 'model\persistencia\pedido.pas',
  pedido_produto in 'model\persistencia\pedido_produto.pas',
  persistencia in 'model\persistencia\persistencia.pas',
  PedidosVendaController in 'controller\PedidosVendaController.pas',
  ConsultaGenerico in 'view\ConsultaGenerico.pas' {FConsultaGenerico},
  ConsultaGenericoController in 'controller\ConsultaGenericoController.pas',
  ConsultaClientes in 'view\ConsultaClientes.pas' {FConsultaClientes},
  ConsultaProdutos in 'view\ConsultaProdutos.pas' {FConsultaProdutos},
  ConsultaGenericoModel in 'model\ConsultaGenericoModel.pas' {fConsultaGenericoModel: TDataModule},
  PedidoVendaModel in 'model\PedidoVendaModel.pas' {FPedidosVendaModel: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModuleConexao, DataModuleConexao);
  Application.CreateForm(TFPedidosVendaModel, FPedidosVendaModel);
  Application.CreateForm(TfConsultaGenericoModel, fConsultaGenericoModel);
  Application.CreateForm(TFPedidosVenda, FPedidosVenda);
  Application.Run;
end.
