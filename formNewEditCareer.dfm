object frmNewEditCareer: TfrmNewEditCareer
  Left = 480
  Top = 377
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1072#1088#1100#1077#1088#1072
  ClientHeight = 172
  ClientWidth = 809
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  DesignSize = (
    809
    172)
  PixelsPerInch = 96
  TextHeight = 13
  object sLabel2: TLabel
    Left = 293
    Top = 27
    Width = 33
    Height = 13
    Caption = #1042#1088#1077#1084#1103
    Visible = False
  end
  object sLabel4: TLabel
    Left = 292
    Top = 51
    Width = 33
    Height = 13
    Caption = #1042#1088#1077#1084#1103
    Visible = False
  end
  object Label1: TLabel
    Left = 12
    Top = 8
    Width = 115
    Height = 26
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1088#1072#1073#1086#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 12
    Top = 42
    Width = 115
    Height = 26
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1088#1072#1073#1086#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 12
    Top = 80
    Width = 68
    Height = 13
    Hint = #1041#1088#1080#1075#1072#1076#1080#1088', '#1079#1074#1077#1085#1100#1077#1074#1086#1081#13#10'('#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100' '#1088#1072#1073#1086#1090')'
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label6: TLabel
    Left = 12
    Top = 112
    Width = 100
    Height = 26
    Hint = #1041#1088#1080#1075#1072#1076#1080#1088', '#1079#1074#1077#1085#1100#1077#1074#1086#1081#13#10'('#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100' '#1088#1072#1073#1086#1090')'
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077'/'#13#10#1086#1090#1076#1077#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object sBitBtn1: TBitBtn
    Left = 494
    Top = 139
    Width = 75
    Height = 25
    Anchors = [akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Kind = bkOK
  end
  object DBLookupComboBoxDolj: TDBLookupComboBox
    Left = 113
    Top = 79
    Width = 683
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    KeyField = 'KEY'
    ListField = 'nm'
    ListSource = DataSourceDoljSPR
    TabOrder = 1
  end
  object DBLookupComboBoxPodr: TDBLookupComboBox
    Left = 113
    Top = 111
    Width = 683
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    KeyField = 'KEY'
    ListField = 'nm'
    ListSource = DataSourceOrgNM
    TabOrder = 2
  end
  object sBitBtn2: TBitBtn
    Left = 655
    Top = 139
    Width = 97
    Height = 25
    Anchors = [akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Kind = bkCancel
  end
  object DatePicker1: TDateTimePicker
    Left = 132
    Top = 10
    Width = 127
    Height = 21
    Date = 44097.649692511570000000
    Time = 44097.649692511570000000
    TabOrder = 4
  end
  object DatePicker2: TDateTimePicker
    Left = 134
    Top = 47
    Width = 127
    Height = 21
    Date = 44097.649692511570000000
    Time = 44097.649692511570000000
    TabOrder = 5
  end
  object TimePicker1: TDateTimePicker
    Left = 337
    Top = 19
    Width = 79
    Height = 21
    Date = 44097.649692511570000000
    Time = 44097.649692511570000000
    Kind = dtkTime
    TabOrder = 6
    Visible = False
  end
  object TimePicker2: TDateTimePicker
    Left = 336
    Top = 46
    Width = 79
    Height = 21
    Date = 44097.649692511570000000
    Time = 44097.649692511570000000
    Kind = dtkTime
    TabOrder = 7
    Visible = False
  end
  object qrOrgNM: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'WITH RECURSIVE TMP(id, parent, nm, path, level) AS ('
      
        '                                                    select o.id,' +
        ' o.parent, o.nm, cast(o.nm as varchar(100)) as path, 1'
      
        '                                                    from burnar.' +
        'org_stru o'
      
        '                                                    where o.pare' +
        'nt = 0'
      '                                                    union'
      
        '                                                    select o2.id' +
        ', o2.parent, o2.nm, cast(tmp.path||'#39', '#39'||o2.nm as varchar(100)),' +
        ' level+1'
      
        '                                                    from burnar.' +
        'org_stru o2, tmp '
      
        '                                                    where tmp.id' +
        '=o2.parent)'
      'select tmp.id as key, tmp.path nm'
      'from tmp'
      'where tmp.id in ('
      '                  WITH RECURSIVE TMP2 AS '
      '                  (                 '
      '                   select o.id'
      '                   from burnar.org_stru o'
      '                   where o.id = :PodrId'
      '                    union'
      '                    select o2.id'
      '                    from burnar.org_stru o2, tmp2 '
      '                    where tmp2.id = o2.parent'
      '                                         )'
      '                  select tmp2.id '
      '                  from tmp2'
      '                 )'
      'order by tmp.path')
    Left = 460
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PodrId'
      end>
  end
  object qrDoljSpr: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select s.key, s.nm from burnar.sprdoljnost s order by s.nm'
      '')
    Left = 548
    Top = 16
  end
  object DataSourceDoljSPR: TDataSource
    DataSet = ClientDataSetDoljSPR
    Left = 440
    Top = 128
  end
  object ClientDataSetDoljSPR: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvideDoljSPR'
    Left = 328
    Top = 128
  end
  object DataSetProvideDoljSPR: TDataSetProvider
    DataSet = qrDoljSpr
    Left = 208
    Top = 128
  end
  object DataSetProviderOrgNM: TDataSetProvider
    DataSet = qrOrgNM
    Left = 640
    Top = 8
  end
  object ClientDataSetOrgNM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderOrgNM'
    Left = 752
    Top = 8
  end
  object DataSourceOrgNM: TDataSource
    DataSet = ClientDataSetOrgNM
    Left = 680
    Top = 64
  end
end
