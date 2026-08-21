object frmSprdolj_list: TfrmSprdolj_list
  Left = 297
  Top = 223
  Width = 857
  Height = 727
  ActiveControl = DBGrid1
  BorderStyle = bsSizeToolWin
  Caption = 'C'#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 841
    Height = 633
    Align = alClient
    DataSource = dsSpr_Typ
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'key'
        Title.Caption = #1050#1086#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nm'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 403
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rank'
        Title.Caption = #1056#1072#1079#1088#1103#1076', '#1082#1072#1090#1077#1075#1086#1088#1080#1103
        Width = 170
        Visible = True
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 841
    Height = 36
    ButtonHeight = 30
    ButtonWidth = 31
    Caption = 'ToolBar1'
    EdgeInner = esNone
    EdgeOuter = esNone
    Images = frmMain.ImageList1
    TabOrder = 1
    DesignSize = (
      841
      36)
    object ToolButton7: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 8
      Top = 2
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
      ImageIndex = 60
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 39
      Top = 2
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      DragKind = dkDock
      ImageIndex = 71
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton2Click
    end
    object ToolButton3: TToolButton
      Left = 70
      Top = 2
      Caption = 'ToolButton3'
      ImageIndex = 70
      OnClick = ToolButton3Click
    end
    object ToolButton8: TToolButton
      Left = 101
      Top = 2
      Width = 275
      Caption = 'ToolButton11'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object BitBtn2: TBitBtn
      Left = 376
      Top = 2
      Width = 85
      Height = 30
      Hint = #1047#1072#1082#1088#1099#1090#1100
      Anchors = [akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn2Click
      Kind = bkClose
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 669
    Width = 841
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object PopupMenu1: TPopupMenu
    Images = frmMain.ImageList1
    Left = 96
    Top = 128
    object N5: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1090#1080#1087#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      ImageIndex = 0
    end
    object N6: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1080#1087#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      ImageIndex = 1
    end
    object N7: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1090#1080#1087#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      ImageIndex = 2
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
      Hint = 'C'#1087#1088#1072#1074#1086#1095#1085#1080#1082
      ImageIndex = 25
    end
  end
  object qrySpr_typ: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select s.key, s.nm, s.rank from burnar.sprdoljnost s'
      'order by 1')
    Left = 80
    Top = 216
  end
  object dsSpr_Typ: TDataSource
    DataSet = qrySpr_typ
    OnDataChange = dsSpr_TypDataChange
    Left = 24
    Top = 248
  end
end
