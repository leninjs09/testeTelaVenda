unit dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, System.UITypes,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  FireDAC.Stan.Pool, FireDAC.VCLUI.Wait, inifiles, Winapi.Windows,
  Winapi.Messages, System.Variants, Vcl.Forms, cliente, pedido_produto,
  pedido, produto, Datasnap.DBClient, vcl.Dialogs, vcl.Controls;

type
  TDataModuleConexao = class(TDataModule)
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    conexao: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    FIni : TIniFile;
    procedure LerParametrosBanco;
  public

  end;

var
  DataModuleConexao: TDataModuleConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}


{$R *.dfm}

procedure TDataModuleConexao.DataModuleCreate(Sender: TObject);
begin

  LerParametrosBanco;

end;

procedure TDataModuleConexao.LerParametrosBanco;
begin

  FIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');

  try
    Conexao.Connected := false;
    Conexao.Params.Values['Server'] := fini.ReadString('PARAMENTROS', 'SERVER', 'LOCALHOST');
    Conexao.Params.Values['Port'] := fini.ReadString('PARAMENTROS', 'PORT', '3306');
    Conexao.Params.Values['Database'] := fini.ReadString('PARAMENTROS', 'DATABASE', 'banco_prova');
    Conexao.Params.Values['User_Name'] := fini.ReadString('PARAMENTROS', 'USERNAME', 'root');
    Conexao.Params.Values['Password'] := fini.ReadString('PARAMENTROS', 'PASSWORD', '12345');
    Conexao.DriverName := 'MySQL';
    Conexao.Connected := true;

    FDPhysMySQLDriverLink1.VendorLib := ExtractFilePath(Application.ExeName) + 'libmysql.dll';
  finally
    FreeAndNil(FIni);
  end;

end;

end.
