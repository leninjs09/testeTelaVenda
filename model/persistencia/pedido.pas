unit pedido;

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
  TPedido = class(TPersistencia)

  private
    FValorTotal: Real;
    FDataEmissao: TDateTime;
    FcodigoCliente: integer;
    FNumeroPedido: integer;
    procedure setcodigoCliente(const Value: integer);
    procedure setDataEmissao(const Value: TDateTime);
    procedure setNumeroPedido(const Value: integer);
    procedure setValorTotal(const Value: Real);
  protected
    procedure PesquisaInterno(pQy : TDataSet); override;
  public
    constructor Create(pconexao: TFDConnection); override;
    function GerarNumeroPedido: integer;
    property NumeroPedido: integer read FNumeroPedido write setNumeroPedido;
    property DataEmissao: TDateTime read FDataEmissao write setDataEmissao;
    property CodigoCliente: integer read FcodigoCliente write setcodigoCliente;
    property ValorTotal: Real read FValorTotal write setValorTotal;
  end;

implementation

{ TPedido }

constructor TPedido.Create(pconexao: TFDConnection);
begin
  inherited;
  tabela := 'pedidos';
end;

function TPedido.GerarNumeroPedido: integer;
var
  Qy : TFDQuery;
begin

  Qy := TFDQuery.Create(nil);
  try
    qy.Connection := Fconexao;
    qy.SQL.Text := 'UPDATE sequence SET id=LAST_INSERT_ID(id+1)';
    qy.ExecSQL;

    qy.SQL.Text := 'SELECT LAST_INSERT_ID()';
    qy.Open();

    result := qy.Fields[0].AsInteger;

  finally
    FreeAndNil(Qy);
  end;
end;

procedure TPedido.PesquisaInterno(pQy: TDataSet);
begin
  inherited;

  NumeroPedido := pqy.FieldByName('numero_pedido').AsInteger;
  DataEmissao := pqy.FieldByName('data_emissao').AsDateTime;
  codigoCliente := pqy.FieldByName('codigo_cliente').AsInteger;
  ValorTotal := pqy.FieldByName('valor_total').AsFloat;

end;

procedure TPedido.setcodigoCliente(const Value: integer);
begin
  FcodigoCliente := Value;
  valor[2] := value;
end;

procedure TPedido.setDataEmissao(const Value: TDateTime);
begin
  FDataEmissao := Value;
  valor[1] := value;
end;

procedure TPedido.setNumeroPedido(const Value: integer);
begin
  FNumeroPedido := Value;
  valor[0] := value;
end;

procedure TPedido.setValorTotal(const Value: Real);
begin
  FValorTotal := Value;
  valor[3] := value;
end;

end.
