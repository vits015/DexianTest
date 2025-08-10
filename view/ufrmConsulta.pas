unit ufrmConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, uClienteController,
  Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Comp.Client, uDataModule,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,System.Generics.Collections,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uFuncoesGenericas, uCliente,
  ufrmManutencao, Vcl.Buttons, uTypes;

type

  TfrmConsulta = class(TForm)
    pnlCentral: TPanel;
    dbgDados: TDBGrid;
    pnlBotoes: TPanel;
    btnFiltrar: TBitBtn;
    btnTodos: TBitBtn;
    btnIncluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnConsultar: TBitBtn;
    procedure btnTodosClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
    FEntityType: TEntityType;
    FClienteController: TClienteController;
    mtDados: TFDMemTable;
    dsDados: TDataSource;
//    FPedidoController: TPedidoController;
    procedure ListarTodos;
  protected
    procedure setHandleObject(AObjectName: TEntityType);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AEntityType: TEntityType); overload;
  end;

var
  frmConsulta: TfrmConsulta;

implementation

{$R *.dfm}

{ TfrmConsultaPadrao }

procedure TfrmConsulta.setHandleObject(AObjectName: TEntityType);
begin
  FEntityType := AObjectName;
  case FEntityType of
    eCliente: FClienteController := TClienteController.Create;
//    onPedido: FPedidoController := TPedidoController.Create;
  end;
end;

procedure TfrmConsulta.btnAlterarClick(Sender: TObject);
var
  Cliente:TCliente;
begin
  try
    case FEntityType of
      eCliente:
      begin
        if mtDados.IsEmpty then
        begin
          Application.MessageBox('É Necessário selecionar um Cliente!', 'Aviso', MB_OK or MB_ICONWARNING);
          Exit;
        end;
        Cliente := TCliente.Create;
        Cliente.ClienteID := mtDados.FieldByName('ClienteID').AsInteger;
        Cliente.Nome := mtDados.FieldByName('Nome').AsString;
        Cliente.Email := mtDados.FieldByName('Email').AsString;
        Cliente.Telefone := mtDados.FieldByName('Telefone').AsString;
        Cliente.DataCadastro := mtDados.FieldByName('DataCadastro').AsDateTime;
        frmManutencao := TFrmManutencao.Create(self, FEntityType, fmUpdate, Cliente);
      end;
    end;
    if (frmManutencao.ShowModal = mrOk) then
    begin
      if (FClienteController.UpdateCliente(frmManutencao.ClienteResult)) then
        Application.MessageBox(PChar('O Cliente ' + frmManutencao.ClienteResult.ClienteID.ToString + ' foi alterado com sucesso!'), 'Sucesso', MB_OK or MB_ICONINFORMATION)
      else
        Application.MessageBox(PChar('Erro ao alterar o Cliente'), 'Erro', MB_OK or MB_ICONERROR);
    end;
    ListarTodos;
  finally
    if Assigned(frmManutencao) then
      frmManutencao.Free;
  end;
end;

procedure TfrmConsulta.btnConsultarClick(Sender: TObject);
var
  frmManutencao: TfrmManutencao;
begin
  ListarTodos;
  frmManutencao := TfrmManutencao.Create(self,FEntityType,fmConsult, nil, dbgDados.DataSource);
  frmManutencao.ShowModal;

end;

procedure TfrmConsulta.btnExcluirClick(Sender: TObject);
begin
  case FEntityType of
    eCliente:
    begin
      if mtDados.IsEmpty then
      begin
        Application.MessageBox('É Necessário selecionar um Cliente!', 'Aviso', MB_OK or MB_ICONWARNING);
        Exit;
      end;
      if Application.MessageBox(PWideChar('Deseja realmente excluir o Cliente ' + mtDados.FieldByName('Nome').AsString), 'Confirmação', MB_YESNO or MB_ICONQUESTION) = IDYES then
      begin
        if (FClienteController.DeleteCliente(mtDados.FieldByName('ClienteID').AsInteger)) then
          Application.MessageBox('Cliente excluído com sucesso!', 'Sucesso', MB_OK or MB_ICONINFORMATION)
        else
          Application.MessageBox('Erro ao excluir o Cliente', 'Erro', MB_OK or MB_ICONERROR);
      end;
    end;
  end;
  ListarTodos;
end;

procedure TfrmConsulta.btnFiltrarClick(Sender: TObject);
var
  frmManutencao:TFrmManutencao;
  Cliente: TCliente;
begin
  frmManutencao := TFrmManutencao.Create(self, FEntityType, fmFilter);
  try
    if (frmManutencao.ShowModal = mrOk) then
    begin
      case FEntityType of
        eCliente:
        begin
          Cliente := frmManutencao.ClienteResult;
          mtDados:=  FClienteController.GetClienteByIdMemTable(Cliente);
        end;
      end;
      dsDados.DataSet := mtDados;
      dbgDados.DataSource := dsDados;
    end;
  finally
    frmManutencao.Free;
  end;
end;

procedure TfrmConsulta.btnIncluirClick(Sender: TObject);
var
  Cliente:TCliente;
begin
  try
    frmManutencao := TFrmManutencao.Create(self, FEntityType, fmInsert);
    if (frmManutencao.ShowModal = mrOk) then
    begin
      case FEntityType of
        eCliente:
        begin
          Cliente := frmManutencao.ClienteResult;
          if (FClienteController.AddCliente(Cliente)) then
            Application.MessageBox(PChar('O Cliente ' + Cliente.Nome + ' foi incluído com sucesso!'), 'Sucesso', MB_OK or MB_ICONINFORMATION)
          else
            Application.MessageBox(PChar('Erro ao incluir o Cliente'), 'Erro', MB_OK or MB_ICONERROR);
        end;
      end;
    end;

  finally
    frmManutencao.Free;
  end;
end;

procedure TfrmConsulta.btnTodosClick(Sender: TObject);
begin
  ListarTodos;
end;

constructor TfrmConsulta.Create(AOwner: TComponent; AEntityType: TEntityType);
begin
  inherited Create(AOwner);
  setHandleObject(AEntityType);

  mtDados := TFDMemTable.Create(Self);
  dsDados := TDataSource.Create(Self);
end;

procedure TfrmConsulta.ListarTodos;
begin
  case FEntityType of
    eCliente:
      begin
        mtDados.Free;
        mtDados:= FClienteController.GetClientesMemTable;
        dsDados.DataSet := mtDados;
        dbgDados.DataSource := dsDados;
      end;
    ePedido:
      begin

      end;
  else
    raise Exception.Create('Objeto não reconhecido!');
  end;
end;

end.

