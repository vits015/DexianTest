unit uClienteDAO;

interface

uses
  uCliente, System.Generics.Collections, FireDAC.Comp.Client, SysUtils;

type
  TClienteDAO = class
  private
    FConn: TFDConnection;
  public
    constructor Create(AConn: TFDConnection);
    function Get(AClienteID: Integer): TObjectList<TCliente>;
    procedure Post(ACliente: TCliente);
  end;

implementation

constructor TClienteDAO.Create(AConn: TFDConnection);
begin
  FConn := AConn;
end;

function TClienteDAO.Get(AClienteID: Integer): TObjectList<TCliente>;
var
  Q: TFDQuery;
  LCliente: TCliente;
begin
  Q := TFDQuery.Create(nil);
  try
    try    
      Result := TObjectList<TCliente>.Create;
      Q.Connection := FConn;
      Q.SQL.Text := 'SELECT ClienteID, Nome, Telefone, Email, DataCadastro FROM CLIENTES WHERE 1=1';
      if AClienteID > 0 then
      begin
        Q.SQL.Add(' AND ClienteID = :ClienteID');
        Q.ParamByName('ClienteID').AsInteger := AClienteID;
      end;
      Q.Open;
      Q.First;
      while not Q.Eof do
      begin
        LCliente := TCliente.Create;
        LCliente.ClienteID := Q.FieldByName('ClienteID').AsInteger;
        LCliente.Nome := Q.FieldByName('Nome').AsString;
        LCliente.Telefone := Q.FieldByName('Telefone').AsString;
        LCliente.Email := Q.FieldByName('Email').AsString;
        LCliente.DataCadastro := Q.FieldByName('DataCadastro').AsDateTime;
        Result.Add(LCliente);      
        Q.Next;      
      end;    
    except
      on E: Exception do        
        raise Exception.Create('Erro ao listar clientes: ' + E.Message);
    end;
  finally
    Q.Free;
  end;
end;

procedure TClienteDAO.Post(ACliente: TCliente);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    try
      Q.Connection := FConn;
      Q.SQL.Text := 'INSERT INTO CLIENTES (Nome, Telefone, Email, DataCadastro) VALUES (:Nome, :Telefone, :Email, :DataCadastro)';
      Q.ParamByName('Nome').AsString := ACliente.Nome;
      Q.ParamByName('Telefone').AsString := ACliente.Telefone;
      Q.ParamByName('Email').AsString := ACliente.Email;
      Q.ParamByName('DataCadastro').AsDateTime := ACliente.DataCadastro;
      Q.ExecSQL;      
    except
      on E: Exception do
      begin        
        raise Exception.Create('Erro ao inserir cliente: ' + E.Message);
      end;
    end;
  finally
    Q.Free;
  end;
end;

end.

