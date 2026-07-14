object frmComNarZad: TfrmComNarZad
  Left = 876
  Top = 345
  Width = 1041
  Height = 627
  Caption = #1053#1072#1088#1103#1076'-'#1079#1072#1076#1072#1085#1080#1077', '#1086#1073#1097#1080#1081' '#1087#1077#1088#1077#1095#1077#1085#1100' '#1088#1072#1073#1086#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    }
  KeyPreview = True
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
    Left = 504
    Top = 5
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
  object RightDockPanelSplitter: TSplitter
    Left = 782
    Top = 29
    Height = 540
    Align = alRight
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 782
    Height = 540
    Align = alClient
    TabOrder = 0
    object trGrdNar: TOVNIDbTreeGrid
      Left = 1
      Top = 1
      Width = 780
      Height = 538
      Align = alClient
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing]
      ColCount = 9
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
      CellSelectColorFont = clWhite
      WordWrap_Simbols = True
      RowHeights = (
        15
        15
        15
        15
        15)
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1025
    Height = 29
    Caption = 'ToolBar1'
    Images = frmMain.ImageList1
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = actOpenSkvZad
      ParentShowHint = False
      ShowHint = True
    end
    object tbCreateCopyNarVip: TToolButton
      Left = 23
      Top = 2
      Action = actCreateCopyNarVip
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
    object tbNarToRes: TToolButton
      Left = 138
      Top = 2
      Action = actNarToRes
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object tbCloseNarZad: TToolButton
      Left = 161
      Top = 2
      Action = actCloseNarZad
      ParentShowHint = False
      ShowHint = True
    end
    object tbDelSelOpers: TToolButton
      Left = 184
      Top = 2
      Action = actDelSelOpers
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton14: TToolButton
      Left = 207
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 27
      Style = tbsSeparator
    end
    object sEdit1: TEdit
      Left = 215
      Top = 2
      Width = 162
      Height = 22
      Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1090#1088#1086#1082#1091' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
      TabOrder = 1
    end
    object tbFindWord: TToolButton
      Left = 377
      Top = 2
      Action = actFindWord
      ParentShowHint = False
      ShowHint = True
    end
    object tbSetWorker: TToolButton
      Left = 400
      Top = 2
      Action = actSetWorker
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object tbReOrderRab: TToolButton
      Left = 423
      Top = 2
      Action = actReOrderRab
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton6: TToolButton
      Left = 446
      Top = 2
      Action = actCutRab
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton3: TToolButton
      Left = 469
      Top = 2
      Action = actCopyRab
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton4: TToolButton
      Left = 492
      Top = 2
      Action = actPasteRab
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton5: TToolButton
      Left = 515
      Top = 2
      Action = actShowOk
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton7: TToolButton
      Left = 538
      Top = 2
      Action = actSelelColorRow
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton8: TToolButton
      Left = 561
      Top = 2
      Action = actClearColor
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton9: TToolButton
      Left = 584
      Top = 2
      Action = actZadanie_add_emptyblock
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton12: TToolButton
      Left = 607
      Top = 2
      Action = actZadanie_del_block
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton2: TToolButton
      Left = 630
      Top = 2
      Action = actRenameBlock
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton11: TToolButton
      Left = 653
      Top = 2
      Action = actFontUp
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton10: TToolButton
      Left = 676
      Top = 2
      Action = actFontDown
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton13: TToolButton
      Left = 699
      Top = 2
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1085#1072#1088#1103#1076'-'#1079#1072#1076#1072#1085#1080#1077
      Action = actOpenDefNar
      ImageIndex = 62
    end
    object ToolButton15: TToolButton
      Left = 722
      Top = 2
      Width = 8
      Caption = 'ToolButton15'
      ImageIndex = 63
      Style = tbsSeparator
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 730
      Top = 2
      Width = 287
      Height = 21
      KeyField = 'ID'
      ListField = 'TREE'
      ListSource = DataSource1
      TabOrder = 0
      OnClick = DBLookupComboBox2Click
    end
  end
  object RightDockPanel: TPanel
    Left = 785
    Top = 29
    Width = 240
    Height = 540
    Align = alRight
    BevelOuter = bvLowered
    DockSite = True
    TabOrder = 2
    object Splitter2: TSplitter
      Left = 1
      Top = 453
      Width = 238
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object GrdParams: TOVNIDbGrid
      Left = 1
      Top = 1
      Width = 238
      Height = 452
      Align = alClient
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goColMoving]
      ColCount = 3
      OnSelectCell = GrdParams2SelectCell
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
      Top = 456
      Width = 238
      Height = 83
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 569
    Width = 1025
    Height = 19
    Panels = <
      item
        Text = #1054#1073#1097#1072#1103' '#1087#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
        Width = 160
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
  object qrNarZad: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'with recursive tmp as('
      'select o.*, '
      '       ARRAY[(row_number() OVER (PARTITION BY o.parent'
      '       ORDER BY o.prnum))::integer] AS ord2,'
      '       cast(o.prnum as varchar(100)) as path'
      'from burnar.zadanie_oper o'
      'where o.parent is null and o.narkey=:keynar'
      'union all'
      'select o.*,'
      
        '       (tmp.ord2 || ARRAY[(row_number() OVER (PARTITION BY o.par' +
        'ent'
      '       ORDER BY o.prnum))::integer]) AS ord2,'
      '       cast(tmp.path||'#39'.'#39'||o.prnum as varchar(100))'
      'from tmp,'
      '     burnar.zadanie_oper o'
      'where tmp.key=o.parent'
      ')'
      'select tmp.key, tmp.parent,'
      'tmp.prnum,'
      '--tmp.ord2,'
      
        'tmp.path as ord, --ltrim(sys_connect_by_path(o.prnum,'#39'.'#39'),'#39'.'#39') o' +
        'rd,'
      
        'case when tmp.oper is not null then (select s.nm from spr_oper s' +
        ' where s.key=tmp.oper)'
      
        'else (select a.nm from burnar.zadanie_anynm a where a.zad_key=tm' +
        'p.key ) end nm,'
      'tmp.begoperdate,'
      'burnar.zadanie_GetOperIst(tmp.key) istnorm,'
      'tmp.oper,'
      'p_ot.znach ot,'
      'p_do.znach do_,'
      ''
      '--GetZRazdelStat(tmp.key) RS,'
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
      
        ' (select round(y.norma/60,2) from burnar.zadanie_norm y where y.' +
        'zad_key=tmp.key and y.prnum=1)'
      'else null end n1,'
      'case when tmp.operlifetype is not null then'
      
        ' (select round(y.norma/60,2) from burnar.zadanie_norm y where y.' +
        'zad_key=tmp.key and y.prnum=2)'
      'else null end n2,'
      'tmp.operlifeid,'
      'tmp.operlifetype,'
      'tmp.colorsel,'
      'tmp.locked,'
      'tmp.narkey'
      
        ',(select t.name_short from burnar.spr_eks t where t.id = tmp.tip' +
        'bur)tipbur'
      ''
      ''
      'from tmp left join'
      '  ( select * from burnar.zadanie_param ttt'
      
        '     where ttt.zad_key in (select z.key from burnar.zadanie_oper' +
        ' z where z.narkey=:keynar)'
      '           and ttt.parcode in (select * from burnar.ot_params)'
      '     )   p_ot on tmp .key=p_ot.zad_key'
      '  left join     '
      '  ( select * from burnar.zadanie_param ttt'
      
        '     where ttt.zad_key in (select z.key from burnar.zadanie_oper' +
        ' z where z.narkey=:keynar)'
      
        '           and ttt.parcode in (select * from burnar.do_params)) ' +
        'p_do on tmp.key=p_do.zad_key'
      'order by ord2  ')
    Left = 24
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'keynar'
      end>
  end
  object qrNormAtribName: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select c.atribname||'#39', '#39' "'#1057#1086#1089#1090#1072#1074'", c.prnum, s.znach edizm'
      'from cfg_izmer c, spr_edizm s'
      'where c.izmer=:CodIzmer and s.key=c.edizm '
      'and c.prnum<=2 --'#1085#1086#1074#1086#1077' '#1074#1077#1103#1085#1080#1077
      'order by c.prnum')
    Left = 40
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodIzmer'
      end>
  end
  object qrCalcNorma1: TPgQuery
    Connection = frmMain.MConnection
    ParamCheck = False
    SQL.Strings = (
      ''
      
        'select norma from table (burnar.zadanie_calc_oper(:akey,:aid,:aI' +
        'zmer).anorma)')
    Left = 44
    Top = 398
  end
  object qrAllSavedNorms: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select z.id,z.parent,z.numin, v.fkey key, v.atribnum, v.norma'
      
        'from table(burnar.getnarzad(:keynar,:CodIzmer,:deepLev)) z, burn' +
        'ar.calcnormzad c, burnar.valnormzad v'
      
        'where c.opernarkey=z.key and c.id=z.id and c.parent=z.parent and' +
        ' c.numin=z.numin'
      'and c.key=v.fkey'
      'and v.atribnum<=2 --'#1085#1086#1074#1086#1077' '#1074#1077#1103#1085#1080#1077
      'order by z.skvnum,v.atribnum')
    Left = 40
    Top = 224
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
    StoredProcName = 'BURNAR.ADDONEOPERINNARZAD'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'begin'
      
        '  BURNAR.ADDONEOPERINNARZAD(:NKEY, :OPERKEY, :DATEIN, :APRNUM, :' +
        'RAZDEL, :WHO, :NARZADKEY);'
      'end;')
    Left = 192
    Top = 312
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
        Name = 'NARZADKEY'
        ParamType = ptOutput
      end>
    CommandStoredProcName = 'BURNAR.ADDONEOPERINNARZAD'
  end
  object qrClosed: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select closed from burnar.DEFNARZAD where narkey = :nar')
    Left = 24
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'nar'
        ParamType = ptInput
      end>
  end
  object sClcBegDateNextOp: TPgStoredProc
    StoredProcName = 'BURNAR.CALCBEGDATENEXTOPZAD'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'begin'
      
        '  BURNAR.CALCBEGDATENEXTOPZAD(:AOPNARKEY, :ATIMENORMA, :ARES, :A' +
        'OPCHANGED, :ANEXTDATE);'
      'end;')
    Left = 192
    Top = 368
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
    CommandStoredProcName = 'BURNAR.CALCBEGDATENEXTOPZAD'
  end
  object sMoveRab: TPgStoredProc
    StoredProcName = 'BURNAR.MOVEOPZAD'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'begin'
      '  BURNAR.MOVEOPZAD(:AKEY, :TOPRNUM);'
      'end;')
    Left = 192
    Top = 264
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
    CommandStoredProcName = 'BURNAR.MOVEOPZAD'
  end
  object sORDERNAR: TPgStoredProc
    StoredProcName = 'BURNAR.REORDERNAR_ZADVIP'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'begin'
      '  BURNAR.REORDERNAR_ZADVIP(:ANARKEY, :ATIPNAR);'
      'end;')
    Left = 192
    Top = 112
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
  object sCopyZadToVip: TPgStoredProc
    StoredProcName = 'BURNAR.COPYZADTOVIP'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'begin'
      '  BURNAR.COPYZADTOVIP(:ANARKEY);'
      'end;')
    Left = 192
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ANARKEY'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'BURNAR.COPYZADTOVIP'
  end
  object qrAlgInfo: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select a.ops from operlife o, alg_operlife ao, algs a'
      'where o.id=:oplife and ao.id_operlife=o.id and ao.alg=a.key')
    ObjectView = True
    Left = 620
    Top = 86
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'oplife'
      end>
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
      'order by z.orderv,z.znach')
    ObjectView = True
    Left = 620
    Top = 190
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
  object qrParamZ: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select p.zad_key,'
      '       p.parcode,'
      '       coalesce(up.nm,'#39#39') || coalesce(case e.znach'
      '         when null then'
      '          '#39#39
      '         else'
      '          '#39', '#39' || e.znach'
      '       end,'#39#39') "'#1055#1072#1088#1072#1084#1077#1090#1088'",'
      '       up.type ptype,'
      '       round(p.znach) "'#1050#1086#1076#1047#1085#1072#1095#1077#1085#1080#1103'",'
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
      '                  from burnar.zndefnarzadatrib zn, common_spr c'
      '                 where zn.defnar = :narkey'
      '                   and zn.parcode = c.id'
      '                   and c.normparorzn is not null'
      '                   and c.normparorzn = p.parcode),'
      '                0) isSkv,'
      
        '       case up.type when 1 then trim(to_char(to_number(replace(p' +
        '.znach::text, '#39'.'#39', '#39','#39'),'#39'999999D999'#39'),'#39'FM99999990D99'#39'),'#39','#39')'
      '                    when 2 then'
      '              (select zp.znach'
      '                 from zn_dparam zp'
      '                where zp.key = round(p.znach)) end "'#1047#1085#1072#1095#1077#1085#1080#1077'"'
      '  from burnar.zadanie_param p,'
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
      ' where p.zad_key = :zadkey'
      '   and p.parcode = up.key'
      '   --and e.key(+) = up.edizm'
      '   and ap.key = up.key'
      ' order by ap.prnum')
    ObjectView = True
    Left = 620
    Top = 38
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
        Name = 'zadkey'
      end>
  end
  object ActionList1: TActionList
    Images = frmMain.ImageList1
    OnUpdate = ActionList1Update
    Left = 736
    Top = 144
    object actCalcOperAndSaveRes: TAction
      Category = 'NarZadOpers'
      Caption = 'CalcOper'
      Hint = #1056#1072#1089#1095#1077#1090' '#1085#1086#1088#1084#1099
      ImageIndex = 11
      ShortCut = 16450
      OnExecute = tbCalcOperClick
    end
    object actCreateCopyNarVip: TAction
      Category = 'NarZadOpers'
      Caption = 'actCreateCopyNarVip'
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1087#1091#1089#1090#1086#1077' '#1085#1072#1088#1103#1076'-'#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077
      ImageIndex = 3
      ShortCut = 16452
      OnExecute = tbCreateCopyNarVipClick
    end
    object actExpandNodes: TAction
      Category = 'NarZadOpers'
      Caption = 'actExpandNodes'
      Hint = #1057#1074#1077#1088#1085#1091#1090#1100'/'#1088#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077' '#1091#1079#1083#1099
      ImageIndex = 10
      ShortCut = 16453
      OnExecute = tbExpandNodesClick
    end
    object actAutoWidthCols: TAction
      Category = 'NarZadOpers'
      Caption = 'actAutoWidthCols'
      Hint = #1055#1086#1076#1086#1073#1088#1072#1090#1100' '#1096#1080#1088#1080#1085#1099' '#1082#1086#1083#1086#1085#1086#1082#13#10#1087#1086' '#1076#1083#1080#1085#1077' '#1090#1077#1082#1089#1090#1072
      ImageIndex = 9
      ShortCut = 16460
      OnExecute = tbAutoWidthColsClick
    end
    object actReloadNar: TAction
      Category = 'NarZadOpers'
      Caption = 'actReloadNar'
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 12
      ShortCut = 16466
      OnExecute = tbReloadNarClick
    end
    object actNarToRes: TAction
      Category = 'NarZadOpers'
      Caption = 'actNarToRes'
      Hint = #1053#1072#1088#1103#1076'-'#1079#1072#1076#1072#1085#1080#1077#13#10#1087#1086' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103#1084
      ImageIndex = 20
      ShortCut = 16455
      OnExecute = tbNarToResClick
    end
    object actCloseNarZad: TAction
      Category = 'NarZadOpers'
      Caption = 'actCloseNarZad'
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1079#1072#1076#1072#1085#1080#1077' '#1086#1090' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 14
      ShortCut = 16459
      OnExecute = tbCloseNarZadClick
    end
    object actDelSelOpers: TAction
      Category = 'NarZadOpers'
      Caption = 'actDelSelOpers'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1077' '#1088#1072#1073#1086#1090#1099
      ImageIndex = 15
      ShortCut = 16430
      OnExecute = tbDelSelOpersClick
    end
    object actFindWord: TAction
      Category = 'NarZadOpers'
      Caption = 'actFindWord'
      Hint = #1053#1072#1081#1090#1080' '#1089#1090#1088#1086#1082#1091#13#10#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1087#1086#1083#1077
      ImageIndex = 26
      ShortCut = 16454
      OnExecute = sSpeedButton3Click
    end
    object actSetPlanMoment: TAction
      Category = 'NarZadOpers'
      Caption = 'actSetPlanMoment'
      Enabled = False
      Hint = #1047#1072#1076#1072#1090#1100' '#1087#1083#1072#1085#1080#1088#1091#1077#1084#1099#1077' '#1084#1086#1084#1077#1085#1090#1099#13#10#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103' '#1086#1087#1077#1088#1072#1094#1080#1081
      ImageIndex = 21
      ShortCut = 16461
      Visible = False
    end
    object actSetWorker: TAction
      Category = 'NarZadOpers'
      Caption = 'actSetWorker'
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103
      ImageIndex = 22
      ShortCut = 16471
      OnExecute = SetWorker
    end
    object actReOrderRab: TAction
      Category = 'NarZadOpers'
      Caption = 'actReOrderRab'
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1085#1091#1084#1077#1088#1072#1094#1080#1102' '#1085#1072' '#1076#1072#1085#1085#1086#1084' '#1091#1088#1086#1074#1085#1077
      ImageIndex = 23
      ShortCut = 16463
      OnExecute = tbReOrderRabClick
    end
    object actOpenSkvZad: TAction
      Category = 'NarZadOpers'
      Caption = 'actOpenSkvZad'
      Hint = #1057#1082#1074#1086#1079#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
      ImageIndex = 5
      ShortCut = 16473
      OnExecute = actOpenSkvZadExecute
    end
    object actCutRab: TAction
      Category = 'NarZadOpers'
      Caption = 'actCutRab'
      Hint = #1042#1099#1088#1077#1079#1072#1090#1100' '#1073#1083#1086#1082
      ImageIndex = 45
      ShortCut = 16472
      OnExecute = actCutRabExecute
    end
    object actCopyRab: TAction
      Category = 'NarZadOpers'
      Caption = 'actCopyRab'
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1073#1083#1086#1082
      ImageIndex = 44
      ShortCut = 16451
      OnExecute = actCopyRabExecute
    end
    object actPasteRab: TAction
      Category = 'NarZadOpers'
      Caption = 'actPasteRab'
      Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1073#1083#1086#1082
      ImageIndex = 33
      ShortCut = 16470
      OnExecute = actPasteRabExecute
    end
    object actShowOk: TAction
      Category = 'NarZadOpers'
      Caption = 'actShowOk'
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1087#1077#1088#1082#1072#1088#1090#1091
      ImageIndex = 6
      ShortCut = 16457
      OnExecute = actShowOkExecute
    end
    object actSaveSelElems: TAction
      Category = 'NarZadOpers'
      Caption = 'actSaveSelElems'
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077#13#10#1101#1083#1077#1084#1077#1085#1090#1099' '#1074' '#1073#1072#1079#1077
      ImageIndex = 37
      ShortCut = 8305
    end
    object actSelelColorRow: TAction
      Category = 'NarZadOpers'
      Caption = 'actSelelColorRow'
      Hint = #1042#1099#1076#1077#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091' '#1094#1074#1077#1090#1086#1084
      ImageIndex = 46
      OnExecute = actSelelColorRowExecute
    end
    object actClearColor: TAction
      Category = 'NarZadOpers'
      Caption = 'actClearColor'
      Hint = #1057#1085#1103#1090#1100' '#1074#1089#1077' '#1074#1099#1076#1077#1083#1077#1085#1080#1103' '#1094#1074#1077#1090#1086#1084' '#1074' '#1085#1072#1088#1103#1076#1077
      ImageIndex = 47
      OnExecute = actClearColorExecute
    end
    object actZadanie_add_emptyblock: TAction
      Category = 'NarZadOpers'
      Caption = 'actZadanie_add_emptyblock'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1091#1089#1090#1086#1081' '#1073#1083#1086#1082
      ImageIndex = 48
      OnExecute = actZadanie_add_emptyblockExecute
    end
    object actRenameBlock: TAction
      Category = 'NarZadOpers'
      Caption = 'actRenameBlock'
      Hint = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100' '#1073#1083#1086#1082
      ImageIndex = 49
      OnExecute = actRenameBlockExecute
    end
    object actFontDown: TAction
      Category = 'NarZadOpers'
      Caption = 'actFontDown'
      Hint = #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1096#1088#1080#1092#1090
      ImageIndex = 50
      OnExecute = actFontDownExecute
    end
    object actFontUp: TAction
      Category = 'NarZadOpers'
      Caption = 'actFontUp'
      Hint = #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1096#1088#1080#1092#1090
      ImageIndex = 51
      OnExecute = actFontUpExecute
    end
    object actOpenDefNar: TAction
      Category = 'NarZadOpers'
      Caption = 'actOpenDefNar'
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1085#1072#1088#1103#1076
      ShortCut = 24699
      OnExecute = actOpenDefNarExecute
    end
    object actViewOperInfo: TAction
      Category = 'NarZadOpers'
      Caption = 'actViewOperInfo'
      Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1090#1077#1093#1085#1086#1083#1086#1075#1091
      ShortCut = 24688
      OnExecute = actViewOperInfoExecute
    end
    object actZadanie_del_block: TAction
      Category = 'NarZadOpers'
      Caption = 'actZadanie_del_block'
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1073#1083#1086#1082#1072' '#1073#1077#1079' '#1091#1076#1072#1083#1077#1085#1080#1103' '#1074#1093#1086#1076#1103#1097#1080#1093' '#1088#1072#1073#1086#1090
      ImageIndex = 61
      OnExecute = actZadanie_del_blockExecute
    end
  end
  object sCopyOper: TPgStoredProc
    StoredProcName = 'BURNAR.COPYOPZAD'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'begin'
      '  BURNAR.COPYOPZAD(:ASRCKEY, :TOPRNUM);'
      'end;')
    Left = 368
    Top = 120
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
    CommandStoredProcName = 'BURNAR.COPYOPZAD'
  end
  object qrHtmlOk: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'SELECT DISTINCT i.lnkfile'
      'FROM COALESCE((SELECT op.osnoventer1 '
      '      FROM public.operlife op '
      '      WHERE op.id = :oplife'
      '      ), 0) AS a'
      '     '
      '     ,COALESCE((SELECT o.ist '
      '     FROM  burnar.zadanie_ist o '
      '     WHERE o.zad_key = :operkey), 0) b --1556223273'
      '          '
      '     ,public.istochniki i'
      'WHERE (i.id IN (a)'
      '      OR i.id in (b))'
      '      AND i.lnkfile IS NOT NULL'
      ''
      ''
      '/*'
      
        #1079#1076#1077#1089#1100' (select o.ist from  burnar.zadanie_ist o where o.zad_key =' +
        ' :operkey) b, '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' NULL '#1080' '#1074#1077#1089#1100' '#1079#1072#1087#1088#1086#1089' '#1082#1086#1089#1103#1095#1080#1090':'
      ''
      'select distinct i.lnkfile'
      
        'from (select op.osnoventer1 from public.operlife op where op.id=' +
        ':oplife) a,'
      
        '     (select o.ist from  burnar.zadanie_ist o where o.zad_key = ' +
        ':operkey) b,'
      '     public.istochniki i'
      'where i.id in (a.osnoventer1)'
      '      OR i.id in (b.ist)'
      '*/')
    Left = 624
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'oplife'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'operkey'
        ParamType = ptInput
      end>
  end
  object ColorDialog1: TColorDialog
    Left = 736
    Top = 88
  end
  object sZadanie_Calc_OperP: TPgStoredProc
    StoredProcName = 'BURNAR.ZADANIE_CALC_OPERP'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL BURNAR.ZADANIE_CALC_OPERP(:akey, :aoperlifeid, :aizmer, :no' +
        'rmaed, :normaob, :istochniki, :aot, :ado)')
    Left = 368
    Top = 520
    ParamData = <
      item
        DataType = ftInteger
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
    CommandStoredProcName = 'BURNAR.ZADANIE_CALC_OPERP:0'
  end
  object SZadanie_operac_copy: TPgStoredProc
    StoredProcName = 'BURNAR.Zadanie_operac_copy'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL BURNAR.Zadanie_operac_copy(:key_oper, :parent_oper, :aparen' +
        't_where_copy, :aprnum_where_copy, :anarkey)')
    Left = 368
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'key_oper'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'parent_oper'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
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
    CommandStoredProcName = 'BURNAR.Zadanie_operac_copy:0'
  end
  object sZadanie_operac_move: TPgStoredProc
    StoredProcName = 'BURNAR.Zadanie_operac_move'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL BURNAR.Zadanie_operac_move(:akey, :aparent, :aprnum, :newpa' +
        'rent, :newprnum, :anarkey)')
    Left = 368
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'akey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
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
    CommandStoredProcName = 'BURNAR.Zadanie_operac_move:0'
  end
  object sZADANIE_OPERAC_DEL: TPgStoredProc
    StoredProcName = 'burnar.ZADANIE_OPERAC_DEL'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL burnar.ZADANIE_OPERAC_DEL(:akey, :aparent, :aprnum, :anarke' +
        'y)')
    Left = 368
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'akey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
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
    CommandStoredProcName = 'burnar.ZADANIE_OPERAC_DEL:0'
  end
  object sZADANIE_ADD_EMPTYBLOCK: TPgStoredProc
    StoredProcName = 'BURNAR.ZADANIE_ADD_EMPTYBLOCK'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL BURNAR.ZADANIE_ADD_EMPTYBLOCK(:nkey, :datein, :aparent, :ap' +
        'rnum, :textik, :who)')
    Left = 368
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
        DataType = ftInteger
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
    CommandStoredProcName = 'BURNAR.ZADANIE_ADD_EMPTYBLOCK:0'
  end
  object qrSetNextDateOper: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select key, begoperdate '
      'from burnar.tkeydate'
      'where narkey = :anarkey and os_user = :usr;'
      ''
      ''
      ''
      '')
    Left = 40
    Top = 328
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
  object sZADANIE_RENUMLEVEL: TPgStoredProc
    StoredProcName = 'BURNAR.ZADANIE_RENUMLEVEL'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'CALL BURNAR.ZADANIE_RENUMLEVEL(:aparent, :anarkey)')
    Left = 368
    Top = 313
    ParamData = <
      item
        DataType = ftInteger
        Name = 'aparent'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anarkey'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'BURNAR.ZADANIE_RENUMLEVEL:0'
  end
  object SVIPOLNENIE_CREATE: TPgStoredProc
    StoredProcName = 'burnar.VIPOLNENIE_CREATE'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'CALL burnar.VIPOLNENIE_CREATE(:anarkey)')
    Left = 368
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'anarkey'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'burnar.VIPOLNENIE_CREATE:0'
  end
  object SZADANIE_REBUILD_OPER: TPgStoredProc
    StoredProcName = 'BURNAR.ZADANIE_REBUILD_OPER'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'CALL BURNAR.ZADANIE_REBUILD_OPER(:akey, :anarkey, :aisrebuild)')
    Left = 192
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
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
    CommandStoredProcName = 'BURNAR.ZADANIE_REBUILD_OPER:0'
  end
  object SZADANIE_CLOSENAR: TPgStoredProc
    StoredProcName = 'burnar.ZADANIE_CLOSENAR'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'CALL burnar.ZADANIE_CLOSENAR(:anarkey)')
    Left = 192
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'anarkey'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'burnar.ZADANIE_CLOSENAR:0'
  end
  object SZADANIE_ADD_RAZDEL: TPgStoredProc
    StoredProcName = 'burnar.zadanie_add_razdel'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL burnar.zadanie_add_razdel(:nkey, :datein, :aparent, :aprnum' +
        ', :razdel, :who, :withname)')
    Left = 368
    Top = 408
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
        DataType = ftInteger
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
    CommandStoredProcName = 'burnar.zadanie_add_razdel:0'
  end
  object SZADANIE_OPERAC_DEL_BLOCK: TPgStoredProc
    StoredProcName = 'BURNAR.ZADANIE_OPERAC_DEL_BLOCK'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL BURNAR.ZADANIE_OPERAC_DEL_BLOCK(:akey, :aparent, :aprnum, :' +
        'anarkey)')
    Left = 368
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'akey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
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
    CommandStoredProcName = 'BURNAR.ZADANIE_OPERAC_DEL_BLOCK:0'
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
        'AS Tree from TMP')
    Left = 857
    Top = 213
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 945
    Top = 213
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qrEKS
    Left = 857
    Top = 261
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 945
    Top = 261
  end
end
