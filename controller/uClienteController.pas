unit uClienteController;

interface

uses
  uClienteDAO, uCliente, System.Generics.Collections, System.SysUtils, uDataModule,
  FireDAC.Comp.Client;

type
  TClienteController = class
  private
    FCLienteDAO: TClienteDAO;
  public
    constructor Create;
    destructor Destroy; override;

    function GetClientes: TObjectList<TCliente>;
    function GetClientesMemTable: TFDMemTable;
    function GetClienteById(AId: Integer): TCliente;
    function GetClienteByIdMemTable(ACliente: TCliente): TFDMemTable;
    function AddCliente(ACliente: TCliente): Boolean;
    function UpdateCliente(ACliente: TCliente): Boolean;
    function DeleteCliente(AId: Integer): Boolean;

    // procedure UpdateCliente(ACliente: TClienteModel);
    // procedure DeleteCliente(AId: Integer);
  end;

implementation

{ TClienteController }

constructor TClienteController.Create;
begin
  FCLienteDAO := TClienteDAO.Create(DM.FDConnection);
end;

destructor TClienteController.Destroy;
begin
  FCLienteDAO.Free;
  inherited;
end;

function TClienteController.GetClientes: TObjectList<TCliente>;
begin
  Result := FCLienteDAO.Get(nil); // nil para obter todos os clientes
end;

function TClienteController.GetClientesMemTable: TFDMemTable;
begin
  Result := TFDMemTable.Create(nil);
  FClienteDAO.ClienteListToMemTable(GetClientes, Result);
end;

function TClienteController.GetClienteById(AId: Integer): TCliente;
var
  LCliente:TCliente;
begin
  LCliente := TCliente.Create;
  LCliente.ClienteID := Aid;
  Result := FCLienteDAO.Get(LCliente).First;
end;

function TClienteController.GetClienteByIdMemTable(ACliente: TCliente): TFDMemTable;
begin
  Result := TFDMemTable.Create(nil);
  FClienteDAO.ClienteListToMemTable(FCLienteDAO.Get(ACliente), Result);
end;

function TClienteController.AddCliente(ACliente: TCliente): Boolean;
begin
  if Assigned(ACliente) then
  begin
    FCLienteDAO.Post(ACliente);
    Result := True;
  end
  else
  begin
    Result := False;
    raise Exception.Create('Cliente nulo');
  end;
end;
function TClienteController.UpdateCliente(ACliente: TCliente): Boolean;
begin
  if Assigned(ACliente) then
  begin
    FCLienteDAO.Put(ACliente);
    Result := True;
  end
  else
  begin
    Result := False;
    raise Exception.Create('Cliente nulo');
  end;
end;
function TClienteController.DeleteCliente(AId: Integer): Boolean;
begin
  if AId > 0 then
  begin
    FCLienteDAO.Delete(AId);
    Result := True;
  end
  else
  begin
    Result := False;
    raise Exception.Create('ID do Cliente inválido');
  end;
end;

end.
