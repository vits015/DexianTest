unit uClienteController;

interface

uses
  uClienteDAO, uCliente, System.Generics.Collections, System.SysUtils, uDataModule;

type
  TClienteController = class
  private
    FModel: TClienteDAO;
  public
    constructor Create;
    destructor Destroy; override;

    function GetClientes: TObjectList<TCliente>;
    function GetClienteById(AId: Integer): TCliente;
    procedure AddCliente(ACliente: TCliente);
    // procedure UpdateCliente(ACliente: TClienteModel);
    // procedure DeleteCliente(AId: Integer);
  end;

implementation

{ TClienteController }

constructor TClienteController.Create;
begin
  FModel := TClienteDAO.Create(DM.FDConnection);
end;

destructor TClienteController.Destroy;
begin
  FModel.Free;
  inherited;
end;

function TClienteController.GetClientes: TObjectList<TCliente>;
begin
  Result := FModel.Get(0); // 0 para obter todos os clientes
end;

function TClienteController.GetClienteById(AId: Integer): TCliente;
begin    
  Result := FModel.Get(AId).First;
end;

procedure TClienteController.AddCliente(ACliente: TCliente);
begin
  if Assigned(ACliente) then
    FModel.Post(ACliente)
    else
      raise Exception.Create('Cliente nulo');
end;

// procedure TClienteController.UpdateCliente(ACliente: TClienteModel);
// begin
//   FModel.Put(ACliente);
// end;

// procedure TClienteController.DeleteCliente(AId: Integer);
// begin
//   FModel.Delete(AId);
// end;

end.
