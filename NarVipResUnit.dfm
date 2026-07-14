object frmNarVipRes: TfrmNarVipRes
  Left = 308
  Top = 300
  Width = 758
  Height = 558
  Caption = #1053#1072#1088#1103#1076'-'#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077' '#1088#1077#1089#1091#1088#1089#1072
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
  OnClose = FormClose
  OnCreate = FormCreate
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
  object trGrdNar: TOVNIDbTreeGrid
    Left = 0
    Top = 25
    Width = 742
    Height = 472
    Align = alClient
    Ctl3D = False
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goColMoving]
    OnMouseDown = trGrdNarMouseDown
    OnDragOver = trGrdNarDragOver
    OnKeyDown = trGrdNarKeyDown
    OnDragDrop = trGrdNarDragDrop
    AutoSizeRowsHeight = True
    FixRowsAutoNum = True
    MinRowHeight = 15
    NumberFormat = '%-10.2f'
    CellSelectColor = clHighlight
    SelectCurRowColor = clSkyBlue
    SelectCurColColor = clSkyBlue
    CellSelectColorFont = clBlack
    RowHeights = (
      15
      15
      15
      15
      15)
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 497
    Width = 742
    Height = 22
    Panels = <
      item
        Text = #1053#1086#1088#1084#1072#1090#1080#1074#1085#1072#1103' '#1087#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
        Width = 190
      end
      item
        Width = 80
      end
      item
        Width = 50
      end
      item
        Text = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103' '#1087#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
        Width = 190
      end
      item
        Width = 80
      end
      item
        Text = #1084#1080#1085
        Width = 50
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 742
    Height = 25
    Caption = 'ToolBar1'
    Images = frmMain.ImageList1
    TabOrder = 2
    object tbExpandNodes: TToolButton
      Left = 0
      Top = 2
      Hint = #1057#1074#1077#1088#1085#1091#1090#1100'/'#1088#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077' '#1091#1079#1083#1099
      Caption = 'tbExpandNodes'
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      OnClick = tbExpandNodesClick
    end
    object tbAutoWidthCols: TToolButton
      Left = 23
      Top = 2
      Hint = #1055#1086#1076#1086#1073#1088#1072#1090#1100' '#1096#1080#1088#1080#1085#1099' '
      Caption = 'tbAutoWidthCols'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      OnClick = tbAutoWidthColsClick
    end
    object tbReloadNar: TToolButton
      Left = 46
      Top = 2
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' ('#1087#1077#1088#1077#1095#1080#1090#1072#1090#1100
      Caption = 'tbReloadNar'
      ImageIndex = 12
      ParentShowHint = False
      ShowHint = True
      OnClick = tbReloadNarClick
    end
    object tbDelSelOpers: TToolButton
      Left = 69
      Top = 2
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1077' '#1088#1072#1073#1086#1090#1099
      Caption = 'tbDelSelOpers'
      ImageIndex = 15
      ParentShowHint = False
      ShowHint = True
      OnClick = tbDelSelOpersClick
    end
    object Edit1: TEdit
      Left = 92
      Top = 2
      Width = 141
      Height = 22
      TabOrder = 0
    end
    object tbFindWord: TToolButton
      Left = 233
      Top = 2
      Hint = #1053#1072#1081#1090#1080' '#1089#1090#1088#1086#1082#1091
      Caption = 'tbFindWord'
      ImageIndex = 26
      ParentShowHint = False
      ShowHint = True
      OnClick = sSpeedButton3Click
    end
    object tbReOrderRab: TToolButton
      Left = 256
      Top = 2
      Hint = #1055#1077#1088#1077#1085#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1088#1072#1073#1086#1090#1099
      Caption = 'tbReOrderRab'
      ImageIndex = 23
      OnClick = tbReOrderRabClick
    end
  end
  object qrNarVip: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select '
      '  t.key'
      '  ,prnum'
      '  ,operkey'
      '  ,t.id'
      '  ,t.parent'
      '  --,t.ind'
      '  ,numin'
      '  ,opernm'
      '  ,dateenter'
      '  ,dateout'
      '  ,begoperdate'
      '  ,istnorm'
      '  ,whowork'
      '  ,proizvodit'
      '  ,volume'
      '  ,findnormtype'
      'from '
      '  table (burnar.GetNarVip(:keynar,:CodIzmer,:deepLev))  t'
      'where '
      '  t.whowork=:worker')
    Left = 80
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'keynar'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CodIzmer'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'deepLev'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'worker'
      end>
  end
  object qrNormAtribName: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'select c.atribname||'#39', '#39'||s.znach "'#1057#1086#1089#1090#1072#1074'", c.prnum, s.znach edi' +
        'zm'
      'from exper.cfg_izmer c, exper.spr_edizm s'
      'where izmer=:CodIzmer and s.key=c.edizm'
      'and c.prnum<=2 --'#1085#1086#1074#1086#1077' '#1074#1077#1103#1085#1080#1077
      'order by c.prnum')
    Left = 240
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodIzmer'
      end>
  end
  object qrCalcNorma: TPgQuery
    Connection = frmMain.MConnection
    ParamCheck = False
    SQL.Strings = (
      'select norma,key,prnum'
      'from table(exper.CALCNORMA( &oplifeid, &ContPars ))')
    Left = 524
    Top = 206
    MacroData = <
      item
        Name = 'oplifeid'
      end
      item
        Name = 'ContPars'
      end>
  end
  object qrAllSavedNorms: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'select z.id,z.parent,z.numin, v.fkey key, v.atribnum, v.norma, v' +
        '.fact'
      
        'from table(burnar.getnarvip(:keynar,:CodIzmer,:deepLev)) z, burn' +
        'ar.calcnormvip c, burnar.valnormvipfact v'
      
        'where whowork=:worker and c.opernarkey=z.key and c.id=z.id and c' +
        '.parent=z.parent and c.numin=z.numin'
      'and c.key=v.fkey'
      'and v.atribnum<=2 --'#1085#1086#1074#1086#1077' '#1074#1077#1103#1085#1080#1077
      'order by z.skvnum')
    Left = 240
    Top = 160
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
      end
      item
        DataType = ftUnknown
        Name = 'worker'
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
    Left = 368
    Top = 193
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
      'select closed from BURNAR.DEFNARVIP where narkey = :nar')
    Left = 240
    Top = 128
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
    Left = 368
    Top = 242
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
    Left = 368
    Top = 140
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
    Left = 368
    Top = 88
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
end
