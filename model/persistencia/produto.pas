unit produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, persistencia,
  FireDAC.Phys, FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  FireDAC.Stan.Pool, FireDAC.VCLUI.Wait;

type
  TProduto = class(TPersistencia)

  private
    FCodigo : integer;
    FDescricao: string;
    FPrecoVenda: Real;
  protected
    procedure PesquisaInterno(pQy : TDataSet); override;
  public
    constructor Create(pconexao: TFDConnection); override;
    property Codigo: integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property PrecoVenda: Real read FPrecoVenda write FPrecoVenda;
  end;

implementation

{ TProduto }

constructor TProduto.Create(pconexao: TFDConnection);
begin
  inherited;
  Tabela := 'produtos';
end;

procedure TProduto.PesquisaInterno(pQy: TDataSet);
begin
  inherited;
  FCodigo := pqy.FieldByName('codigo').AsInteger;
  FDescricao := pqy.FieldByName('descricao').AsString;
  FPrecoVenda := pqy.FieldByName('preco_venda').AsFloat;

end;

end.
