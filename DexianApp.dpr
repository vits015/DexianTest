program DexianApp;

uses
  Vcl.Forms,
  uDataModule in 'uDataModule.pas' {DataModule1: TDataModule},
  uMainForm in 'view\uMainForm.pas' {frmPrincipal},
  uConsultaPadrao in 'view\uConsultaPadrao.pas' {frmConsultaPadrao},
  uCliente in 'model\entities\uCliente.pas',
  uPedido in 'model\entities\uPedido.pas',
  uPedidoDAO in 'model\dao\uPedidoDAO.pas',
  uClienteDAO in 'model\dao\uClienteDAO.pas',
  uClienteController in 'controller\uClienteController.pas',
  uFuncoesGenericas in 'uFuncoesGenericas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmConsultaPadrao, frmConsultaPadrao);
  Application.Run;
end.
