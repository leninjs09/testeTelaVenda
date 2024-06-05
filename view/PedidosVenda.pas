unit PedidosVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids, System.UITypes,
  Vcl.DBGrids, Vcl.ExtCtrls, dm, Vcl.DBCtrls, PedidosVendaController;

type
  TFPedidosVenda = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    gbProduto: TGroupBox;
    Label2: TLabel;
    edCodProduto: TEdit;
    EdDescProduto: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdQuantidade: TEdit;
    btAddProduto: TButton;
    edPrecoUnitario: TEdit;
    Label5: TLabel;
    lbTotal: TLabel;
    gbCliente: TGroupBox;
    edCodCliente: TEdit;
    edCliente: TEdit;
    pnBarraBotoes: TPanel;
    BtGravarPedido: TButton;
    btCarregarPedido: TButton;
    Label1: TLabel;
    Label6: TLabel;
    btCancelarPedido: TButton;
    btLimpar: TButton;
    btConsultaCliente: TButton;
    btConsultaProduto: TButton;
    procedure EdQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btAddProdutoClick(Sender: TObject);
    procedure edCodClienteChange(Sender: TObject);
    procedure edCodProdutoChange(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtGravarPedidoClick(Sender: TObject);
    procedure btCarregarPedidoClick(Sender: TObject);
    procedure btCancelarPedidoClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btConsultaClienteClick(Sender: TObject);
    procedure btConsultaProdutoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FPedidoVendaController : TPedidosVendaController;
  public

  end;

var
  FPedidosVenda: TFPedidosVenda;

implementation

{$R *.dfm}

uses Util, PedidoVendaModel;

procedure TFPedidosVenda.btAddProdutoClick(Sender: TObject);
begin

  FPedidoVendaController.AddProduto;

end;

procedure TFPedidosVenda.btCancelarPedidoClick(Sender: TObject);
begin

  FPedidoVendaController.CancelarPedido;

end;

procedure TFPedidosVenda.btCarregarPedidoClick(Sender: TObject);
begin

  FPedidoVendaController.CarregarPedido;

end;

procedure TFPedidosVenda.btConsultaClienteClick(Sender: TObject);
begin
  FPedidoVendaController.ConsultaCliente;
end;

procedure TFPedidosVenda.btConsultaProdutoClick(Sender: TObject);
begin

  FPedidoVendaController.ConsultaProduto;

end;

procedure TFPedidosVenda.BtGravarPedidoClick(Sender: TObject);
begin

  FPedidoVendaController.GravarPedido;

end;

procedure TFPedidosVenda.btLimparClick(Sender: TObject);
begin

  FPedidoVendaController.LimparTela;

end;

procedure TFPedidosVenda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_DELETE then
    FPedidoVendaController.ApagarProdutoPedido;

end;

procedure TFPedidosVenda.edCodClienteChange(Sender: TObject);
begin

  FPedidoVendaController.ClienteChange;

end;

procedure TFPedidosVenda.edCodProdutoChange(Sender: TObject);
begin

  FPedidoVendaController.ProdutoChange;

end;

procedure TFPedidosVenda.EdQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin

  if not CharInSet(key, ['0'..'9', ',', Chr(8)]) then
    Key := #0;

end;

procedure TFPedidosVenda.FormCreate(Sender: TObject);
begin

  FPedidoVendaController := TPedidosVendaController.Create;

  ReportMemoryLeaksOnShutdown := True;

end;

procedure TFPedidosVenda.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FPedidoVendaController);
end;

end.
