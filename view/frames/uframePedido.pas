unit uframePedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  uframeCliente, Vcl.StdCtrls, Vcl.ComCtrls, uPedido, uCliente, uClienteController;

type
  TframePedido = class(TFrame)
    pnlPedido: TPanel;
    lbPedidoID: TLabel;
    edtPedidoID: TEdit;
    edtValorTotal: TEdit;
    lbValorTotal: TLabel;
    lbObservacao: TLabel;
    memoObservacao: TMemo;
    lbDataPedido: TLabel;
    dtpDataPedido: TDateTimePicker;
    lbClientePedido: TLabel;
    pnClientePedido: TPanel;
    frameCliente1: TframeCliente;
    procedure frameCliente1edtClienteIDExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function getPedido:TPedido;
    procedure PreencheCliente;
  end;

implementation

{$R *.dfm}

procedure TframePedido.frameCliente1edtClienteIDExit(Sender: TObject);
begin
  PreencheCliente;
end;

function TFramePedido.getPedido:TPedido;
begin
  result:= TPedido.Create;
  result.Cliente := TCliente.Create;
  with result do
  begin
    PedidoID := StrToIntDef(edtPedidoID.Text,0);
    DataPedido:= dtpDataPedido.DateTime;
    Cliente:= frameCliente1.GetCliente;
    if edtValorTotal.Text <> '' then
       ValorTotal:= StrToFloat(edtValorTotal.Text)
    else
      ValorTotal := -1;
    Observacao := memoObservacao.Lines.Text;
  end;
end;


procedure TframePedido.PreencheCliente;
var
  vClienteController:TClienteController;
  vCliente:TCliente;
begin
  if frameCliente1.edtClienteID.Text <> '' then
  begin
    try
      try
        vCliente:= TCliente.Create;
        vClienteController := TClienteController.Create;
        vCliente:= vClienteController.GetClienteById(StrToInt(frameCliente1.edtClienteID.Text));
        with frameCliente1 do
        begin
          edtNome.Text := vCliente.Nome;
          edtTelefone.Text := vCliente.Telefone;
          edtEmail.Text := vCliente.Email;
          dtpDataCadastro.Date := vCliente.DataCadastro;
        end;
      finally
        vCliente.Free;
        vClienteController.Free;
      end;
    except
      on E: Exception do
      begin
        ShowMessage('Cliente não encontrado!');
        frameCliente1.edtClienteID.SetFocus;
        frameCliente1.edtNome.Text := '';
        frameCliente1.edtTelefone.Text := '';
        frameCliente1.edtEmail.Text := '';
        frameCliente1.dtpDataCadastro.Date := Date;
      end;
    end;
  end;
end;

end.
