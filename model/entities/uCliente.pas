unit uCliente;

interface

type
  TCliente = class
  private
    FClienteID: Integer;
    FNome: string;
    FTelefone: string;
    FEmail: string;
    FDataCadastro: TDateTime;
  published
    property ClienteID: Integer read FClienteID write FClienteID;
    property Nome: string read FNome write FNome;
    property Telefone: string read FTelefone write FTelefone;
    property Email: string read FEmail write FEmail;
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
  end;

implementation

end.
