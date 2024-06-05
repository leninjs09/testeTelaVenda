unit ConsultaGenericoController;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids, System.UITypes,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TConsultaGenericoController = class

  private

  public
//    constructor Create;
//    Destructor Destroy;
    procedure Consulta(pSQL : string);
    function pegaValorCodigo: integer;
  end;

implementation

uses
  dm, ConsultaGenericoModel;

{ TConsultaGenericoController }

procedure TConsultaGenericoController.Consulta(pSQL : string);
begin

  fConsultaGenericoModel.Consulta(pSQL);

end;

//constructor TConsultaGenericoController.Create;
//begin
//
//end;
//
//destructor TConsultaGenericoController.Destroy;
//begin
//
//end;

function TConsultaGenericoController.pegaValorCodigo: integer;
begin
  Result := fConsultaGenericoModel.pegaValorCodigo;
end;

end.
