object frmSkvVipVar: TfrmSkvVipVar
  Left = 962
  Top = 202
  Width = 626
  Height = 707
  Caption = #1057#1082#1074#1086#1079#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' ('#1092#1072#1082#1090')'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 610
    Height = 558
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnEditButtonClick = DBGrid1EditButtonClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'defnar'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'prnum'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'parcode'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'nm'
        Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088
        Width = 188
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'znval'
        Visible = False
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'znnm'
        Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1086#1077
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'val'
        Title.Caption = #1063#1080#1089#1083#1086#1074#1086#1077
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valstr'
        Title.Caption = #1057#1090#1088#1086#1082#1086#1074#1086#1077
        Width = 175
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 623
    Width = 610
    Height = 45
    Align = alBottom
    TabOrder = 1
    object StatusBar1: TStatusBar
      Left = 1
      Top = 25
      Width = 608
      Height = 19
      Panels = <
        item
          Width = 50
        end>
    end
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 608
      Height = 29
      Caption = 'ToolBar1'
      Images = frmMain.ImageList1
      TabOrder = 1
      object ToolButton1: TToolButton
        Left = 0
        Top = 2
        Hint = #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
        Caption = 'ToolButton1'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = sSpeedButton9Click
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 2
        Hint = #1042#1077#1088#1085#1091#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1074' '#1080#1089#1093#1086#1076#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
        Caption = 'ToolButton2'
        ImageIndex = 16
        ParentShowHint = False
        ShowHint = True
        OnClick = sSpeedButton4Click
      end
      object ToolButton3: TToolButton
        Left = 46
        Top = 2
        Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1089#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1077
        Caption = 'ToolButton3'
        ImageIndex = 17
        ParentShowHint = False
        ShowHint = True
        OnClick = sSpeedButton3Click
      end
      object ToolButton4: TToolButton
        Left = 69
        Top = 2
        Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1077#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1077
        Caption = 'ToolButton4'
        ImageIndex = 18
        ParentShowHint = False
        ShowHint = True
        OnClick = sSpeedButton2Click
      end
      object ToolButton5: TToolButton
        Left = 92
        Top = 2
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1085#1072' '#1089#1077#1088#1074#1077#1088#1077
        Caption = 'ToolButton5'
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = sSpeedButton1Click
      end
      object EditFind: TEdit
        Left = 115
        Top = 2
        Width = 206
        Height = 22
        Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1090#1088#1086#1082#1091' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object ToolButton6: TToolButton
        Left = 321
        Top = 2
        Hint = #1053#1072#1095#1072#1090#1100' '#1087#1086#1080#1089#1082
        Caption = 'ToolButton6'
        ImageIndex = 26
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton8Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 610
    Height = 65
    Align = alTop
    TabOrder = 2
    object Label3: TLabel
      Left = 166
      Top = 17
      Width = 151
      Height = 13
      Hint = #1042#1088#1077#1084#1103', '#1082#1086#1075#1076#1072' '#1085#1072#1088#1103#1076'-'#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077' '#1073#1099#1083#1086' '
      Caption = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1086#1090' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      FocusControl = DBEdFactCLOSEDDATE
      ParentShowHint = False
      ShowHint = True
    end
    object Label2: TLabel
      Left = 5
      Top = 18
      Width = 140
      Height = 13
      Hint = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103' '#1076#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072' '#1088#1072#1073#1086#1090
      Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072' '#1088#1072#1073#1086#1090
      FocusControl = DBEdFACTBEGDATE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label1: TLabel
      Left = 338
      Top = 4
      Width = 114
      Height = 13
      Hint = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103' '#1076#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1088#1072#1073#1086#1090
      FocusControl = DBEdVIPENDDATE
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object DBChFactCLOSED: TDBCheckBox
      Left = 330
      Top = 44
      Width = 136
      Height = 13
      Caption = #1047#1072#1082#1088#1099#1090#1086' '#1086#1090' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      Color = clBtnFace
      Ctl3D = True
      DataField = 'CLOSED'
      DataSource = DataSource2
      ParentColor = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBEdVIPENDDATE: TDBEdit
      Left = 166
      Top = 38
      Width = 136
      Height = 21
      DataField = 'ENDDATE'
      DataSource = DataSource2
      Enabled = False
      TabOrder = 2
    end
    object DBEdFactCLOSEDDATE: TDBEdit
      Left = 165
      Top = 38
      Width = 152
      Height = 21
      DataField = 'CLOSEDDATE'
      DataSource = DataSource2
      Enabled = False
      TabOrder = 3
    end
    object DBEdFACTBEGDATE: TDBEdit
      Left = 6
      Top = 39
      Width = 152
      Height = 21
      DataField = 'BEGDATE'
      DataSource = DataSource2
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      OnEnter = DBEdFACTBEGDATEEnter
    end
    object ToolBar2: TToolBar
      Left = 473
      Top = 35
      Width = 60
      Height = 27
      Align = alCustom
      Caption = 'ToolBar2'
      EdgeBorders = []
      Images = frmMain.ImageList1
      TabOrder = 5
      object ToolButton7: TToolButton
        Left = 0
        Top = 2
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1085#1072' '#1089#1077#1088#1074#1077#1088#1077
        Caption = 'ToolButton7'
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = sSpeedButton15Click
      end
      object ToolButton9: TToolButton
        Left = 23
        Top = 2
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton8: TToolButton
        Left = 31
        Top = 2
        Hint = #1042#1077#1088#1085#1091#1090#1100' '#1087#1086#1083#1103' '#1074' '#1080#1089#1093#1086#1076#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
        Caption = 'ToolButton8'
        ImageIndex = 16
        ParentShowHint = False
        ShowHint = True
        OnClick = sSpeedButton14Click
      end
    end
    object MaskEdit1: TMaskEdit
      Left = 50
      Top = 2
      Width = 111
      Height = 21
      EditMask = '90\.90\.\2\000 !90:00:\0\0;1;_'
      MaxLength = 19
      TabOrder = 1
      Text = '  .  .20     :  :00'
      Visible = False
      OnExit = MaskEdit1Exit
    end
  end
  object qrParAndZnFact: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select zn.defnar,'
      '          zn.prnum,'
      '          zn.parcode, '
      '  (select public.getparnm(zn.parcode))::varchar(200) NM,'
      '  zn.znval,'
      
        '  (select p2.nm from public.common_spr p2 where p2.id = zn.znval' +
        ')::varchar(200) znnm,'
      '  zn.val,'
      '  zn.valstr'
      'from '
      '  burnar.zndefnarvipatrib zn'
      'where '
      '  zn.defnar = :nar --'#1085#1072#1088#1103#1076
      'order by zn.prnum'
      '')
    Left = 335
    Top = 169
    ParamData = <
      item
        DataType = ftString
        Name = 'nar'
        ParamType = ptInput
        Value = '1'
      end>
    object qrParAndZnFactdefnar: TIntegerField
      FieldName = 'defnar'
      Required = True
    end
    object qrParAndZnFactprnum: TFloatField
      FieldName = 'prnum'
      Required = True
    end
    object qrParAndZnFactparcode: TFloatField
      FieldName = 'parcode'
      Required = True
    end
    object qrParAndZnFactnm: TStringField
      FieldName = 'nm'
      Size = 200
    end
    object qrParAndZnFactznval: TFloatField
      FieldName = 'znval'
    end
    object qrParAndZnFactznnm: TStringField
      FieldName = 'znnm'
      Size = 200
    end
    object qrParAndZnFactval: TFloatField
      FieldName = 'val'
    end
    object qrParAndZnFactvalstr: TStringField
      FieldName = 'valstr'
      Size = 150
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterOpen = ClientDataSet1AfterOpen
    OnReconcileError = ClientDataSet1ReconcileError
    Left = 383
    Top = 137
    object ClientDataSet1defnar: TIntegerField
      FieldName = 'defnar'
      Required = True
    end
    object ClientDataSet1prnum: TFloatField
      FieldName = 'prnum'
      Required = True
    end
    object ClientDataSet1parcode: TFloatField
      FieldName = 'parcode'
      Required = True
    end
    object ClientDataSet1nm: TStringField
      FieldName = 'nm'
      Size = 200
    end
    object ClientDataSet1znval: TFloatField
      FieldName = 'znval'
    end
    object ClientDataSet1znnm: TStringField
      FieldName = 'znnm'
      Size = 200
    end
    object ClientDataSet1val: TFloatField
      FieldName = 'val'
    end
    object ClientDataSet1valstr: TStringField
      FieldName = 'valstr'
      Size = 150
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qrParAndZnFact
    Options = [poDisableInserts, poDisableDeletes]
    BeforeUpdateRecord = DataSetProvider1BeforeUpdateRecord
    Left = 455
    Top = 169
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 415
    Top = 225
  end
  object SQLQuery2: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select '
      '  z.narkey'
      '  ,z.begdate'
      '  ,z.enddate'
      '  ,z.closed'
      '  ,z.closeddate'
      'from '
      '  BURNAR.DEFNARVIP z'
      'where'
      '  z.narkey = :nar')
    Left = 32
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'nar'
        ParamType = ptInput
      end>
    object SQLQuery2narkey: TIntegerField
      FieldName = 'narkey'
      Required = True
    end
    object SQLQuery2begdate: TDateTimeField
      FieldName = 'begdate'
    end
    object SQLQuery2enddate: TDateTimeField
      FieldName = 'enddate'
    end
    object SQLQuery2closed: TFloatField
      FieldName = 'closed'
      Required = True
    end
    object SQLQuery2closeddate: TDateTimeField
      FieldName = 'closeddate'
    end
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = SQLQuery2
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 208
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'DataSetProvider2'
    OnReconcileError = ClientDataSet1ReconcileError
    Left = 128
    Top = 208
    object ClientDataSet2narkey: TIntegerField
      FieldName = 'narkey'
      Required = True
    end
    object ClientDataSet2begdate: TDateTimeField
      FieldName = 'begdate'
    end
    object ClientDataSet2enddate: TDateTimeField
      FieldName = 'enddate'
    end
    object ClientDataSet2closed: TFloatField
      FieldName = 'closed'
      Required = True
    end
    object ClientDataSet2closeddate: TDateTimeField
      FieldName = 'closeddate'
    end
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 160
    Top = 208
  end
  object SVIPOLNENIE_SET_DATE: TPgStoredProc
    StoredProcName = 'burnar.vipolnenie_Set_DATE'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'CALL burnar.vipolnenie_Set_DATE(:nkey)')
    Left = 408
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'nkey'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'burnar.vipolnenie_Set_DATE:0'
  end
end
