object Form2: TForm2
  Left = 0
  Top = 0
  Caption = #1057#1090#1072#1090#1080#1089#1090
  ClientHeight = 556
  ClientWidth = 901
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 432
    Top = 8
    Width = 409
    Height = 217
    Caption = #1060#1080#1083#1100#1090#1088' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1083#1102#1076#1077#1081
    TabOrder = 0
    object BirthDateTimePicker1: TDateTimePicker
      Left = 143
      Top = 36
      Width = 97
      Height = 21
      Date = 44700.000000000000000000
      Time = 0.744706539349863300
      Enabled = False
      TabOrder = 0
    end
    object BirthDateTimePicker2: TDateTimePicker
      Left = 264
      Top = 36
      Width = 97
      Height = 21
      Date = 44700.000000000000000000
      Time = 0.744706539349863300
      Enabled = False
      TabOrder = 1
    end
    object RegisterDateTimePicker1: TDateTimePicker
      Left = 144
      Top = 72
      Width = 97
      Height = 21
      Date = 44700.000000000000000000
      Time = 0.744706539349863300
      Enabled = False
      TabOrder = 2
    end
    object RegisterDateTimePicker2: TDateTimePicker
      Left = 264
      Top = 72
      Width = 97
      Height = 21
      Date = 44700.000000000000000000
      Time = 0.744706539349863300
      Enabled = False
      TabOrder = 3
    end
    object BirthCheckBox1: TCheckBox
      Left = 9
      Top = 36
      Width = 120
      Height = 17
      Caption = #1055#1086' '#1076#1072#1090#1077' '#1088#1086#1078#1076#1077#1085#1080#1103
      TabOrder = 4
      OnClick = BirthCheckBoxClick
    end
    object RegisterCheckBox2: TCheckBox
      Left = 9
      Top = 72
      Width = 136
      Height = 21
      Caption = #1055#1086' '#1076#1072#1090#1077' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      TabOrder = 5
      OnClick = RegisterCheckBox2Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 24
    Top = 283
    Width = 417
    Height = 198
    Caption = #1057#1087#1080#1089#1086#1082' '#1089#1087#1088#1072#1074#1086#1082
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 3
      Top = 17
      Width = 385
      Height = 161
      DataSource = CertificatesSource
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'people_id'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'name'
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1087#1088#1072#1074#1082#1080
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'code'
          Title.Caption = #1050#1086#1076
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'date_issue'
          Title.Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
          Width = 140
          Visible = True
        end>
    end
  end
  object CertificatesSource: TDataSource
    DataSet = CertificatesQuery
    Left = 96
    Top = 480
  end
  object CertificatesQuery: TFDQuery
    Active = True
    IndexFieldNames = 'people_id'
    Connection = Form1.FDConnection1
    SQL.Strings = (
      'select people_id, name,code,date_issue'
      'from certificates c'
      'inner join certificate_db cdb on (cdb.id = c.certificate_id)')
    Left = 40
    Top = 480
  end
end
