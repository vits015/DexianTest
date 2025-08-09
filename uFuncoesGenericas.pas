unit uFuncoesGenericas;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client, uCliente, Data.DB;

procedure ClienteListToMemTable(AList: TObjectList<TCliente>; AMemTable: TFDMemTable);

implementation

procedure ClienteListToMemTable(AList: TObjectList<TCliente>; AMemTable: TFDMemTable);
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

end.