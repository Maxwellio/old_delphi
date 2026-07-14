object frmNarList: TfrmNarList
  Left = 0
  Top = 123
  Width = 1024
  Height = 684
  Caption = #1057#1087#1080#1089#1086#1082' '#1085#1072#1088#1103#1076#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    }
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 456
    Top = 5
    Width = 16
    Height = 16
    AutoSize = True
    Picture.Data = {
      }
    Transparent = True
    Visible = False
  end
  object Image2: TImage
    Left = 435
    Top = 5
    Width = 16
    Height = 16
    AutoSize = True
    Picture.Data = {
      }
    Transparent = True
    Visible = False
  end
  object Splitter1: TSplitter
    Left = 0
    Top = 30
    Width = 1
    Height = 596
  end
  object grdDefNarList: TOVNIDbGrid
    Left = 201
    Top = 30
    Width = 807
    Height = 596
    Align = alClient
    Ctl3D = False
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goColMoving, goRowSelect]
    ColCount = 8
    RowCount = 2
    OnDblClick = grdDefNarListDblClick
    OnKeyDown = grdDefNarListDeleteNars
    AutoSizeRowsHeight = True
    FixRowsAutoNum = True
    MinRowHeight = 20
    EditedFields.Strings = (
      '')
    NumberFormat = '%-10.0f'
    CellSelectColor = clSkyBlue
    SelectCurCol = False
    SelectCurRowColor = clSkyBlue
    SelectCurColColor = clSkyBlue
    ColorRowSplit = True
    OnTitleClick = grdDefNarListTitleClick
    CellSelectColorFont = clBlack
    ColWidths = (
      64
      40
      173
      129
      112
      83
      72
      64)
    RowHeights = (
      20
      16)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 30
    Align = alTop
    TabOrder = 1
    object Label11: TLabel
      Left = 5
      Top = 7
      Width = 64
      Height = 13
      Caption = #1057#1090#1088#1091#1082#1090'.'#1087#1086#1076#1088'.'
    end
    object CbxStruct: TComboBox
      Left = 71
      Top = 4
      Width = 124
      Height = 21
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 0
      OnChange = CbxStructChange
    end
    object ToolBar1: TToolBar
      Left = 201
      Top = 1
      Width = 184
      Height = 29
      Align = alCustom
      Caption = 'ToolBar1'
      Images = frmMain.ImageList1
      TabOrder = 1
      object ToolButton1: TToolButton
        Left = 0
        Top = 2
        Hint = #1064#1080#1088#1080#1085#1099' '#1082#1086#1083#1086#1085#1086#1082' '#1087#1086' '#1076#1083#1080#1085#1077' '#1090#1077#1082#1089#1090#1072
        Caption = 'ToolButton1'
        ImageIndex = 9
        ParentShowHint = False
        ShowHint = True
        OnClick = sSpeedButton2Click
      end
      object ToolButton6: TToolButton
        Left = 23
        Top = 2
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 31
        Top = 2
        Hint = #1057#1086#1079#1076#1072#1090#1100' '#1082#1086#1087#1080#1102' '#1085#1072#1088#1103#1076#1072
        Caption = 'ToolButton2'
        ImageIndex = 44
        OnClick = CreateCopyNar
      end
      object ToolButton7: TToolButton
        Left = 54
        Top = 2
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 62
        Top = 2
        Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1085#1072#1088#1103#1076#1072' '#1074' '#1090#1077#1089#1090#1086#1074#1091#1102' '#1041#1044
        Caption = 'ToolButton3'
        ImageIndex = 24
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = sSpeedButton4Click
      end
      object ToolButton8: TToolButton
        Left = 85
        Top = 2
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 93
        Top = 2
        Hint = #1054#1073#1085#1086#1074#1080#1090#1100
        Caption = 'ToolButton4'
        ImageIndex = 12
        OnClick = sSpeedButton5Click
      end
      object ToolButton9: TToolButton
        Left = 116
        Top = 2
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 124
        Top = 2
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1085#1072#1088#1103#1076#1099
        Caption = 'ToolButton5'
        ImageIndex = 15
        OnClick = DeleteNars
      end
    end
  end
  object Panel2: TPanel
    Left = 1
    Top = 30
    Width = 200
    Height = 596
    Align = alLeft
    TabOrder = 2
    DesignSize = (
      200
      596)
    object Label5: TLabel
      Left = 6
      Top = 340
      Width = 43
      Height = 13
      Caption = #1050#1086#1076'.'#1085#1072#1088'.'
    end
    object Label1: TLabel
      Left = 6
      Top = 362
      Width = 42
      Height = 13
      Caption = #1041#1088#1080#1075#1072#1076#1072
    end
    object Label3: TLabel
      Left = 6
      Top = 384
      Width = 38
      Height = 13
      Caption = #1052#1072#1089#1090#1077#1088
    end
    object Label4: TLabel
      Left = 6
      Top = 405
      Width = 43
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085'.'
    end
    object Label6: TLabel
      Left = 6
      Top = 428
      Width = 36
      Height = 13
      Caption = #1057#1082#1074#1072#1078'.'
    end
    object Label8: TLabel
      Left = 6
      Top = 449
      Width = 23
      Height = 13
      Caption = #1050#1091#1089#1090
    end
    object Label9: TLabel
      Left = 6
      Top = 471
      Width = 41
      Height = 13
      Caption = #1052#1077#1089#1090#1086#1088'.'
    end
    object TreeView1: TTreeView
      Left = 4
      Top = 111
      Width = 190
      Height = 218
      HideSelection = False
      Indent = 19
      ReadOnly = True
      TabOrder = 0
      OnClick = TreeView1Click
      OnKeyUp = TreeView1KeyUp
      Items.Data = {
        010000001A0000000000000000000000FFFFFFFFFFFFFFFF0000000003000000
        01311A0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000132
        1A0000000000000000000000FFFFFFFFFFFFFFFF000000000000000001341A00
        00000000000000000000FFFFFFFFFFFFFFFF00000000000000000134}
    end
    object rgDate: TRadioGroup
      Left = 3
      Top = 4
      Width = 190
      Height = 105
      Caption = #1054#1090#1073#1086#1088' '#1087#1086' '#1076#1072#1090#1072#1084
      Items.Strings = (
        #1057#1086#1079#1076#1072#1085#1080#1077' '#1085#1072#1088#1103#1076#1072
        #1055#1083#1072#1085'. '#1085#1072#1095#1072#1083#1086' '#1073#1091#1088#1077#1085#1080#1103
        #1053#1072#1095#1072#1083#1086' '#1073#1091#1088#1077#1085#1080#1103
        #1059#1095#1077#1090#1085#1099#1077' '#1087#1077#1088#1080#1086#1076#1099
        #1047#1072#1082#1088#1099#1090#1080#1077' '#1085#1072#1088#1103#1076#1072)
      TabOrder = 1
      OnClick = rgDateClick
    end
    object EdCodNar: TEdit
      Left = 52
      Top = 336
      Width = 142
      Height = 21
      TabOrder = 2
      OnChange = EdCodNarChange
      OnExit = EdCodNarExit
    end
    object EdOwner: TEdit
      Left = 52
      Top = 358
      Width = 142
      Height = 21
      TabOrder = 3
      OnChange = EdOwnerChange
      OnExit = EdOwnerExit
    end
    object EdMaster: TEdit
      Left = 52
      Top = 380
      Width = 142
      Height = 21
      TabOrder = 4
      OnChange = EdMasterChange
      OnExit = EdMasterExit
    end
    object EdNameNar: TEdit
      Left = 52
      Top = 402
      Width = 142
      Height = 21
      TabOrder = 5
      OnChange = EdNameNarChange
      OnExit = EdNameNarExit
    end
    object edSkv: TEdit
      Left = 52
      Top = 424
      Width = 142
      Height = 21
      TabOrder = 6
      OnChange = edSkvChange
      OnExit = edSkvExit
    end
    object edKust: TEdit
      Left = 52
      Top = 446
      Width = 142
      Height = 21
      TabOrder = 7
      OnChange = edKustChange
      OnExit = edKustExit
    end
    object edMest: TEdit
      Left = 52
      Top = 468
      Width = 142
      Height = 21
      TabOrder = 8
      OnChange = edMestChange
      OnExit = edMestExit
    end
    object BitBtn2: TBitBtn
      Left = 6
      Top = 511
      Width = 77
      Height = 25
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1102
      Anchors = [akTop]
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 9
      OnClick = BitBtn2Click
      Glyph.Data = {
        }
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 90
      Top = 511
      Width = 97
      Height = 25
      Hint = #1057#1073#1088#1086#1089#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080
      Anchors = [akTop]
      Cancel = True
      Caption = #1057#1073#1088#1086#1089
      TabOrder = 10
      OnClick = BitBtn1Click
      Glyph.Data = {
        }
      NumGlyphs = 2
    end
    object BtnOpenNar: TBitBtn
      Left = 88
      Top = 544
      Width = 97
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100
      TabOrder = 11
      OnClick = BitBtn3Click
      Glyph.Data = {
        }
      NumGlyphs = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 626
    Width = 1008
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object ActionList1: TActionList
    Images = frmMain.ImageList1
    OnUpdate = ActionList1Update
    Left = 736
    Top = 456
    object actFindWord: TAction
      Category = 'cmdPanel'
      Hint = #1055#1086#1080#1089#1082' '#1089#1090#1088#1086#1082#1080
      ImageIndex = 26
      ShortCut = 16454
    end
    object actAutoWidthCols: TAction
      Category = 'cmdPanel'
      Hint = #1064#1080#1088#1080#1085#1099' '#1082#1086#1083#1086#1085#1086#1082' '#1087#1086' '#1076#1083#1080#1085#1077' '#1090#1077#1082#1089#1090#1072
      ImageIndex = 9
      ShortCut = 16460
      OnExecute = sSpeedButton2Click
    end
    object actDelNars: TAction
      Category = 'cmdPanel'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1085#1072#1088#1103#1076#1099
      ImageIndex = 15
      OnExecute = DeleteNars
    end
    object actCopyNar: TAction
      Category = 'cmdPanel'
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1082#1086#1087#1080#1102' '#1085#1072#1088#1103#1076#1072
      ImageIndex = 44
      ShortCut = 16451
      OnExecute = CreateCopyNar
    end
    object asCopyToTest: TAction
      Category = 'cmdPanel'
      ImageIndex = 24
      OnExecute = sSpeedButton4Click
    end
    object actFirstRec: TAction
      Category = 'cmdPanel'
      Caption = '|<'
      Hint = #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
      OnExecute = sBtnFirstRecClick
    end
    object actPrevRec: TAction
      Category = 'cmdPanel'
      Caption = '<'
      Hint = #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
      OnExecute = sBtnPrevRecClick
    end
    object actNextRec: TAction
      Category = 'cmdPanel'
      Caption = '>'
      Hint = #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
      OnExecute = SBtnNextRecClick
    end
    object actLastRec: TAction
      Category = 'cmdPanel'
      Caption = '>|'
      Hint = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
      OnExecute = SBtnLastRecClick
    end
    object actOpenNar: TAction
      Category = 'cmdPanel'
      Caption = #1054#1090#1082#1088#1099#1090#1100
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1085#1072#1088#1103#1076
      OnExecute = BtnOpenNarClick
    end
  end
  object QryLoad: TPgQuery
    Connection = frmMain.MConnection
    Left = 688
    Top = 168
  end
  object qrDefNarList: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select '
      '  d.key "'#1050#1086#1076' '#1085#1072#1088#1103#1076#1072'"'
      '  ,d.ownernar  '
      '  ,d.nartype'
      '  ,d.nm "'#1053#1072#1079#1074#1072#1085#1080#1077'"'
      '  ,(select'
      
        '   ltrim(SYS_CONNECT_BY_PATH( replace(o.nm, '#39','#39'), '#39', '#39'), '#39', '#39') n' +
        'm'
      '   from burnar.org_stru o where o.id=s.org start with o.parent=0'
      '   connect by prior o.id=o.parent) "'#1042#1083#1072#1076#1077#1083#1077#1094' '#1085#1072#1088#1103#1076#1072'"'
      '  ,d.createdate "'#1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1074' '#1089#1080#1089#1090#1077#1084#1077'"'
      ',burnar.getmasters(key) "'#1052#1072#1089#1090#1077#1088'"'
      '-- ,p1.fioreports "'#1052#1072#1089#1090#1077#1088'"'
      '  ,u.ora_name "'#1040#1074#1090#1086#1088' '#1085#1072#1088#1103#1076#1072'"'
      '  ,d.shifr "'#1064#1080#1092#1088'"'
      
        '  ,case when  (select z.closed from defnarzad z where d.key=z.na' +
        'rkey)=1 then '#39'1'#39
      
        '        when  (select z.closed from defnarzad z where d.key=z.na' +
        'rkey)=0 then '#39'0'#39
      '  else null end "'#1047#1072#1076#1072#1085#1080#1077'"'
      
        '  ,case when  (select z.closed from defnarvip z where d.key=z.na' +
        'rkey)=1 then '#39'1'#39
      
        '        when  (select z.closed from defnarvip z where d.key=z.na' +
        'rkey)=0 then '#39'0'#39
      '  else null end "'#1042#1099#1087#1086#1083#1085#1077#1085#1080#1077'" '
      
        'from burnar.defnar d, burnar.spr_workers s, burnar.people p1, bu' +
        'rnar.users u, burnar.org_stru o'
      '  ,(--'#1074#1089#1077' '#1083#1102#1076#1080' '#1074' '#1086#1088#1075' '#1077#1076#1080#1085#1080#1094#1077' '#1085#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1086#1084#1077#1085#1090
      '    select ds.org,k.idpeople'
      '    from burnar.karjera k, burnar.doljtostruct ds'
      '    where'
      '      k.dtenter <= Sysdate'
      '      and k.dtout >= Sysdate'
      '      and ds.key = k.doljinstru'
      '   ) userstru   '
      'where '
      
        '  d.nartype>=decode(:nartype1,null,(select min(nartype)from burn' +
        'ar.defnar),:nartype11) '
      
        '  and d.nartype<=decode(:nartype2,null,(select max(nartype)from ' +
        'burnar.defnar),:nartype22)'
      
        '  and d.createdate>=to_date(decode(:createdate1,'#39#39','#39'01.01.1800'#39',' +
        ':createdate11),'#39'dd.mm.yyyy'#39')'
      
        '  and d.createdate<=to_date(decode(:createdate2,'#39#39','#39'01.01.4000'#39',' +
        ':createdate22),'#39'dd.mm.yyyy'#39')'
      '  and d.ownernar=s.key '
      '  and d.brigadir=p1.id(+) '
      '  and d.narauthor=u.users_id'
      '  and o.id(+)=s.org'
      
        '  and u.people_id=userstru.idpeople(+) --'#1087#1086#1076#1082#1083#1102#1095#1072#1077#1084' '#1083#1102#1076#1077#1081' '#1089' '#1087#1088#1080#1085 +
        #1072#1076#1083#1077#1078#1085#1086#1089#1090#1100#1102' '#1082' '#1089#1090#1088#1091#1082#1090#1091#1088#1082#1077' '#1085#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1086#1084#1077#1085#1090
      '  and userstru.org in --'#1087#1086#1076#1082#1083#1102#1095#1072#1077#1084' "'#1087#1088#1072#1074#1080#1083#1072' '#1076#1086#1089#1090#1091#1087#1072'"'
      '  (select c.id from burnar.org_stru c '
      '    start with c.id='
      '    ('
      '    select ds.org'
      
        '      from burnar.karjera k, burnar.doljtostruct ds, burnar.user' +
        's u'
      '     where upper(u.ora_name) = upper(:usr)'
      '       and k.idpeople = u.people_id'
      '       and k.dtenter <= Sysdate'
      '       and k.dtout >= Sysdate'
      '       and ds.key = k.doljinstru'
      '    )'
      '   connect by prior c.id=c.sysboss)')
    Left = 704
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nartype1'
      end
      item
        DataType = ftUnknown
        Name = 'nartype11'
      end
      item
        DataType = ftUnknown
        Name = 'nartype2'
      end
      item
        DataType = ftUnknown
        Name = 'nartype22'
      end
      item
        DataType = ftUnknown
        Name = 'createdate1'
      end
      item
        DataType = ftUnknown
        Name = 'createdate11'
      end
      item
        DataType = ftUnknown
        Name = 'createdate2'
      end
      item
        DataType = ftUnknown
        Name = 'createdate22'
      end
      item
        DataType = ftUnknown
        Name = 'usr'
      end>
  end
  object SQLQuery1: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select '
      '  d.key "'#1050#1086#1076' '#1085#1072#1088#1103#1076#1072'"'
      '  ,d.ownernar  '
      '  ,d.nartype'
      '  ,d.nm "'#1053#1072#1079#1074#1072#1085#1080#1077'"'
      '  ,(select'
      
        '   ltrim(SYS_CONNECT_BY_PATH( replace(o.nm, '#39','#39'), '#39', '#39'), '#39', '#39') n' +
        'm'
      '   from burnar.org_stru o where o.id=s.org start with o.parent=0'
      '   connect by prior o.id=o.parent) "'#1042#1083#1072#1076#1077#1083#1077#1094' '#1085#1072#1088#1103#1076#1072'"'
      
        '  ,to_char(d.createdate, '#39'dd.mm.yyyy hh24:mi:ss'#39') "'#1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103 +
        ' '#1074' '#1089#1080#1089#1090#1077#1084#1077'"'
      ',burnar.getmasters(d.key) "'#1052#1072#1089#1090#1077#1088'" '
      '  ,u.ora_name "'#1040#1074#1090#1086#1088' '#1085#1072#1088#1103#1076#1072'"'
      '  ,d.shifr "'#1064#1080#1092#1088'"'
      
        '  ,case when  (select z.closed from burnar.defnarzad z where d.k' +
        'ey=z.narkey)=1 then '#39'1'#39
      
        '        when  (select z.closed from burnar.defnarzad z where d.k' +
        'ey=z.narkey)=0 then '#39'0'#39
      '  else null end "'#1047#1072#1076#1072#1085#1080#1077'"'
      
        '  ,case when  (select z.closed from burnar.defnarvip z where d.k' +
        'ey=z.narkey)=1 then '#39'1'#39
      
        '        when  (select z.closed from burnar.defnarvip z where d.k' +
        'ey=z.narkey)=0 then '#39'0'#39
      '  else null end "'#1042#1099#1087#1086#1083#1085#1077#1085#1080#1077'" '
      
        'from burnar.defnar d, burnar.spr_workers s, burnar.people p1, bu' +
        'rnar.users u, burnar.org_stru o, burnar.people p'
      '  ,('
      '    select ds.org,k.idpeople'
      '    from burnar.karjera k, burnar.doljtostruct ds'
      '    where'
      '      k.dtenter <= Sysdate'
      '      and k.dtout >= Sysdate'
      '      and ds.key = k.doljinstru'
      '   ) userstru   '
      'where '
      '  d.nartype=:nartypep'
      
        '  and d.createdate>=to_date(decode(:crdata1,'#39#39','#39'01.01.1800'#39',:crd' +
        'ata11),'#39'dd.mm.yyyy'#39')'
      
        '  and d.createdate<=to_date(decode(:crdata2,'#39#39','#39'01.01.4000'#39',:crd' +
        'ata22),'#39'dd.mm.yyyy'#39')'
      '  and d.ownernar=s.key '
      '  and d.brigadir=p1.id(+) '
      '  and d.narauthor=u.users_id'
      '  and o.id(+)=s.org'
      '  and u.people_id=userstru.idpeople(+) '
      '  and u.people_id=p.id '
      '  and userstru.org in '
      '  (select c.id from burnar.org_stru c '
      '    start with c.id='
      '    ('
      '    select ds.org'
      
        '      from burnar.karjera k, burnar.doljtostruct ds, burnar.user' +
        's u'
      '     where upper(u.ora_name) = upper(:auser)'
      '       and k.idpeople = u.people_id'
      '       and k.dtenter <= Sysdate'
      '       and k.dtout >= Sysdate'
      '       and ds.key = k.doljinstru'
      '    )'
      '   connect by prior c.id=c.sysboss)'
      
        '  and upper(p.fioreports) like nvl(upper('#39'%'#39'||:names ||'#39'%'#39'),'#39'%'#39')' +
        ' '
      
        '   and nvl(upper(burnar.getmasters(d.key)),'#39' '#39') like upper('#39'%'#39'||' +
        ':masters ||'#39'%'#39')'
      '   and to_char (d.key) like nvl(upper('#39'%'#39'||:nar ||'#39'%'#39'),'#39'%'#39')'
      
        '   and trunc(d.createdate,'#39'dd'#39')<=  to_date(nvl(:data,'#39'01.01.4000' +
        #39'),'#39'dd.mm.yyyy'#39')'
      ''
      'order by d.key')
    Left = 728
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nartypep'
      end
      item
        DataType = ftUnknown
        Name = 'crdata1'
      end
      item
        DataType = ftUnknown
        Name = 'crdata11'
      end
      item
        DataType = ftUnknown
        Name = 'crdata2'
      end
      item
        DataType = ftUnknown
        Name = 'crdata22'
      end
      item
        DataType = ftUnknown
        Name = 'auser'
      end
      item
        DataType = ftUnknown
        Name = 'names'
      end
      item
        DataType = ftUnknown
        Name = 'masters'
      end
      item
        DataType = ftUnknown
        Name = 'nar'
      end
      item
        DataType = ftUnknown
        Name = 'data'
      end>
  end
  object CopyToTest: TPgStoredProc
    StoredProcName = 'COPY_WORK_TO_TESTDB'
    Connection = frmMain.MConnection
    Left = 424
    Top = 344
  end
  object spCopyNar: TPgStoredProc
    StoredProcName = 'burnar.COPYNARNEW_WITHDATE'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL burnar.COPYNARNEW_WITHDATE(:anarkey, :ausername, :abeginope' +
        'rdate, :result)')
    Left = 448
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'anarkey'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ausername'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'abeginoperdate'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'result'
        ParamType = ptInputOutput
      end>
    CommandStoredProcName = 'burnar.COPYNARNEW_WITHDATE:0'
  end
end
