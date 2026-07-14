object frmEditNewPeriod: TfrmEditNewPeriod
  Left = 861
  Top = 614
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmEditNewPeriod'
  ClientHeight = 197
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 80
    Width = 137
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1088#1072#1073#1086#1090':'
  end
  object Label2: TLabel
    Left = 223
    Top = 80
    Width = 155
    Height = 13
    Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1088#1072#1073#1086#1090':'
  end
  object Label3: TLabel
    Left = 20
    Top = 8
    Width = 98
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1077#1088#1080#1086#1076#1072':'
  end
  object Label4: TLabel
    Left = 14
    Top = 132
    Width = 33
    Height = 13
    Caption = #1042#1088#1077#1084#1103
  end
  object Label5: TLabel
    Left = 221
    Top = 132
    Width = 33
    Height = 13
    Caption = #1042#1088#1077#1084#1103
  end
  object Label6: TLabel
    Left = 14
    Top = 102
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object Label7: TLabel
    Left = 221
    Top = 102
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object Edit1: TEdit
    Left = 20
    Top = 24
    Width = 385
    Height = 21
    TabOrder = 0
  end
  object TimePicker1: TDateTimePicker
    Left = 52
    Top = 126
    Width = 81
    Height = 21
    Date = 44097.000000000000000000
    Time = 44097.000000000000000000
    DateMode = dmUpDown
    Kind = dtkTime
    TabOrder = 1
  end
  object TimePicker2: TDateTimePicker
    Left = 259
    Top = 126
    Width = 81
    Height = 21
    Date = 44097.000000000000000000
    Time = 44097.000000000000000000
    DateMode = dmUpDown
    Kind = dtkTime
    TabOrder = 2
  end
  object DatePicker1: TDateTimePicker
    Left = 52
    Top = 96
    Width = 128
    Height = 21
    Date = 44097.000000000000000000
    Time = 44097.000000000000000000
    TabOrder = 3
  end
  object DatePicker2: TDateTimePicker
    Left = 259
    Top = 96
    Width = 128
    Height = 21
    Date = 44097.000000000000000000
    Time = 44097.000000000000000000
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 151
    Top = 164
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 5
  end
end
