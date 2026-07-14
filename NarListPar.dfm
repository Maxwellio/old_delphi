object frmNarListPar: TfrmNarListPar
  Left = 669
  Top = 468
  BorderStyle = bsToolWindow
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
  ClientHeight = 83
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 24
    Top = 17
    Width = 64
    Height = 13
    Caption = #1058#1080#1087' '#1085#1072#1088#1103#1076#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbCodeSpr1: TLabel
    Left = 16
    Top = 169
    Width = 180
    Height = 13
    Hint = #1048#1084#1077#1083' '#1089#1080#1083#1091' '#1074' '#1079#1072#1076#1072#1085#1085#1086#1084' '#1080#1085#1090#1077#1088#1074#1072#1083#1077
    Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1085#1072#1088#1103#1076#1086#1074' '#1074' '#1089#1080#1089#1090#1077#1084#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label1: TLabel
    Left = 16
    Top = 184
    Width = 56
    Height = 13
    Caption = #1053#1077' '#1088#1072#1085#1077#1077'...'
  end
  object Label3: TLabel
    Left = 128
    Top = 184
    Width = 68
    Height = 13
    Caption = #1053#1077' '#1087#1086#1079#1076#1085#1077#1077'...'
  end
  object CheckBox1: TCheckBox
    Left = 224
    Top = 202
    Width = 89
    Height = 17
    Caption = #1042#1089#1077' '#1087#1077#1088#1080#1086#1076#1099
    TabOrder = 0
    OnClick = CheckBox1Click
  end
  object BitBtn1: TBitBtn
    Left = 137
    Top = 47
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object DateEdit1: TDateTimePicker
    Left = 16
    Top = 201
    Width = 83
    Height = 21
    Date = 44101.681745775470000000
    Time = 44101.681745775470000000
    TabOrder = 2
  end
  object DateEdit2: TDateTimePicker
    Left = 129
    Top = 201
    Width = 83
    Height = 21
    Date = 44101.681745775470000000
    Time = 44101.681745775470000000
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 101
    Top = 199
    Width = 25
    Height = 25
    Caption = '='
    TabOrder = 4
  end
  object ComboBox1: TComboBox
    Left = 96
    Top = 9
    Width = 217
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
  end
  object qrNarTypes: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select * from burnar.sprnartype')
    Left = 248
    Top = 24
  end
end
