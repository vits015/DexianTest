program DexianApp;

uses
  Vcl.Forms,
  uDataModule in 'uDataModule.pas' {DataModule1: TDataModule},
  uMainForm in 'view\uMainForm.pas' {frmPrincipal},
  ufrmConsulta in 'view\ufrmConsulta.pas' {frmConsulta},
  uCliente in 'model\entities\uCliente.pas',
  uPedido in 'model\entities\uPedido.pas',
  uPedidoDAO in 'model\dao\uPedidoDAO.pas',
  uClienteDAO in 'model\dao\uClienteDAO.pas',
  uClienteController in 'controller\uClienteController.pas',
  uFuncoesGenericas in 'uFuncoesGenericas.pas',
  ufrmManutencao in 'view\ufrmManutencao.pas' {frmManutencao},
  uTypes in 'utils\uTypes.pas',
  uframeCliente in 'view\frames\uframeCliente.pas' {frameCliente: TFrame},
  uPedidoController in 'controller\uPedidoController.pas',
  uframePedido in 'view\frames\uframePedido.pas' {framePedido: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmConsulta, frmConsulta);
  Application.CreateForm(TfrmManutencao, frmManutencao);
  Application.Run;
end.
