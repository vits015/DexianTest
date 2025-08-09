unit uPedido;

interface

uses
  uCliente;

type
  TPedido = class
  private
    FPedidoID: Integer;
    FCliente: TCliente;
    FDataPedido: TDateTime;
    FValorTotal: Currency;
    FObservacao: String;
  public
    constructor Create;
    destructor Destroy; override;

    property PedidoID: Integer read FPedidoID write FPedidoID;
    property Cliente: TCliente read FCliente write FCliente;
    property DataPedido: TDateTime read FDataPedido write FDataPedido;
    property ValorTotal: Currency read FValorTotal write FValorTotal;
    property Observacao: String read FObservacao write FObservacao;
  end;

implementation

constructor TPedido.Create;
begin
  inherited Create;
  FCliente := TCliente.Create;
end;

destructor TPedido.Destroy;
begin
  FCliente.Free;
  inherited Destroy;
end;

end.
