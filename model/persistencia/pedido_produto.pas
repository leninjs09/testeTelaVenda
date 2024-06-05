unit pedido_produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, Persistencia,
  FireDAC.Phys, FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  FireDAC.Stan.Pool, FireDAC.VCLUI.Wait;

type
  TPedidoProduto = class(TPersistencia)

  private
    Fautoincrem: integer;
    FCodigoProduto: integer;
    FValorUnitario: Real;
    FValorTotal: Real;
    FQuantidade: Real;
    FNumeroPedido: integer;
    procedure setCodigoProduto(const Value: integer);
    procedure setNumeroPedido(const Value: integer);
    procedure setQuantidade(const Value: Real);
    procedure setValorTotal(const Value: Real);
    procedure setValorUnitario(const Value: Real);
    procedure setautoincrem(const Value: integer);
  protected
    procedure PesquisaInterno(pQy : TDataSet); override;
  public
    constructor Create(pconexao: TFDConnection); override;
    property autoincrem: integer read Fautoincrem write setautoincrem;
    property NumeroPedido: integer read FNumeroPedido write setNumeroPedido;
    property CodigoProduto: integer read FCodigoProduto write setCodigoProduto;
    property Quantidade: Real read FQuantidade write setQuantidade;
    property ValorUnitario: Real read FValorUnitario write setValorUnitario;
    property ValorTotal: Real read FValorTotal write setValorTotal;
  end;

implementation

{ TPedidoProduto }

{
procedure TPedidoProduto.Gravar;
var
  Qy : TFDQuery;
begin

  Qy := TFDQuery.Create(nil);
  try
    qy.Connection := Fconexao;

    if not FInserindo then
      Qy.SQL.Text := 'update pedidos_produtos set numero_pedido = ' + QuotedStr(FNumeroPedido.ToString)
        + ', Codigo_Produto = ' + QuotedStr(FCodigoProduto.ToString)
        + ',Valor_Unitario = ' + QuotedStr(FloatToStr(FValorUnitario))
        + ',Quantidade = ' + QuotedStr(FloatToStr(FQuantidade))
        + ',valor_total = ' + QuotedStr(FloatToStr(FValorTotal))
        + ' where autoincrem = ' + Fautoincrem.ToString
    else
      Qy.SQL.Text := 'INSERT INTO pedidos_produtos (numero_pedido, Codigo_Produto, Valor_Unitario, Quantidade, valor_total) '
        + ' VALUES (' + FNumeroPedido.ToString + ',' + QuotedStr(FCodigoProduto.ToString)
        + ',' + QuotedStr(FloatToStr(ValorUnitario)) + ',' + QuotedStr(FloatToStr(FQuantidade)) + ',' + QuotedStr(FloatToStr(FValorTotal)) + ');';

    Qy.ExecSQL;
  finally
    FreeAndNil(Qy);
  end;
end;
}

constructor TPedidoProduto.Create(pconexao: TFDConnection);
begin
  inherited;
  tabela := 'pedidos_produtos';
end;

procedure TPedidoProduto.PesquisaInterno(pQy: TDataSet);
begin
  inherited;

  autoincrem := pqy.FieldByName('autoincrem').AsInteger;
  NumeroPedido := pqy.FieldByName('numero_pedido').AsInteger;
  CodigoProduto := pqy.FieldByName('Codigo_Produto').AsInteger;
  ValorUnitario := pqy.FieldByName('Valor_Unitario').AsFloat;
  ValorTotal := pqy.FieldByName('valor_total').AsFloat;
  Quantidade := pqy.FieldByName('Quantidade').AsFloat;

end;

procedure TPedidoProduto.setautoincrem(const Value: integer);
begin
  Fautoincrem := Value;
  valor[0] := value;
end;

procedure TPedidoProduto.setCodigoProduto(const Value: integer);
begin
  FCodigoProduto := Value;
  valor[2] := value;
end;

procedure TPedidoProduto.setNumeroPedido(const Value: integer);
begin
  FNumeroPedido := Value;
  valor[1] := value;
end;

procedure TPedidoProduto.setQuantidade(const Value: Real);
begin
  FQuantidade := Value;
  valor[3] := value;
end;

procedure TPedidoProduto.setValorTotal(const Value: Real);
begin
  FValorTotal := Value;
  valor[5] := value;
end;

procedure TPedidoProduto.setValorUnitario(const Value: Real);
begin
  FValorUnitario := Value;
  valor[4] := value;
end;

end.
