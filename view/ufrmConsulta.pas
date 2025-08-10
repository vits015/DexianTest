unit ufrmConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, uClienteController,
  Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Comp.Client, uDataModule,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,System.Generics.Collections,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uFuncoesGenericas, uCliente,
  ufrmManutencao;

type
  TEntityType = (eCliente, ePedido);

  TfrmConsulta = class(TForm)
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
    procedure btnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
    FEntityType: TEntityType;
    FClienteController: TClienteController;
//    FPedidoController: TPedidoController;
    mtDados: TFDMemTable;
    dsDados: TDataSource;

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

procedure TfrmConsulta.btnFiltrarClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TfrmManutencao, frmManutencao);
   frmManutencao.ShowModal;
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
    // Adicione outros casos conforme necessário para diferentes objetos
  else
    raise Exception.Create('Objeto não reconhecido!');
  end;
end;

end.

