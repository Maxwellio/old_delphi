object frmSetWorker: TfrmSetWorker
  Left = 612
  Top = 348
  Width = 245
  Height = 128
  BorderStyle = bsSizeToolWin
  Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ComboBox1: TComboBox
    Left = 3
    Top = 24
    Width = 221
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 74
    Top = 56
    Width = 75
    Height = 25
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 1
  end
  object qrWorkers: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'WITH RECURSIVE TMP(id, parent, nm, path, level) AS ('
      
        '                                                    select o.id,' +
        ' o.parent, o.nm, cast(o.nm as varchar(100)) as path, 1'
      
        '                                                    from burnar.' +
        'org_stru o'
      
        '                                                    where o.pare' +
        'nt = 0'
      '                                                    union'
      
        '                                                    select o2.id' +
        ', o2.parent, o2.nm, cast(tmp.path||'#39', '#39'||o2.nm as varchar(100)),' +
        ' level+1'
      
        '                                                    from burnar.' +
        'org_stru o2, tmp '
      
        '                                                    where tmp.id' +
        '=o2.parent)'
      'select t.key, tmp.path "'#1056#1077#1089#1091#1088#1089'" '
      'from tmp, burnar.spr_workers t'
      'where tmp.id = t.org')
    Left = 96
  end
end
