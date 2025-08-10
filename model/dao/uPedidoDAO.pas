unit uPedidoDAO;

interface

uses
  uPedido, System.Generics.Collections, FireDAC.Comp.Client, SysUtils, Data.DB;

type
  TPedidoDAO = class
  private
    FConn: TFDConnection;
  public
    constructor Create(AConn: TFDConnection);
    function Get(APedido: TPedido): TObjectList<TPedido>;
    procedure Post(APedido: TPedido);
    procedure Put(APedido: TPedido);
    procedure Delete(AId: Integer);
    procedure PedidoListToMemTable(AList: TObjectList<TPedido>; AMemTable: TFDMemTable);
  end;

implementation

constructor TPedidoDAO.Create(AConn: TFDConnection);
begin
  FConn := AConn;
end;

procedure TPedidoDAO.PedidoListToMemTable(AList: TObjectList<TPedido>; AMemTable: TFDMemTable);
var
  i: Integer;
  Pedido: TPedido;
begin
  AMemTable.Close;
  AMemTable.FieldDefs.Clear;
  AMemTable.FieldDefs.Add('PedidoID', ftInteger);
  AMemTable.FieldDefs.Add('ClienteID', ftInteger);
  AMemTable.FieldDefs.Add('DataPedido', ftDateTime);
  AMemTable.FieldDefs.Add('ValorTotal', ftFloat);
  AMemTable.FieldDefs.Add('Observacao', ftString, 50);
  AMemTable.CreateDataSet;
  AMemTable.Open;

  for i := 0 to AList.Count - 1 do
  begin
    Pedido := AList[i];
    AMemTable.Append;
    AMemTable.FieldByName('PedidoID').AsInteger := Pedido.PedidoID;
    AMemTable.FieldByName('ClienteID').AsInteger := Pedido.Cliente.ClienteID;
    AMemTable.FieldByName('DataPedido').AsDateTime := Pedido.DataPedido;
    AMemTable.FieldByName('ValorTotal').AsFloat := Pedido.ValorTotal;
    AMemTable.FieldByName('Observacao').AsString := Pedido.Observacao;
    AMemTable.Post;
  end;
end;

function TPedidoDAO.Get(APedido: TPedido): TObjectList<TPedido>;
var
  Q: TFDQuery;
  LPedido: TPedido;
  WhereAdded: Boolean;
begin
  Q := TFDQuery.Create(nil);
  try
    try
      Result := TObjectList<TPedido>.Create;
      Q.Connection := FConn;
      Q.SQL.Text := 'SELECT PedidoID, ClienteID, DataPedido, ValorTotal, Observacao FROM PEDIDOS';
      WhereAdded := False;

      if (APedido <> nil) then
      begin
        if APedido.PedidoID > 0 then
        begin
          Q.SQL.Add('WHERE PedidoID = :PedidoID');
          Q.ParamByName('PedidoID').AsInteger := APedido.PedidoID;
          WhereAdded := True;
        end;

        if APedido.Cliente.ClienteID > 0 then
        begin
          if not WhereAdded then
          begin
            Q.SQL.Add('WHERE ClienteID = :ClienteID');
            WhereAdded := True;
          end
          else
            Q.SQL.Add('AND ClienteID = :ClienteID');
          Q.ParamByName('ClienteID').AsInteger := APedido.Cliente.ClienteID;
        end;

//        if APedido.DataPedido > 0 then
//        begin
//          if not WhereAdded then
//          begin
//            Q.SQL.Add('WHERE DataPedido = :DataPedido');
//            WhereAdded := True;
//          end
//          else
//            Q.SQL.Add('AND DataPedido = :DataPedido');
//          Q.ParamByName('DataPedido').AsDateTime := APedido.DataPedido;
//        end;

        if APedido.ValorTotal > 0 then
        begin
          if not WhereAdded then
          begin
            Q.SQL.Add('WHERE ValorTotal = :ValorTotal');
            WhereAdded := True;
          end
          else
            Q.SQL.Add('AND ValorTotal = :ValorTotal');
          Q.ParamByName('ValorTotal').AsFloat := APedido.ValorTotal;
        end;
      end;

      Q.Open;
      Q.First;
      while not Q.Eof do
      begin
        LPedido := TPedido.Create;
        LPedido.PedidoID := Q.FieldByName('PedidoID').AsInteger;
        LPedido.Cliente.ClienteID := Q.FieldByName('ClienteID').AsInteger;
        LPedido.DataPedido := Q.FieldByName('DataPedido').AsDateTime;
        LPedido.ValorTotal := Q.FieldByName('ValorTotal').AsFloat;
        LPedido.Observacao := Q.FieldByName('Observacao').AsString;
        Result.Add(LPedido);
        Q.Next;
      end;
    except
      on E: Exception do
        raise Exception.Create('Erro ao listar pedidos: ' + E.Message);
    end;
  finally
    Q.Free;
  end;
end;

procedure TPedidoDAO.Post(APedido: TPedido);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    try
      Q.Connection := FConn;
      Q.SQL.Text := 'INSERT INTO PEDIDOS (ClienteID, DataPedido, ValorTotal, Observacao) VALUES (:ClienteID, :DataPedido, :ValorTotal, :Observacao)';
      Q.ParamByName('ClienteID').AsInteger := APedido.Cliente.ClienteID;
      Q.ParamByName('DataPedido').AsDateTime := APedido.DataPedido;
      Q.ParamByName('ValorTotal').AsFloat := APedido.ValorTotal;
      Q.ParamByName('Observacao').AsString := APedido.Observacao;
      Q.ExecSQL;
    except
      on E: Exception do
        raise Exception.Create('Erro ao inserir pedido: ' + E.Message);
    end;
  finally
    Q.Free;
  end;
end;

procedure TPedidoDAO.Put(APedido: TPedido);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    try
      Q.Connection := FConn;
      Q.SQL.Text :=
        'UPDATE PEDIDOS SET ' +
        'ClienteID = :ClienteID, ' +
        'DataPedido = :DataPedido, ' +
        'ValorTotal = :ValorTotal, ' +
        'Observacao = :Observacao ' +
        'WHERE PedidoID = :PedidoID';
      Q.ParamByName('ClienteID').AsInteger := APedido.Cliente.ClienteID;
      Q.ParamByName('DataPedido').AsDateTime := APedido.DataPedido;
      Q.ParamByName('ValorTotal').AsFloat := APedido.ValorTotal;
      Q.ParamByName('PedidoID').AsInteger := APedido.PedidoID;
      Q.ParamByName('Observacao').AsString := APedido.Observacao;
      Q.ExecSQL;
    except
      on E: Exception do
        raise Exception.Create('Erro ao atualizar pedido: ' + E.Message);
    end;
  finally
    Q.Free;
  end;
end;

procedure TPedidoDAO.Delete(AId: Integer);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    try
      Q.Connection := FConn;
      Q.SQL.Text := 'DELETE FROM PEDIDOS WHERE PedidoID = :PedidoID';
      Q.ParamByName('PedidoID').AsInteger := AId;
      Q.ExecSQL;
    except
      on E: Exception do
        raise Exception.Create('Erro ao excluir pedido: ' + E.Message);
    end;
  finally
    Q.Free;
  end;
end;

end.