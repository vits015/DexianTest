object frmManutencaoPadrao: TfrmManutencaoPadrao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Manuten'#231#227'o'
  ClientHeight = 300
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 40
    Align = alTop
    Caption = 'Formul'#225'rio de Manuten'#231#227'o'
    TabOrder = 0
    ExplicitTop = -6
  end
  object pnlCampos: TPanel
    Left = 0
    Top = 40
    Width = 500
    Height = 200
    Align = alClient
    TabOrder = 1
    ExplicitTop = 34
    object lblCampo1: TLabel
      Left = 16
      Top = 16
      Width = 51
      Height = 15
      Caption = 'Campo 1:'
    end
    object lblCampo2: TLabel
      Left = 16
      Top = 48
      Width = 51
      Height = 15
      Caption = 'Campo 2:'
    end
    object lblCampo3: TLabel
      Left = 16
      Top = 116
      Width = 85
      Height = 15
      Caption = 'Valor Num'#233'rico:'
    end
    object lblCampo4: TLabel
      Left = 16
      Top = 148
      Width = 27
      Height = 15
      Caption = 'Data:'
    end
    object edtCampo1: TEdit
      Left = 108
      Top = 12
      Width = 200
      Height = 23
      TabOrder = 0
    end
    object memCampo2: TMemo
      Left = 108
      Top = 44
      Width = 200
      Height = 60
      TabOrder = 1
    end
    object edtCampo3: TEdit
      Left = 108
      Top = 112
      Width = 100
      Height = 23
      TabOrder = 2
    end
    object dtpCampo4: TDateTimePicker
      Left = 108
      Top = 141
      Width = 120
      Height = 23
      Date = 45876.000000000000000000
      Time = 0.871552754630101800
      TabOrder = 3
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 240
    Width = 500
    Height = 60
    Align = alBottom
    TabOrder = 2
    object dbnNavegacao: TDBNavigator
      Left = 10
      Top = 15
      Width = 240
      Height = 25
      TabOrder = 0
      Visible = False
    end
    object btnRestaurar: TButton
      Left = 255
      Top = 15
      Width = 75
      Height = 25
      Caption = 'Restaurar'
      TabOrder = 1
      Visible = False
    end
    object btnOk: TButton
      Left = 340
      Top = 15
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
    end
    object btnSair: TButton
      Left = 420
      Top = 15
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 3
      OnClick = btnSairClick
    end
  end
end
