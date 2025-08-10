unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frCoreClasses, frxClass, uTypes;

type
  TfrmPrincipal = class(TForm)
    btnCadastroClientes: TButton;
    btnCadastroFuncionarios: TButton;
    frxReport1: TfrxReport;
    Button1: TButton;
    procedure btnCadastroClientesClick(Sender: TObject);
    procedure btnCadastroFuncionariosClick(Sender: TObject);
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

procedure TfrmPrincipal.btnCadastroFuncionariosClick(Sender: TObject);
var
  frmConsultaPedido: TfrmConsulta;
begin
  frmConsultaPedido := TfrmConsulta.Create(self, ePedido);
  frmConsultaPedido.ShowModal;
end;

procedure TfrmPrincipal.btnCadastroClientesClick(Sender: TObject);
var
  frmConsultaCliente:TfrmConsulta;
begin
  frmConsultaCliente := TfrmConsulta.Create(self, eCliente);
  frmConsultaCliente.ShowModal;
end;

end.
