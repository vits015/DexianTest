object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object btnCadastroClientes: TButton
    Left = 56
    Top = 167
    Width = 145
    Height = 73
    Caption = 'Cadastro Clientes'
    TabOrder = 0
    OnClick = btnCadastroClientesClick
  end
  object btnCadastroFuncionarios: TButton
    Left = 232
    Top = 167
    Width = 153
    Height = 74
    Caption = 'Cadastro Pedidos'
    TabOrder = 1
    OnClick = btnCadastroFuncionariosClick
  end
  object Button1: TButton
    Left = 424
    Top = 167
    Width = 153
    Height = 74
    Caption = 'Relat'#243'rio'
    TabOrder = 2
    OnClick = btnCadastroFuncionariosClick
  end
  object frxReport1: TfrxReport
    Version = '2023.3.4'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45878.311472581020000000
    ReportOptions.LastChange = 45878.311472581020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 496
    Top = 112
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
    end
  end
end
