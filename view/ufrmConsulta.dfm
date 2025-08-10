object frmConsulta: TfrmConsulta
  Left = 0
  Top = 0
  Caption = 'Consulta '
  ClientHeight = 444
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlBotoes: TPanel
    Left = 574
    Top = 0
    Width = 117
    Height = 444
    Align = alRight
    TabOrder = 0
    object btnFiltrar: TBitBtn
      Left = 11
      Top = 15
      Width = 95
      Height = 33
      Caption = '&Filtrar'
      TabOrder = 0
      OnClick = btnFiltrarClick
    end
    object btnTodos: TBitBtn
      Left = 11
      Top = 55
      Width = 95
      Height = 33
      Caption = '&Todos'
      TabOrder = 1
      OnClick = btnTodosClick
    end
    object btnIncluir: TBitBtn
      Left = 11
      Top = 94
      Width = 95
      Height = 33
      Caption = '&Incluir'
      TabOrder = 2
      OnClick = btnIncluirClick
    end
    object btnAlterar: TBitBtn
      Left = 11
      Top = 133
      Width = 95
      Height = 33
      Caption = '&Alterar'
      TabOrder = 3
      OnClick = btnAlterarClick
    end
    object btnExcluir: TBitBtn
      Left = 11
      Top = 172
      Width = 95
      Height = 33
      Caption = '&Excluir'
      TabOrder = 4
      OnClick = btnExcluirClick
    end
    object btnConsultar: TBitBtn
      Left = 6
      Top = 211
      Width = 95
      Height = 33
      Caption = '&Consultar'
      TabOrder = 5
      OnClick = btnConsultarClick
    end
    object BitBtn7: TBitBtn
      Left = 11
      Top = 390
      Width = 95
      Height = 33
      Caption = '&Sair'
      Kind = bkAbort
      NumGlyphs = 2
      TabOrder = 6
    end
  end
  object pnlCentral: TPanel
    Left = 0
    Top = 0
    Width = 574
    Height = 444
    Align = alClient
    TabOrder = 1
    object dbgDados: TDBGrid
      Left = 1
      Top = 1
      Width = 572
      Height = 442
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
end
