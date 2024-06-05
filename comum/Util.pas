unit Util;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls;

type
  TUtil = class

  private

  public
    class function EhNumero(S: string): Boolean;
  end;

implementation

{ TUtil }

class function TUtil.EhNumero(S: string): Boolean;
var
  I: Integer;
begin
  Result := Length(S) > 0;
  for I := 1 to Length(S) do
  begin
    if not (S[I] in ['0'..'9']) then
    begin
      Result := False;
      Break;
    end;
  end;

end;

end.
