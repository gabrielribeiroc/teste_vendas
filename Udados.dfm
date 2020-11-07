object dmdados: Tdmdados
  OldCreateOrder = False
  Height = 401
  Width = 435
  object connVendas: TFDConnection
    Params.Strings = (
      'Database=vendas'
      'User_Name=vendas'
      'Password=vendas@2020'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 64
    Top = 16
  end
  object qrgeral: TFDQuery
    Connection = connVendas
    Left = 48
    Top = 72
  end
  object qrprodutos: TFDQuery
    Connection = connVendas
    Left = 104
    Top = 72
  end
  object qrclientes: TFDQuery
    Connection = connVendas
    Left = 48
    Top = 136
  end
  object qrupdate: TFDQuery
    Connection = connVendas
    Left = 104
    Top = 136
  end
  object qrdelete: TFDQuery
    Connection = connVendas
    Left = 48
    Top = 200
  end
  object dtsprodutos: TDataSource
    DataSet = dsprodutos
    Left = 272
    Top = 24
  end
  object dsclientes: TDataSource
    DataSet = qrclientes
    Enabled = False
    Left = 336
    Top = 24
  end
  object dsprodutos: TClientDataSet
    PersistDataPacket.Data = {
      9A0000009619E0BD0100000018000000060000000000030000009A000B636F64
      5F70726F6475746F04000100000000000964657363726963616F020049000000
      010005574944544802000200FF000A7175616E74696461646508000400000000
      000A76616C6F725F756E697408000400000000000B76616C6F725F746F74616C
      08000400000000000B636F645F636C69656E746504000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cod_produto'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'quantidade'
        DataType = ftFloat
      end
      item
        Name = 'valor_unit'
        DataType = ftFloat
      end
      item
        Name = 'valor_total'
        DataType = ftFloat
      end
      item
        Name = 'cod_cliente'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 272
    Top = 88
    object cod_produto: TIntegerField
      DisplayLabel = 'C'#243'digo Produto'
      DisplayWidth = 14
      FieldName = 'cod_produto'
    end
    object descricao: TStringField
      DisplayLabel = 'Descricao'
      DisplayWidth = 16
      FieldName = 'descricao'
      Size = 255
    end
    object quantidade: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'quantidade'
    end
    object valor_unit: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      DisplayWidth = 10
      FieldName = 'valor_unit'
    end
    object valor_total: TFloatField
      DisplayLabel = 'Total'
      DisplayWidth = 10
      FieldName = 'valor_total'
    end
    object cod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Visible = False
    end
  end
  object qrinsertpedido: TFDQuery
    Connection = connVendas
    Left = 112
    Top = 200
  end
  object qrinsertpedidodetalhe: TFDQuery
    Connection = connVendas
    Left = 48
    Top = 256
  end
  object qrpedidos: TFDQuery
    Connection = connVendas
    Left = 120
    Top = 248
  end
  object dsbuscapedido: TDataSource
    DataSet = qrpedidos
    Enabled = False
    Left = 344
    Top = 88
  end
  object dsbuscapedidodetalhe: TDataSource
    DataSet = qrpedidosdetalhe
    Enabled = False
    Left = 344
    Top = 152
  end
  object qrpedidosdetalhe: TFDQuery
    Connection = connVendas
    Left = 48
    Top = 312
  end
  object qrdeletapedido: TFDQuery
    Connection = connVendas
    Left = 128
    Top = 304
  end
  object qrdeletapedidodetalhe: TFDQuery
    Connection = connVendas
    Left = 208
    Top = 320
  end
end
