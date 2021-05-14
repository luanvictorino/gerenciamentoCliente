unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    sttbarPrincipal: TStatusBar;
    mmPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Sair1: TMenuItem;
    pnlPrincipalTop: TPanel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCliente;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
  frmCadastroCliente.ShowModal;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  sttbarPrincipal.Panels[3].Text := 'Data: ' + FormatDateTime('dddd, dd " de " mmmm " de " yyyy', Now);
  sttbarPrincipal.Panels[4].Text := FormatDateTime('hh:mm:ss', Now);
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.
