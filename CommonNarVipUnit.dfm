object frmComNarVip: TfrmComNarVip
  Left = 434
  Top = 324
  Width = 1038
  Height = 683
  Caption = #1053#1072#1088#1103#1076'-'#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077', '#1086#1073#1097#1080#1081' '#1087#1077#1088#1077#1095#1077#1085#1100' '#1088#1072#1073#1086#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    }
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 464
    Top = 32
    Width = 16
    Height = 16
    AutoSize = True
    Picture.Data = {
      }
    Transparent = True
  end
  object Image2: TImage
    Left = 539
    Top = 5
    Width = 16
    Height = 16
    AutoSize = True
    Picture.Data = {
      }
    Transparent = True
  end
  object Image3: TImage
    Left = 512
    Top = 13
    Width = 24
    Height = 24
    AutoSize = True
    Picture.Data = {
      }
    Transparent = True
  end
  object Image4: TImage
    Left = 520
    Top = 21
    Width = 16
    Height = 16
    AutoSize = True
    Picture.Data = {
      }
    Transparent = True
  end
  object Image5: TImage
    Left = 528
    Top = 29
    Width = 16
    Height = 16
    AutoSize = True
    Picture.Data = {
      }
    Stretch = True
    Transparent = True
  end
  object RightDockPanelSplitter: TSplitter
    Left = 789
    Top = 29
    Height = 596
    Align = alRight
    AutoSnap = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 789
    Height = 596
    Align = alClient
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 1
      Top = 482
      Width = 787
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object Panel2: TPanel
      Left = 1
      Top = 485
      Width = 787
      Height = 110
      Align = alBottom
      TabOrder = 0
      object Label1: TLabel
        Left = 61
        Top = 5
        Width = 101
        Height = 13
        Caption = #1048#1090#1086#1075#1080' '#1087#1086' '#1087#1077#1088#1080#1086#1076#1072#1084':'
      end
      object SpeedButton2: TSpeedButton
        Left = 27
        Top = 3
        Width = 22
        Height = 22
        Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1080#1090#1086#1075#1080
        Flat = True
        Glyph.Data = {
          }
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object sbShowItogi: TSpeedButton
        Left = 3
        Top = 3
        Width = 22
        Height = 22
        Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1090#1086#1075#1080
        Flat = True
        Glyph.Data = {
          }
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = sbShowItogiClick
      end
      object sbHideItogi: TSpeedButton
        Left = 3
        Top = 3
        Width = 22
        Height = 22
        Hint = #1057#1082#1088#1099#1090#1100' '#1080#1090#1086#1075#1080
        Flat = True
        Glyph.Data = {
          }
        ParentShowHint = False
        ShowHint = True
        OnClick = sbHideItogiClick
      end
      object grItog: TOVNIDbGrid
        Left = 1
        Top = 32
        Width = 785
        Height = 77
        Align = alBottom
        Anchors = [akLeft, akTop, akBottom]
        FixedCols = 0
        PopupMenu = PopupMenu1
        TabOrder = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goColMoving]
        ColCount = 2
        RowCount = 2
        AutoSizeRowsHeight = True
        NumberFormat = '%-10.2f'
        CellSelectColor = clHighlight
        SelectCurRowColor = clSkyBlue
        SelectCurColColor = clSkyBlue
        CellSelectColorFont = clWhite
      end
    end
    object trGrdNar: TOVNIDbTreeGrid
      Left = 1
      Top = 1
      Width = 787
      Height = 481
      Align = alClient
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing]
      ColCount = 10
      OnSelectCell = trGrdNarSelectCell
      OnClick = ReadOpParams
      OnMouseDown = trGrdNarMouseDown
      OnDragOver = trGrdNarDragOver
      OnDragDrop = trGrdNarDragDrop
      AutoSizeRowsHeight = True
      FixRowsAutoNum = True
      MinRowHeight = 15
      NumberFormat = '%-10.2f'
      CellSelectColor = clHighlight
      SelectCurRowColor = clSkyBlue
      SelectCurColColor = clSkyBlue
      ColorRowSplit = True
      CellValChange = trGrdNarCellValChange
      CellSelectColorFont = clWhite
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1022
    Height = 29
    Caption = 'ToolBar1'
    Images = frmMain.ImageList1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    DesignSize = (
      1022
      27)
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = actOpenSkvVip
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton12: TToolButton
      Left = 23
      Top = 2
      Action = actImportRabZad
      ParentShowHint = False
      ShowHint = True
    end
    object tbExpandNodes: TToolButton
      Left = 46
      Top = 2
      Action = actExpandNodes
      AllowAllUp = True
      ParentShowHint = False
      ShowHint = True
      Style = tbsCheck
    end
    object tbAutoWidthCols: TToolButton
      Left = 69
      Top = 2
      Action = actAutoWidthCols
      ParentShowHint = False
      ShowHint = True
      Style = tbsCheck
    end
    object tbReloadNar: TToolButton
      Left = 92
      Top = 2
      Action = actReloadNar
      ParentShowHint = False
      ShowHint = True
    end
    object tbCalcOper: TToolButton
      Left = 115
      Top = 2
      Action = actCalcOperAndSaveRes
      ParentShowHint = False
      ShowHint = True
    end
    object tbCloseNarZad: TToolButton
      Left = 138
      Top = 2
      Action = actCloseNarVip
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton14: TToolButton
      Left = 161
      Top = 2
      Action = actUnLockOper
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton13: TToolButton
      Left = 184
      Top = 2
      Hint = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1073#1086#1090#1091
      Action = actLockOper
      Caption = '0'
      ParentShowHint = False
      ShowHint = True
    end
    object tbDelSelOpers: TToolButton
      Left = 207
      Top = 2
      Action = actDelSelOpers
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton22: TToolButton
      Left = 230
      Top = 2
      Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1088#1072#1073#1086#1090#1099' '#1087#1086' '#1084#1077#1093'.'#1073#1091#1088#1077#1085#1080#1102' '#1085#1072' '#1085#1077#1087#1088#1077#1088#1099#1074#1085#1086#1089#1090#1100' '#1080#1085#1090#1077#1088#1074#1072#1083#1086#1074
      Action = actIntervals
    end
    object ToolButton23: TToolButton
      Left = 253
      Top = 2
      Hint = #1047#1072#1084#1077#1085#1080#1090#1100' '#1079#1072#1076#1072#1085#1080#1077' '#1085#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077
      Caption = 'ToolButton23'
      ImageIndex = 25
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton23Click
    end
    object tbNarToRes: TToolButton
      Left = 276
      Top = 2
      Action = actNarToRes
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object ToolButton15: TToolButton
      Left = 299
      Top = 2
      Action = actListPeriod
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton24: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton24'
      ImageIndex = 15
      Wrap = True
      Style = tbsSeparator
    end
    object sEdit1: TEdit
      Left = 0
      Top = 29
      Width = 135
      Height = 22
      Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1090#1088#1086#1082#1091' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object tbFindWord: TToolButton
      Left = 135
      Top = 29
      Action = actFindWord
      ParentShowHint = False
      ShowHint = True
    end
    object tbSetWorker: TToolButton
      Left = 158
      Top = 29
      Action = actSetWorker
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object tbReOrderRab: TToolButton
      Left = 181
      Top = 29
      Action = actReOrderRab
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton6: TToolButton
      Left = 204
      Top = 29
      Action = actCutRab
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton3: TToolButton
      Left = 227
      Top = 29
      Action = actCopyRab
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton4: TToolButton
      Left = 250
      Top = 29
      Action = actPasteRab
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton16: TToolButton
      Left = 273
      Top = 29
      Action = actSelPeriodOper
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton5: TToolButton
      Left = 296
      Top = 29
      Action = actShowOk
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton2: TToolButton
      Left = 319
      Top = 29
      Action = actSelelColorRow
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton7: TToolButton
      Left = 342
      Top = 29
      Action = actClearColor
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton8: TToolButton
      Left = 365
      Top = 29
      Action = actVipolnenie_add_emptyblock
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton17: TToolButton
      Left = 388
      Top = 29
      Action = actVipolnenie_del_block
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton9: TToolButton
      Left = 411
      Top = 29
      Action = actRenameBlock
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton10: TToolButton
      Left = 434
      Top = 29
      Action = actFontUp
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton11: TToolButton
      Left = 457
      Top = 29
      Action = actFontDown
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton18: TToolButton
      Left = 480
      Top = 29
      Action = actsetdateHANDmla
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton19: TToolButton
      Left = 503
      Top = 29
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1085#1072#1088#1103#1076'-'#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077
      Action = actOpenNarVip
    end
    object ToolButton20: TToolButton
      Left = 526
      Top = 29
      Hint = #1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1088#1080#1079#1085#1072#1082' '#1044#1086#1087'.'#1088#1072#1073#1086#1090#1099
      Action = ActSetD
    end
    object ToolButton21: TToolButton
      Left = 549
      Top = 29
      Action = ActSetNotD
    end
    object ToolButton58: TToolButton
      Left = 572
      Top = 29
      Width = 8
      Caption = 'ToolButton58'
      ImageIndex = 33
      Style = tbsSeparator
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 580
      Top = 29
      Width = 243
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'ID'
      ListField = 'TREE'
      ListSource = DataSource1
      TabOrder = 1
      OnClick = DBLookupComboBox1Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 625
    Width = 1022
    Height = 19
    Panels = <
      item
        Text = #1054#1073#1097#1072#1103' '#1085#1086#1088#1084#1072#1090#1080#1074#1085#1072#1103' '#1087#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
        Width = 230
      end
      item
        Width = 80
      end
      item
        Width = 50
      end
      item
        Text = #1054#1073#1097#1072#1103' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103' '#1087#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
        Width = 230
      end
      item
        Width = 80
      end
      item
        Width = 50
      end
      item
        Text = #1050#1086#1076' '#1086#1087#1077#1088#1072#1094#1080#1080
        Width = 90
      end
      item
        Width = 50
      end>
  end
  object RightDockPanel: TPanel
    Left = 792
    Top = 29
    Width = 230
    Height = 596
    Align = alRight
    BevelOuter = bvLowered
    DockSite = True
    TabOrder = 3
    object Splitter2: TSplitter
      Left = 1
      Top = 485
      Width = 228
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object GrdParams: TOVNIDbGrid
      Left = 1
      Top = 1
      Width = 228
      Height = 484
      Align = alClient
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goColMoving]
      ColCount = 3
      OnSelectCell = GrdParamsSelectCell
      AutoSizeRowsHeight = True
      FixRowsAutoNum = True
      MinRowHeight = 15
      NumberFormat = '%-10.2f'
      CellSelectColor = clHighlight
      SelectCurRow = False
      SelectCurRowColor = clSkyBlue
      SelectCurColColor = clSkyBlue
      CellSelectColorFont = clWhite
      RowHeights = (
        15
        15
        15
        15
        15)
    end
    object algInfo: TMemo
      Left = 1
      Top = 488
      Width = 228
      Height = 107
      Hint = #1044#1086#1087'. '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      Align = alBottom
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ReadOnly = True
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 1
    end
  end
  object qrNarVip: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'with recursive tmp as('
      'select o.*, '
      '       ARRAY[(row_number() OVER (PARTITION BY o.parent'
      '       ORDER BY o.prnum))::integer] AS ord2,'
      '       cast(o.prnum as varchar(100)) as path'
      'from burnar.vipolnenie_oper o'
      'where o.parent is null and o.narkey=:keynar'
      'union all'
      'select o.*,'
      
        '       (tmp.ord2 || ARRAY[(row_number() OVER (PARTITION BY o.par' +
        'ent'
      '       ORDER BY o.prnum))::integer]) AS ord2,'
      
        '       cast(tmp.path||'#39'.'#39'||o.prnum||CASE tmp.priznak when 1 then' +
        ' '#39#1044#39' else '#39#39' END as varchar(100))'
      'from tmp,'
      '     burnar.vipolnenie_oper o'
      'where tmp.key=o.parent'
      ')'
      'select tmp.key, tmp.parent,'
      'tmp.prnum,'
      '--tmp.ord2,'
      
        'tmp.path as ord, --ltrim(sys_connect_by_path(o.prnum,'#39'.'#39'),'#39'.'#39')||' +
        'decode(o.priznak,1,'#39' ('#1044')'#39') ord,'
      
        'case when tmp.oper is not null then (select s.nm from spr_oper s' +
        ' where s.key=tmp.oper)'
      
        'else (select a.nm from burnar.vipolnenie_anynm a where a.vip_key' +
        '=tmp.key ) end nm,'
      'tmp.begoperdate,'
      'burnar.vipolnenie_GetOperIst(tmp.key) istnorm,'
      'tmp.oper,'
      'p_ot.znach ot,'
      'p_do.znach do_,'
      ''
      '(WITH vars(npi) AS ('
      
        '   values (array[13555,13556,13557,13558,13559,13560,13561,13562' +
        ',13563,13564,13565,13566])'
      ')'
      'SELECT CASE '
      '         when tmp.razdel = ANY(npi) then '#39'1'#39
      '         ELSE '#39'0'#39
      '       End as RS'
      'FROM vars) RS,'
      ''
      'case when tmp.operlifetype is not null then'
      
        ' (select round(y.norma/60,2) from burnar.vipolnenie_norm y where' +
        ' y.vip_key=tmp.key and y.prnum=1)'
      'else null end n1,'
      'case when tmp.operlifetype is not null then'
      
        ' (select round(y.norma/60,2) from burnar.vipolnenie_norm y where' +
        ' y.vip_key=tmp.key and y.prnum=2)'
      'else null end n2,'
      'tmp.operlifeid,'
      'tmp.operlifetype,'
      'tmp.colorsel,'
      'tmp.locked,'
      'tmp.narkey,'
      ''
      
        'case when tmp.operlifetype is not null then (select round(y.fact' +
        '/60,2)  from burnar.vipolnenie_norm y where y.vip_key=tmp.key an' +
        'd y.prnum=2)'
      'else null end fact,'
      ''
      
        'case when tmp.operlifetype is not null then (select 1 from burna' +
        'r.factkorr fr where fr.idlife=tmp.operlifeid)'
      'else null end kor,'
      ''
      
        'case when tmp.period is not null then (select nm||'#39' ('#39'  ||  to_c' +
        'har(begoperdate, '#39'dd.mm.yyyy'#39') ||'#39' - '#39'||to_char(outoperdate, '#39'dd' +
        '.mm.yyyy'#39') || '#39')'#39' from burnar.vipolnenie_period pp where pp.key=' +
        'tmp.period)'
      'else null end period_nm,'
      ''
      
        '(select t.name_short from burnar.spr_eks t where t.id = tmp.tipb' +
        'ur)tipbur'
      ''
      ''
      'from tmp left join'
      '  ( select * from burnar.vipolnenie_param ttt'
      
        '     where ttt.vip_key in (select z.key from burnar.vipolnenie_o' +
        'per z where z.narkey=:keynar)'
      '           and ttt.parcode in (select * from burnar.ot_params)'
      '     )   p_ot on tmp .key=p_ot.vip_key'
      '  left join     '
      '  ( select * from burnar.vipolnenie_param ttt'
      
        '     where ttt.vip_key in (select z.key from burnar.vipolnenie_o' +
        'per z where z.narkey=:keynar)'
      
        '           and ttt.parcode in (select * from burnar.do_params)) ' +
        'p_do on tmp.key=p_do.vip_key'
      'order by ord2')
    Left = 16
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'keynar'
        ParamType = ptInput
      end>
  end
  object qrNormAtribName: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select c.atribname||'#39', '#39'"'#1057#1086#1089#1090#1072#1074'", c.prnum, s.znach edizm'
      'from burnar.cfg_izmer c, burnar.spr_edizm s'
      'where c.izmer=:CodIzmer and s.key=c.edizm'
      'and c.prnum<=2 --'#1085#1086#1074#1086#1077' '#1074#1077#1103#1085#1080#1077
      'order by c.prnum')
    Left = 112
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodIzmer'
      end>
  end
  object qrAllSavedNorms: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'select z.id,z.parent,z.numin, v.fkey key, v.atribnum, v.norma, v' +
        '.fact'
      
        'from table(burnar.getnarvip(:keynar,:CodIzmer,:deepLev)) z, burn' +
        'ar.calcnormvip c, burnar.valnormvipfact v'
      
        'where c.opernarkey=z.key and c.id=z.id and c.parent=z.parent and' +
        ' c.numin=z.numin'
      'and c.key=v.fkey'
      'and v.atribnum<=2 --'#1085#1086#1074#1086#1077' '#1074#1077#1103#1085#1080#1077
      'order by z.skvnum,v.atribnum')
    Left = 40
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'keynar'
      end
      item
        DataType = ftUnknown
        Name = 'CodIzmer'
      end
      item
        DataType = ftUnknown
        Name = 'deepLev'
      end>
  end
  object sAddRab: TPgStoredProc
    StoredProcName = 'BURNAR.ADDONEOPERINNARVIP'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'begin'
      
        '  BURNAR.ADDONEOPERINNARVIP(:NKEY, :OPERKEY, :DATEIN, :APRNUM, :' +
        'RAZDEL, :WHO, :NARVIPKEY);'
      'end;')
    Left = 240
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NKEY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OPERKEY'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATEIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'APRNUM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RAZDEL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'WHO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NARVIPKEY'
        ParamType = ptOutput
      end>
    CommandStoredProcName = 'BURNAR.ADDONEOPERINNARVIP'
  end
  object qrClosed: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select closed from burnar.DEFNARVIP where narkey = :nar')
    Left = 16
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'nar'
        ParamType = ptInput
      end>
  end
  object sClcBegDateNextOp: TPgStoredProc
    StoredProcName = 'BURNAR.CALCBEGDATENEXTOPVIP'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'begin'
      
        '  BURNAR.CALCBEGDATENEXTOPVIP(:AOPNARKEY, :ATIMENORMA, :ARES, :A' +
        'OPCHANGED, :ANEXTDATE);'
      'end;')
    Left = 240
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AOPNARKEY'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ATIMENORMA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ARES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AOPCHANGED'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'ANEXTDATE'
        ParamType = ptOutput
      end>
    CommandStoredProcName = 'BURNAR.CALCBEGDATENEXTOPVIP'
  end
  object sMoveRab: TPgStoredProc
    StoredProcName = 'BURNAR.MOVEOPVIP'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'begin'
      '  BURNAR.MOVEOPVIP(:AKEY, :TOPRNUM);'
      'end;')
    Left = 240
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AKEY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TOPRNUM'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'BURNAR.MOVEOPVIP'
  end
  object sORDERNAR: TPgStoredProc
    StoredProcName = 'BURNAR.REORDERNAR_ZADVIP'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'begin'
      '  BURNAR.REORDERNAR_ZADVIP(:ANARKEY, :ATIPNAR);'
      'end;')
    Left = 240
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ANARKEY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ATIPNAR'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'BURNAR.REORDERNAR_ZADVIP'
  end
  object qrAllZnTekDiscrParam: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      ''
      'select * from zn_dparam z where z.dparam = :CodePar'
      'and z.key in'
      '('
      
        'select distinct (y.zndparam) from sbor_norm y, norms n where y.k' +
        'ey_norm=n.key and n.operlifeid=:oplife'
      'union '
      
        'select distinct (par.zndparam) from alg_operlife opa, algs al, a' +
        'lgzndparam par where al.key=opa.alg and al.key=par.alg and opa.i' +
        'd_operlife=:oplife'
      ')'
      'order by z.orderv,z.znach'
      '')
    ObjectView = True
    Left = 708
    Top = 150
    ParamData = <
      item
        DataType = ftString
        Name = 'CodePar'
        Value = '1'
      end
      item
        DataType = ftUnknown
        Name = 'oplife'
      end>
  end
  object qrAlgInfo: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select a.ops from operlife o, alg_operlife ao, algs a'
      'where o.id=:oplife and ao.id_operlife=o.id and ao.alg=a.key')
    ObjectView = True
    Left = 716
    Top = 254
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'oplife'
      end>
  end
  object qrParamV: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select p.vip_key,'
      'p.parcode,'
      '       coalesce(up.nm,'#39#39') || coalesce(case e.znach'
      '         when null then'
      '          '#39#39
      '         else'
      '          '#39', '#39' || e.znach'
      '       end,'#39#39') "'#1055#1072#1088#1072#1084#1077#1090#1088'",'
      'up.type ptype,'
      'round(p.znach) "'#1050#1086#1076#1047#1085#1072#1095#1077#1085#1080#1103'",'
      '       coalesce((select case'
      '                         when p.znach ='
      '                              coalesce(zn.val,'
      '                                  (select q.normparorzn'
      '                                     from common_spr q'
      '                                    where q.id = zn.znval)) then'
      '                          14811101'
      '                         else'
      '                          11777023'
      '                       end'
      'from burnar.zndefnarvipatrib zn, common_spr c'
      'where zn.defnar =:narkey'
      'and zn.parcode = c.id'
      'and c.normparorzn is not null'
      'and c.normparorzn = p.parcode),0) isSkv,'
      
        '       case up.type --when 1 then replace(cast(p.znach as varcha' +
        'r), '#39'.'#39', '#39','#39')'
      
        '                    when 1 then trim(to_char(to_number(replace(p' +
        '.znach::text, '#39'.'#39', '#39','#39'),'#39'999999D999'#39'),'#39'FM99999990D99'#39'),'#39','#39')'
      '                    when 2 then'
      '              (select zp.znach'
      '                 from zn_dparam zp'
      '                where zp.key = round(p.znach)) end "'#1047#1085#1072#1095#1077#1085#1080#1077'"'
      '  from burnar.vipolnenie_param p,'
      '       user_param up left join'
      '       spr_edizm e on  e.key = up.edizm,'
      '       (select ss.prnum, ss.key'
      '          from (select t.prnum as prnum, t.param as key'
      '                  from comboperparam t'
      '                 where t.operlifeid = :aoperlifeid'
      '                union all'
      '                select ap.prnum as prnum, ap.userparam as key'
      '                  from alguserparam ap, alg_operlife t'
      '                 where t.id_operlife = :aoperlifeid'
      '                   and ap.alg = t.alg) ss) ap'
      ''
      'where p.vip_key = :vipkey'
      'and p.parcode = up.key'
      'and ap.key = up.key'
      'order by ap.prnum')
    ObjectView = True
    Left = 708
    Top = 94
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'narkey'
      end
      item
        DataType = ftUnknown
        Name = 'aoperlifeid'
      end
      item
        DataType = ftUnknown
        Name = 'vipkey'
      end>
  end
  object ActionList1: TActionList
    Images = frmMain.ImageList1
    OnUpdate = ActionList1Update
    Left = 656
    Top = 32
    object actCalcOperAndSaveRes: TAction
      Category = 'NarVipOpers'
      Caption = 'CalcOper'
      Hint = #1056#1072#1089#1095#1077#1090' '#1085#1086#1088#1084#1099
      ImageIndex = 11
      ShortCut = 16450
      OnExecute = tbCalcOperClick
    end
    object actExpandNodes: TAction
      Category = 'NarVipOpers'
      Caption = 'actExpandNodes'
      Hint = #1057#1074#1077#1088#1085#1091#1090#1100'/'#1088#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077' '#1091#1079#1083#1099
      ImageIndex = 10
      ShortCut = 16453
      OnExecute = tbExpandNodesClick
    end
    object actAutoWidthCols: TAction
      Category = 'NarVipOpers'
      Caption = 'actAutoWidthCols'
      Hint = #1055#1086#1076#1086#1073#1088#1072#1090#1100' '#1096#1080#1088#1080#1085#1099' '#1082#1086#1083#1086#1085#1086#1082#13#10#1087#1086' '#1076#1083#1080#1085#1077' '#1090#1077#1082#1089#1090#1072
      ImageIndex = 9
      ShortCut = 16460
      OnExecute = tbAutoWidthColsClick
    end
    object actReloadNar: TAction
      Category = 'NarVipOpers'
      Caption = 'actReloadNar'
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 12
      ShortCut = 16466
      OnExecute = tbReloadNarClick
    end
    object actNarToRes: TAction
      Category = 'NarVipOpers'
      Caption = 'actNarToRes'
      Hint = #1053#1072#1088#1103#1076'-'#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077#13#10#1087#1086' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103#1084
      ImageIndex = 20
      ShortCut = 16455
      OnExecute = tbNarToResClick
    end
    object actCloseNarVip: TAction
      Category = 'NarVipOpers'
      Caption = 'actCloseNarVip'
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077' '#1086#1090' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 14
      ShortCut = 16459
      OnExecute = tbCloseNarZadClick
    end
    object actDelSelOpers: TAction
      Category = 'NarVipOpers'
      Caption = 'actDelSelOpers'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1077' '#1088#1072#1073#1086#1090#1099
      ImageIndex = 15
      ShortCut = 16430
      OnExecute = tbDelSelOpersClick
    end
    object actFindWord: TAction
      Category = 'NarVipOpers'
      Caption = 'actFindWord'
      Hint = #1053#1072#1081#1090#1080' '#1089#1090#1088#1086#1082#1091#13#10#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1087#1086#1083#1077
      ImageIndex = 26
      ShortCut = 16454
      OnExecute = sSpeedButton3Click
    end
    object actSetFactMoment: TAction
      Category = 'NarVipOpers'
      Caption = 'actSetFactMoment'
      Enabled = False
      Hint = #1047#1072#1076#1072#1090#1100' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077' '#1084#1086#1084#1077#1085#1090#1099#13#10#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103' '#1086#1087#1077#1088#1072#1094#1080#1081
      ImageIndex = 21
      ShortCut = 16461
      Visible = False
    end
    object actSetWorker: TAction
      Category = 'NarVipOpers'
      Caption = 'actSetWorker'
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103
      ImageIndex = 22
      ShortCut = 16471
      OnExecute = SetWorker
    end
    object actReOrderRab: TAction
      Category = 'NarVipOpers'
      Caption = 'actReOrderRab'
      Hint = #1055#1077#1088#1077#1085#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1088#1072#1073#1086#1090#1099
      ImageIndex = 23
      ShortCut = 16463
      OnExecute = tbReOrderRabClick
    end
    object actSaveFact: TAction
      Category = 'NarVipOpers'
      Caption = 'actSaveFact'
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1074' '#1073#1072#1079#1077
      ImageIndex = 13
      ShortCut = 16473
    end
    object actOpenSkvVip: TAction
      Category = 'NarVipOpers'
      Caption = 'actOpenSkvVip'
      Hint = #1057#1082#1074#1086#1079#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
      ImageIndex = 5
      ShortCut = 16473
      OnExecute = actOpenSkvVipExecute
    end
    object actCutRab: TAction
      Category = 'NarVipOpers'
      Caption = 'actCutRab'
      Hint = #1042#1099#1088#1077#1079#1072#1090#1100' '#1073#1083#1086#1082
      ImageIndex = 45
      ShortCut = 16472
      OnExecute = actCutRabExecute
    end
    object actCopyRab: TAction
      Category = 'NarVipOpers'
      Caption = 'actCopyRab'
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1073#1083#1086#1082
      ImageIndex = 44
      ShortCut = 16451
      OnExecute = actCopyRabExecute
    end
    object actPasteRab: TAction
      Category = 'NarVipOpers'
      Caption = 'actPasteRab'
      Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1073#1083#1086#1082
      ImageIndex = 33
      ShortCut = 16470
      OnExecute = actPasteRabExecute
    end
    object actShowOk: TAction
      Category = 'NarVipOpers'
      Caption = 'actShowOk'
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1087#1077#1088#1082#1072#1088#1090#1091
      ImageIndex = 6
      ShortCut = 16457
      OnExecute = actShowOkExecute
    end
    object actSaveSelElems: TAction
      Category = 'NarVipOpers'
      Caption = 'actSaveSelElems'
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077
      ImageIndex = 37
      ShortCut = 8305
      OnExecute = actSaveSelElemsExecute
    end
    object actSelelColorRow: TAction
      Category = 'NarVipOpers'
      Caption = 'actSelelColorRow'
      Hint = #1042#1099#1076#1077#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091' '#1094#1074#1077#1090#1086#1084
      ImageIndex = 46
      OnExecute = actSelelColorRowExecute
    end
    object actClearColor: TAction
      Category = 'NarVipOpers'
      Caption = 'actClearColor'
      Hint = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1074#1099#1076#1077#1083#1077#1085#1080#1103' '#1094#1074#1077#1090#1086#1084' '#1074' '#1085#1072#1088#1103#1076#1077
      ImageIndex = 47
      OnExecute = actClearColorExecute
    end
    object actVipolnenie_add_emptyblock: TAction
      Category = 'NarVipOpers'
      Caption = 'actVipolnenie_add_emptyblock'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1091#1089#1090#1086#1081' '#1073#1083#1086#1082
      ImageIndex = 48
      OnExecute = actVipolnenie_add_emptyblockExecute
    end
    object actRenameBlock: TAction
      Category = 'NarVipOpers'
      Caption = 'actRenameBlock'
      Hint = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100' '#1073#1083#1086#1082
      ImageIndex = 49
      OnExecute = actRenameBlockExecute
    end
    object actFontDown: TAction
      Category = 'NarVipOpers'
      Caption = 'actFontDown'
      Hint = #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1096#1088#1080#1092#1090
      ImageIndex = 50
      OnExecute = actFontDownExecute
    end
    object actFontUp: TAction
      Category = 'NarVipOpers'
      Caption = 'actFontUp'
      Hint = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1096#1088#1080#1092#1090
      ImageIndex = 51
      OnExecute = actFontUpExecute
    end
    object actImportRabZad: TAction
      Category = 'NarVipOpers'
      Caption = 'actImportRabZad'
      Hint = #1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1073#1086#1090#1099' '#1080#1079' '#1079#1072#1076#1072#1085#1080#1103
      ImageIndex = 3
      OnExecute = actImportRabZadExecute
    end
    object actLockOper: TAction
      Category = 'NarVipOpers'
      Caption = 'actLockOper'
      Hint = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1088#1072#1073#1086#1090#1091
      ImageIndex = 52
      OnExecute = actLockOperExecute
    end
    object actUnLockOper: TAction
      Category = 'NarVipOpers'
      Caption = 'actUnLockOper'
      Hint = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1073#1086#1090#1091
      ImageIndex = 53
      OnExecute = actUnLockOperExecute
    end
    object actOpenNarVip: TAction
      Category = 'NarVipOpers'
      Caption = 'actOpenNarVip'
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1085#1072#1088#1103#1076
      ImageIndex = 62
      ShortCut = 24699
      OnExecute = actOpenNarVipExecute
    end
    object actListPeriod: TAction
      Category = 'NarVipOpers'
      Caption = 'actListPeriod'
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1077#1088#1080#1086#1076#1086#1074' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1088#1072#1073#1086#1090
      ImageIndex = 58
      OnExecute = actListPeriodExecute
    end
    object actSelPeriodOper: TAction
      Category = 'NarVipOpers'
      Caption = 'actSelPeriodOper'
      Hint = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080' '#1082' '#1087#1077#1088#1080#1086#1076#1091
      ImageIndex = 55
      OnExecute = actSelPeriodOperExecute
    end
    object actViewOperInfo: TAction
      Category = 'NarVipOpers'
      Caption = 'actViewOperInfo'
      Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1090#1077#1093#1085#1086#1083#1086#1075#1091
      ShortCut = 24688
      OnExecute = actViewOperInfoExecute
    end
    object actVipolnenie_del_block: TAction
      Category = 'NarVipOpers'
      Caption = 'actVipolnenie_del_block'
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1073#1083#1086#1082#1072' '#1073#1077#1079' '#1091#1076#1072#1083#1077#1085#1080#1103' '#1074#1093#1086#1076#1103#1097#1080#1093' '#1088#1072#1073#1086#1090
      ImageIndex = 61
      OnExecute = actVipolnenie_del_blockExecute
    end
    object actsetdateHANDmla: TAction
      Category = 'NarVipOpers'
      Caption = 'actsetdateHANDmla'
      Hint = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1081' '#1076#1072#1090#1099' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1088#1072#1073#1086#1090#1099
      ImageIndex = 21
      OnExecute = actsetdateHANDmlaExecute
    end
    object ActSetD: TAction
      Category = 'NarVipOpers'
      Caption = 'ActSetD'
      ImageIndex = 64
      OnExecute = ActSetDExecute
    end
    object ActSetNotD: TAction
      Category = 'NarVipOpers'
      Caption = 'ActSetNotD'
      ImageIndex = 65
      OnExecute = ActSetNotDExecute
    end
    object actIntervals: TAction
      Category = 'NarVipOpers'
      Caption = 'actIntervals'
      ImageIndex = 40
      OnExecute = actIntervalsExecute
    end
  end
  object qrfactkorr: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select t.* from burnar.factkorr t'
      'where t.idlife=:idlife')
    Left = 112
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idlife'
      end>
  end
  object sCopyOper: TPgStoredProc
    StoredProcName = 'BURNAR.COPYOPVIP'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'begin'
      '  BURNAR.COPYOPVIP(:ASRCKEY, :TOPRNUM);'
      'end;')
    Left = 352
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ASRCKEY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TOPRNUM'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'BURNAR.COPYOPVIP'
  end
  object qrCalcNorma1: TPgQuery
    Connection = frmMain.MConnection
    ParamCheck = False
    SQL.Strings = (
      
        'select column_value norma from table(burnar.CalcOpV( :aKey,:aId,' +
        ':aParent,:aNumin,:aIzmer))')
    Left = 108
    Top = 102
  end
  object qrHtmlOk: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select distinct i.lnkfile'
      
        'from (select op.osnoventer1 from operlife op where op.id=:oplife' +
        ') a,'
      
        '     (select o.ist from burnar.vipolnenie_ist o where o.vip_key ' +
        '= :operkey) b,'
      '    istochniki i'
      'where i.id in (a.osnoventer1)'
      '      OR i.id in (b.ist)')
    Left = 712
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oplife'
      end
      item
        DataType = ftLargeint
        Name = 'operkey'
      end>
  end
  object ColorDialog1: TColorDialog
    Left = 792
    Top = 32
  end
  object sVIPOLNENIE_ADD_EMPTYBLOCK: TPgStoredProc
    StoredProcName = 'BURNAR.VIPOLNENIE_ADD_EMPTYBLOCK'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL BURNAR.VIPOLNENIE_ADD_EMPTYBLOCK(:nkey, :datein, :aparent, ' +
        ':aprnum, :textik, :who)')
    Left = 240
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'nkey'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'datein'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'aparent'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'aprnum'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'textik'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'who'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'BURNAR.VIPOLNENIE_ADD_EMPTYBLOCK:0'
  end
  object sVIPOLNENIE_RENUMLEVEL: TPgStoredProc
    StoredProcName = 'BURNAR.VIPOLNENIE_RENUMLEVEL'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'CALL BURNAR.VIPOLNENIE_RENUMLEVEL(:aparent, :anarkey)')
    Left = 240
    Top = 304
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'aparent'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anarkey'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'BURNAR.VIPOLNENIE_RENUMLEVEL:0'
  end
  object sVIPOLNENIE_OPERAC_MOVE: TPgStoredProc
    StoredProcName = 'BURNAR.VIPOLNENIE_OPERAC_MOVE'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL BURNAR.VIPOLNENIE_OPERAC_MOVE(:akey, :aparent, :aprnum, :ne' +
        'wparent, :newprnum, :anarkey)')
    Left = 544
    Top = 328
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'akey'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'aparent'
      end
      item
        DataType = ftFloat
        Name = 'aprnum'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'newparent'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'newprnum'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anarkey'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'BURNAR.VIPOLNENIE_OPERAC_MOVE:0'
  end
  object sVIPOLNENIE_OPERAC_DEL: TPgStoredProc
    StoredProcName = 'burnar.VIPOLNENIE_OPERAC_DEL'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL burnar.VIPOLNENIE_OPERAC_DEL(:akey, :aparent, :aprnum, :ana' +
        'rkey)')
    Left = 544
    Top = 80
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'akey'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'aparent'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'aprnum'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anarkey'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'burnar.VIPOLNENIE_OPERAC_DEL:0'
  end
  object SVIPOLNENIE_OPERAC_COPY: TPgStoredProc
    StoredProcName = 'BURNAR.VIPOLNENIE_OPERAC_COPY'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL BURNAR.VIPOLNENIE_OPERAC_COPY(:key_oper, :parent_oper, :apa' +
        'rent_where_copy, :aprnum_where_copy, :anarkey)')
    Left = 544
    Top = 128
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'key_oper'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'parent_oper'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'aparent_where_copy'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'aprnum_where_copy'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anarkey'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'BURNAR.VIPOLNENIE_OPERAC_COPY:0'
  end
  object sZadanie_Calc_OperP: TPgStoredProc
    StoredProcName = 'BURNAR.Zadanie_Calc_OperP'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'begin'
      
        '  BURNAR.Zadanie_Calc_OperP(:AKEY, :AOPERLIFEID, :AIZMER, :NORMA' +
        'ED, :NORMAOB, :ISTOCHNIKI, :AOT, :ADO);'
      'end;')
    Left = 352
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AKEY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AOPERLIFEID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AIZMER'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NORMAED'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NORMAOB'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'ISTOCHNIKI'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'AOT'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'ADO'
        ParamType = ptOutput
      end>
    CommandStoredProcName = 'BURNAR.Zadanie_Calc_OperP'
  end
  object SZADANIE_TO_VIPOLNENIE: TPgStoredProc
    StoredProcName = 'burnar.ZADANIE_TO_VIPOLNENIE'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'CALL burnar.ZADANIE_TO_VIPOLNENIE(:nkey, :datein)')
    Left = 544
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'nkey'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datein'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'burnar.ZADANIE_TO_VIPOLNENIE:0'
  end
  object SVIPOLNENIE_CALC_OPERP: TPgStoredProc
    StoredProcName = 'BURNAR.VIPOLNENIE_CALC_OPERP'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL BURNAR.VIPOLNENIE_CALC_OPERP(:akey, :aoperlifeid, :aizmer, ' +
        ':normaed, :normaob, :istochniki, :aot, :ado)')
    Left = 544
    Top = 424
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'akey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'aoperlifeid'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'aizmer'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'normaed'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'normaob'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'istochniki'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'aot'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'ado'
        ParamType = ptInputOutput
      end>
    CommandStoredProcName = 'BURNAR.VIPOLNENIE_CALC_OPERP:0'
  end
  object qrSetNextDateOperVIP: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select key, begoperdate '
      'from burnar.tkeydate'
      'where narkey = :anarkey and os_user = :usr;'
      ''
      ''
      ''
      '')
    Left = 112
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'anarkey'
      end
      item
        DataType = ftUnknown
        Name = 'usr'
      end>
  end
  object SVIPOLNENIE_LOCK_OPER: TPgStoredProc
    StoredProcName = 'burnar.VIPOLNENIE_LOCK_OPER'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'CALL burnar.VIPOLNENIE_LOCK_OPER(:akey, :anarkey)')
    Left = 240
    Top = 352
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'akey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anarkey'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'burnar.VIPOLNENIE_LOCK_OPER:0'
  end
  object SVIPOLNENIE_REBUILD_OPER: TPgStoredProc
    StoredProcName = 'burnar.VIPOLNENIE_REBUILD_OPER'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL burnar.VIPOLNENIE_REBUILD_OPER(:akey, :anarkey, :aisrebuild' +
        ')')
    Left = 240
    Top = 408
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'akey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anarkey'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'aisrebuild'
        ParamType = ptInputOutput
      end>
    CommandStoredProcName = 'burnar.VIPOLNENIE_REBUILD_OPER:0'
  end
  object qrLocked: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'select count(*) kol from burnar.vipolnenie_oper o where o.locked' +
        '=1 and narkey=:nar')
    Left = 16
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nar'
      end>
  end
  object qrColNotLocked: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'select count(*) kol from burnar.vipolnenie_oper o where o.locked' +
        '=0 and narkey=:nar')
    Left = 32
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nar'
      end>
  end
  object SVIPOLNENIE_ADD_RAZDEL: TPgStoredProc
    StoredProcName = 'burnar.vipolnenie_add_razdel'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL burnar.vipolnenie_add_razdel(:nkey, :datein, :aparent, :apr' +
        'num, :razdel, :who, :withname)')
    Left = 544
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'nkey'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'datein'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'aparent'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'aprnum'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'razdel'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'who'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'withname'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'burnar.vipolnenie_add_razdel:0'
  end
  object SVIPOLNENIE_UN_LOCK_OPER: TPgStoredProc
    StoredProcName = 'burnar.VIPOLNENIE_UN_LOCK_OPER'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'CALL burnar.VIPOLNENIE_UN_LOCK_OPER(:akey, :anarkey)')
    Left = 544
    Top = 376
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'akey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anarkey'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'burnar.VIPOLNENIE_UN_LOCK_OPER:0'
  end
  object qrUnLock: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'select count(*) kol from burnar.vipolnenie_oper o where o.locked' +
        '=0 and narkey=:nar')
    Left = 32
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nar'
      end>
  end
  object SVIPOLNENIE_OPERAC_DEL_BLOCK: TPgStoredProc
    StoredProcName = 'BURNAR.VIPOLNENIE_OPERAC_DEL_BLOCK'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL BURNAR.VIPOLNENIE_OPERAC_DEL_BLOCK(:akey, :aparent, :aprnum' +
        ', :anarkey)')
    Left = 544
    Top = 232
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'akey'
      end
      item
        DataType = ftLargeint
        Name = 'aparent'
      end
      item
        DataType = ftFloat
        Name = 'aprnum'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anarkey'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'BURNAR.VIPOLNENIE_OPERAC_DEL_BLOCK:0'
  end
  object PopupMenu1: TPopupMenu
    Left = 720
    Top = 34
    object N1: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N1Click
    end
  end
  object qrITOGtable: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      '--CALL burnar.vipolnenie_lock_oper (66134200 , 358674)'
      ''
      
        '--select to_date('#39'18.11.2022 12:00:00'#39','#39'dd.mm.yyyy'#39') + 1/1 * int' +
        'erval '#39'1 day'#39
      ''
      'select vv.NARKEY, '
      '       vv.KEY, '
      '       case when vv.BEGOPERDATE is null '
      '                 and vv.OUTOPERDATE is null '
      '              then vv.NM '
      '            else'
      
        '              vv.NM || '#39' ( '#39' || to_char( vv.BEGOPERDATE, '#39'dd.mm.' +
        'yyyy'#39' ) || '#39'-'#39' || to_char( vv.OUTOPERDATE, '#39'dd.mm.yyyy'#39' ) || '#39' )' +
        #39' '
      '       end NM, '
      '       vv.NORMATIV + vv.REMONT_N SUMM_N, '
      '       vv.FACT + vv.REMONT_F SUMM_F, '
      '       vv.NORMATIV, '
      '       vv.REMONT_N, '
      '       vv.FACT, '
      '       vv.REMONT_F '
      'from ( select o.NARKEY, '
      '              p.KEY, '
      '              p.BEGOPERDATE, '
      '              p.OUTOPERDATE, '
      '              ( case when p.KEY is null '
      '                       then '#39#1053#1077' '#1074#1082#1083#1102#1095#1077#1085#1085#1099#1077' '#1074' '#1087#1077#1088#1080#1086#1076#1099' '#1088#1072#1073#1086#1090#1099#39' '
      '                     else'
      '                       p.NM '
      '                end ) NM, '
      '              sum ( round( n.norma/60, 2 ) ) NORMATIV, '
      '              round( case when coalesce( ( ( select f.VAL '
      
        '                                             from burnar.ZNREPPA' +
        'RSV f '
      
        '                                             where f.PERIOD_KEY ' +
        '= o.PERIOD '
      
        '                               and f.PARCODE = 2683 AND f.REPID ' +
        '= 1 ) ), 0 ) > sum( round( case when coalesce( o.OPERLIFETYPEOPE' +
        'R, 0 ) not in ( 200, 207, 208, 209 ) '
      
        '                                                                ' +
        '         then n.NORMA '
      
        '                                                                ' +
        '       else'
      
        '                                                                ' +
        '         0 '
      
        '                                                                ' +
        '  end / 60, 2 ) ) * 0.053 '
      
        '                            then sum( round( case when coalesce(' +
        ' o.OPERLIFETYPEOPER, 0 ) not in ( 200, 207, 208, 209 ) '
      
        '                                                    then n.NORMA' +
        ' '
      '                                                  else'
      '                                                    0 '
      
        '                                             end / 60, 2 ) * 0.0' +
        '53 ) '
      '                          else'
      '                            coalesce( ( ( select f.VAL '
      
        '                                          from burnar.ZNREPPARSV' +
        ' f '
      
        '                                          where f.PERIOD_KEY = o' +
        '.PERIOD '
      '                               and f.PARCODE = 2683 '
      '                               and f.REPID = 1 ) ), 0 ) '
      '                     end, 2 ) REMONT_N, '
      '              sum ( round( n.fact/60, 2 ) ) FACT, '
      '              ( select coalesce( f.VAL, 0 ) '
      '                from burnar.ZNREPPARSV f '
      
        '                where f.PARCODE = 2683 and f.PERIOD_KEY = p.KEY ' +
        'and f.REPID = 1 ) REMONT_F '
      '       from burnar.VIPOLNENIE_OPER o '
      '            join burnar.VIPOLNENIE_NORM n on n.VIP_KEY = o.KEY '
      
        '            left join burnar.VIPOLNENIE_PERIOD p on o.PERIOD = p' +
        '.KEY '
      '       where n.PRNUM = 2 and o.NARKEY =:narkey '
      
        '       group by o.NARKEY, p.KEY, o.PERIOD, p.NM, p.BEGOPERDATE, ' +
        'p.OUTOPERDATE ) vv '
      'where vv.NARKEY =:narkey '
      'order by vv.BEGOPERDATE, vv.OUTOPERDATE')
    Left = 24
    Top = 354
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'narkey'
      end>
  end
  object qrEKS: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'WITH RECURSIVE TMP AS('
      '    SELECT t.id, t.parent_id, t.name, 1 as level '
      '     from burnar.spr_eks t'
      '     where t.parent_id = 1'
      '    UNION ALL'
      '    SELECT t.id, t.parent_id, t.name, level+1 '
      '     from burnar.spr_eks t, tmp'
      '     where tmp.id = t.parent_id and t.parent_id = 1'
      ')'
      
        'select tmp.id, (LPAD('#39' '#39', 3 * level) || tmp.name)::varchar(150) ' +
        'AS Tree  from TMP')
    Left = 881
    Top = 165
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 961
    Top = 181
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qrEKS
    Left = 873
    Top = 237
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 961
    Top = 237
  end
end
