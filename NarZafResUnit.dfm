object frmNarZadRes: TfrmNarZadRes
  Left = 616
  Top = 312
  Width = 717
  Height = 543
  Caption = #1053#1072#1088#1103#1076'-'#1079#1072#1076#1072#1085#1080#1077' '#1088#1077#1089#1091#1088#1089#1072
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
    Top = 29
    Width = 701
    Height = 456
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
    Top = 485
    Width = 701
    Height = 19
    Panels = <
      item
        Text = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
        Width = 120
      end
      item
        Width = 80
      end
      item
        Width = 50
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 701
    Height = 29
    Caption = 'ToolBar1'
    Images = frmMain.ImageList1
    TabOrder = 2
    object tbExpandNodes: TToolButton
      Left = 0
      Top = 2
      Hint = #1057#1074#1077#1088#1085#1091#1090#1100'/'#1088#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077' '#1091#1079#1083#1099
      AllowAllUp = True
      Caption = 'ToolButton2'
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      Style = tbsCheck
      OnClick = tbExpandNodesClick
    end
    object tbAutoWidthCols: TToolButton
      Left = 23
      Top = 2
      Hint = #1055#1086#1076#1086#1073#1088#1072#1090#1100' '#1096#1080#1088#1080#1085#1099' '#13#10#1082#1086#1083#1086#1085#1086#1082' '#1087#1086' '#1076#1083#1080#1085#1077' '#1090#1077#1082#1089#1090#1072
      Caption = 'ToolButton3'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      OnClick = tbAutoWidthColsClick
    end
    object tbReloadNar: TToolButton
      Left = 46
      Top = 2
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' ('#1087#1077#1088#1077#1095#1080#1090#1072#1090#1100#13#10#1076#1072#1085#1085#1099#1077' '#1089' '#1089#1077#1088#1074#1077#1088#1072')'
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
      Width = 121
      Height = 22
      TabOrder = 0
    end
    object tbFindWord: TToolButton
      Left = 213
      Top = 2
      Hint = #1053#1072#1081#1090#1080' '#1089#1090#1088#1086#1082#1091
      Caption = 'tbFindWord'
      ImageIndex = 26
      ParentShowHint = False
      ShowHint = True
      OnClick = sSpeedButton3Click
    end
    object tbReOrderRab: TToolButton
      Left = 236
      Top = 2
      Hint = #1055#1077#1088#1077#1085#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1088#1072#1073#1086#1090#1099
      Caption = 'tbReOrderRab'
      ImageIndex = 23
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = tbReOrderRabClick
    end
  end
  object qrNarZad: TPgQuery
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
      '  table (burnar.GetNarZad(:keynar,:CodIzmer,:deepLev))  t'
      'where '
      '  t.whowork=:worker')
    Left = 96
    Top = 256
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
    Left = 256
    Top = 256
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
    Left = 548
    Top = 238
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
      'select z.id,z.parent,z.numin, v.fkey key, v.atribnum, v.norma '
      
        'from table(burnar.getnarzad(:keynar,:CodIzmer,:deepLev)) z, burn' +
        'ar.calcnormzad c, burnar.valnormzad v'
      
        'where whowork=:worker and c.opernarkey=z.key and c.id=z.id and c' +
        '.parent=z.parent and c.numin=z.numin'
      'and c.key=v.fkey'
      'and v.atribnum<=2 --'#1085#1086#1074#1086#1077' '#1074#1077#1103#1085#1080#1077
      'order by z.skvnum --v.fkey, v.atribnum')
    Left = 256
    Top = 192
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
    StoredProcName = 'BURNAR.ADDONEOPERINNARZAD'
    Connection = frmMain.MConnection
    SQL.Strings = (
      'begin'
      
        '  BURNAR.ADDONEOPERINNARZAD(:NKEY, :OPERKEY, :DATEIN, :APRNUM, :' +
        'RAZDEL, :WHO, :NARZADKEY);'
      'end;')
    Left = 384
    Top = 223
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
      'select closed from BURNAR.DEFNARZAD where narkey = :nar')
    Left = 256
    Top = 144
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
    Left = 384
    Top = 268
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
    Left = 384
    Top = 175
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
    Left = 384
    Top = 129
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
    Left = 384
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ANARKEY'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'BURNAR.COPYZADTOVIP'
  end
end
