object FConsultaGenerico: TFConsultaGenerico
  Left = 0
  Top = 0
  Caption = 'Tela de Consulta'
  ClientHeight = 371
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 330
    Width = 544
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btCancelar: TButton
      AlignWithMargins = True
      Left = 380
      Top = 4
      Width = 82
      Height = 33
      Align = alRight
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = btCancelarClick
      ExplicitLeft = 376
    end
    object btConfirmar: TButton
      AlignWithMargins = True
      Left = 468
      Top = 4
      Width = 76
      Height = 33
      Align = alRight
      Caption = 'Confirmar'
      TabOrder = 1
      OnClick = btConfirmarClick
      ExplicitLeft = 464
    end
  end
  object Grid: TDBGrid
    Left = 0
    Top = 0
    Width = 544
    Height = 330
    Align = alClient
    DataSource = dsConsulta
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = GridDblClick
  end
  object dsConsulta: TDataSource
    DataSet = fConsultaGenericoModel.tbConsulta
    Left = 688
    Top = 232
  end
end
