object frmMehBurIntervals: TfrmMehBurIntervals
  Left = 940
  Top = 411
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1080#1085#1090#1077#1088#1074#1072#1083#1086#1074
  ClientHeight = 645
  ClientWidth = 783
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 783
    Height = 645
    ActivePage = TabMB
    Align = alClient
    TabOrder = 0
    object TabMB: TTabSheet
      Caption = #1052#1077#1093'.'#1041#1091#1088#1077#1085#1080#1077
      object Panel2: TPanel
        Left = 0
        Top = 580
        Width = 775
        Height = 37
        Align = alBottom
        TabOrder = 0
        object BitBtn1: TBitBtn
          Left = 343
          Top = 6
          Width = 75
          Height = 25
          Caption = 'OK'
          ModalResult = 1
          TabOrder = 0
        end
      end
      object GrMehInt: TOVNIDbGrid
        Left = -15
        Top = 0
        Width = 790
        Height = 577
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clWhite
        TabOrder = 1
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goColMoving]
        AutoSizeRowsHeight = True
        FixRowsAutoNum = True
        NumberFormat = '%-10.2f'
        CellSelectColor = clHighlight
        SelectCurRowColor = clSkyBlue
        SelectCurColColor = clSkyBlue
        CellSelectColorFont = clBlack
        RowHeights = (
          16
          16
          16
          16
          16)
      end
    end
    object Tabnar: TTabSheet
      Caption = #1053#1072#1088#1072#1097#1080#1074#1072#1085#1080#1077
      ImageIndex = 1
      object GrNarInt: TOVNIDbGrid
        Left = -8
        Top = 0
        Width = 790
        Height = 577
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clWhite
        TabOrder = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goColMoving]
        AutoSizeRowsHeight = True
        FixRowsAutoNum = True
        NumberFormat = '%-10.2f'
        CellSelectColor = clHighlight
        SelectCurRowColor = clSkyBlue
        SelectCurColColor = clSkyBlue
        CellSelectColorFont = clBlack
        RowHeights = (
          16
          16
          16
          16
          16)
      end
      object Panel1: TPanel
        Left = 0
        Top = 580
        Width = 775
        Height = 37
        Align = alBottom
        TabOrder = 1
        object BitBtn2: TBitBtn
          Left = 333
          Top = 6
          Width = 75
          Height = 25
          Caption = 'OK'
          ModalResult = 1
          TabOrder = 0
        end
      end
    end
  end
  object qrMehBurInt: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select d.KEY NARKEY, '
      '       vo.KEY as KEY, '
      '       vo.PRNUM, '
      '       max( so.NM ) NM, '
      '       max( ( case when vp.PARCODE = 747 '
      '                     then znach '
      '                   else'
      '                     null '
      '              end ) ) OT, '
      '       max( ( case when vp.PARCODE = 748 '
      '                     then znach '
      '                   else'
      '                     null '
      '              end ) ) as DO, '
      '       burnar.GetRabMehBurIntervals( d.KEY, vo.KEY ) COLORSEL '
      'from burnar.DEFNAR d, '
      '     burnar.VIPOLNENIE_OPER vo, '
      '     burnar.VIPOLNENIE_PARAM vp, '
      '     public.SPR_OPER so '
      
        'where d.KEY = vo.NARKEY and vo.OPER = so.KEY and vo.OPERLIFETYPE' +
        'OPER = 203 and vo.KEY = vp.VIP_KEY and vp.PARCODE in ( 747, 748 ' +
        ') and d.KEY = :keynar '
      'group by d.KEY, vo.KEY, vo.PRNUM '
      'order by ot, vo.PRNUM')
    Left = 528
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'keynar'
      end>
  end
  object qrNarInt: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select d.KEY NARKEY, '
      '       vo.KEY as KEY, '
      '       vo.PRNUM, '
      '       max( so.NM ) NM, '
      '       max( ( case when vp.PARCODE = 747 '
      '                     then znach '
      '                   when vp.PARCODE = 1073 '
      '                     then znach '
      '                   else'
      '                     null '
      '              end ) ) OT, '
      '       max( ( case when vp.PARCODE = 748 '
      '                     then znach '
      '                   when vp.PARCODE = 1074 '
      '                     then znach '
      '                   else'
      '                     null '
      '              end ) ) as DO, '
      '       burnar.GetRabNarIntervals( d.KEY, vo.KEY ) COLORSEL '
      'from burnar.DEFNAR d, '
      '     burnar.VIPOLNENIE_OPER vo, '
      '     burnar.VIPOLNENIE_PARAM vp, '
      '     public.SPR_OPER so '
      
        'where d.KEY = vo.NARKEY and vo.OPER = so.KEY and vo.OPERLIFETYPE' +
        'OPER = 213 and vo.KEY = vp.VIP_KEY and vp.PARCODE in ( 747, 748,' +
        ' 1073, 1074 ) and d.KEY = :keynar '
      'group by d.KEY, vo.KEY, vo.PRNUM '
      'order by ot, vo.PRNUM')
    Left = 464
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'keynar'
      end>
  end
end
