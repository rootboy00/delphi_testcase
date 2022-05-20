object Form3: TForm3
  Left = 0
  Top = 0
  Caption = #1054#1087#1077#1088#1072#1090#1086#1088
  ClientHeight = 437
  ClientWidth = 899
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PrintScale = poNone
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox3: TGroupBox
    Left = 8
    Top = 220
    Width = 417
    Height = 198
    Caption = #1057#1087#1080#1089#1086#1082' '#1089#1087#1088#1072#1074#1086#1082
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 16
      Top = 24
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
  object PageControl1: TPageControl
    Left = 442
    Top = 8
    Width = 433
    Height = 321
    ActivePage = Человек
    TabOrder = 1
    object Человек: TTabSheet
      Caption = #1063#1077#1083#1086#1074#1077#1082
      object Label1: TLabel
        Left = 26
        Top = 31
        Width = 29
        Height = 19
        Caption = #1048#1084#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 26
        Top = 82
        Width = 65
        Height = 19
        Caption = #1060#1072#1084#1080#1083#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 26
        Top = 135
        Width = 69
        Height = 19
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 26
        Top = 175
        Width = 113
        Height = 19
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 26
        Top = 215
        Width = 132
        Height = 19
        Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object BirthDateTimePicker: TDateTimePicker
        Left = 177
        Top = 173
        Width = 121
        Height = 21
        Date = 44697.000000000000000000
        Time = 0.585947534724255100
        TabOrder = 0
      end
      object CheckBoxNeedRegisterDate: TCheckBox
        Left = 185
        Top = 265
        Width = 161
        Height = 17
        Caption = #1059#1082#1072#1079#1072#1090#1100' '#1076#1072#1090#1091' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
        TabOrder = 1
        OnClick = CheckBoxNeedRegisterDateClick
      end
      object FirstNameEdit: TEdit
        Left = 177
        Top = 33
        Width = 121
        Height = 21
        TabOrder = 2
        TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1080#1084#1103'...'
      end
      object PatronymicEdit: TEdit
        Left = 177
        Top = 133
        Width = 121
        Height = 21
        TabOrder = 3
        TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1086#1090#1095#1077#1089#1090#1074#1086'...'
      end
      object RegisterDateTimePicker: TDateTimePicker
        Left = 177
        Top = 216
        Width = 121
        Height = 21
        Date = 44697.000000000000000000
        Time = 0.595823634255793900
        Enabled = False
        TabOrder = 4
      end
      object SurnameEdit: TEdit
        Left = 177
        Top = 84
        Width = 121
        Height = 21
        TabOrder = 5
        TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1092#1072#1084#1080#1083#1080#1102'...'
      end
      object Добавить: TButton
        Left = 26
        Top = 261
        Width = 75
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 6
        OnClick = AddPeopleButton
      end
    end
    object Справка: TTabSheet
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ImageIndex = 1
      object Label6: TLabel
        Left = 18
        Top = 79
        Width = 91
        Height = 19
        Caption = #1050#1086#1076' '#1089#1087#1088#1072#1074#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 18
        Top = 39
        Width = 131
        Height = 19
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1087#1088#1072#1074#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 18
        Top = 128
        Width = 6
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 18
        Top = 120
        Width = 6
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object NameEdit: TEdit
        Left = 209
        Top = 41
        Width = 145
        Height = 21
        TabOrder = 0
        TextHint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1087#1088#1072#1074#1082#1080'...'
      end
      object Button1: TButton
        Left = 26
        Top = 261
        Width = 69
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 1
        OnClick = Button1Click
      end
      object CodeEdit: TEdit
        Left = 209
        Top = 81
        Width = 145
        Height = 21
        TabOrder = 2
        TextHint = #1050#1086#1076' '#1089#1087#1088#1072#1074#1082#1080
      end
    end
    object TTabSheet
      Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077' 10 '#1095#1077#1083#1086#1074#1077#1082
      ImageIndex = 2
      object lastpeople: TLabel
        Left = 3
        Top = 16
        Width = 198
        Height = 23
        Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077' 10 '#1095#1077#1083#1086#1074#1077#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LastNameDBGrid: TDBGrid
        Left = 0
        Top = 45
        Width = 425
        Height = 252
        DataSource = LastPeopleDataSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = LastNameDBGridCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'first_name'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'surname'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'patronymic'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'birthday'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'register_date'
            Visible = True
          end>
      end
    end
  end
  object OperatorQuery: TFDQuery
    Connection = Form1.FDConnection1
    Left = 40
    Top = 29
  end
  object CertificatesSource: TDataSource
    DataSet = CertificatesQuery
    Left = 792
    Top = 368
  end
  object CertificatesQuery: TFDQuery
    Active = True
    IndexFieldNames = 'people_id'
    Connection = Form1.FDConnection1
    SQL.Strings = (
      'select people_id, name,code,date_issue'
      'from certificates c'
      'inner join certificate_db cdb on (cdb.id = c.certificate_id)')
    Left = 752
    Top = 368
  end
  object LastPeopleDataSource: TDataSource
    DataSet = LastPeopleFDQuery
    Left = 508
    Top = 372
  end
  object LastPeopleFDQuery: TFDQuery
    Active = True
    Connection = Form1.FDConnection1
    SQL.Strings = (
      'select * '
      'from peoples'
      'order by id desc'
      'limit 10')
    Left = 572
    Top = 372
  end
end
