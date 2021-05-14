program GerenciamentoClientes;

uses
  Vcl.Forms,
  uPrincipal in 'code\uPrincipal.pas' {frmPrincipal},
  uDMCliente in 'code\uDMCliente.pas' {dmCliente: TDataModule},
  uCliente in 'code\uCliente.pas' {frmCadastroCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmCliente, dmCliente);
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  Application.Run;
end.
