object fprincipal: Tfprincipal
  Left = 0
  Top = 0
  Caption = 'fprincipal'
  ClientHeight = 634
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 472
    Top = 582
    Width = 104
    Height = 16
    Caption = 'Total do Pedido:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 65
    Top = 75
    Width = 35
    Height = 16
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 75
    Width = 43
    Height = 16
    Caption = 'Codigo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 169
    Width = 43
    Height = 16
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 307
    Top = 169
    Width = 74
    Height = 16
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 407
    Top = 169
    Width = 34
    Height = 16
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 68
    Top = 169
    Width = 63
    Height = 16
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblcidade: TLabel
    Left = 8
    Top = 120
    Width = 95
    Height = 16
    Caption = 'Cidade/Estado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lbltitulo: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 10
    Width = 685
    Height = 31
    Margins.Top = 10
    Margins.Bottom = 0
    Align = alTop
    Alignment = taCenter
    Caption = 'Pedidos de Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbltotal: TLabel
    Left = 597
    Top = 582
    Width = 8
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 53
    Width = 152
    Height = 16
    Caption = 'Identifica'#231#227'o do Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 147
    Width = 143
    Height = 16
    Caption = 'Selecione os produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 578
    Top = 582
    Width = 17
    Height = 16
    Alignment = taRightJustify
    Caption = 'R$'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnbuscar: TButton
    Left = 305
    Top = 97
    Width = 76
    Height = 21
    Caption = 'Pesquisar'
    TabOrder = 0
    OnClick = btnbuscarClick
  end
  object btngravar: TButton
    Left = 472
    Top = 601
    Width = 211
    Height = 25
    Caption = 'Encerrar Pedido'
    TabOrder = 1
    OnClick = btngravarClick
  end
  object btninserir: TButton
    Left = 610
    Top = 191
    Width = 73
    Height = 22
    Caption = 'Inserir'
    TabOrder = 2
    OnClick = btninserirClick
  end
  object DBGrid1: TDBGrid
    Left = 7
    Top = 219
    Width = 676
    Height = 357
    DataSource = dmdados.dtsprodutos
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
  end
  object edtcodcliente: TEdit
    Left = 8
    Top = 97
    Width = 54
    Height = 21
    NumbersOnly = True
    TabOrder = 4
    OnDblClick = edtcodclienteDblClick
    OnExit = edtcodclienteExit
    OnKeyDown = edtcodclienteKeyDown
  end
  object edtcodproduto: TEdit
    Left = 8
    Top = 191
    Width = 54
    Height = 21
    Enabled = False
    TabOrder = 5
    OnExit = edtcodprodutoExit
    OnKeyDown = edtcodprodutoKeyDown
  end
  object edtnomecliente: TEdit
    Left = 65
    Top = 97
    Width = 234
    Height = 21
    TabOrder = 6
    OnDblClick = edtnomeclienteDblClick
    OnExit = edtnomeclienteExit
  end
  object edtnomeproduto: TEdit
    Left = 68
    Top = 191
    Width = 237
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object edtqtdproduto: TEdit
    Left = 307
    Top = 191
    Width = 98
    Height = 21
    Enabled = False
    TabOrder = 8
    OnKeyDown = edtqtdprodutoKeyDown
  end
  object edtvalorproduto: TEdit
    Left = 407
    Top = 191
    Width = 197
    Height = 21
    Enabled = False
    NumbersOnly = True
    TabOrder = 9
  end
  object btnbuscapedido: TButton
    Left = 387
    Top = 97
    Width = 76
    Height = 21
    Caption = 'Buscar Pedido'
    TabOrder = 10
    OnClick = btnbuscapedidoClick
  end
  object btnbuscapedidocanc: TButton
    Left = 469
    Top = 97
    Width = 92
    Height = 21
    Caption = 'Cancelar Pedido'
    TabOrder = 11
    OnClick = btnbuscapedidocancClick
  end
end
