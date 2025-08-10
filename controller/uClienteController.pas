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
    procedure AddCliente(ACliente: TCliente);
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
  Result := FCLienteDAO.Get(0); // 0 para obter todos os clientes
end;

function TClienteController.GetClientesMemTable: TFDMemTable;
begin
  Result := TFDMemTable.Create(nil);
  FClienteDAO.ClienteListToMemTable(GetClientes, Result);
end;

function TClienteController.GetClienteById(AId: Integer): TCliente;
begin    
  Result := FCLienteDAO.Get(AId).First;
end;

procedure TClienteController.AddCliente(ACliente: TCliente);
begin
  if Assigned(ACliente) then
    FCLienteDAO.Post(ACliente)
    else
      raise Exception.Create('Cliente nulo');
end;

// procedure TClienteController.UpdateCliente(ACliente: TClienteModel);
// begin
//   FCLienteDAO.Put(ACliente);
// end;

// procedure TClienteController.DeleteCliente(AId: Integer);
// begin
//   FCLienteDAO.Delete(AId);
// end;

end.
