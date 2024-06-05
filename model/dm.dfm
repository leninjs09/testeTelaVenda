object DataModuleConexao: TDataModuleConexao
  OnCreate = DataModuleCreate
  Height = 114
  Width = 304
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 168
    Top = 16
  end
  object conexao: TFDConnection
    Params.Strings = (
      'Database=banco_prova'
      'User_Name=root'
      'Password=12345'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 48
    Top = 16
  end
end
