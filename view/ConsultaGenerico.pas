unit ConsultaGenerico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, ConsultaGenericoController;

type
  TFConsultaGenerico = class(TForm)
    Panel1: TPanel;
    Grid: TDBGrid;
    btCancelar: TButton;
    btConfirmar: TButton;
    dsConsulta: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    FController : TConsultaGenericoController;
    FCodigo: integer;
  protected
    FSQL : string;
  public
    procedure consulta;
    property Codigo: integer read FCodigo write FCodigo;
  end;

var
  FConsultaGenerico: TFConsultaGenerico;

implementation

uses
  ConsultaGenericoModel;

{$R *.dfm}

{ TFConsultaGenerico }

procedure TFConsultaGenerico.btCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFConsultaGenerico.btConfirmarClick(Sender: TObject);
begin
  Codigo := FController.pegaValorCodigo;
  close;
end;

procedure TFConsultaGenerico.consulta;
begin

  FController.Consulta(FSQL);

end;

procedure TFConsultaGenerico.FormCreate(Sender: TObject);
begin

  FController := TConsultaGenericoController.Create;

end;

procedure TFConsultaGenerico.FormDestroy(Sender: TObject);
begin

  FreeAndNil(FController);

end;

procedure TFConsultaGenerico.GridDblClick(Sender: TObject);
begin
  Codigo := FController.pegaValorCodigo;
  close;
end;

end.
