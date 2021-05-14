unit uCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Param;

type
  TOperacao = (tpNone, tpIncluir, tpEditar);

  TfrmCadastroCliente = class(TForm)
    pgrcCliente: TPageControl;
    tsCadastroCliente: TTabSheet;
    tsConsultaCliente: TTabSheet;
    lbDataNasc: TLabel;
    lbNomeCliente: TLabel;
    lbBairro: TLabel;
    lbEndereco: TLabel;
    lbUf: TLabel;
    lbRg: TLabel;
    lbCidade: TLabel;
    lbTelefone: TLabel;
    lbCpf: TLabel;
    lbCelular: TLabel;
    lbCodigoCliente: TLabel;
    lbEmail: TLabel;
    lbStatus: TLabel;
    lbDataCadastro: TLabel;
    lbCep: TLabel;
    pnBotoes: TPanel;
    btnInserir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnFechar: TSpeedButton;
    btnConsultar: TSpeedButton;
    btnVoltarParaCadastro: TSpeedButton;
    grdConsultaCliente: TDBGrid;
    btnImprimir: TSpeedButton;
    btnPesquisarCliente: TSpeedButton;
    edtBusca: TEdit;
    lbBusca: TLabel;
    dtpDataBusca: TDateTimePicker;
    rdgpOpcoesBusca: TRadioGroup;
    lbQtdeRegistros: TLabel;
    edtImprimir: TDBEdit;
    edtCodigo: TEdit;
    edtDataCadastro: TEdit;
    edtNome: TEdit;
    edtRg: TEdit;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtEmail: TEdit;
    cbxStatus: TComboBox;
    edtDataNasc: TMaskEdit;
    edtCpf: TMaskEdit;
    edtCep: TMaskEdit;
    edtTelefone: TMaskEdit;
    edtCelular: TMaskEdit;
    edtUf: TEdit;
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnVoltarParaCadastroClick(Sender: TObject);
    procedure rdgpOpcoesBuscaClick(Sender: TObject);
    procedure btnPesquisarClienteClick(Sender: TObject);
    procedure grdConsultaClienteCellClick(Column: TColumn);
    procedure btnImprimirClick(Sender: TObject);
    procedure grdConsultaClienteDblClick(Sender: TObject);
    procedure edtCpfExit(Sender: TObject);
  private
    FOperacao: TOperacao;
    procedure SetOperacao(const Value: TOperacao);
    procedure ConfigurarFormularioCliente;
    procedure LimparCampos;
    procedure ConfigurarBotoesCadastro;
    procedure HabilitarCamposEdit;
    procedure DesabilitaCamposEdit;
    function ValidaCpf(pCpf: string): Boolean;
    procedure IncluiCliente;
    procedure EditaCliente;
    procedure MostraQtdeRegistrosEncontrados(pQtdeRegistros: Integer);
    procedure CarregarDadosDoCliente;
  public
    property Operacao : TOperacao read FOperacao write SetOperacao;
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

uses uDMCliente;

procedure TfrmCadastroCliente.FormCreate(Sender: TObject);
begin
  ConfigurarFormularioCliente;
  LimparCampos;
  DesabilitaCamposEdit;
end;

procedure TfrmCadastroCliente.ConfigurarFormularioCliente;
begin
  pgrcCliente.TabIndex := 0;
  tsConsultaCliente.TabVisible := False;

  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;

  edtBusca.Visible := False;
  lbBusca.Visible := False;
  dtpDataBusca.Visible := False;

  btnImprimir.Enabled := False;
  dmCliente.sqlCliente.Active := False;
end;

procedure TfrmCadastroCliente.LimparCampos;
begin
  edtCodigo.Clear;
  edtNome.Clear;
  edtDataNasc.Clear;
  edtRg.Clear;
  edtCpf.Clear;
  edtEndereco.Clear;
  edtBairro.Clear;
  edtCep.Clear;
  edtCidade.Clear;
  edtTelefone.Clear;
  edtCelular.Clear;
  edtEmail.Clear;
  edtDataCadastro.Clear;
  edtUf.Clear;
end;

procedure TfrmCadastroCliente.btnInserirClick(Sender: TObject);
begin
  dmCliente.Conexao.Connected := True;
  dmCliente.sqlCliente.Active := True;
  dmCliente.sqlCliente.Insert;

  ConfigurarBotoesCadastro;

  LimparCampos;
  cbxStatus.ItemIndex := 0;
  edtDataCadastro.Text := DateToStr(Date);
  HabilitarCamposEdit;
  edtCodigo.Text := IntToStr(dmCliente.sqlClienteCliID.Value);
  edtNome.SetFocus;
  Operacao := tpIncluir;
end;

procedure TfrmCadastroCliente.btnAlterarClick(Sender: TObject);
begin
  if edtCodigo.Text = '' then
  begin
    ShowMessage('Nenhum Cliente para Editar!');
    Exit;
  end;

  if not dmCliente.sqlCliente.Active then
    dmCliente.sqlCliente.Active := True;

  dmCliente.sqlCliente.Edit;
  HabilitarCamposEdit;
  ConfigurarBotoesCadastro;
  Operacao := tpEditar;
end;

procedure TfrmCadastroCliente.btnSalvarClick(Sender: TObject);
begin
  if not ValidaCpf(edtCpf.Text) then
  begin
    ShowMessage('Cpf inv�lido!');
    Exit;
  end;

  if Operacao = tpIncluir then
  begin
    IncluiCliente;
  end
  else
  begin
    EditaCliente;
  end;
  dmCliente.sqlCliente.Open;
  ShowMessage('Cliente Salvo!');
  ConfigurarBotoesCadastro;
  DesabilitaCamposEdit;
  dmCliente.sqlCliente.Active := False;
end;

procedure TfrmCadastroCliente.IncluiCliente;
begin
  with dmCliente.sqlCliente do
  begin
    FieldByName('CliNome').AsString := edtNome.Text;
    FieldByName('CliDataNasc').Value := StrToDate(FormatDateTime('dd/mm/yyyy', StrToDate(edtDataNasc.Text)));
    FieldByName('CliRg').AsString := edtRg.Text;
    FieldByName('CliCpf').AsString := edtCpf.Text;
    FieldByName('CliEndereco').AsString := edtEndereco.Text;
    FieldByName('CliBairro').AsString := edtBairro.Text;
    FieldByName('CliCep').AsString := edtCep.Text;
    FieldByName('CliCidade').AsString := edtCidade.Text;
    FieldByName('CliUf').AsString := edtUf.Text;
    FieldByName('CliTel').AsString := edtTelefone.Text;
    FieldByName('CliCel').AsString := edtCelular.Text;
    FieldByName('CliEmail').AsString := edtEmail.Text;
    FieldByName('CliStatus').AsString := cbxStatus.Text;
    FieldByName('CliDataCad').Value := Date;
    Post;
  end;
end;

procedure TfrmCadastroCliente.EditaCliente;
const
  sSqlUpdate = 'update cliente set CliNome = :nome, CliDataNasc = :dataNasc, ' +
    'CliRg = :rg, CliCpf = :cpf, CliEndereco = :endereco, CliBairro = :bairro,' +
    ' CliCep = :cep, CliCidade = :cidade, CliUf = :uf, CliTel = :tel, CliCel = :cel,' +
    ' CliEmail = :email, CliStatus = :status, CliDataCad = :dataCad where CliId = :id';
begin
  with dmCliente.sqlCliente do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSqlUpdate);
    ParamByName('nome').AsString := edtNome.Text;
    ParamByName('dataNasc').AsDate := StrToDate(FormatDateTime('dd/mm/yyyy', StrToDate(edtDataNasc.Text)));
    ParamByName('rg').AsString := edtRg.Text;
    ParamByName('cpf').AsString := edtCpf.Text;
    ParamByName('endereco').AsString := edtEndereco.Text;
    ParamByName('bairro').AsString := edtBairro.Text;
    ParamByName('cep').AsString := edtCep.Text;
    ParamByName('cidade').AsString := edtCidade.Text;
    ParamByName('uf').AsString := edtUf.Text;
    ParamByName('tel').AsString := edtTelefone.Text;
    ParamByName('cel').AsString := edtCelular.Text;
    ParamByName('email').AsString := edtEmail.Text;
    ParamByName('status').AsString := cbxStatus.Text;
    ParamByName('dataCad').AsDate := StrToDate(FormatDateTime('dd/mm/yyyy', StrToDate(edtDataCadastro.Text)));
    ParamByName('id').AsString := edtImprimir.Text;
    ExecSQL;
  end;
end;

procedure TfrmCadastroCliente.edtCpfExit(Sender: TObject);
begin
  if not ValidaCpf(edtCpf.Text) then
  begin
    ShowMessage('Cpf inv�lido!');
    edtCpf.SetFocus;
  end;
end;

function TfrmCadastroCliente.ValidaCpf(pCpf: string): Boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9: integer;
  d1, d2: integer;
  sDigitado, sCalculado: string;
begin
  n1 := StrToInt(pCpf[1]);
  n2 := StrToInt(pCpf[2]);
  n3 := StrToInt(pCpf[3]);
  n4 := StrToInt(pCpf[4]);
  n5 := StrToInt(pCpf[5]);
  n6 := StrToInt(pCpf[6]);
  n7 := StrToInt(pCpf[7]);
  n8 := StrToInt(pCpf[8]);
  n9 := StrToInt(pCpf[9]);

  d1 := n9*2 + n8*3 + n7*4 + n6*5 + n5*6 + n4*7 + n3*8 + n2*9 + n1*10;
  d1 := 11 - (d1 mod 11);
  if (d1 >= 10) then
    d1:=0;

  d2 := d1*2 + n9*3 + n8*4 + n7*5 + n6*6 + n5*7 + n4*8 + n3*9 + n2*10 + n1*11;
  d2 := 11 - (d2 mod 11);
  if (d2 >= 10) then
    d2 := 0;

  sCalculado := IntToStr(d1) + IntToStr(d2);
  sDigitado := pCpf[10] + pCpf[11];
  if (sCalculado = sDigitado) then
    Result := true
  else
    Result := false;
end;

procedure TfrmCadastroCliente.btnExcluirClick(Sender: TObject);
begin
  if edtCodigo.Text = '' then
  begin
    ShowMessage('Nenhum cliente selecionado!');
    Exit;
  end;

  dmCliente.Conexao.Connected := True;

  case Application.MessageBox('Deseja Excluir o Cliente?',
    'Excluir Cliente', MB_YESNO + MB_ICONQUESTION) of
    IDYES:
    begin
      dmCliente.sqlCliente.Close;
      dmCliente.sqlCliente.SQL.Clear;
      dmCliente.sqlCliente.SQL.Add('delete from cliente where CliId = :codigo');
      dmCliente.sqlCliente.ParamByName('codigo').Value := edtImprimir.Text;
      dmCliente.sqlCliente.ExecSQL;
      ShowMessage('Cliente Exclu�do!');
    end;

    IDNO:
    begin
     exit;
    end;
  end;
  dmCliente.sqlCliente.Active := False;
  LimparCampos;
end;

procedure TfrmCadastroCliente.btnCancelarClick(Sender: TObject);
begin
  dmCliente.Conexao.Connected := True;
  dmCliente.sqlCliente.Cancel;
  ConfigurarBotoesCadastro;
  DesabilitaCamposEdit;
  LimparCampos;
  dmCliente.sqlCliente.Active := False;
end;

procedure TfrmCadastroCliente.btnFecharClick(Sender: TObject);
begin
  if dmCliente.sqlCliente.State in [dsInsert, dsEdit] then
  begin
    ShowMessage('Salve ou Cancele o registro antes de fechar!');
    exit;
  end
  else
  begin
    LimparCampos;
    close;
  end;
end;

procedure TfrmCadastroCliente.btnConsultarClick(Sender: TObject);
begin
  pgrcCliente.TabIndex := 1;
  tsConsultaCliente.TabVisible := True;
  tsCadastroCliente.TabVisible := False;
end;

procedure TfrmCadastroCliente.ConfigurarBotoesCadastro;
begin
  btnInserir.Enabled := dmCliente.sqlCliente.State in [dsBrowse];
  btnAlterar.Enabled := dmCliente.sqlCliente.State in [dsBrowse];
  btnExcluir.Enabled := dmCliente.sqlCliente.State in [dsBrowse];
  btnSalvar.Enabled := dmCliente.sqlCliente.State in [dsInsert, dsEdit];
  btnCancelar.Enabled := dmCliente.sqlCliente.State in [dsInsert, dsEdit];
end;

procedure TfrmCadastroCliente.HabilitarCamposEdit;
begin
  edtNome.Enabled := True;
  edtEndereco.Enabled := True;
  edtBairro.Enabled := True;
  edtCidade.Enabled := True;
  edtCep.Enabled := True;
  edtCelular.Enabled := True;
  edtTelefone.Enabled := True;
  edtDataNasc.Enabled := True;
  edtEmail.Enabled := True;
  edtCpf.Enabled := True;
  edtRg.Enabled := True;
  edtUf.Enabled := True;
  cbxStatus.Enabled := True;
end;

procedure TfrmCadastroCliente.grdConsultaClienteCellClick(Column: TColumn);
begin
  edtImprimir.Text := IntToStr(dmCliente.sqlConsultaClienteCliID.Value);
  btnImprimir.Enabled := True;
end;

procedure TfrmCadastroCliente.grdConsultaClienteDblClick(Sender: TObject);
begin
  pgrcCliente.TabIndex := 0;
  tsConsultaCliente.TabVisible := False;
  tsCadastroCliente.TabVisible := True;
  CarregarDadosDoCliente;
  DesabilitaCamposEdit;
end;

procedure TfrmCadastroCliente.CarregarDadosDoCliente;
begin
{$WARNINGS OFF}
  dmCliente.sqlCliente.Active := True;
  edtCodigo.Text := IntToStr(dmCliente.sqlConsultaClienteCliID.Value);
  edtNome.Text := dmCliente.sqlConsultaClienteCliNome.Value;
  edtEndereco.Text := dmCliente.sqlConsultaClienteCliEndereco.Value;
  edtBairro.Text := dmCliente.sqlConsultaClienteCliBairro.Value;
  edtCidade.Text := dmCliente.sqlConsultaClienteCliCidade.Value;
  edtCep.Text := dmCliente.sqlConsultaClienteCliCep.Value;
  edtUf.Text := dmCliente.sqlConsultaClienteCliUf.Value;

  cbxStatus.ItemIndex := 1;
  if dmCliente.sqlConsultaClienteCliStatus.Value = 'Ativo' then
    cbxStatus.ItemIndex := 0;

  edtUf.Text := dmCliente.sqlConsultaClienteCliUf.Value;
  edtCpf.Text := dmCliente.sqlConsultaClienteCliCpf.Value;
  edtRg.Text := dmCliente.sqlConsultaClienteCliRg.Value;
  edtTelefone.Text := dmCliente.sqlConsultaClienteCliTel.Value;
  edtCelular.Text := dmCliente.sqlConsultaClienteCliCel.Value;
  edtEmail.Text := dmCliente.sqlConsultaClienteCliEmail.Value;
  edtDataNasc.Text := DateToStr(dmCliente.sqlConsultaClienteCliDataNasc.Value);
  edtDataCadastro.Text := DateToStr(dmCliente.sqlConsultaClienteCliDataCad.Value);
{$WARNINGS ON}
end;

procedure TfrmCadastroCliente.btnImprimirClick(Sender: TObject);
begin
  with dmCliente.sqlRelatorioCliente do
  begin
    Close;
    Sql.Clear;
    if edtImprimir.Text = '' then
    begin
      SQL.Add('select * from cliente');
    end
    else
    begin
      SQL.Add('select * from cliente where CliId = :codigo');
      ParamByName('codigo').Value := StrToInt(edtImprimir.Text);
    end;
    Open;

    dmCliente.frxReportCliente.LoadFromFile(GetCurrentDir + '\rel\relCliente.fr3');
    dmCliente.frxReportCliente.ShowReport();
  end;
end;

procedure TfrmCadastroCliente.btnPesquisarClienteClick(Sender: TObject);
begin
  with dmCliente.sqlConsultaCliente do begin
    Close;
    SQL.Clear;
    SQL.Add('select * from cliente');

    case rdgpOpcoesBusca.ItemIndex of
      0:
      begin
        SQL.Add('where CliId = :codigo');
        ParamByName('codigo').Value := edtBusca.Text;
      end;

      1:
      begin
        SQL.Add('where CliNome like :nome');
        ParamByName('nome').Value := '%' + edtBusca.Text + '%';
      end;

      2:
      begin
        SQL.Add('where CliRg = :rg');
        ParamByName('rg').Value := edtBusca.Text;
      end;

      3:
      begin
        SQL.Add('where CliCpf = :cpf');
        ParamByName('cpf').Value := edtBusca.Text;
      end;

      4:
      begin
        SQL.Add('where CliDataNasc = like :dataNasc');
        ParamByName('dataNasc').AsDate := strToDate(formatDateTime('dd/mm/yyyy', dtpDataBusca.Date));
      end;
    end;
    Open;

    MostraQtdeRegistrosEncontrados(RecordCount);
  end;
end;

procedure TfrmCadastroCliente.MostraQtdeRegistrosEncontrados(pQtdeRegistros: Integer);
begin
  if pQtdeRegistros = 0 then
    begin
      lbQtdeRegistros.Visible := True;
      lbQtdeRegistros.Caption := '';
      lbQtdeRegistros.Caption := 'Nenhum Cliente encontrado!';
      btnImprimir.Enabled := False;
    end;

    if pQtdeRegistros = 1 then
    begin
      lbQtdeRegistros.Visible := True;
      lbQtdeRegistros.Caption := '';
      lbQtdeRegistros.Caption := 'Foram encontrado 1 Cliente';
      btnImprimir.Enabled := True;
    end;

    if pQtdeRegistros > 1 then
    begin
      lbQtdeRegistros.Visible := True;
      lbQtdeRegistros.Caption := '';
      lbQtdeRegistros.Caption := 'Foram encontrados ' + IntToStr(pQtdeRegistros) +  ' Clientes';
      btnImprimir.Enabled := True;
    end;
end;

procedure TfrmCadastroCliente.DesabilitaCamposEdit;
begin
  edtCodigo.Enabled := False;
  edtNome.Enabled := False;
  edtEndereco.Enabled := False;
  edtBairro.Enabled := False;
  edtCidade.Enabled := False;
  edtCep.Enabled := False;
  edtCelular.Enabled := False;
  edtTelefone.Enabled := False;
  edtDataNasc.Enabled := False;
  edtDataCadastro.Enabled := False;
  edtEmail.Enabled := False;
  edtCpf.Enabled := False;
  edtRg.Enabled := False;
  edtUf.Enabled := False;
  cbxStatus.Enabled := False;
end;

procedure TfrmCadastroCliente.rdgpOpcoesBuscaClick(Sender: TObject);
begin
  case rdgpOpcoesBusca.ItemIndex of
    0:
    begin
      edtBusca.Visible := True;
      lbBusca.Caption := 'Digite o C�digo do Cliente';
      lbBusca.Visible := True;
      dtpDataBusca.Visible := False;
      edtBusca.Clear;
      edtBusca.SetFocus;
    end;

    1:
    begin
      edtBusca.Visible := True;
      lbBusca.Caption := 'Digite o Nome do Cliente';
      lbBusca.Visible := True;
      dtpDataBusca.Visible := False;
      edtBusca.Clear;
      edtBusca.SetFocus;
    end;

    2:
    begin
      edtBusca.Visible := True;
      lbBusca.Caption := 'Digite o RG do Cliente';
      lbBusca.Visible := True;
      dtpDataBusca.Visible := False;
      edtBusca.Clear;
      edtBusca.SetFocus;
    end;

    3:
    begin
      edtBusca.Visible := True;
      lbBusca.Caption := 'Digite o CPF do Cliente';
      lbBusca.Visible := True;
      dtpDataBusca.Visible := False;
      edtBusca.Clear;
      edtBusca.SetFocus;
    end;

    4:
    begin
      edtBusca.Visible := False;
      lbBusca.Caption := 'Informe a Data de Nascimento do Cliente';
      lbBusca.Visible := True;
      dtpDataBusca.Visible := True;
      edtBusca.Clear;
    end;
  end;
end;

procedure TfrmCadastroCliente.SetOperacao(const Value: TOperacao);
begin
  FOperacao := Value;
end;

procedure TfrmCadastroCliente.btnVoltarParaCadastroClick(Sender: TObject);
begin
  pgrcCliente.TabIndex := 0;
  tsConsultaCliente.TabVisible := False;
  tsCadastroCliente.TabVisible := True;
end;

end.
