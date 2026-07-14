object frmSetOptions: TfrmSetOptions
  Left = 518
  Top = 198
  Width = 772
  Height = 957
  Caption = #1054#1082#1085#1086' '#1085#1072#1089#1090#1088#1086#1077#1082' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  Icon.Data = {
    }
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 216
    Top = 0
    Height = 877
  end
  object MainPanel: TPanel
    Left = 219
    Top = 0
    Width = 537
    Height = 877
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object EdizmPanel: TPanel
      Left = 45
      Top = 30
      Width = 450
      Height = 140
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 83
        Height = 13
        Caption = #1053#1086#1088#1084#1099' '#1074#1088#1077#1084#1077#1085#1080
      end
      object scbEdIzm: TComboBox
        Left = 104
        Top = 24
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = #1063#1072#1089#1099
      end
    end
    object GlobalSettingPanel: TPanel
      Left = 0
      Top = 0
      Width = 537
      Height = 809
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 0
        Top = 461
        Width = 535
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object Panel1: TPanel
        Left = 0
        Top = 464
        Width = 535
        Height = 343
        Align = alBottom
        TabOrder = 0
        DesignSize = (
          535
          343)
        object Label2: TLabel
          Left = 7
          Top = 4
          Width = 147
          Height = 13
          Caption = #1047#1072#1087#1091#1089#1082' '#1074#1085#1077#1096#1085#1080#1093' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1081
        end
        object Label4: TLabel
          Left = 6
          Top = 278
          Width = 189
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = #1055#1091#1090#1100' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1086#1087#1077#1088#1072#1094#1080#1086#1085#1085#1099#1093' '#1082#1072#1088#1090':'
        end
        object StringGrid1: TStringGrid
          Left = 7
          Top = 21
          Width = 520
          Height = 252
          Align = alCustom
          Anchors = [akLeft, akTop, akRight, akBottom]
          ColCount = 2
          DefaultRowHeight = 16
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
          PopupMenu = PopupMenu1
          TabOrder = 0
          ColWidths = (
            237
            305)
        end
        object sEdHtmlPath: TEdit
          Left = 7
          Top = 293
          Width = 520
          Height = 19
          Anchors = [akLeft, akBottom]
          TabOrder = 1
        end
        object sCheckBox4: TCheckBox
          Left = 9
          Top = 317
          Width = 496
          Height = 17
          Caption = 'A'#1074#1090#1086#1084#1072#1089#1096#1090#1072#1073#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1086#1076' '#1083#1102#1073#1086#1077' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1077' '#1101#1082#1088#1072#1085#1072
          TabOrder = 2
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 535
        Height = 461
        Align = alClient
        TabOrder = 1
        DesignSize = (
          535
          461)
        object Label5: TLabel
          Left = 10
          Top = 6
          Width = 234
          Height = 13
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel1: TBevel
          Left = -1
          Top = 168
          Width = 538
          Height = 9
          Anchors = [akLeft, akTop, akRight]
          Shape = bsTopLine
        end
        object Label6: TLabel
          Left = 5
          Top = 175
          Width = 143
          Height = 13
          Caption = #1055#1091#1090#1080' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1073#1080#1073#1083#1080#1086#1090#1077#1082':'
        end
        object BitBtn1: TBitBtn
          Left = 0
          Top = 419
          Width = 537
          Height = 40
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1087#1091#1090#1100' '#1087#1086#1080#1089#1082#1072
          Caption = #1059#1076#1072#1083#1080#1090#1100
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = sSpeedButton4Click
        end
        object lstboxPath: TListBox
          Left = 7
          Top = 216
          Width = 519
          Height = 202
          Anchors = [akLeft, akTop, akRight, akBottom]
          ItemHeight = 13
          Items.Strings = (
            'ert'
            'erterter'
            'bbc'
            'vbcv'
            'bvb'
            'xcv'
            'bvcb'
            'cvbvcb'
            'cvb'
            'cvb'
            'cvb'
            'cvbcv'
            'bxcv'
            'bvcbbbvc'
            '')
          TabOrder = 1
        end
        object LabeledEdit1: TLabeledEdit
          Left = 133
          Top = 27
          Width = 310
          Height = 19
          EditLabel.Width = 119
          EditLabel.Height = 13
          EditLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
          LabelPosition = lpLeft
          TabOrder = 2
        end
        object LabeledEdit2: TLabeledEdit
          Left = 133
          Top = 51
          Width = 310
          Height = 19
          EditLabel.Width = 96
          EditLabel.Height = 13
          EditLabel.Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
          LabelPosition = lpLeft
          TabOrder = 3
        end
        object LabeledEdit3: TLabeledEdit
          Left = 133
          Top = 75
          Width = 310
          Height = 19
          EditLabel.Width = 38
          EditLabel.Height = 13
          EditLabel.Caption = #1055#1072#1088#1086#1083#1100
          LabelPosition = lpLeft
          PasswordChar = '*'
          TabOrder = 4
        end
        object sCheckBox3: TCheckBox
          Left = 12
          Top = 104
          Width = 430
          Height = 17
          Hint = #1055#1086#1079#1074#1086#1083#1103#1077#1090' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1080#1084#1103' '#1080' '#1087#1072#1088#1086#1083#1100
          Caption = 
            #1042#1082#1083#1102#1095#1080#1090#1100' '#1088#1077#1078#1080#1084' '#1076#1086#1084#1077#1085#1085#1086#1081' ('#1086#1087#1077#1088#1072#1094#1080#1086#1085#1085#1086#1081') '#1072#1091#1090#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077 +
            #1083#1103' '
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object sCheckBox1: TCheckBox
          Left = 12
          Top = 126
          Width = 430
          Height = 17
          Hint = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1074#1099#1095#1080#1089#1083#1077#1085#1085#1086#1081' '#1085#1086#1088#1084#1099
          Caption = #1040#1074#1090#1086#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1088#1072#1089#1095#1080#1090#1072#1085#1085#1086#1081' '#1085#1086#1088#1084#1099
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
        end
        object chBAutoCalcBegOperDate: TCheckBox
          Left = 12
          Top = 147
          Width = 430
          Height = 17
          Hint = #1052#1086#1084#1077#1085#1090' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103' '#1084#1086#1078#1077#1090' '#1086#1087#1088#1077#1076#1077#1083#1103#1090#1100' '#1082#1072#1082' '#1089#1090#1088#1091#1082#1090#1091#1088#1091
          Caption = 
            #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1074#1099#1095#1080#1089#1083#1103#1077#1090' '#1084#1086#1084#1077#1085#1090' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091' ' +
            #1073#1083#1086#1082#1072' '#1086#1087#1077#1088#1072#1094#1080#1080
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
        end
        object edNewPath: TEdit
          Left = 6
          Top = 192
          Width = 404
          Height = 19
          TabOrder = 8
        end
        object BitBtn2: TBitBtn
          Left = 413
          Top = 189
          Width = 25
          Height = 25
          Caption = '...'
          TabOrder = 9
          OnClick = SpeedButton3Click
        end
        object BitBtn3: TBitBtn
          Left = 442
          Top = 189
          Width = 83
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 10
          OnClick = sSpeedButton3Click
        end
      end
    end
  end
  object OptionsTreeView: TTreeView
    Left = 0
    Top = 0
    Width = 216
    Height = 877
    Align = alLeft
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = True
    HideSelection = False
    Indent = 19
    ParentCtl3D = False
    TabOrder = 1
    Items.Data = {
      010000001E0000000000000000000000FFFFFFFFFFFFFFFF0000000001000000
      05CEEFF6E8E82A0000000000000000000000FFFFFFFFFFFFFFFF000000000000
      000011C5E4E8EDE8F6FB20E8E7ECE5F0E5EDE8E9}
  end
  object Panel2: TPanel
    Left = 0
    Top = 877
    Width = 756
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnOk: TBitBtn
      Left = 9
      Top = 8
      Width = 75
      Height = 25
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      Caption = #1043#1086#1090#1086#1074#1086
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TBitBtn
      Left = 93
      Top = 8
      Width = 75
      Height = 25
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1085#1072#1089#1090#1088#1086#1077#1082','
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnApply: TBitBtn
      Left = 179
      Top = 8
      Width = 75
      Height = 25
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ApplyChanges
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 669
    Top = 48
    object N1: TMenuItem
      Caption = #1053#1086#1074#1086#1077' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1077
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1077#1077
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1091#1090#1100
      OnClick = N4Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 603
    Top = 40
  end
end
