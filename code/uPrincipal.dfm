object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Gerenciamento de Clientes'
  ClientHeight = 405
  ClientWidth = 1059
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object sttbarPrincipal: TStatusBar
    Left = 0
    Top = 386
    Width = 1059
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'Sistema de Gerenciamento de Clientes'
        Width = 250
      end
      item
        Text = 'Desenvolvido por Luan Victorino'
        Width = 200
      end
      item
        Text = 'Usu'#225'rio - Luan Victorino'
        Width = 200
      end
      item
        Text = 'Data'
        Width = 250
      end
      item
        Alignment = taCenter
        Text = 'Hora'
        Width = 50
      end>
  end
  object pnlPrincipalTop: TPanel
    Left = 0
    Top = 0
    Width = 1059
    Height = 41
    Align = alTop
    TabOrder = 1
  end
  object mmPrincipal: TMainMenu
    Left = 312
    Top = 80
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 520
    Top = 216
  end
end
