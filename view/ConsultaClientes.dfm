inherited FConsultaClientes: TFConsultaClientes
  Caption = 'Consulta Clientes'
  ClientWidth = 553
  ExplicitWidth = 565
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 553
    ExplicitLeft = 0
    ExplicitTop = 330
    ExplicitWidth = 532
    inherited btCancelar: TButton
      Left = 385
      ExplicitLeft = 380
      ExplicitTop = 4
    end
    inherited btConfirmar: TButton
      Left = 473
      ExplicitLeft = 468
      ExplicitTop = 4
      ExplicitHeight = 33
    end
  end
  inherited Grid: TDBGrid
    Width = 553
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 259
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
        Width = 79
        Visible = True
      end>
  end
end
