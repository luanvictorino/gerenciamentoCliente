object dmCliente: TdmCliente
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 406
  Width = 328
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=gerenciamentoclientes'
      'User_Name=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object DriverMySql: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Users\Pichau\Desktop\GerenciamentoClientes\lib\libmysql.dll'
    Left = 152
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 256
    Top = 16
  end
  object sqlCliente: TFDTable
    IndexFieldNames = 'CliID'
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'gerenciamentoclientes.cliente'
    TableName = 'gerenciamentoclientes.cliente'
    Left = 40
    Top = 80
    object sqlClienteCliID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CliID'
      Origin = 'CliID'
      Required = True
    end
    object sqlClienteCliNome: TStringField
      FieldName = 'CliNome'
      Origin = 'CliNome'
      Required = True
      Size = 100
    end
    object sqlClienteCliEndereco: TStringField
      FieldName = 'CliEndereco'
      Origin = 'CliEndereco'
      Required = True
      Size = 100
    end
    object sqlClienteCliBairro: TStringField
      FieldName = 'CliBairro'
      Origin = 'CliBairro'
      Required = True
      Size = 60
    end
    object sqlClienteCliCidade: TStringField
      FieldName = 'CliCidade'
      Origin = 'CliCidade'
      Required = True
      Size = 60
    end
    object sqlClienteCliUf: TStringField
      FieldName = 'CliUf'
      Origin = 'CliUf'
      Required = True
      Size = 2
    end
    object sqlClienteCliCep: TStringField
      FieldName = 'CliCep'
      Origin = 'CliCep'
      Required = True
      EditMask = '00000\-999;0;_'
    end
    object sqlClienteCliRg: TStringField
      FieldName = 'CliRg'
      Origin = 'CliRg'
      Required = True
      Size = 15
    end
    object sqlClienteCliCpf: TStringField
      FieldName = 'CliCpf'
      Origin = 'CliCpf'
      Required = True
      EditMask = '000\.000\.000\-00;0;_'
      Size = 15
    end
    object sqlClienteCliTel: TStringField
      FieldName = 'CliTel'
      Origin = 'CliTel'
      Required = True
      EditMask = '!\(99\)0000-0000;0;_'
    end
    object sqlClienteCliCel: TStringField
      FieldName = 'CliCel'
      Origin = 'CliCel'
      Required = True
      EditMask = '!\(99\)00000-0000;0;_'
    end
    object sqlClienteCliDataNasc: TDateField
      FieldName = 'CliDataNasc'
      Origin = 'CliDataNasc'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sqlClienteCliDataCad: TDateField
      FieldName = 'CliDataCad'
      Origin = 'CliDataCad'
      Required = True
    end
    object sqlClienteCliStatus: TStringField
      FieldName = 'CliStatus'
      Origin = 'CliStatus'
      Required = True
    end
    object sqlClienteCliEmail: TStringField
      FieldName = 'CliEmail'
      Origin = 'CliEmail'
      Required = True
      Size = 100
    end
  end
  object dsCliente: TDataSource
    AutoEdit = False
    DataSet = sqlCliente
    Left = 152
    Top = 80
  end
  object sqlConsultaCliente: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cliente')
    Left = 40
    Top = 152
    object sqlConsultaClienteCliID: TIntegerField
      FieldName = 'CliID'
      Origin = 'CliID'
      Required = True
    end
    object sqlConsultaClienteCliNome: TStringField
      FieldName = 'CliNome'
      Origin = 'CliNome'
      Required = True
      Size = 100
    end
    object sqlConsultaClienteCliEndereco: TStringField
      FieldName = 'CliEndereco'
      Origin = 'CliEndereco'
      Required = True
      Size = 100
    end
    object sqlConsultaClienteCliBairro: TStringField
      FieldName = 'CliBairro'
      Origin = 'CliBairro'
      Required = True
      Size = 60
    end
    object sqlConsultaClienteCliCidade: TStringField
      FieldName = 'CliCidade'
      Origin = 'CliCidade'
      Required = True
      Size = 60
    end
    object sqlConsultaClienteCliUf: TStringField
      FieldName = 'CliUf'
      Origin = 'CliUf'
      Required = True
      Size = 2
    end
    object sqlConsultaClienteCliCep: TStringField
      FieldName = 'CliCep'
      Origin = 'CliCep'
      Required = True
    end
    object sqlConsultaClienteCliRg: TStringField
      FieldName = 'CliRg'
      Origin = 'CliRg'
      Required = True
      Size = 15
    end
    object sqlConsultaClienteCliCpf: TStringField
      FieldName = 'CliCpf'
      Origin = 'CliCpf'
      Required = True
      Size = 15
    end
    object sqlConsultaClienteCliTel: TStringField
      FieldName = 'CliTel'
      Origin = 'CliTel'
      Required = True
    end
    object sqlConsultaClienteCliCel: TStringField
      FieldName = 'CliCel'
      Origin = 'CliCel'
      Required = True
    end
    object sqlConsultaClienteCliEmail: TStringField
      FieldName = 'CliEmail'
      Origin = 'CliEmail'
      Required = True
      Size = 100
    end
    object sqlConsultaClienteCliDataNasc: TDateField
      FieldName = 'CliDataNasc'
      Origin = 'CliDataNasc'
      Required = True
    end
    object sqlConsultaClienteCliDataCad: TDateField
      FieldName = 'CliDataCad'
      Origin = 'CliDataCad'
      Required = True
    end
    object sqlConsultaClienteCliStatus: TStringField
      FieldName = 'CliStatus'
      Origin = 'CliStatus'
      Required = True
    end
  end
  object dsConsultaCliente: TDataSource
    DataSet = sqlConsultaCliente
    Left = 152
    Top = 152
  end
  object sqlRelatorioCliente: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from cliente')
    Left = 40
    Top = 224
    object sqlRelatorioClienteCliID: TIntegerField
      FieldName = 'CliID'
      Origin = 'CliID'
      Required = True
    end
    object sqlRelatorioClienteCliNome: TStringField
      FieldName = 'CliNome'
      Origin = 'CliNome'
      Required = True
      Size = 100
    end
    object sqlRelatorioClienteCliEndereco: TStringField
      FieldName = 'CliEndereco'
      Origin = 'CliEndereco'
      Required = True
      Size = 100
    end
    object sqlRelatorioClienteCliBairro: TStringField
      FieldName = 'CliBairro'
      Origin = 'CliBairro'
      Required = True
      Size = 60
    end
    object sqlRelatorioClienteCliCidade: TStringField
      FieldName = 'CliCidade'
      Origin = 'CliCidade'
      Required = True
      Size = 60
    end
    object sqlRelatorioClienteCliUf: TStringField
      FieldName = 'CliUf'
      Origin = 'CliUf'
      Required = True
      Size = 2
    end
    object sqlRelatorioClienteCliCep: TStringField
      FieldName = 'CliCep'
      Origin = 'CliCep'
      Required = True
    end
    object sqlRelatorioClienteCliRg: TStringField
      FieldName = 'CliRg'
      Origin = 'CliRg'
      Required = True
      Size = 15
    end
    object sqlRelatorioClienteCliCpf: TStringField
      FieldName = 'CliCpf'
      Origin = 'CliCpf'
      Required = True
      Size = 15
    end
    object sqlRelatorioClienteCliTel: TStringField
      FieldName = 'CliTel'
      Origin = 'CliTel'
      Required = True
    end
    object sqlRelatorioClienteCliCel: TStringField
      FieldName = 'CliCel'
      Origin = 'CliCel'
      Required = True
    end
    object sqlRelatorioClienteCliEmail: TStringField
      FieldName = 'CliEmail'
      Origin = 'CliEmail'
      Required = True
      Size = 100
    end
    object sqlRelatorioClienteCliDataNasc: TDateField
      FieldName = 'CliDataNasc'
      Origin = 'CliDataNasc'
      Required = True
    end
    object sqlRelatorioClienteCliDataCad: TDateField
      FieldName = 'CliDataCad'
      Origin = 'CliDataCad'
      Required = True
    end
    object sqlRelatorioClienteCliStatus: TStringField
      FieldName = 'CliStatus'
      Origin = 'CliStatus'
      Required = True
    end
  end
  object frxReportCliente: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44329.828178379600000000
    ReportOptions.LastChange = 44329.850242523150000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 144
    Top = 224
    Datasets = <
      item
        DataSet = frxdsRelCliente
        DataSetName = 'frxdsRelCliente'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 64.252010000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 15.118120000000000000
          Width = 170.078850000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Relat'#243'rio de Cliente')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 222.992270000000000000
        Top = 143.622140000000000000
        Width = 718.110700000000000000
        DataSet = frxdsRelCliente
        DataSetName = 'frxdsRelCliente'
        RowCount = 0
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 15.118120000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          Fill.BackColor = clWhite
          Frame.Color = clNone
          Frame.Typ = []
        end
        object frxdsRelClienteCliID: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 74.811070000000000000
          Top = 14.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CliID'
          DataSet = frxdsRelCliente
          DataSetName = 'frxdsRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsRelCliente."CliID"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 24.456710000000000000
          Top = 14.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 83.149660000000000000
          Width = 702.992580000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 710.551640000000000000
          Top = 64.252010000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 64.252010000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxdsRelClienteCliNome: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 64.252010000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'CliNome'
          DataSet = frxdsRelCliente
          DataSetName = 'frxdsRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsRelCliente."CliNome"]')
          ParentFont = False
        end
        object frxdsRelClienteCliTel: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 355.275820000000000000
          Top = 64.252010000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DataField = 'CliTel'
          DataSet = frxdsRelCliente
          DataSetName = 'frxdsRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsRelCliente."CliTel"]')
          ParentFont = False
        end
        object frxdsRelClienteCliCpf: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 215.433210000000000000
          Top = 64.252010000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'CliCpf'
          DataSet = frxdsRelCliente
          DataSetName = 'frxdsRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsRelCliente."CliCpf"]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 64.252010000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 347.716760000000000000
          Top = 64.252010000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 536.693260000000000000
          Top = 64.252010000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxdsRelClienteCliCel: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 64.252010000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'CliCel'
          DataSet = frxdsRelCliente
          DataSetName = 'frxdsRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsRelCliente."CliCel"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 44.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 215.433210000000000000
          Top = 44.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 355.275820000000000000
          Top = 44.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 44.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Celular')
          ParentFont = False
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 133.504020000000000000
          Width = 702.992580000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 710.551640000000000000
          Top = 114.606370000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 114.606370000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo7: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 114.606370000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'CliEndereco'
          DataSet = frxdsRelCliente
          DataSetName = 'frxdsRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsRelCliente."CliEndereco"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 355.275820000000000000
          Top = 114.606370000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = frxdsRelCliente
          DataSetName = 'frxdsRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsRelCliente."CliCep"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 215.433210000000000000
          Top = 114.606370000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'CliBairro'
          DataSet = frxdsRelCliente
          DataSetName = 'frxdsRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsRelCliente."CliBairro"]')
          ParentFont = False
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 114.606370000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 347.716760000000000000
          Top = 114.606370000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo10: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 471.252320000000000000
          Top = 114.606370000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = frxdsRelCliente
          DataSetName = 'frxdsRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsRelCliente."CliCidade"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Endere'#231'o')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 215.433210000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Bairro')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 355.275820000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CEP')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 471.252320000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 600.401980000000000000
          Top = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Estado')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 600.401980000000000000
          Top = 113.385900000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'CliUf'
          DataSet = frxdsRelCliente
          DataSetName = 'frxdsRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsRelCliente."CliUf"]')
          ParentFont = False
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 113.385900000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 589.606680000000000000
          Top = 113.385900000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line15: TfrxLineView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 186.417440000000000000
          Width = 461.102660000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line17: TfrxLineView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 167.519790000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line18: TfrxLineView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 167.519790000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line19: TfrxLineView
          AllowVectorExport = True
          Left = 347.716760000000000000
          Top = 167.519790000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line20: TfrxLineView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 166.299320000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo17: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 167.519790000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'CliEmail'
          DataSet = frxdsRelCliente
          DataSetName = 'frxdsRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsRelCliente."CliEmail"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 355.275820000000000000
          Top = 167.519790000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'CliStatus'
          DataSet = frxdsRelCliente
          DataSetName = 'frxdsRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsRelCliente."CliStatus"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 215.433210000000000000
          Top = 167.519790000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'CliDataNasc'
          DataSet = frxdsRelCliente
          DataSetName = 'frxdsRelCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdsRelCliente."CliDataNasc"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 147.401670000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'E-mail')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 215.433210000000000000
          Top = 147.401670000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data Nascimento')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 355.275820000000000000
          Top = 147.401670000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
        object Line21: TfrxLineView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 207.874150000000000000
          Width = 668.976810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxdsRelCliente: TfrxDBDataset
    UserName = 'frxdsRelCliente'
    CloseDataSource = False
    DataSet = sqlRelatorioCliente
    BCDToCurrency = False
    Left = 240
    Top = 224
  end
end
