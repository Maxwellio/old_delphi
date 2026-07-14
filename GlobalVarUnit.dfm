object frmGlobalVar: TfrmGlobalVar
  Left = 837
  Top = 292
  Width = 709
  Height = 811
  Anchors = [akRight, akBottom]
  Caption = #1058#1077#1093#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1081' '#1085#1072#1088#1103#1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    }
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 16
    Top = 14
    Width = 88
    Height = 13
    Hint = #1054#1089#1085#1086#1074#1085#1086#1081' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100' '#1088#1072#1073#1086#1090
    Caption = #1042#1083#1072#1076#1077#1083#1077#1094' '#1085#1072#1088#1103#1076#1072
    FocusControl = dbedOWNERNARNM
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 46
    Width = 132
    Height = 13
    Hint = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1074' '#1089#1080#1089#1090#1077#1084#1077','#13#10#1079#1072#1076#1072#1077#1090#1089#1103' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
    Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1074' '#1089#1080#1089#1090#1077#1084#1077
    FocusControl = DBEdCREATEDATE
    ParentShowHint = False
    ShowHint = True
  end
  object Label5: TLabel
    Left = 16
    Top = 78
    Width = 50
    Height = 13
    Hint = #1041#1088#1080#1075#1072#1076#1080#1088', '#1079#1074#1077#1085#1100#1077#1074#1086#1081#13#10'('#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100' '#1088#1072#1073#1086#1090')'
    Caption = #1052#1072#1089#1090#1077#1088'('#1072')'
    FocusControl = DBEdit5
    ParentShowHint = False
    ShowHint = True
  end
  object Label7: TLabel
    Left = 16
    Top = 106
    Width = 124
    Height = 13
    Hint = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1089#1080#1089#1090#1077#1084#1099','#13#10#1089#1086#1079#1076#1072#1074#1096#1080#1081' '#1085#1072#1088#1103#1076', '#1079#1072#1076#1072#1077#1090#1089#1103#13#10#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
    Caption = #1040#1074#1090#1086#1088' '#1085#1072#1088#1103#1076#1072' '#1074' '#1089#1080#1089#1090#1077#1084#1077
    FocusControl = DBEdNARAUTHORNM
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label9: TLabel
    Left = 16
    Top = 136
    Width = 74
    Height = 13
    Caption = #1064#1080#1092#1088' '#1086#1073#1098#1077#1082#1090#1072
    FocusControl = DBEdSHIFR
  end
  object Label10: TLabel
    Left = 16
    Top = 165
    Width = 58
    Height = 13
    Hint = #1058#1080#1087' '#1085#1072#1088#1103#1076#1072', '#1079#1072#1076#1072#1077#1090#1089#1103#13#10#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1087#1088#1080' '#1089#1086#1079#1076#1072#1085#1080#1080
    Caption = #1058#1080#1087' '#1085#1072#1088#1103#1076#1072
    FocusControl = DBEdNARTYPENM
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label11: TLabel
    Left = 16
    Top = 200
    Width = 115
    Height = 13
    Hint = #1059#1076#1086#1073#1085#1086#1077' '#1076#1083#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103#13#10#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1085#1072#1088#1103#1076#1072
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1085#1072#1088#1103#1076#1072
    FocusControl = DBEdNarNM
  end
  object dbedOWNERNARNM: TDBEdit
    Left = 155
    Top = 11
    Width = 302
    Height = 21
    Ctl3D = True
    DataField = 'OWNERNARNM'
    DataSource = DataSourceOper
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 483
    Top = 10
    Width = 50
    Height = 21
    Ctl3D = True
    DataField = 'OWNERNAR'
    DataSource = DataSourceOper
    Enabled = False
    ParentCtl3D = False
    TabOrder = 1
    Visible = False
  end
  object DBEdCREATEDATE: TDBEdit
    Left = 155
    Top = 43
    Width = 302
    Height = 21
    Ctl3D = True
    DataField = 'CREATEDATE'
    DataSource = DataSourceOper
    Enabled = False
    ParentCtl3D = False
    TabOrder = 2
  end
  object DBEdBRIGADIRNM: TDBEdit
    Left = 155
    Top = 75
    Width = 302
    Height = 21
    Ctl3D = True
    DataField = 'NAMEMASTER'
    DataSource = DataSourceOper
    Enabled = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 483
    Top = 75
    Width = 49
    Height = 21
    Ctl3D = True
    DataField = 'BRIGADIR'
    DataSource = DataSourceOper
    Enabled = False
    ParentCtl3D = False
    TabOrder = 4
    Visible = False
  end
  object DBEdNARAUTHORNM: TDBEdit
    Left = 155
    Top = 103
    Width = 302
    Height = 21
    Ctl3D = True
    DataField = 'NARAUTHORNM'
    DataSource = DataSourceOper
    Enabled = False
    ParentCtl3D = False
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 483
    Top = 103
    Width = 50
    Height = 21
    Ctl3D = True
    DataField = 'NARAUTHOR'
    DataSource = DataSourceOper
    Enabled = False
    ParentCtl3D = False
    TabOrder = 6
    Visible = False
  end
  object DBEdSHIFR: TDBEdit
    Left = 155
    Top = 133
    Width = 302
    Height = 21
    Ctl3D = True
    DataField = 'SHIFR'
    DataSource = DataSourceOper
    ParentCtl3D = False
    TabOrder = 7
  end
  object DBEdNARTYPENM: TDBEdit
    Left = 155
    Top = 165
    Width = 302
    Height = 21
    Ctl3D = True
    DataField = 'NARTYPENM'
    DataSource = DataSourceOper
    Enabled = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 8
  end
  object DBEdit8: TDBEdit
    Left = 483
    Top = 165
    Width = 50
    Height = 21
    Ctl3D = True
    DataField = 'NARTYPE'
    DataSource = DataSourceOper
    Enabled = False
    ParentCtl3D = False
    TabOrder = 9
    Visible = False
  end
  object DBEdNarNM: TDBEdit
    Left = 155
    Top = 197
    Width = 302
    Height = 21
    Ctl3D = True
    DataField = 'NM'
    DataSource = DataSourceOper
    ParentCtl3D = False
    TabOrder = 10
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 753
    Width = 693
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object ToolBar2: TToolBar
    Left = 485
    Top = 195
    Width = 81
    Height = 24
    Align = alCustom
    Caption = 'ToolBar2'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Images = frmMain.ImageList1
    TabOrder = 12
    object ToolButton9: TToolButton
      Left = 0
      Top = 2
      Hint = #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = 'ToolButton9'
      ImageIndex = 19
      ParentShowHint = False
      ShowHint = True
      OnClick = sSpeedButton10Click
    end
    object ToolButton10: TToolButton
      Left = 23
      Top = 2
      Hint = #1042#1077#1088#1085#1091#1090#1100' '#1087#1086#1083#1103' '#1074' '#1080#1089#1093#1086#1076#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
      Caption = 'ToolButton10'
      ImageIndex = 16
      ParentShowHint = False
      ShowHint = True
      OnClick = sSpeedButton11Click
    end
    object ToolButton11: TToolButton
      Left = 46
      Top = 2
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1085#1072' '#1089#1077#1088#1074#1077#1088#1077
      Caption = 'ToolButton11'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = sSpeedButton12Click
    end
  end
  object BitBtn1: TBitBtn
    Left = 457
    Top = 9
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 13
    OnClick = Button1Click
  end
  object BitBtn2: TBitBtn
    Left = 457
    Top = 74
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 14
    OnClick = Button4Click
  end
  object gbProhodka: TGroupBox
    Left = 0
    Top = 542
    Width = 693
    Height = 211
    Align = alBottom
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1083#1103' '#1086#1090#1095#1077#1090#1072' "'#1056#1072#1089#1095#1077#1090' '#1087#1088#1080#1074#1077#1076#1077#1085#1085#1086#1081' '#1087#1088#1086#1093#1086#1076#1082#1080
    TabOrder = 15
    object ClbxType: TCheckListBox
      Left = 2
      Top = 15
      Width = 343
      Height = 194
      OnClickCheck = ClbxTypeClickCheck
      Align = alLeft
      Color = clWhite
      ItemHeight = 13
      Items.Strings = (
        '1'
        '2'
        '3')
      TabOrder = 0
    end
    object ClbxPar: TCheckListBox
      Left = 345
      Top = 15
      Width = 304
      Height = 194
      Align = alLeft
      Color = clWhite
      ItemHeight = 13
      TabOrder = 1
    end
    object ToolBar3: TToolBar
      Left = 658
      Top = 16
      Width = 25
      Height = 24
      Align = alCustom
      Caption = 'ToolBar2'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = frmMain.ImageList1
      TabOrder = 2
      object ToolButton12: TToolButton
        Left = 0
        Top = 2
        Hint = #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
        Caption = 'ToolButton9'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton12Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 224
    Width = 692
    Height = 313
    Align = alCustom
    Caption = 'Panel2'
    TabOrder = 16
    object Panel1: TPanel
      Left = 1
      Top = 284
      Width = 690
      Height = 28
      Align = alBottom
      Caption = 'Panel1'
      TabOrder = 0
      object ToolBar1: TToolBar
        Left = 90
        Top = 1
        Width = 599
        Height = 26
        Align = alRight
        ButtonWidth = 27
        Caption = 'ToolBar1'
        Customizable = True
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        EdgeInner = esNone
        EdgeOuter = esNone
        Images = frmMain.ImageList1
        TabOrder = 0
        object EditFind: TEdit
          Left = 0
          Top = 2
          Width = 176
          Height = 22
          TabOrder = 0
        end
        object ToolButton3: TToolButton
          Left = 176
          Top = 2
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object ToolButton4: TToolButton
          Left = 184
          Top = 2
          Hint = #1053#1072#1095#1072#1090#1100' '#1087#1086#1080#1089#1082
          Caption = 'ToolButton4'
          ImageIndex = 26
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton8Click
        end
        object ToolButton2: TToolButton
          Left = 211
          Top = 2
          Width = 126
          Caption = 'ToolButton2'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton1: TToolButton
          Left = 337
          Top = 2
          Hint = #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
          Caption = 'ToolButton1'
          ImageIndex = 19
          ParentShowHint = False
          ShowHint = True
          OnClick = sSpeedButton9Click
        end
        object ToolButton5: TToolButton
          Left = 364
          Top = 2
          Hint = #1042#1077#1088#1085#1091#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1074' '#1080#1089#1093#1086#1076#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
          Caption = 'ToolButton5'
          ImageIndex = 16
          ParentShowHint = False
          ShowHint = True
          OnClick = sSpeedButton4Click
        end
        object ToolButton6: TToolButton
          Left = 391
          Top = 2
          Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1089#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1077
          Caption = 'ToolButton6'
          ImageIndex = 17
          ParentShowHint = False
          ShowHint = True
          OnClick = sSpeedButton3Click
        end
        object ToolButton7: TToolButton
          Left = 418
          Top = 2
          Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1077#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1077
          Caption = 'ToolButton7'
          ImageIndex = 18
          ParentShowHint = False
          ShowHint = True
          OnClick = sSpeedButton2Click
        end
        object ToolButton8: TToolButton
          Left = 445
          Top = 2
          Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1085#1072' '#1089#1077#1088#1074#1077#1088#1077
          Caption = 'ToolButton8'
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          OnClick = sSpeedButton1Click
        end
      end
      object btnFindSKV: TButton
        Left = 8
        Top = 2
        Width = 75
        Height = 25
        Caption = #1055#1086#1080#1089#1082' '#1089#1082#1074'.'
        TabOrder = 1
        OnClick = btnFindSKVClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 690
      Height = 283
      Align = alClient
      DataSource = DataSource1
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnEditButtonClick = DBGrid1EditButtonClick
      OnKeyPress = DBGrid1KeyPress
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
  end
  object SQLQueryKOD: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select t.key::integer'
      '       ,t.ownernar::integer'
      '                '
      '       ,(WITH RECURSIVE TMP AS ('
      
        '                                select o.id, o.parent, o.nm, cas' +
        't(o.nm as varchar(100)) as path'
      '                                from burnar.org_stru o'
      '                                where o.parent = 0'
      '                                union all'
      
        '                                select o2.id, o2.parent, o2.nm, ' +
        'cast(tmp.path||'#39', '#39'||o2.nm as varchar(100))'
      '                                from burnar.org_stru o2, tmp '
      '                                where tmp.id=o2.parent)'
      '        select tmp.path '
      '        from tmp'
      '        where tmp.id = w.org            '
      '        )::varchar(300)  as ownernarnm     '
      ''
      '       ,t.createdate::timestamp without time zone'
      '       ,t.brigadir::integer'
      
        '       ,(select p.fio from burnar.people p where p.id = t.brigad' +
        'ir) brigadirnm'
      '       ,t.narauthor::integer'
      '       ,u.ora_name narauthornm'
      '       ,t.nartype::integer'
      '       ,ntype.ops nartypenm'
      '       ,t.shifr'
      '       ,t.nm'
      '       ,burnar.getmasters(t.key)::varchar(200) as namemaster'
      '       ,w.boss::integer'
      
        '       ,cast ((coalesce(z.closed, 0) +  coalesce(v.closed, 0))as' +
        ' integer) as IsClosed'
      '  from burnar.defnar      t'
      '       left join burnar.defnarvip v on (t.key=v.narkey) '
      '       ,burnar.spr_workers w'
      '       ,burnar.users       u'
      '       ,burnar.sprnartype  ntype'
      '       ,burnar.defnarzad z         '
      '       '
      ' where t.key = :nar'
      '       and t.ownernar = w.key'
      '       and t.narauthor = u.users_id'
      '       and t.nartype = ntype.key'
      '       and t.key = z.narkey')
    Left = 544
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'nar'
        ParamType = ptInput
      end>
    object SQLQueryKODkey: TIntegerField
      FieldName = 'key'
      Required = True
    end
    object SQLQueryKODownernar: TIntegerField
      FieldName = 'ownernar'
      Required = True
    end
    object SQLQueryKODownernarnm: TStringField
      FieldName = 'ownernarnm'
      Size = 300
    end
    object SQLQueryKODcreatedate: TDateTimeField
      FieldName = 'createdate'
      Required = True
    end
    object SQLQueryKODbrigadir: TIntegerField
      FieldName = 'brigadir'
    end
    object SQLQueryKODbrigadirnm: TStringField
      FieldName = 'brigadirnm'
      Size = 255
    end
    object SQLQueryKODnarauthor: TIntegerField
      FieldName = 'narauthor'
      Required = True
    end
    object SQLQueryKODnarauthornm: TStringField
      FieldName = 'narauthornm'
      Required = True
      Size = 100
    end
    object SQLQueryKODnartype: TIntegerField
      FieldName = 'nartype'
      Required = True
    end
    object SQLQueryKODnartypenm: TStringField
      FieldName = 'nartypenm'
      Size = 50
    end
    object SQLQueryKODshifr: TStringField
      FieldName = 'shifr'
    end
    object SQLQueryKODnm: TStringField
      FieldName = 'nm'
      Size = 50
    end
    object SQLQueryKODboss: TIntegerField
      FieldName = 'boss'
      Required = True
    end
    object SQLQueryKODisclosed: TIntegerField
      FieldName = 'isclosed'
    end
    object SQLQueryKODnamemaster: TStringField
      FieldName = 'namemaster'
      Size = 200
    end
  end
  object DataSetProviderOper: TDataSetProvider
    DataSet = SQLQueryKOD
    UpdateMode = upWhereKeyOnly
    Left = 616
    Top = 40
  end
  object cdsOper: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'DataSetProviderOper'
    OnReconcileError = ClientDataSet1ReconcileError
    Left = 552
    Top = 96
    object cdsOperkey: TIntegerField
      FieldName = 'key'
      Required = True
    end
    object cdsOperownernar: TIntegerField
      FieldName = 'ownernar'
      Required = True
    end
    object cdsOperownernarnm: TStringField
      FieldName = 'ownernarnm'
      Size = 300
    end
    object cdsOpercreatedate: TDateTimeField
      FieldName = 'createdate'
      Required = True
    end
    object cdsOperbrigadir: TIntegerField
      FieldName = 'brigadir'
    end
    object cdsOperbrigadirnm: TStringField
      FieldName = 'brigadirnm'
      Size = 255
    end
    object cdsOpernarauthor: TIntegerField
      FieldName = 'narauthor'
      Required = True
    end
    object cdsOpernarauthornm: TStringField
      FieldName = 'narauthornm'
      Required = True
      Size = 100
    end
    object cdsOpernartype: TIntegerField
      FieldName = 'nartype'
      Required = True
    end
    object cdsOpernartypenm: TStringField
      FieldName = 'nartypenm'
      Size = 50
    end
    object cdsOpershifr: TStringField
      FieldName = 'shifr'
    end
    object cdsOpernm: TStringField
      FieldName = 'nm'
      Size = 50
    end
    object cdsOperboss: TIntegerField
      FieldName = 'boss'
      Required = True
    end
    object cdsOperisclosed: TIntegerField
      FieldName = 'isclosed'
    end
    object cdsOpernamemaster: TStringField
      FieldName = 'namemaster'
      Size = 200
    end
  end
  object DataSourceOper: TDataSource
    DataSet = cdsOper
    Left = 624
    Top = 97
  end
  object qrParamAndZn: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select '
      '  zn.defnar,'
      '  zn.prnum,'
      '  zn.parcode, '
      '  getparnm(zn.parcode)::varchar(150) as NM,'
      '  zn.znval,'
      '  (select p2.nm from common_spr p2 where p2.id = zn.znval) znnm,'
      '  zn.val,'
      '  zn.valstr'
      'from '
      '  burnar.znparams zn'
      'where '
      '  zn.defnar = :nar --'#1085#1072#1088#1103#1076
      'order by zn.prnum')
    Left = 39
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'nar'
        ParamType = ptInput
        Value = '1'
      end>
    object qrParamAndZndefnar: TIntegerField
      FieldName = 'defnar'
      Required = True
    end
    object qrParamAndZnprnum: TFloatField
      FieldName = 'prnum'
      Required = True
    end
    object qrParamAndZnparcode: TFloatField
      FieldName = 'parcode'
      Required = True
    end
    object qrParamAndZnnm: TStringField
      FieldName = 'nm'
      Size = 150
    end
    object qrParamAndZnznval: TFloatField
      FieldName = 'znval'
    end
    object qrParamAndZnznnm: TStringField
      FieldName = 'znnm'
      Size = 300
    end
    object qrParamAndZnval: TFloatField
      FieldName = 'val'
    end
    object qrParamAndZnvalstr: TStringField
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
    Left = 143
    Top = 377
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
      Size = 150
    end
    object ClientDataSet1znval: TFloatField
      FieldName = 'znval'
    end
    object ClientDataSet1znnm: TStringField
      FieldName = 'znnm'
      Size = 300
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
    DataSet = qrParamAndZn
    Options = [poDisableInserts, poDisableDeletes]
    BeforeUpdateRecord = DataSetProvider1BeforeUpdateRecord
    Left = 143
    Top = 327
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 143
    Top = 433
  end
  object OraDataSource1: TPgDataSource
    DataSet = ClientDataSet1
    Left = 240
    Top = 432
  end
  object qryEdit: TPgQuery
    Connection = frmMain.MConnection
    Left = 176
    Top = 608
  end
end
