unit uPedidoController;

interface

uses
  uPedidoDAO, uPedido, System.Generics.Collections, System.SysUtils, uDataModule,
  FireDAC.Comp.Client;

type
  TPedidoController = class
  private
    FPedidoDAO: TPedidoDAO;
  public
    constructor Create;
    destructor Destroy; override;

    function GetPedidos: TObjectList<TPedido>;
    function GetPedidosMemTable: TFDMemTable;
    function GetPedidoById(AId: Integer): TPedido;
    function GetPedidoByIdMemTable(APedido: TPedido): TFDMemTable;
    function AddPedido(APedido: TPedido): Boolean;
    function UpdatePedido(APedido: TPedido): Boolean;
    function DeletePedido(AId: Integer): Boolean;
  end;

implementation

{ TPedidoController }

constructor TPedidoController.Create;
begin
  FPedidoDAO := TPedidoDAO.Create(DM.FDConnection);
end;

destructor TPedidoController.Destroy;
begin
  FPedidoDAO.Free;
  inherited;
end;

function TPedidoController.GetPedidos: TObjectList<TPedido>;
begin
  Result := FPedidoDAO.Get(nil); // nil para obter todos os pedidos
end;

function TPedidoController.GetPedidosMemTable: TFDMemTable;
begin
  Result := TFDMemTable.Create(nil);
  FPedidoDAO.PedidoListToMemTable(GetPedidos, Result);
end;

function TPedidoController.GetPedidoById(AId: Integer): TPedido;
var
  LPedido: TPedido;
begin
  LPedido := TPedido.Create;
  LPedido.PedidoID := AId;
  Result := FPedidoDAO.Get(LPedido).First;
end;

function TPedidoController.GetPedidoByIdMemTable(APedido: TPedido): TFDMemTable;
begin
  Result := TFDMemTable.Create(nil);
  FPedidoDAO.PedidoListToMemTable(FPedidoDAO.Get(APedido), Result);
end;

function TPedidoController.AddPedido(APedido: TPedido): Boolean;
begin
  if Assigned(APedido) then
  begin
    FPedidoDAO.Post(APedido);
    Result := True;
  end
  else
  begin
    Result := False;
    raise Exception.Create('Pedido nulo');
  end;
end;

function TPedidoController.UpdatePedido(APedido: TPedido): Boolean;
begin
  if Assigned(APedido) then
  begin
    FPedidoDAO.Put(APedido);
    Result := True;
  end
  else
  begin
    Result := False;
    raise Exception.Create('Pedido nulo');
  end;
end;

function TPedidoController.DeletePedido(AId: Integer): Boolean;
begin
  if AId > 0 then
  begin
    FPedidoDAO.Delete(AId);
    Result := True;
  end
  else
  begin
    Result := False;
    raise Exception.Create('ID do Pedido inválido');
  end;
end;

end.
