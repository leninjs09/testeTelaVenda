object FPedidosVendaModel: TFPedidosVendaModel
  OnCreate = DataModuleCreate
  Height = 120
  Width = 277
  object tbPedidoProdutos: TFDMemTable
    BeforePost = tbPedidoProdutosBeforePost
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 56
    Top = 32
    object tbPedidoProdutosCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tbPedidoProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object tbPedidoProdutosQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tbPedidoProdutosPrecoUnitario: TCurrencyField
      FieldName = 'PrecoUnitario'
    end
    object tbPedidoProdutosTotal: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'Total'
    end
    object tbPedidoProdutosCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
  end
  object dsPedidoProdutos: TDataSource
    DataSet = tbPedidoProdutos
    Left = 176
    Top = 32
  end
end
