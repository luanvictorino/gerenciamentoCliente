unit uDMCliente;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, frxClass, frxDBSet;

type
  TdmCliente = class(TDataModule)
    Conexao: TFDConnection;
    DriverMySql: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    sqlCliente: TFDTable;
    dsCliente: TDataSource;
    sqlClienteCliID: TIntegerField;
    sqlClienteCliNome: TStringField;
    sqlClienteCliEndereco: TStringField;
    sqlClienteCliBairro: TStringField;
    sqlClienteCliCidade: TStringField;
    sqlClienteCliUf: TStringField;
    sqlClienteCliRg: TStringField;
    sqlClienteCliCpf: TStringField;
    sqlClienteCliTel: TStringField;
    sqlClienteCliCel: TStringField;
    sqlClienteCliDataNasc: TDateField;
    sqlClienteCliDataCad: TDateField;
    sqlClienteCliStatus: TStringField;
    sqlClienteCliEmail: TStringField;
    sqlClienteCliCep: TStringField;
    sqlConsultaCliente: TFDQuery;
    dsConsultaCliente: TDataSource;
    sqlRelatorioCliente: TFDQuery;
    sqlConsultaClienteCliID: TIntegerField;
    sqlConsultaClienteCliNome: TStringField;
    sqlConsultaClienteCliEndereco: TStringField;
    sqlConsultaClienteCliBairro: TStringField;
    sqlConsultaClienteCliCidade: TStringField;
    sqlConsultaClienteCliUf: TStringField;
    sqlConsultaClienteCliCep: TStringField;
    sqlConsultaClienteCliRg: TStringField;
    sqlConsultaClienteCliCpf: TStringField;
    sqlConsultaClienteCliTel: TStringField;
    sqlConsultaClienteCliCel: TStringField;
    sqlConsultaClienteCliEmail: TStringField;
    sqlConsultaClienteCliDataNasc: TDateField;
    sqlConsultaClienteCliDataCad: TDateField;
    sqlConsultaClienteCliStatus: TStringField;
    sqlRelatorioClienteCliID: TIntegerField;
    sqlRelatorioClienteCliNome: TStringField;
    sqlRelatorioClienteCliEndereco: TStringField;
    sqlRelatorioClienteCliBairro: TStringField;
    sqlRelatorioClienteCliCidade: TStringField;
    sqlRelatorioClienteCliUf: TStringField;
    sqlRelatorioClienteCliCep: TStringField;
    sqlRelatorioClienteCliRg: TStringField;
    sqlRelatorioClienteCliCpf: TStringField;
    sqlRelatorioClienteCliTel: TStringField;
    sqlRelatorioClienteCliCel: TStringField;
    sqlRelatorioClienteCliEmail: TStringField;
    sqlRelatorioClienteCliDataNasc: TDateField;
    sqlRelatorioClienteCliDataCad: TDateField;
    sqlRelatorioClienteCliStatus: TStringField;
    frxReportCliente: TfrxReport;
    frxdsRelCliente: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ConfiguraDataModule();
  public
    { Public declarations }
  end;

var
  dmCliente: TdmCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCliente.DataModuleCreate(Sender: TObject);
begin
  ConfiguraDataModule();
end;

procedure TdmCliente.ConfiguraDataModule;
begin
  Conexao.Params.Database := 'gerenciamentoclientes';
  Conexao.Params.UserName := 'root';
  Conexao.Params.Password := '';
  Conexao.Connected := True;
  DriverMySql.VendorLib := GetCurrentDir + '\lib\libmySQL.dll';

  sqlCliente.TableName := 'cliente';
  sqlCliente.Active := True;
end;

end.
