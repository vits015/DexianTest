object frmConsultaPadrao: TfrmConsultaPadrao
  Left = 0
  Top = 0
  Caption = 'Consulta'
  ClientHeight = 400
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 700
    Height = 50
    Align = alTop
    TabOrder = 0
  end
  object dbgDados: TDBGrid
    Left = 0
    Top = 50
    Width = 700
    Height = 300
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 350
    Width = 700
    Height = 50
    Align = alBottom
    TabOrder = 2
    object btnFiltrar: TButton
      Left = 9
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 0
    end
    object btnTodos: TButton
      Left = 90
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Todos'
      TabOrder = 1
      OnClick = btnTodosClick
    end
    object btnIncluir: TButton
      Left = 170
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 2
    end
    object btnAlterar: TButton
      Left = 250
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 3
    end
    object btnExcluir: TButton
      Left = 330
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 4
    end
    object btnConsultar: TButton
      Left = 410
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Consultar'
      TabOrder = 5
    end
  end
end
