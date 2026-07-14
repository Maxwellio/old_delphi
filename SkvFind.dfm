object frmSkvFind: TfrmSkvFind
  Left = 245
  Top = 169
  Width = 1555
  Height = 755
  Caption = #1055#1086#1080#1089#1082' '#1089#1082#1074#1072#1078#1080#1085#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object strgrdSkv: TStringGrid
    Left = 0
    Top = 33
    Width = 1539
    Height = 638
    Align = alClient
    DefaultRowHeight = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ParentFont = False
    TabOrder = 1
    OnDblClick = strgrdSkvDblClick
    OnDrawCell = strgrdSkvDrawCell
    OnEnter = strgrdSkvEnter
    OnKeyDown = strgrdSkvKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 671
    Width = 1539
    Height = 45
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object btnCancel: TButton
      Left = 371
      Top = 11
      Width = 94
      Height = 26
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
    end
    object btnSave: TButton
      Left = 179
      Top = 11
      Width = 94
      Height = 26
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object edIdSkv: TEdit
      Left = 576
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 2
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1539
    Height = 33
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label2: TLabel
      Left = 336
      Top = 8
      Width = 74
      Height = 16
      Caption = #1057#1082#1074#1072#1078#1080#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 542
      Top = 8
      Width = 120
      Height = 16
      Caption = #1052#1077#1089#1090#1086#1088#1086#1078#1076#1077#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 798
      Top = 8
      Width = 35
      Height = 16
      Caption = #1050#1091#1089#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 72
      Top = 8
      Width = 79
      Height = 16
      Caption = #1058#1077#1093'. '#1084#1077#1089#1090#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 1080
      Top = 4
      Width = 49
      Height = 26
      Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1080#1079' '#1048#1057' '#1041#1091#1088#1077#1085#1080#1077' '#1087#1086' '#1091#1082#1072#1079#1072#1085#1085#1086#1084#1091' '#1090#1077#1093'.'#1084#1077#1089#1090#1091
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000028C8E8DFF8C8E8DFF828484FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000008C8E8DFFB7B8B8FFA3A4A3FF828484FF000000000000
        0000000000000000000000000000000000006A6E6C89808381FF808381FF8083
        81FF808381FF8C8E8DFFB7B8B8FFA3A4A3FFA3A4A3FF828484FF898E8CA3868B
        89FF858A88FF858A88FF858A88FF7B807EFF808381FFDCC8B3FFCFAC8BFFD1A8
        80FFD0B399FF808381FFA3A4A3FFA3A4A3FF6A6E6CD800000000868B89FBFFFF
        FFFFFFFFFFFFFFFFFFFFCDCFCFFF808381FFD1B89FFFD6B391FFDFC5AFFFE3CA
        B2FFD6BAA0FFD3B497FF808381FF737675E20000000000000000868B89FBF9FA
        FAFFEFF0F0FFEFF0F0FF808381FFC3B5A7FFD0AB89FFE5CAB3FFEBD7C3FFEAD4
        C1FFEEDDCFFFDABDA3FFCEAF93FB808381FF0000000000000000868B89FDFDFE
        FEFFEFF0F0FFEFF0F0FF808381FFD6BFA9FFE0C1A5FFEEDED0FFF2E5DAFFEDDC
        CDFFECD9C8FFE8D0BCFFD1A780FD808381FF0000000000000000878C8AFDFFFF
        FFFFEFF0F0FFEFF0F0FF808381FFD0B8A2FFDFC0A5FFF1E4D9FFF3EAE0FFF2E7
        DDFFE9D4C1FFDFBEA0FFD0A681FE808381FF0000000000000000878C8AFDFFFF
        FFFFEFF0F0FFC6C7C7FF808381FFBBAEA3FFCFA985FFF2E6DCFFF7EEE8FFF5EC
        E4FFECDACAFFD8B28EFFCBAF97FD808381FF0000000000000000868B89FDFFFF
        FFFFEFF0F0FFEFF0F0FFD5D7D6FF808381FFC8B7A8FFD2AC8AFFE7D3BFFFEAD7
        C5FFD9BA9CFFCBAD90FF808381FF6B6F6D310000000000000000878C8AFDFFFF
        FFFFEFF0F0FFC6C7C7FFC6C7C7FFA6A9A8FF808381FFC8BAAEFFD2BCA6FFD4BA
        A2FFCDB9A8FF808381FF7074735C000000000000000000000000868B89FDFFFF
        FFFFEFF0F0FFEFF0F0FFEFF0F0FFEFF0F0FFD5D6D6FF808381FF808381FF8083
        81FF808381FF808482FF00000000000000000000000000000000878C8AFDFFFF
        FFFFEFF0F0FFC6C7C7FFC6C7C7FFC6C7C7FFC6C7C7FFC6C7C7FFC6C7C7FFEFF0
        F0FFFFFFFFFF858A88FF00000000000000000000000000000000868B89FDFFFF
        FFFFEFF0F0FFEFF0F0FFEFF0F0FFEFF0F0FFEFF0F0FFEFF0F0FFEFF0F0FFEFF0
        F0FFFFFFFFFF858A88FF00000000000000000000000000000000878C8AFDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF858A88FF00000000000000000000000000000000979B9AD0858A
        88FF858A88FF858A88FF858A88FF858A88FF858A88FF858A88FF858A88FF858A
        88FF858A88FF8A8F8DAB00000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object edSkvFind: TEdit
      Left = 414
      Top = 5
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edSkvFindKeyDown
    end
    object edMest: TEdit
      Left = 665
      Top = 5
      Width = 122
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyDown = edMestKeyDown
    end
    object EdKust: TEdit
      Left = 841
      Top = 5
      Width = 122
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyDown = EdKustKeyDown
    end
    object edTehMesto: TEdit
      Left = 153
      Top = 5
      Width = 179
      Height = 24
      Hint = 
        #1087#1086#1080#1089#1082' '#1087#1086' '#1090#1077#1093#1084#1077#1089#1090#1091' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1089#1103'  '#1087#1088#1080' '#1076#1083#1080#1085#1077' '#1090#1077#1082#1089#1090#1072' '#1073#1086#1083#1077#1077' 4-'#1093' '#1079#1085#1072#1082#1086 +
        #1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnKeyDown = edTehMestoKeyDown
    end
    object ToolBar1: TToolBar
      Left = 10
      Top = 3
      Width = 41
      Height = 29
      Align = alCustom
      ButtonWidth = 41
      Caption = 'ToolBar1'
      Images = frmMain.ImageList1
      TabOrder = 4
      object sbtnFind: TToolButton
        Left = 0
        Top = 2
        Hint = #1055#1086#1080#1089#1082
        Caption = 'sbtnFind'
        ImageIndex = 55
        OnClick = sbtnFindClick
      end
    end
    object ToolBar2: TToolBar
      Left = 976
      Top = 1
      Width = 57
      Height = 29
      Align = alCustom
      ButtonHeight = 24
      ButtonWidth = 49
      Caption = 'ToolBar2'
      Images = frmMain.ImageList1
      TabOrder = 5
      object sSpeedButton1: TToolButton
        Left = 0
        Top = 2
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1086#1082#1085#1072' '#1087#1086#1080#1089#1082#1072
        Caption = 'sSpeedButton1'
        ImageIndex = 17
        OnClick = sSpeedButton1Click
      end
    end
  end
  object qrySkv: TPgQuery
    Connection = frmMain.MConnection
    Left = 192
    Top = 192
  end
  object procGetskvfromoracledbbytehmesto: TPgStoredProc
    StoredProcName = 'burnar.getskvfromoracledbbytehmesto'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'CALL burnar.getskvfromoracledbbytehmesto(:tehmesto)')
    Left = 1096
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'tehmesto'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'burnar.getskvfromoracledbbytehmesto:0'
  end
end
