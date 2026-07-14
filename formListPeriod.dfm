object frmListPeriod: TfrmListPeriod
  Left = 496
  Top = 380
  Width = 740
  Height = 453
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1077#1088#1080#1086#1076#1086#1074' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1088#1072#1073#1086#1090':'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    724
    414)
  PixelsPerInch = 96
  TextHeight = 13
  object grListPeriod: TOVNIDbGrid
    Left = 0
    Top = 24
    Width = 729
    Height = 356
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goColMoving]
    AutoSizeRowsHeight = True
    FixRowsAutoNum = True
    NumberFormat = '%-10.2f'
    CellSelectColor = clHighlight
    SelectCurRowColor = clSkyBlue
    SelectCurColColor = clSkyBlue
    CellSelectColorFont = clBlack
  end
  object BitBtn1: TBitBtn
    Left = 320
    Top = 384
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 724
    Height = 26
    AutoSize = True
    Caption = 'ToolBar1'
    Images = frmMain.ImageList1
    TabOrder = 2
    object Edit1: TEdit
      Left = 0
      Top = 2
      Width = 170
      Height = 22
      Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1090#1088#1086#1082#1091' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ToolButton1: TToolButton
      Left = 170
      Top = 2
      Hint = #1053#1072#1081#1090#1080' '#1089#1090#1088#1086#1082#1091
      ImageIndex = 26
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 193
      Top = 2
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1077#1088#1080#1086#1076
      ImageIndex = 54
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton2Click
    end
    object ToolButton3: TToolButton
      Left = 216
      Top = 2
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
      ImageIndex = 56
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton3Click
    end
    object ToolButton4: TToolButton
      Left = 239
      Top = 2
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1077#1088#1080#1086#1076
      ImageIndex = 57
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton4Click
    end
  end
  object qrPeriods: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select t.nm, t.begoperdate, t.outoperdate, t.key '
      'from burnar.vipolnenie_period t'
      'where t.narkey=:keynar'
      'order by t.begoperdate, t.outoperdate')
    Left = 288
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'keynar'
      end>
  end
end
