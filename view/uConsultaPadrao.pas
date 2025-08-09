unit uConsultaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, uClienteController,
  Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Comp.Client, uDataModule,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,System.Generics.Collections,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uFuncoesGenericas, uCliente;

type
  TObjectNameType = (onCliente, onPedido);

  TfrmConsultaPadrao = class(TForm)
    pnlTopo: TPanel;
    dbgDados: TDBGrid;
    pnlBotoes: TPanel;
    btnFiltrar: TButton;
    btnTodos: TButton;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnConsultar: TButton;
    procedure btnTodosClick(Sender: TObject);
  private
    { Private declarations }
    FObjectName: TObjectNameType;
    FClienteController: TClienteController;
//    FPedidoController: TPedidoController;
    mtDados: TFDMemTable;
    dsDados: TDataSource;
  protected
    procedure setHandleObject(AObjectName: TObjectNameType);    
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AObjectName: TObjectNameType); overload;        
  end;

var
  frmConsultaPadrao: TfrmConsultaPadrao;

implementation

{$R *.dfm}

{ TfrmConsultaPadrao }

procedure TfrmConsultaPadrao.setHandleObject(AObjectName: TObjectNameType);
begin
  FObjectName := AObjectName;
  case FObjectName of
    onCliente: FClienteController := TClienteController.Create;
//    onPedido: FPedidoController := TPedidoController.Create;
  end;
end;

procedure TfrmConsultaPadrao.btnTodosClick(Sender: TObject);
var
  Lista: TObjectList<TCliente>;
begin
  case FObjectName of
    onCliente:
      begin
        Lista := FClienteController.GetClientes;
        ClienteListToMemTable(Lista, mtDados); // converte a lista para o TFDMemTable
        dsDados.DataSet := mtDados;         // conecta o DataSource ao MemTable
        dbgDados.DataSource := dsDados;        // conecta o grid ao DataSource
        Lista.Free;
      end;
    // Adicione outros casos conforme necessário para diferentes objetos
  else
    raise Exception.Create('Objeto não reconhecido!');
  end;
end;

constructor TfrmConsultaPadrao.Create(AOwner: TComponent; AObjectName: TObjectNameType);
begin
  inherited Create(AOwner);
  setHandleObject(AObjectName);

  mtDados := TFDMemTable.Create(Self);
  dsDados := TDataSource.Create(Self);
end;

end.

