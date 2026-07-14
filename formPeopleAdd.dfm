object frmPeopleAdd: TfrmPeopleAdd
  Left = 453
  Top = 233
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1075#1086' '#1083#1080#1094#1072' '
  ClientHeight = 476
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 447
    Width = 510
    Height = 29
    Align = alBottom
    ButtonHeight = 25
    Caption = 'ToolBar1'
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Width = 337
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object BitBtn1: TBitBtn
      Left = 337
      Top = 2
      Width = 75
      Height = 25
      Caption = #1054#1050
      ModalResult = 1
      TabOrder = 1
    end
    object ToolButton2: TToolButton
      Left = 412
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object BitBtn2: TBitBtn
      Left = 420
      Top = 2
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 0
    end
  end
  object gbUser: TGroupBox
    Left = 0
    Top = 233
    Width = 510
    Height = 216
    Align = alTop
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    TabOrder = 1
    object Label18: TLabel
      Left = 7
      Top = 93
      Width = 89
      Height = 13
      Caption = #1044#1072#1090#1072' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1103
    end
    object Label19: TLabel
      Left = 7
      Top = 61
      Width = 96
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    end
    object Label20: TLabel
      Left = 7
      Top = 149
      Width = 56
      Height = 13
      Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
    end
    object Label21: TLabel
      Left = 10
      Top = 27
      Width = 41
      Height = 13
      Caption = #1051#1086#1075#1080#1085':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object osnovanie: TMemo
      Left = 72
      Top = 149
      Width = 425
      Height = 57
      TabOrder = 4
    end
    object cbActive: TCheckBox
      Left = 8
      Top = 121
      Width = 97
      Height = 17
      Caption = #1040#1082#1090#1080#1074#1077#1085
      TabOrder = 0
    end
    object EnterDate: TDateTimePicker
      Left = 112
      Top = 60
      Width = 139
      Height = 21
      Date = 44097.658526967590000000
      Time = 44097.658526967590000000
      TabOrder = 2
    end
    object OutDate: TDateTimePicker
      Left = 113
      Top = 92
      Width = 139
      Height = 21
      Date = 44097.658526967590000000
      Time = 44097.658526967590000000
      TabOrder = 3
    end
    object edOraName: TEdit
      Left = 113
      Top = 25
      Width = 117
      Height = 21
      TabOrder = 1
    end
  end
  object gbPeople: TGroupBox
    Left = 0
    Top = 0
    Width = 510
    Height = 233
    Align = alTop
    Caption = #1056#1072#1073#1086#1090#1085#1080#1082
    TabOrder = 2
    object Label11: TLabel
      Left = 21
      Top = 212
      Width = 260
      Height = 13
      Caption = '- '#1086#1090#1084#1077#1095#1077#1085#1099' '#1074#1089#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099#1077' '#1076#1083#1103' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1086#1083#1103
    end
    object Label17: TLabel
      Left = 287
      Top = 173
      Width = 7
      Height = 24
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 7
      Top = 180
      Width = 129
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1074#1086#1076#1072' '#1074' '#1076#1086#1083#1078#1085#1086#1089#1090#1100':'
    end
    object Label14: TLabel
      Left = 7
      Top = 156
      Width = 61
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
    end
    object Label12: TLabel
      Left = 7
      Top = 132
      Width = 166
      Height = 13
      Caption = #1054#1090#1076#1077#1083'/'#1041#1088#1080#1075#1072#1076#1072'/'#1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077':'
    end
    object Label9: TLabel
      Left = 7
      Top = 108
      Width = 48
      Height = 13
      Caption = #1050#1086#1076' '#1074' R3:'
    end
    object Label13: TLabel
      Left = 493
      Top = 124
      Width = 7
      Height = 24
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 493
      Top = 148
      Width = 7
      Height = 24
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 312
      Top = 77
      Width = 7
      Height = 24
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 7
      Top = 84
      Width = 95
      Height = 13
      Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088':'
    end
    object Label3: TLabel
      Left = 7
      Top = 60
      Width = 233
      Height = 13
      Caption = #1048#1085#1080#1094#1080#1072#1083#1099', '#1092#1072#1084#1080#1083#1080#1103' ('#1074' '#1088#1086#1076#1080#1090#1077#1083#1100#1085#1086#1084' '#1087#1072#1076#1077#1078#1077'):'
    end
    object Label7: TLabel
      Left = 493
      Top = 52
      Width = 7
      Height = 24
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 7
      Top = 36
      Width = 110
      Height = 13
      Caption = #1048#1085#1080#1094#1080#1072#1083#1099', '#1092#1072#1084#1080#1083#1080#1103': '
    end
    object Label1: TLabel
      Left = 7
      Top = 12
      Width = 71
      Height = 13
      Caption = #1055#1086#1083#1085#1086#1077' '#1060#1048#1054':'
    end
    object Label5: TLabel
      Left = 493
      Top = 5
      Width = 7
      Height = 24
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 493
      Top = 29
      Width = 7
      Height = 24
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 7
      Top = 205
      Width = 7
      Height = 24
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ComboBox2: TComboBox
      Left = 80
      Top = 152
      Width = 410
      Height = 21
      ItemHeight = 13
      TabOrder = 6
      Text = #1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1100
    end
    object ComboBox1: TComboBox
      Left = 184
      Top = 128
      Width = 306
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Text = #1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1090#1076#1077#1083'/'#1073#1088#1080#1075#1072#1076#1091'/'#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
    end
    object ER3: TEdit
      Left = 128
      Top = 104
      Width = 177
      Height = 21
      TabOrder = 4
    end
    object ETAB: TEdit
      Left = 128
      Top = 80
      Width = 177
      Height = 21
      TabOrder = 3
      OnKeyPress = ETABKeyPress
    end
    object EROD: TEdit
      Left = 248
      Top = 56
      Width = 241
      Height = 21
      TabOrder = 2
    end
    object EREP: TEdit
      Left = 128
      Top = 32
      Width = 361
      Height = 21
      TabOrder = 1
    end
    object EFIO: TEdit
      Left = 128
      Top = 8
      Width = 361
      Height = 21
      TabOrder = 0
    end
    object DatePicker1: TDateTimePicker
      Left = 144
      Top = 176
      Width = 139
      Height = 21
      Date = 44097.658526967590000000
      Time = 44097.658526967590000000
      TabOrder = 7
    end
  end
end
