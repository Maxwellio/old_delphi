object FormChangePass: TFormChangePass
  Left = 383
  Top = 427
  BorderStyle = bsToolWindow
  Caption = #1057#1084#1077#1085#1072' '#1087#1072#1088#1086#1083#1103
  ClientHeight = 119
  ClientWidth = 230
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 6
    Width = 102
    Height = 16
    Caption = #1057#1090#1072#1088#1099#1081' '#1087#1072#1088#1086#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 6
    Top = 30
    Width = 96
    Height = 16
    Caption = #1053#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 6
    Top = 54
    Width = 109
    Height = 16
    Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object PoleOld: TEdit
    Left = 117
    Top = 6
    Width = 105
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object PoleNew1: TEdit
    Left = 117
    Top = 30
    Width = 105
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object PoleNew2: TEdit
    Left = 117
    Top = 54
    Width = 105
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 31
    Top = 88
    Width = 81
    Height = 22
    Caption = #1057#1084#1077#1085#1080#1090#1100
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 119
    Top = 88
    Width = 81
    Height = 22
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    Kind = bkAbort
  end
end
