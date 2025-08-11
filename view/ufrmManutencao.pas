unit ufrmManutencao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, uTypes,
  Vcl.DBCtrls, uframeCliente, uCliente, data.db, uPedido, uframePedido, uClienteController;

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
    FFramePedido: TFramePedido;
    FClienteResult: TCliente;
    FPedidoResult: TPedido;
    FDataSource: TDataSource;
    procedure HandleClienteIDExit(Sender: TObject);
    procedure OnDataChangeHandler(Sender: TObject; Field: TField);
    procedure DesativaCamposCliente;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AEntityType:TEntityType; AFormMode:TFormMode;AObject:TObject = nil; ADataSource:TDataSource  = nil); overload;
    property ClienteResult : TCliente read FClienteResult write FClienteResult;
    property PedidoResult : TPedido read FPedidoResult write FPedidoResult;

  end;

var
  frmManutencao: TfrmManutencao;

implementation

{$R *.dfm}

procedure TfrmManutencao.btnOKClick(Sender: TObject);
begin
  // obtem os dados do frame e devolve para o ufrmConsulta
  case FEntityType of
  eCliente:
    FClienteResult := FFrameCliente.GetCliente;
  ePedido:
    FPedidoResult := FFramePedido.GetPedido;
  end;
  ModalResult := mrOk;
end;

procedure TfrmManutencao.btnRestaurarClick(Sender: TObject);
begin
  case FEntityType of
    eCliente:
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
    ePedido:
    begin
      with FFramePedido do
      begin
        edtPedidoID.Text := FPedidoResult.PedidoID.ToString;
        frameCliente1.edtClienteID.Text := FPedidoResult.Cliente.ClienteID.ToString;
        dtpDataPedido.DateTime := FPedidoResult.DataPedido;
        edtValorTotal.Text := FPedidoResult.ValorTotal.ToString;
        memoObservacao.Lines.Text := FPedidoResult.Observacao;
      end;
    end;
  end;
end;

procedure TfrmManutencao.btnSairClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

constructor TfrmManutencao.Create(AOwner: TComponent; AEntityType: TEntityType; AFormMode:TFormMode; AObject:TObject = nil; ADataSource:TDataSource  = nil);
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
      self.Height:= 250;
      case FFormMode of
        fmFilter:
        begin
          pnNavigator.Visible:= false;
          btnRestaurar.Visible:= false;
          FFrameCliente.pnlCampos.Visible:= true;
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
          end;
        end;
        fmUpdate:
        begin
          pnNavigator.Visible:= false;
          FClienteResult := TCliente(AObject);
          with FFrameCliente do
          begin
            edtClienteID.Visible:=false;
            lblClienteID.Visible:= false;

            edtClienteID.Text := FClienteResult.ClienteID.ToString;
            edtNome.Text := FClienteResult.Nome;
            edtEmail.Text := FClienteResult.Email;
            edtTelefone.Text := FClienteResult.Telefone;
            dtpDataCadastro.DateTime := FClienteResult.DataCadastro;
          end;
        end;
        fmConsult:
        begin
          btnRestaurar.Visible:= false;
          DBNavigator.DataSource := FDataSource;
          FDataSource.OnDataChange := OnDataChangeHandler;
          FDataSource.DataSet.First;
          FFrameCliente.Enabled:= false;
        end;

      end;
      // Se quiser acessar depois, pode guardar em um campo privado
    end;
    ePedido:
    begin
      FPedidoResult := TPedido.Create;
      FFramePedido := TFramePedido.Create(Self);
      self.Height:= 540;
      with FFramePedido do
      begin
        FFramePedido.Parent := pnPrincipal;
        FFramePedido.Align := alClient;
        case FFormMode of
          fmFilter:
          begin

            lbPedidoID.Visible:=true;
            edtPedidoID.Visible:= true;
            pnNavigator.Visible:= false;
            btnRestaurar.Visible:= false;

            DesativaCamposCliente;
          end;
          fmInsert:
          begin
            lbPedidoID.Visible:=false;
            edtPedidoID.Visible:= false;
            btnRestaurar.Visible:= false;
            pnNavigator.Visible:= false;

            DesativaCamposCliente;
          end;
          fmUpdate:
          begin
            pnNavigator.Visible:= false;
            FPedidoResult := TPedido(AObject);
            with FFramePedido do
            begin
              edtPedidoID.Text := FPedidoResult.PedidoID.ToString;
              dtpDataPedido.DateTime := FPedidoResult.DataPedido;
              edtValorTotal.Text := FPedidoResult.ValorTotal.ToString;
              memoObservacao.Lines.Text := FPedidoResult.Observacao;
              with frameCliente1 do
              begin
                edtClienteID.Text := FPedidoResult.Cliente.ClienteID.ToString;
                edtNome.Text := FPedidoResult.Cliente.Nome;
                edtEmail.Text := FPedidoResult.Cliente.Email;
                edtTelefone.Text := FPedidoResult.Cliente.Telefone;
                dtpDataCadastro.DateTime := FPedidoResult.Cliente.DataCadastro;

                DesativaCamposCliente;
                PreencheCliente;
              end;
            end;
          end;
          fmConsult:
          begin
            lbPedidoID.Visible:= true;
            edtPedidoID.Visible:= true;
            DBNavigator.DataSource := FDataSource;
            FDataSource.OnDataChange := OnDataChangeHandler;
            FDataSource.DataSet.First;
            pnlPedido.Enabled:= false;
            btnRestaurar.Visible:= false;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmManutencao.DesativaCamposCliente;
begin
  with FFramePedido.frameCliente1 do
  begin
    edtClienteID.OnExit := HandleClienteIDExit;
    edtTelefone.Enabled:= false;
    dtpDataCadastro.Enabled:= false;
    edtEmail.Enabled:= false;
    edtNome.Enabled:= false;
  end;
end;

procedure TfrmManutencao.HandleClienteIDExit(Sender: TObject);
var
  vClienteController:TClienteController;
  vCliente:TCliente;
begin
  if FFramePedido.frameCliente1.edtClienteID.Text <> '' then
  begin
    try
      try
        vCliente:= TCliente.Create;
        vClienteController := TClienteController.Create;
        vCliente:= vClienteController.GetClienteById(StrToInt(FFramePedido.frameCliente1.edtClienteID.Text));
        with FFramePedido.frameCliente1 do
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
        with FFramePedido do
        begin
          frameCliente1.edtClienteID.SetFocus;
          frameCliente1.edtNome.Text := '';
          frameCliente1.edtTelefone.Text := '';
          frameCliente1.edtEmail.Text := '';
          frameCliente1.dtpDataCadastro.Date := Date;
        end;
      end;
    end;
  end;
end;

procedure TfrmManutencao.OnDataChangeHandler(Sender: TObject; Field: TField);
begin
  case FEntityType of
    ePedido:
    begin
      with FFramePedido do
      begin
        edtPedidoID.Text:= FDataSource.DataSet.FieldByName('PedidoID').AsInteger.ToString;
        dtpDataPedido.Date := FDataSource.DataSet.FieldByName('DataPedido').AsDateTime;
        edtValorTotal.Text := FDataSource.DataSet.FieldByName('ValorTotal').AsFloat.ToString;
        memoObservacao.Lines.Text := FDataSource.DataSet.FieldByName('Observacao').AsString;
        with frameCliente1 do
        begin
          edtClienteID.Text := FDataSource.DataSet.FieldByName('ClienteID').AsInteger.ToString;
          HandleClienteIDExit(frameCliente1.edtClienteID);
        end;
      end;

    end;
    eCliente:
    begin
      with FFrameCliente do
      begin
        edtClienteID.Text := FDataSource.DataSet.FieldByName('ClienteID').AsInteger.ToString;
        edtNome.Text := FDataSource.DataSet.FieldByName('Nome').AsString;
        edtTelefone.Text := FDataSource.DataSet.FieldByName('Telefone').AsString;
        edtEmail.Text := FDataSource.DataSet.FieldByName('Email').AsString;
        dtpDataCadastro.DateTime := FDataSource.DataSet.FieldByName('DataCadastro').AsDateTime;
      end;
    end;
  end;
end;

end.