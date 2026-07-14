object frmSetPeriod: TfrmSetPeriod
  Left = 699
  Top = 331
  Width = 347
  Height = 112
  BorderStyle = bsSizeToolWin
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1077#1088#1080#1086#1076':'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ComboBox1: TComboBox
    Left = 2
    Top = 10
    Width = 328
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 129
    Top = 40
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object qrPeriods: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'select t.nm, t.begoperdate, t.outoperdate, t.key from burnar.vip' +
        'olnenie_period t'
      'where t.narkey=:keynar'
      'order by t.begoperdate, t.outoperdate')
    Left = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'keynar'
      end>
  end
end
