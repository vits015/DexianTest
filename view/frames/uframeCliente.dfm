object frameCliente: TframeCliente
  Left = 0
  Top = 0
  Width = 640
  Height = 210
  Align = alClient
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object pnlCampos: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 210
    Align = alClient
    BevelOuter = bvNone
    Color = 16316664
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 240
    ExplicitHeight = 383
    object lblClienteID: TLabel
      Left = 16
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Cliente ID:'
    end
    object lblNome: TLabel
      Left = 16
      Top = 48
      Width = 33
      Height = 13
      Caption = 'Nome:'
    end
    object lblTelefone: TLabel
      Left = 16
      Top = 80
      Width = 46
      Height = 13
      Caption = 'Telefone:'
    end
    object lblEmail: TLabel
      Left = 16
      Top = 112
      Width = 34
      Height = 13
      Caption = 'E-mail:'
    end
    object lblDataCadastro: TLabel
      Left = 16
      Top = 144
      Width = 92
      Height = 13
      Caption = 'Data de Cadastro:'
    end
    object edtClienteID: TEdit
      Left = 116
      Top = 8
      Width = 80
      Height = 21
      TabOrder = 0
    end
    object edtNome: TEdit
      Left = 116
      Top = 44
      Width = 300
      Height = 21
      TabOrder = 1
    end
    object edtTelefone: TMaskEdit
      Left = 116
      Top = 76
      Width = 116
      Height = 21
      EditMask = '!\(99\)00000-0000;1;_'
      MaxLength = 14
      TabOrder = 2
      Text = '(  )     -    '
    end
    object edtEmail: TEdit
      Left = 116
      Top = 108
      Width = 300
      Height = 21
      TabOrder = 3
    end
    object dtpDataCadastro: TDateTimePicker
      Left = 116
      Top = 141
      Width = 300
      Height = 21
      Date = 45879.000000000000000000
      Time = 0.363966412034642400
      TabOrder = 4
    end
  end
end
