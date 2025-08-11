object framePedido: TframePedido
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object pnlPedido: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    TabOrder = 0
    object lbPedidoID: TLabel
      Left = 33
      Top = 41
      Width = 54
      Height = 15
      Caption = 'Pedido ID:'
    end
    object lbValorTotal: TLabel
      Left = 33
      Top = 367
      Width = 58
      Height = 15
      Caption = 'Valor Total:'
    end
    object lbObservacao: TLabel
      Left = 26
      Top = 407
      Width = 65
      Height = 15
      Caption = 'Obserca'#231#227'o:'
    end
    object lbDataPedido: TLabel
      Left = 33
      Top = 81
      Width = 84
      Height = 15
      Caption = 'Data do Pedido:'
    end
    object lbClientePedido: TLabel
      Left = 26
      Top = 126
      Width = 40
      Height = 15
      Caption = 'Cliente:'
    end
    object edtPedidoID: TEdit
      Left = 123
      Top = 38
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object edtValorTotal: TEdit
      Left = 97
      Top = 364
      Width = 121
      Height = 23
      TabOrder = 1
    end
    object memoObservacao: TMemo
      Left = 97
      Top = 404
      Width = 432
      Height = 72
      TabOrder = 2
    end
    object dtpDataPedido: TDateTimePicker
      Left = 123
      Top = 78
      Width = 186
      Height = 23
      Date = 45879.000000000000000000
      Time = 0.661812546299188400
      TabOrder = 3
    end
    object pnClientePedido: TPanel
      Left = 8
      Top = 147
      Width = 617
      Height = 211
      TabOrder = 4
      inline frameCliente1: TframeCliente
        Left = 1
        Top = 1
        Width = 615
        Height = 209
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
        inherited pnlCampos: TPanel
          Width = 615
          Height = 209
          StyleElements = [seFont, seClient, seBorder]
          ExplicitLeft = 0
          ExplicitHeight = 210
          inherited lblClienteID: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited lblNome: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited lblTelefone: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited lblEmail: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited lblDataCadastro: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited edtClienteID: TEdit
            StyleElements = [seFont, seClient, seBorder]
            OnExit = frameCliente1edtClienteIDExit
          end
          inherited edtNome: TEdit
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited edtTelefone: TMaskEdit
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited edtEmail: TEdit
            StyleElements = [seFont, seClient, seBorder]
          end
        end
      end
    end
  end
end
