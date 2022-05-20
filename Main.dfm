object Form1: TForm1
  Left = 397
  Top = 239
  Caption = 'Form1'
  ClientHeight = 600
  ClientWidth = 1003
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  DesignSize = (
    1003
    600)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 496
    Width = 1009
    Height = 104
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 16
    object N1: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1052#1077#1089#1090#1072
      object N2: TMenuItem
        Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1054#1087#1077#1088#1072#1090#1086#1088
        OnClick = N3Click
      end
    end
  end
  object FDConnection1: TFDConnection
    ConnectionName = 'postgres'
    Params.Strings = (
      'User_Name=postgres'
      'Password=123123'
      'Database=testdb'
      'DriverID=PG')
    Connected = True
    Transaction = FDTransaction1
    Left = 272
    Top = 256
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = 'D:\delphi project\test_case_Delphi_01\drivers'
    Left = 272
    Top = 200
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 264
    Top = 312
  end
end
