unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frCoreClasses, frxClass;

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

uses uConsultaPadrao;

procedure TfrmPrincipal.btnCadastroFuncionariosClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaPadrao, frmConsultaPadrao);
  frmConsultaPadrao.ShowModal;
end;

procedure TfrmPrincipal.btnCadastroClientesClick(Sender: TObject);
var
  ConsultaPadrao:TfrmConsultaPadrao;
begin
  ConsultaPadrao := TfrmConsultaPadrao.Create(self, onCliente);
  ConsultaPadrao.ShowModal;
end;

end.
