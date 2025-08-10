unit uClienteDAO;

interface

uses
  uCliente, System.Generics.Collections, FireDAC.Comp.Client, SysUtils, Data.DB;

type
  TClienteDAO = class
  private
    FConn: TFDConnection;
  public
    constructor Create(AConn: TFDConnection);
    function Get(AClienteID: Integer): TObjectList<TCliente>;
    procedure Post(ACliente: TCliente);
    procedure ClienteListToMemTable(AList: TObjectList<TCliente>; AMemTable: TFDMemTable);
  end;

implementation

constructor TClienteDAO.Create(AConn: TFDConnection);
begin
  FConn := AConn;
end;

procedure TClienteDAO.ClienteListToMemTable(AList: TObjectList<TCliente>; AMemTable: TFDMemTable);
var
  i: Integer;
  Cliente: TCliente;
begin
  AMemTable.Close;
  AMemTable.FieldDefs.Clear;
  AMemTable.FieldDefs.Add('ClienteID', ftInteger);
  AMemTable.FieldDefs.Add('Nome', ftString, 100);
  AMemTable.FieldDefs.Add('Telefone', ftString, 20);
  AMemTable.FieldDefs.Add('Email', ftString, 100);
  AMemTable.FieldDefs.Add('DataCadastro', ftDateTime);
  AMemTable.CreateDataSet;
  AMemTable.Open;

  for i := 0 to AList.Count - 1 do
  begin
    Cliente := AList[i];
    AMemTable.Append;
    AMemTable.FieldByName('ClienteID').AsInteger := Cliente.ClienteID;
    AMemTable.FieldByName('Nome').AsString := Cliente.Nome;
    AMemTable.FieldByName('Telefone').AsString := Cliente.Telefone;
    AMemTable.FieldByName('Email').AsString := Cliente.Email;
    AMemTable.FieldByName('DataCadastro').AsDateTime := Cliente.DataCadastro;
    AMemTable.Post;
  end;
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

