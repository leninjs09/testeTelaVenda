inherited FConsultaProdutos: TFConsultaProdutos
  Caption = 'Consulta Produtos'
  TextHeight = 15
  inherited Panel1: TPanel
    ExplicitLeft = 0
    ExplicitTop = 330
    ExplicitWidth = 544
    inherited btCancelar: TButton
      ExplicitLeft = 376
      ExplicitTop = 4
    end
    inherited btConfirmar: TButton
      ExplicitLeft = 464
      ExplicitTop = 4
      ExplicitHeight = 33
    end
  end
  inherited Grid: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Width = 357
        Visible = True
      end>
  end
end
