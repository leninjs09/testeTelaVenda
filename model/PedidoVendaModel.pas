unit PedidoVendaModel;

interface

uses
  System.SysUtils, System.Classes,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  Winapi.Messages, System.Variants, Vcl.Forms, cliente, pedido_produto,
  pedido, produto, Datasnap.DBClient, vcl.Dialogs, System.UITypes, vcl.Controls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB;

type
  TFPedidosVendaModel = class(TDataModule)
    tbPedidoProdutos: TFDMemTable;
    tbPedidoProdutosCodProduto: TIntegerField;
    tbPedidoProdutosDescricao: TStringField;
    tbPedidoProdutosQuantidade: TFloatField;
    tbPedidoProdutosPrecoUnitario: TCurrencyField;
    tbPedidoProdutosTotal: TCurrencyField;
    tbPedidoProdutosCodigoCliente: TIntegerField;
    dsPedidoProdutos: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure tbPedidoProdutosBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    function CarregarPedido: boolean;
    procedure AdicionarProduto(pCodigoProduto, pCodigoCliente : integer; pQuantidade, pPrecoUnitario : real);
    function CalcularTotalPedido: Real;
    procedure ApagarProdutoPedido;
    function GravarPedido(): boolean;
    function ApagarPedido: boolean;
  end;

var
  FPedidosVendaModel: TFPedidosVendaModel;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses dm;

{$R *.dfm}

{ TFPedidosVendaModel }

procedure TFPedidosVendaModel.AdicionarProduto(pCodigoProduto,
  pCodigoCliente: integer; pQuantidade, pPrecoUnitario: real);
var
  Produto : TProduto;
begin

  Produto := TProduto.Create(DataModuleConexao.conexao);
  try
    produto.Pesquisar(pcodigoProduto.ToString);

    tbPedidoProdutos.append;
    tbPedidoProdutosCodProduto.AsInteger := Produto.Codigo;
    tbPedidoProdutosDescricao.asstring := Produto.Descricao;
    tbPedidoProdutosQuantidade.AsFloat := pQuantidade;
    tbPedidoProdutosCodigoCliente.AsInteger := pCodigoCliente;
    tbPedidoProdutosPrecoUnitario.Value := pPrecoUnitario;
    tbPedidoProdutosTotal.Value := tbPedidoProdutosQuantidade.Value * tbPedidoProdutosPrecoUnitario.Value;
    tbPedidoProdutos.post;
  finally
    FreeAndNil(Produto);
  end;

end;

function TFPedidosVendaModel.ApagarPedido: boolean;
var
  InputString: string;
  Pedido : TPedido;
  PedidoProduto : TPedidoProduto;
  Qy : TFdQuery;
  Achou : boolean;
begin
  result := false;
  InputString := InputBox('Informe o número do pedido', 'Pedido:', '');

  if InputString <> '' then
  begin
    DataModuleConexao.conexao.StartTransaction;
    Pedido := TPedido.Create(DataModuleConexao.conexao);
    PedidoProduto := TPedidoProduto.Create(DataModuleConexao.conexao);
    Qy := TFDQuery.Create(nil);
    try
      try
        Qy.Connection := DataModuleConexao.conexao;
        qy.SQL.Text := 'select pp.autoincrem ' +
                       ' from pedidos_produtos pp ' +
                       ' where pp.numero_pedido = :numero_pedido';
        qy.ParamByName('numero_pedido').AsString := InputString;
        qy.Open();

        qy.First;
        while not qy.Eof do
        begin

          PedidoProduto.Pesquisar(Qy.FieldByName('autoincrem').AsString);
          PedidoProduto.Apagar;

          qy.Next;
        end;

        Pedido.Pesquisar(InputString);
        Achou := pedido.NumeroPedido > 0;

        if Achou then
        begin
          Pedido.Apagar;
          result := true;
          DataModuleConexao.conexao.Commit;
          MessageDlg('Pedido ' + InputString + ' apagado com sucesso.', TMsgDlgType.mtInformation, [mbOk],0);
        end
        else
        begin
          DataModuleConexao.conexao.Rollback;
          MessageDlg('Pedido ' + InputString + ' não encontrado.', TMsgDlgType.mtInformation, [mbOk],0);
        end;

      except
        on e: Exception do
        begin
          DataModuleConexao.conexao.Rollback;
          MessageDlg('Erro ao apagar pedido' + #13 + 'Erro:' + e.Message, mtError, [mbOk],0);
        end;
      end;

    finally
      FreeAndNil(Qy);
      FreeAndNil(Pedido);
      FreeAndNil(PedidoProduto);
    end;
  end;
end;

procedure TFPedidosVendaModel.ApagarProdutoPedido;
begin

  if MessageDlg('Deseja apagar o registro selecionado?',
  mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin

    if not tbPedidoProdutos.IsEmpty then
      tbPedidoProdutos.Delete;

  end;

end;

function TFPedidosVendaModel.CalcularTotalPedido: Real;
var
  tb : TFDMemTable;
  Total : real;
begin

  tb := TFDMemTable.Create(nil);
  try
    tb.Data := tbPedidoProdutos.Data;

    total := 0;
    tb.First;
    while not tb.eof do
    begin
      total := total + tb.FieldByName('total').AsFloat;
      tb.Next;
    end;

    result := total;
  finally
    FreeAndNil(tb);
  end;

end;

function TFPedidosVendaModel.CarregarPedido: boolean;
var
  InputString: string;
  Qy : TFdQuery;
begin
  result := false;
  InputString := InputBox('Informe o número do pedido', 'Pedido:', '');

  if InputString <> '' then
  begin
    result := true;

    Qy := TFDQuery.Create(nil);
    try
      qy.Connection := DataModuleConexao.conexao;
      qy.SQL.Add('select');
      qy.SQL.Add('p.numero_pedido,');
      qy.SQL.Add('p.data_emissao,');
      qy.SQL.Add('p.codigo_cliente,');
      qy.SQL.Add('p.valor_total,');
      qy.SQL.Add('pp.autoincrem,');
      qy.SQL.Add('pp.codigo_produto,');
      qy.SQL.Add('pp.quantidade,');
      qy.SQL.Add('pp.valor_unitario,');
      qy.SQL.Add('pp.valor_total as valorProduto');
      qy.SQL.Add('from pedidos p');
      qy.SQL.Add('join pedidos_produtos pp on pp.numero_pedido = p.numero_pedido');
      qy.SQL.Add('where p.numero_pedido = :numero_pedido');
      qy.ParamByName('numero_pedido').AsString := InputString;
      qy.Open();

      if not tbPedidoProdutos.IsEmpty then
        tbPedidoProdutos.EmptyDataSet;

      qy.First;
      while not qy.Eof do
      begin
        AdicionarProduto(qy.FieldByName('codigo_produto').AsInteger, qy.FieldByName('codigo_cliente').AsInteger,
          qy.FieldByName('quantidade').AsFloat, qy.FieldByName('valor_unitario').AsFloat);
        qy.Next;
      end;

      if qy.IsEmpty then
      begin
        Result := False;
        MessageDlg('Pedido ' + InputString + ' não encontrado.', TMsgDlgType.mtInformation, [mbOk],0);
      end;

    finally
      FreeAndNil(Qy);
    end;
  end;

end;

procedure TFPedidosVendaModel.DataModuleCreate(Sender: TObject);
begin
  tbPedidoProdutos.CreateDataSet;
end;

function TFPedidosVendaModel.GravarPedido: boolean;
var
  Pedido : TPedido;
  PedidoProduto : TPedidoProduto;
  NumeroPedido : integer;
begin

  result := False;
  if tbPedidoProdutos.IsEmpty then
    exit;

  DataModuleConexao.conexao.StartTransaction;
  Pedido := TPedido.Create(DataModuleConexao.conexao);
  PedidoProduto := TPedidoProduto.Create(DataModuleConexao.conexao);
  try
    try
      NumeroPedido := Pedido.GerarNumeroPedido;
      Pedido.Pesquisar('-1');
      Pedido.NumeroPedido := NumeroPedido;
      Pedido.DataEmissao := Now;
      Pedido.CodigoCliente := tbPedidoProdutosCodigoCliente.AsInteger;
      Pedido.ValorTotal := CalcularTotalPedido;
      Pedido.Gravar;

      tbPedidoProdutos.First;
      while not tbPedidoProdutos.Eof do
      begin

        PedidoProduto.Pesquisar('-1');
        PedidoProduto.autoincrem := -1;
        PedidoProduto.NumeroPedido := NumeroPedido;
        PedidoProduto.CodigoProduto := tbPedidoProdutosCodProduto.AsInteger;
        PedidoProduto.Quantidade := tbPedidoProdutosQuantidade.AsFloat;
        PedidoProduto.ValorUnitario := tbPedidoProdutosPrecoUnitario.AsFloat;
        PedidoProduto.ValorTotal := tbPedidoProdutosTotal.AsFloat;
        PedidoProduto.Gravar;

        tbPedidoProdutos.Next;
      end;

      DataModuleConexao.conexao.Commit;
      result := true;
      MessageDlg('Pedido ' + NumeroPedido.ToString + ' gravado com sucesso.', TMsgDlgType.mtInformation, [mbOk],0);

    except
      on e: Exception do
      begin
        DataModuleConexao.conexao.Rollback;
        MessageDlg('Erro ao gravar pedido' + #13 + 'Erro:' + e.Message, mtError, [mbOk],0);
      end;
    end;

  finally
    FreeAndNil(Pedido);
    FreeAndNil(PedidoProduto);
  end;

end;

procedure TFPedidosVendaModel.tbPedidoProdutosBeforePost(DataSet: TDataSet);
begin

  tbPedidoProdutosTotal.Value := tbPedidoProdutosQuantidade.Value * tbPedidoProdutosPrecoUnitario.Value;

  if (tbPedidoProdutosCodProduto.Value = 0) or (tbPedidoProdutosDescricao.AsString = '') then
    dataset.Cancel;

end;

end.
