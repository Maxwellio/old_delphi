object FrmIerarh: TFrmIerarh
  Left = 888
  Top = 279
  Width = 525
  Height = 681
  BorderStyle = bsSizeToolWin
  Caption = #1054#1073#1097#1080#1081' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 509
    Height = 30
    Align = alTop
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 507
      Height = 29
      Caption = 'ToolBar1'
      Images = frmMain.ImageList1
      TabOrder = 0
      object Edit5: TEdit
        Left = 0
        Top = 2
        Width = 121
        Height = 22
        Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1090#1088#1086#1082#1091' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object ToolButton2: TToolButton
        Left = 121
        Top = 2
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 129
        Top = 2
        Hint = #1053#1072#1095#1072#1090#1100' '#1087#1086#1080#1089#1082
        Caption = 'ToolButton1'
        ImageIndex = 26
        ParentShowHint = False
        ShowHint = True
        OnClick = FindButton1Click
      end
      object ToolButton3: TToolButton
        Left = 152
        Top = 2
        Hint = #1064#1080#1088#1080#1085#1099' '#1082#1086#1083#1086#1085#1086#1082' '#1087#1086' '#1076#1083#1080#1085#1077' '#1090#1077#1082#1089#1090#1072
        Caption = 'ToolButton3'
        ImageIndex = 9
        OnClick = N8Click
      end
      object ToolButton4: TToolButton
        Left = 175
        Top = 2
        Hint = #1057#1074#1077#1088#1085#1091#1090#1100'/'#1088#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077' '#1091#1079#1083#1099
        Caption = 'ToolButton4'
        ImageIndex = 10
        OnClick = sSpeedButton3Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 594
    Width = 509
    Height = 48
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 215
      Top = 2
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 28
      Width = 507
      Height = 19
      Panels = <
        item
          Width = 50
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 30
    Width = 509
    Height = 564
    Align = alClient
    TabOrder = 2
    object GvDbTreeGrid1: TOVNIDbTreeGrid
      Left = 1
      Top = 1
      Width = 507
      Height = 562
      Align = alClient
      Ctl3D = False
      FixedCols = 0
      ParentCtl3D = False
      TabOrder = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goColMoving, goRowSelect]
      ColCount = 3
      RowCount = 2
      AutoSizeRowsHeight = True
      FixRowsAutoNum = True
      MinRowHeight = 16
      NumberFormat = '%-4.0f'
      CellSelectColor = clHighlight
      SelectCurRowColor = clSkyBlue
      SelectCurColColor = clSkyBlue
      OnTitleClick = GvDbTreeGrid1TitleClick
      CellSelectColorFont = clWhite
      ColWidths = (
        64
        29
        356)
    end
  end
  object qrSprCommon: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'with recursive tmp as ('
      
        '                       select c.id, c.nm, c.ops,c.parent_id, c.o' +
        'rd,'
      
        '                       ARRAY[(row_number() OVER (PARTITION BY c.' +
        'parent_id'
      
        '                                   ORDER BY c.ord))::integer] AS' +
        ' ord2'
      '                       from common_spr c'
      '                       where c.parent_id = :val'
      '                       union all'
      
        '                       select c.id, c.nm, c.ops,c.parent_id, c.o' +
        'rd,'
      
        '                       (tmp.ord2 || ARRAY[(row_number() OVER (PA' +
        'RTITION BY c.parent_id'
      
        '                                   ORDER BY c.ord))::integer]) A' +
        'S ord2'
      '                       from common_spr c, tmp'
      '                       where tmp.id=c.parent_id'
      '                       )'
      
        'select tmp.id "'#1050#1086#1076'", tmp.nm "'#1047#1085#1072#1095#1077#1085#1080#1077'", tmp.ops "'#1054#1087#1080#1089#1072#1085#1080#1077'", tmp.' +
        'parent_id "'#1050#1086#1076#1055#1088#1077#1076#1082#1072'", tmp.ord "'#1055#1086#1088#1103#1076#1086#1082'" '
      'from tmp'
      'order by tmp.ord2')
    Left = 192
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'val'
      end>
  end
end
