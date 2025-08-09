unit uManutencaoPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TModoTela = (mtInclusao, mtAlteracao, mtConsulta);

  TfrmManutencaoPadrao = class(TForm)
    pnlTopo: TPanel;
    pnlCampos: TPanel;
    pnlBotoes: TPanel;
    dbnNavegacao: TDBNavigator;
    btnRestaurar: TButton;
    btnOk: TButton;
    btnSair: TButton;
    lblCampo1: TLabel;
    edtCampo1: TEdit;
    lblCampo2: TLabel;
    memCampo2: TMemo;
    lblCampo3: TLabel;
    edtCampo3: TEdit;
    lblCampo4: TLabel;
    dtpCampo4: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    FModoTela: TModoTela;
    procedure ConfigurarModo;
  public
    procedure AbrirModo(AModo: TModoTela);
  end;

var
  frmManutencaoPadrao: TfrmManutencaoPadrao;

implementation

{$R *.dfm}

procedure TfrmManutencaoPadrao.FormCreate(Sender: TObject);
begin
  FModoTela := mtInclusao;
  ConfigurarModo;
end;

procedure TfrmManutencaoPadrao.AbrirModo(AModo: TModoTela);
begin
  FModoTela := AModo;
  ConfigurarModo;
  ShowModal;
end;

procedure TfrmManutencaoPadrao.ConfigurarModo;
begin
  dbnNavegacao.Visible := (FModoTela = mtConsulta);
  btnRestaurar.Visible := (FModoTela = mtAlteracao);
end;

procedure TfrmManutencaoPadrao.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.

