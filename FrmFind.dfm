object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 288
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SearchGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 409
    Height = 217
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 0
    object SearchEdit: TEdit
      Left = 16
      Top = 25
      Width = 265
      Height = 21
      TabOrder = 0
    end
    object SearchDBGrid1: TDBGrid
      Left = 16
      Top = 52
      Width = 353
      Height = 120
      DataSource = DataSource1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = OnCellClickSearchGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'first_name'
          Title.Caption = #1048#1084#1103
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'surname'
          Title.Caption = #1060#1072#1084#1080#1083#1080#1103
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'patronymic'
          Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'birthday'
          Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'register_date'
          Title.Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          Width = 82
          Visible = True
        end>
    end
    object SearchButton: TButton
      Left = 294
      Top = 21
      Width = 75
      Height = 25
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 2
      OnClick = SearchButtonClick
    end
  end
  object FDQuery1: TFDQuery
    Connection = Form1.FDConnection1
    Left = 16
    Top = 232
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 72
    Top = 232
  end
end
