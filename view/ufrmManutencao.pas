unit ufrmManutencao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, uTypes,
  Vcl.DBCtrls, uframeCliente, uCliente, data.db;

type
  TfrmManutencao = class(TForm)
    pnPrincipal: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnNavigator: TPanel;
    btnRestaurar: TBitBtn;
    btnOK: TBitBtn;
    btnSair: TBitBtn;
    DBNavigator: TDBNavigator;
    procedure btnOKClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
  private
    { Private declarations }
    FEntityType:TEntityType;
    FFormMode: TFormMode;
    FFrameCliente: TFrameCliente;
    FClienteResult: TCliente;
    FDataSource: TDataSource;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AEntityType:TEntityType; AFormMode:TFormMode;ACliente:TCliente = nil; ADataSource:TDataSource  = nil); overload;
    property ClienteResult : TCliente read FClienteResult write FClienteResult;
  end;

var
  frmManutencao: TfrmManutencao;

implementation

{$R *.dfm}

procedure TfrmManutencao.btnOKClick(Sender: TObject);
var
  Cliente: TCliente;
begin
  // obtem os dados do frame e devolve para o ufrmConsulta
  if FEntityType = eCliente then
  begin
    FClienteResult := FFrameCliente.GetCliente;
  end;
  ModalResult := mrOk;
end;

procedure TfrmManutencao.btnRestaurarClick(Sender: TObject);
begin
  with FFrameCliente do
  begin
    edtClienteID.Text := FClienteResult.ClienteID.ToString;
    edtNome.Text := FClienteResult.Nome;
    edtEmail.Text := FClienteResult.Email;
    edtTelefone.Text := FClienteResult.Telefone;
    dtpDataCadastro.DateTime := FClienteResult.DataCadastro;
  end;
end;

procedure TfrmManutencao.btnSairClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

constructor TfrmManutencao.Create(AOwner: TComponent; AEntityType: TEntityType; AFormMode:TFormMode; ACliente:TCliente = nil; ADataSource:TDataSource  = nil);
begin
  inherited Create(AOwner);
  FEntityType := AEntityType;
  FFormMode := AFormMode;
  FDataSource := ADataSource;
  case FEntityType of
    eCliente:
    begin
      FClienteResult := TCliente.Create;
      FFrameCliente := TFrameCliente.Create(Self);
      FFrameCliente.Parent := pnPrincipal;
      FFrameCliente.Align := alClient;
      case FFormMode of
        fmFilter:
        begin
          pnNavigator.Visible:= false;
          btnRestaurar.Visible:= false;
        end;
        fmInsert:
        begin
          btnRestaurar.Visible:= false;
          with FFrameCliente do
          begin
            pnNavigator.Visible:= false;
            edtClienteID.Visible:=false;
            lblClienteID.Visible:= false;
            pnlCampos.Visible := true;
            pnlConsulta.Visible:= false;
          end;
        end;
        fmUpdate:
        begin
          pnNavigator.Visible:= false;
          FClienteResult := ACliente;
          with FFrameCliente do
          begin
            edtClienteID.Visible:=false;
            lblClienteID.Visible:= false;

            edtClienteID.Text := ACliente.ClienteID.ToString;
            edtNome.Text := ACliente.Nome;
            edtEmail.Text := ACliente.Email;
            edtTelefone.Text := ACliente.Telefone;
            dtpDataCadastro.DateTime := ACliente.DataCadastro;
            pnlCampos.Visible := true;
            pnlConsulta.Visible:= false;

          end;
        end;
        fmConsult:
        begin
          btnRestaurar.Visible:= false;
          FFrameCliente.LinkFields(FDataSource);
          FFrameCliente.pnlCampos.Visible:= false;
          FFrameCliente.pnlConsulta.Visible:= true;
          DBNavigator.DataSource := FDataSource;
        end;

      end;
      // Se quiser acessar depois, pode guardar em um campo privado
    end;
  end;
end;

end.