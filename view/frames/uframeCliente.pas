unit uframeCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, uCliente, Vcl.DBCtrls;

type
  TframeCliente = class(TFrame)
    pnlCampos: TPanel;
    lblClienteID: TLabel;
    edtClienteID: TEdit;
    lblNome: TLabel;
    edtNome: TEdit;
    lblTelefone: TLabel;
    edtTelefone: TMaskEdit;
    lblEmail: TLabel;
    edtEmail: TEdit;
    lblDataCadastro: TLabel;
    dtpDataCadastro: TDateTimePicker;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetCliente: TCliente;
  end;

var
  frmEdicaoCliente: TframeCliente;

implementation

{$R *.dfm}

{ TframeCliente }

function TframeCliente.GetCliente: TCliente;
begin
  Result := TCliente.Create;
  Result.ClienteID := StrToIntDef(edtClienteID.Text, 0);
  Result.Nome := edtNome.Text;
  Result.Telefone := edtTelefone.Text;
  Result.Email := edtEmail.Text;
  Result.DataCadastro := dtpDataCadastro.Date;
end;
end.
