object frmStructNar: TfrmStructNar
  Left = 925
  Top = 81
  Width = 661
  Height = 693
  BorderStyle = bsSizeToolWin
  Caption = #1050#1072#1090#1072#1083#1086#1075' '#1090#1077#1084#1072#1090#1080#1095#1077#1089#1082#1080#1093' '#1088#1072#1079#1076#1077#1083#1086#1074
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 654
    Align = alClient
    TabOrder = 0
    object Catalog: TOVNIDbTreeGrid
      Left = 1
      Top = 33
      Width = 643
      Height = 566
      Align = alCustom
      Ctl3D = False
      FixedCols = 0
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goColMoving]
      OnMouseDown = CatalogMouseDown
      AutoSizeRowsHeight = True
      MinRowHeight = 15
      NumberFormat = '%-10.0f'
      CellSelectColor = clSkyBlue
      SelectCurRowColor = clSkyBlue
      SelectCurColColor = clSkyBlue
      OnTitleClick = CatalogTitleClick
      CellSelectColorFont = clBlack
      ColWidths = (
        64
        64
        64
        64
        64)
      RowHeights = (
        15
        15
        15
        15
        15)
    end
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 643
      Height = 29
      ButtonHeight = 26
      Caption = 'ToolBar1'
      Images = frmMain.ImageList1
      TabOrder = 1
      object Edit1: TEdit
        Left = 0
        Top = 2
        Width = 121
        Height = 26
        TabOrder = 1
      end
      object ToolButton1: TToolButton
        Left = 121
        Top = 2
        Caption = 'ToolButton1'
        ImageIndex = 26
        OnClick = sSpeedButton3Click
      end
      object ToolButton2: TToolButton
        Left = 144
        Top = 2
        Caption = 'ToolButton2'
        ImageIndex = 10
        OnClick = sSpeedButton1Click
      end
      object ToolButton3: TToolButton
        Left = 167
        Top = 2
        Caption = 'ToolButton3'
        ImageIndex = 9
        OnClick = sSpeedButton2Click
      end
      object ToolButton4: TToolButton
        Left = 190
        Top = 2
        Hint = #1047#1072#1076#1072#1085#1080#1077
        Caption = 'ToolButton4'
        DropdownMenu = PMaddToZad
        ImageIndex = 44
        ParentShowHint = False
        PopupMenu = PMaddToZad
        ShowHint = True
        Style = tbsDropDown
      end
      object ToolButton7: TToolButton
        Left = 228
        Top = 2
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 236
        Top = 2
        Hint = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1077
        Caption = 'ToolButton5'
        DropdownMenu = PMaddToVip
        ImageIndex = 44
        ParentShowHint = False
        PopupMenu = PMaddToVip
        ShowHint = True
        Style = tbsDropDown
      end
      object ToolButton6: TToolButton
        Left = 274
        Top = 2
        Width = 95
        Caption = 'ToolButton6'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object Label1: TLabel
        Left = 369
        Top = 2
        Width = 94
        Height = 26
        Alignment = taCenter
        Caption = #1044#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1086#1087#1077#1088#1072#1094#1080#1080
        WordWrap = True
      end
      object DateTimePicker1: TDateTimePicker
        Left = 463
        Top = 2
        Width = 176
        Height = 26
        Date = 41099.600958287040000000
        Format = 'dd.MM.yyyy'
        Time = 41099.600958287040000000
        TabOrder = 0
      end
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 634
      Width = 643
      Height = 19
      Panels = <
        item
          Width = 50
        end>
    end
    object BitBtnResult: TBitBtn
      Left = 291
      Top = 605
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 3
      Glyph.Data = {
        }
      NumGlyphs = 2
    end
  end
  object qrStructNar: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'WITH RECURSIVE TMP AS'
      '('
      'select t.id,'
      '       t.parent_id,'
      '       case when t.oper is null then t.nm else s.nm end nm,'
      '       t.oper,'
      '       t.ord,'
      '       t.NARTYPE,'
      
        '       ARRAY[(row_number() OVER (PARTITION BY t.parent_id ORDER ' +
        'BY t.ord))::integer] AS ord2'
      'from public.tematic_razdel t'
      '     left join public.spr_oper s on t.oper = s.key'
      'where t.id = :parId '
      'union all'
      'select t.id,'
      '       t.parent_id,'
      '       case when t.oper is null then t.nm else s.nm end nm,'
      '       t.oper,'
      '       t.ord,'
      '       t.NARTYPE,'
      
        '       tmp.ord2 || ARRAY[(row_number() OVER (PARTITION BY t.pare' +
        'nt_id ORDER BY t.ord))::integer] AS ord2'
      'from public.tematic_razdel t'
      '     left join public.spr_oper s on t.oper = s.key, tmp'
      'where tmp.id = t.parent_id '
      ')'
      'select tmp.id "'#1050#1086#1076' '#1088#1072#1079#1076#1077#1083#1072'",'
      '       tmp.parent_id,'
      '       tmp.nm "'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'",'
      '       tmp.oper "'#1050#1086#1076' '#1086#1087#1077#1088#1072#1094#1080#1080'",'
      '       tmp.ord,'
      '       tmp.NARTYPE '
      'from tmp'
      'order by ord2')
    Left = 64
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'parId'
      end>
  end
  object qrGetStructNarRoot: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'WITH RECURSIVE TMP AS'
      '('
      'select t.id,'
      '       t.NARTYPE'
      'from public.tematic_razdel t'
      'where t.parent_id = 1'
      '      and t.id = :Id'
      'union all'
      'select t.id,'
      '       t.NARTYPE'
      'from public.tematic_razdel t, tmp'
      'where tmp.id = t.parent_id '
      ')'
      'select tmp.* '
      'from tmp')
    Left = 160
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id'
      end>
  end
  object PMaddToZad: TPopupMenu
    Left = 304
    Top = 336
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1077#1088#1077#1076' '#1090#1077#1082#1091#1097#1077#1081' '#1086#1087#1077#1088#1072#1094#1080#1077#1081
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1082#1086#1085#1077#1094' '#1088#1072#1079#1076#1077#1083#1072
      OnClick = N2Click
    end
    object N5: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1091#1089#1090#1086#1081' '#1088#1072#1079#1076#1077#1083
      OnClick = N5Click
    end
  end
  object PMaddToVip: TPopupMenu
    Left = 368
    Top = 256
    object N3: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1077#1088#1077#1076' '#1090#1077#1082#1091#1097#1077#1081' '#1086#1087#1077#1088#1072#1094#1080#1077#1081
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1082#1086#1085#1077#1094' '#1088#1072#1079#1076#1077#1083#1072
      OnClick = N4Click
    end
    object N6: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1091#1089#1090#1086#1081' '#1088#1072#1079#1076#1077#1083
      OnClick = N6Click
    end
  end
end
