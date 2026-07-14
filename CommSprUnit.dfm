object SprSelect: TSprSelect
  Left = 861
  Top = 537
  Width = 439
  Height = 457
  BorderStyle = bsSizeToolWin
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 29
    Width = 423
    Height = 339
    Align = alTop
    DataSource = dsWorkers
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 423
    Height = 29
    Caption = 'ToolBar1'
    Images = frmMain.ImageList1
    TabOrder = 1
    object EditFind: TEdit
      Left = 0
      Top = 2
      Width = 121
      Height = 22
      Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1090#1088#1086#1082#1091' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ToolButton1: TToolButton
      Left = 121
      Top = 2
      Hint = #1053#1072#1095#1072#1090#1100' '#1087#1086#1080#1089#1082
      Caption = 'ToolButton1'
      ImageIndex = 26
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton8Click
    end
  end
  object BitBtn1: TBitBtn
    Left = 343
    Top = 370
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 399
    Width = 423
    Height = 19
    Panels = <
      item
        Width = 50
      end>
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
      'select t.key, tmp.path as nm'
      'from tmp, burnar.spr_workers t'
      'where tmp.id = t.org'
      '      and t.org in'
      '     '
      '('
      'WITH RECURSIVE TMP2 AS ('
      '                                                    select o.id'
      
        '                                                    from burnar.' +
        'org_stru o'
      
        '                                                    where o.id =' +
        ' ('
      
        '                                                                ' +
        '    select ds.org'
      
        '                                                                ' +
        '    from burnar.karjera k, burnar.doljtostruct ds, burnar.users ' +
        'u'
      
        '                                                                ' +
        '    where upper(u.ora_name) = upper(:usr)'
      
        '                                                                ' +
        '          and k.idpeople = u.people_id'
      
        '                                                                ' +
        '          and k.dtenter <= now()'
      
        '                                                                ' +
        '          and k.dtout >= now()'
      
        '                                                                ' +
        '          and ds.key = k.doljinstru'
      
        '                                                                ' +
        '    )'
      '                                                    union'
      '                                                    select o2.id'
      
        '                                                    from burnar.' +
        'org_stru o2, tmp2 '
      
        '                                                    where tmp2.i' +
        'd=o2.sysboss)'
      'select tmp2.id '
      'from tmp2'
      ')'
      '     ')
    Left = 55
    Top = 65
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usr'
      end>
    object qrWorkersKEY: TIntegerField
      FieldName = 'KEY'
      Required = True
    end
    object qrWorkersNM: TStringField
      FieldName = 'NM'
      Size = 4000
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qrWorkers
    Left = 55
    Top = 121
  end
  object cdsWorkers: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterOpen = cdsPeopleAfterOpen
    Left = 55
    Top = 177
    object cdsWorkersKEY: TIntegerField
      FieldName = 'KEY'
      Required = True
    end
    object cdsWorkersNM: TStringField
      FieldName = 'NM'
      Size = 4000
    end
  end
  object dsWorkers: TDataSource
    AutoEdit = False
    DataSet = cdsWorkers
    Left = 55
    Top = 233
  end
  object qrPeople: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      'select p.id as key, p.fio nm'
      '  from burnar.people       p,'
      '       burnar.karjera      k,'
      '       burnar.doljtostruct ds,'
      '       burnar.sprdoljnost  s'
      ' where k.idpeople = p.id'
      '   and k.dtenter <= now()'
      '   and k.dtout >= now()'
      '   and k.doljinstru = ds.key'
      '   and ds.doljnost = s.key'
      '   and s.key = :chief'
      '   and ds.org in'
      '     '
      '('
      'WITH RECURSIVE TMP2 AS ('
      '                                                    select o.id'
      
        '                                                    from burnar.' +
        'org_stru o'
      
        '                                                    where o.id =' +
        ' ('
      
        '                                                                ' +
        '    select ds.org'
      
        '                                                                ' +
        '    from burnar.karjera k, burnar.doljtostruct ds, burnar.users ' +
        'u'
      
        '                                                                ' +
        '    where upper(u.ora_name) = upper(:usr)'
      
        '                                                                ' +
        '          and k.idpeople = u.people_id'
      
        '                                                                ' +
        '          and k.dtenter <= now()'
      
        '                                                                ' +
        '          and k.dtout >= now()'
      
        '                                                                ' +
        '          and ds.key = k.doljinstru'
      
        '                                                                ' +
        '    )'
      '                                                    union'
      '                                                    select o2.id'
      
        '                                                    from burnar.' +
        'org_stru o2, tmp2 '
      
        '                                                    where tmp2.i' +
        'd=o2.sysboss)'
      'select tmp2.id '
      'from tmp2'
      ')'
      '     ')
    Left = 223
    Top = 65
    ParamData = <
      item
        DataType = ftString
        Name = 'chief'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'usr'
      end>
    object qrPeopleKEY: TIntegerField
      FieldName = 'KEY'
      Required = True
    end
    object qrPeopleNM: TStringField
      FieldName = 'NM'
      Required = True
      Size = 255
    end
  end
  object DataSetProvider4: TDataSetProvider
    DataSet = qrPeople
    Left = 223
    Top = 121
  end
  object cdsPeople: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider4'
    ReadOnly = True
    AfterOpen = cdsPeopleAfterOpen
    Left = 223
    Top = 177
    object cdsPeopleKEY: TIntegerField
      FieldName = 'KEY'
      Required = True
    end
    object cdsPeopleNM: TStringField
      FieldName = 'NM'
      Required = True
      Size = 255
    end
  end
  object dsPeople: TDataSource
    AutoEdit = False
    DataSet = cdsPeople
    Left = 223
    Top = 233
  end
end
