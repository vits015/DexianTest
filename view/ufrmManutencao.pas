unit ufrmManutencao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls;

type
  TfrmManutencao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManutencao: TfrmManutencao;

implementation

{$R *.dfm}

procedure TfrmManutencao.BitBtn2Click(Sender: TObject);
begin
  // Ação para o botão OK
  // Você pode fechar o formulário com o resultado de diálogo "mrOk"
  ModalResult := mrOk;
end;

procedure TfrmManutencao.BitBtn3Click(Sender: TObject);
begin
  // Ação para o botão Sair
  // Você pode fechar o formulário com o resultado de diálogo "mrCancel"
  ModalResult := mrCancel;
end;

end.