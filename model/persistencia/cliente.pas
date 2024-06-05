unit cliente;

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
  TCliente = class(TPersistencia)

  private
    FCodigo : integer;
    FNome: string;
    FCidade: string;
    FUF: string;
  protected
    procedure PesquisaInterno(pQy : TDataSet); override;
  public
    constructor Create(pconexao: TFDConnection); override;
    property Codigo: integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Cidade: string read FCidade write FCidade;
    property UF: string read FUF write FUF;
  end;

implementation

{ TCliente }

constructor TCliente.Create(pconexao: TFDConnection);
begin
  inherited;
  Tabela := 'clientes';
end;

procedure TCliente.PesquisaInterno(pQy: TDataSet);
begin
  inherited;
  FCodigo := pqy.FieldByName('codigo').AsInteger;
  FNome := pqy.FieldByName('nome').AsString;
  FCidade := pqy.FieldByName('cidade').AsString;
  FUF := pqy.FieldByName('UF').AsString;
end;

end.
