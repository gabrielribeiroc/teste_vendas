object Fbusca: TFbusca
  Left = 0
  Top = 0
  Caption = 'Fbusca'
  ClientHeight = 277
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 569
    Height = 277
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 224
    ExplicitTop = 136
    ExplicitWidth = 185
    ExplicitHeight = 41
    object lbltitulo: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 11
      Width = 557
      Height = 26
      Margins.Left = 5
      Margins.Top = 10
      Margins.Right = 5
      Align = alTop
      Alignment = taCenter
      Caption = 'Buscar Clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 6
    end
    object lblnome: TLabel
      Left = 6
      Top = 37
      Width = 43
      Height = 16
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtnome: TEdit
      Left = 6
      Top = 56
      Width = 475
      Height = 21
      TabOrder = 0
    end
    object dbgrid_result: TDBGrid
      Left = 7
      Top = 83
      Width = 556
      Height = 186
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgrid_resultDblClick
    end
    object btnok: TButton
      Left = 487
      Top = 54
      Width = 75
      Height = 25
      Caption = 'BUSCAR'
      TabOrder = 2
      OnClick = btnokClick
    end
  end
end
