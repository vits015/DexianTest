unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frCoreClasses, frxClass, uTypes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDataModule, frxDBSet, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    QryClientes: TFDQuery;
    dsClientes: TDataSource;
    frxDBDsClientes: TfrxDBDataset;
    Relatorio: TfrxReport;
    qryPedidos: TFDQuery;
    dsPedidos: TDataSource;
    frxDBDsPedidos: TfrxDBDataset;
    btnCadastroClientes: TBitBtn;
    btnRelatorio: TBitBtn;
    btnCadastroPedidos: TBitBtn;
    procedure btnCadastroClientesClick(Sender: TObject);
    procedure btnCadastroPedidosClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses ufrmConsulta;

procedure TfrmPrincipal.btnCadastroPedidosClick(Sender: TObject);
var
  frmConsultaPedido: TfrmConsulta;
begin
  frmConsultaPedido := TfrmConsulta.Create(self, ePedido);
  frmConsultaPedido.ShowModal;
end;

procedure TfrmPrincipal.btnRelatorioClick(Sender: TObject);
begin
  Relatorio.ShowReport();
end;

procedure TfrmPrincipal.btnCadastroClientesClick(Sender: TObject);
var
  frmConsultaCliente:TfrmConsulta;
begin
  frmConsultaCliente := TfrmConsulta.Create(self, eCliente);
  frmConsultaCliente.ShowModal;
end;

end.
