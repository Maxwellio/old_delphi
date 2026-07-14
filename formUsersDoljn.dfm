object frmUsersDoljn: TfrmUsersDoljn
  Left = 349
  Top = 114
  Width = 1177
  Height = 719
  Anchors = [akTop, akRight]
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1076#1086#1083#1078#1085#1086#1089#1090#1077#1081' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1093' '#1083#1080#1094
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 633
    Top = 0
    Width = 2
    Height = 661
    OnMoved = Splitter1Moved
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 661
    Width = 1161
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 633
    Height = 661
    Align = alLeft
    TabOrder = 1
    OnResize = Panel1Resize
    object grUsers: TOVNIDbGrid
      Left = 1
      Top = 97
      Width = 631
      Height = 563
      Align = alClient
      TabOrder = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goColMoving]
      ColCount = 2
      RowCount = 2
      OnSelectCell = grUsersSelectCell
      OnDblClick = grUsersDblClick
      AutoSizeRowsHeight = True
      FixRowsAutoNum = True
      NumberFormat = '%-10.2f'
      CellSelectColor = clHighlight
      SelectCurRowColor = clSkyBlue
      SelectCurColColor = clSkyBlue
      OnTitleClick = grUsersTitleClick
      CellSelectColorFont = clWhite
    end
    object Panel4: TPanel
      Left = 1
      Top = 69
      Width = 631
      Height = 28
      Align = alTop
      TabOrder = 1
      object ToolBar2: TToolBar
        Left = 1
        Top = 1
        Width = 629
        Height = 26
        Align = alClient
        ButtonWidth = 33
        Caption = 'ToolBar1'
        EdgeBorders = []
        Images = frmMain.ImageList1
        TabOrder = 0
        object ToolButton5: TToolButton
          Left = 0
          Top = 2
          Width = 11
          Caption = 'ToolButton5'
          ImageIndex = 61
          Style = tbsSeparator
        end
        object ToolButton4: TToolButton
          Left = 11
          Top = 2
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1077' '#1083#1080#1094#1086
          Caption = 'ToolButton3'
          ImageIndex = 60
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton4Click
        end
        object ToolButton10: TToolButton
          Left = 44
          Top = 2
          Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
          Caption = 'ToolButton10'
          ImageIndex = 71
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton10Click
        end
        object ToolButton8: TToolButton
          Left = 77
          Top = 2
          Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1083#1086#1075#1080#1085#1072' '#1080' '#1088#1086#1083#1080
          Caption = 'ToolButton8'
          ImageIndex = 68
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton8Click
        end
        object ToolButton9: TToolButton
          Left = 110
          Top = 2
          Hint = #1059#1076#1072#1083#1077#1085#1080#1077
          Caption = 'ToolButton9'
          ImageIndex = 70
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton9Click
        end
        object ToolButton11: TToolButton
          Left = 143
          Top = 2
          Hint = #1057#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
          Caption = 'ToolButton11'
          ImageIndex = 69
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton11Click
        end
        object ToolButton7: TToolButton
          Left = 176
          Top = 2
          Width = 25
          Caption = 'ToolButton7'
          ImageIndex = 61
          Style = tbsSeparator
        end
        object ToolButton14: TToolButton
          Left = 201
          Top = 2
          Hint = #1044#1086#1083#1078#1085#1086#1089#1090#1080
          Caption = 'ToolButton14'
          ImageIndex = 59
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton14Click
        end
        object ToolButton15: TToolButton
          Left = 234
          Top = 2
          Width = 23
          Caption = 'ToolButton15'
          ImageIndex = 73
          Style = tbsSeparator
        end
        object btnPrintToExcel: TToolButton
          Left = 257
          Top = 2
          Hint = #1042#1099#1074#1086#1076' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1074' Excel'
          Caption = 'btnPrintToExcel'
          ImageIndex = 72
          ParentShowHint = False
          ShowHint = True
          OnClick = btnPrintToExcelClick
        end
        object EditFind: TEdit
          Left = 290
          Top = 2
          Width = 113
          Height = 22
          Hint = #1042#1074#1077#1076#1080#1090#1077' '#1089#1090#1088#1086#1082#1091' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object SpeedButton8: TSpeedButton
          Left = 403
          Top = 2
          Width = 42
          Height = 22
          Hint = #1055#1086#1080#1089#1082' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
          Glyph.Data = {
            }
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton8Click
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 631
      Height = 68
      Align = alTop
      Caption = #1060#1080#1083#1100#1090#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        631
        68)
      object Label1: TLabel
        Left = 10
        Top = 14
        Width = 78
        Height = 26
        Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1085#1086#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 113
        Top = 16
        Width = 499
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        KeyField = 'id'
        ListField = 'nm'
        ListSource = DataSourcePodr
        TabOrder = 0
        OnCloseUp = DBLookupComboBox1CloseUp
      end
      object chkPeople: TCheckBox
        Left = 9
        Top = 46
        Width = 123
        Height = 17
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1085#1099#1077' '#1083#1080#1094#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = chkPeopleClick
      end
      object chkUser: TCheckBox
        Left = 150
        Top = 46
        Width = 123
        Height = 17
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080' '#1055#1054
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = chkUserClick
      end
    end
  end
  object Panel2: TPanel
    Left = 635
    Top = 0
    Width = 526
    Height = 661
    Align = alClient
    TabOrder = 2
    DesignSize = (
      526
      661)
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 524
      Height = 34
      Align = alTop
      TabOrder = 0
      object Image1: TImage
        Left = 320
        Top = 13
        Width = 16
        Height = 16
        AutoSize = True
        Picture.Data = {
          }
        Transparent = True
        Visible = False
      end
      object Image2: TImage
        Left = 296
        Top = 13
        Width = 16
        Height = 16
        AutoSize = True
        Picture.Data = {
          }
        Transparent = True
        Visible = False
      end
      object ToolBar1: TToolBar
        Left = 1
        Top = 1
        Width = 176
        Align = alLeft
        ButtonHeight = 25
        ButtonWidth = 32
        Caption = 'ToolBar1'
        EdgeBorders = []
        Images = frmMain.ImageList1
        TabOrder = 0
        object ToolButton6: TToolButton
          Left = 0
          Top = 2
          Width = 11
          Caption = 'ToolButton6'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object ToolButton3: TToolButton
          Left = 11
          Top = 2
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1076#1086#1083#1078#1085#1086#1089#1090#1085#1086#1081' '#1087#1077#1088#1080#1086#1076
          Caption = 'ToolButton3'
          ImageIndex = 60
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton3Click
        end
        object ToolButton13: TToolButton
          Left = 43
          Top = 2
          Caption = 'ToolButton13'
          ImageIndex = 66
          OnClick = ToolButton13Click
        end
        object ToolButton2: TToolButton
          Left = 75
          Top = 2
          Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1077#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1077
          Caption = 'ToolButton2'
          ImageIndex = 17
          ParentShowHint = False
          ShowHint = True
          Visible = False
          OnClick = ToolButton2Click
        end
        object ToolButton1: TToolButton
          Left = 107
          Top = 2
          Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          Caption = 'ToolButton1'
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          Visible = False
          OnClick = ToolButton1Click
        end
        object ToolButton12: TToolButton
          Left = 139
          Top = 2
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1082#1072#1088#1100#1077#1088#1091
          Caption = 'ToolButton12'
          ImageIndex = 70
          ParentShowHint = False
          ShowHint = True
          OnClick = ToolButton12Click
        end
      end
    end
    object grKareraList: TOVNIDbGrid
      Left = 1
      Top = 35
      Width = 524
      Height = 625
      Align = alClient
      TabOrder = 1
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goColMoving]
      ColCount = 2
      RowCount = 2
      OnClick = grKareraListClick
      AutoSizeRowsHeight = True
      FixRowsAutoNum = True
      NumberFormat = '%-10.2f'
      CellSelectColor = clHighlight
      SelectCurRowColor = clSkyBlue
      SelectCurColColor = clSkyBlue
      CellSelectColorFont = clWhite
    end
    object sDateEdit1: TDateTimePicker
      Left = 129
      Top = 504
      Width = 128
      Height = 21
      Anchors = [akTop]
      Date = 43053.599160335650000000
      Time = 43053.599160335650000000
      TabOrder = 2
      Visible = False
      OnExit = sDateEdit1Exit
    end
  end
  object DataSourcePodr: TDataSource
    DataSet = ClientDataSetPodr
    Left = 477
    Top = 7
  end
  object ClientDataSetPodr: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProviderPodr'
    Left = 387
    Top = 7
  end
  object DataSetProviderPodr: TDataSetProvider
    DataSet = qrPodr
    Options = [poDisableInserts, poDisableDeletes]
    Left = 286
    Top = 7
  end
  object qrPodr: TPgQuery
    SQL.Strings = (
      'select o.id'
      '       ,o.nm       '
      'from burnar.org_stru o'
      'where o.id in (1, 5, 6, 7, 8, 123)')
    Left = 208
    Top = 7
  end
  object qrUserList: TPgQuery
    Left = 48
    Top = 168
  end
  object qrDoljSpr: TPgQuery
    SQL.Strings = (
      'select s.key, s.nm '
      'from burnar.sprdoljnost s '
      'order by s.nm')
    Left = 312
    Top = 248
  end
  object qrKarera: TPgQuery
    SQL.Strings = (
      'select k.key'
      '       ,to_char(k.dtenter,'#39'dd.mm.yyyy'#39') dtenter'
      '       ,to_char(k.dtout,'#39'dd.mm.yyyy'#39') dtout'
      '       ,(with recursive tr as'
      '         ('
      '              select t.*                                       '
      '                     ,t.nm::text as SYS_CONNECT_BY_PATH    '
      '              from burnar.org_stru t'
      '              where t.parent = 0'
      '                    '
      '              union all'
      
        '              select t.*                                        ' +
        ' '
      
        '                     ,tr.SYS_CONNECT_BY_PATH || '#39', '#39' || t.nm  as' +
        ' SYS_CONNECT_BY_PATH '
      '              from burnar.org_stru t'
      '                   ,tr'
      '              where tr.id = t.parent         '
      '         )'
      '        select tr.SYS_CONNECT_BY_PATH       '
      '        from tr'
      '        where tr.id = d.org              '
      '        ) as org_nm    '
      '        '
      '       ,sp.nm dolj_nm'
      '       ,0 stat'
      '       ,o.id org_id'
      '       ,sp.key dolj_id'
      '       ,k.idpeople'
      '  from burnar.karjera      k,'
      '       burnar.doljtostruct d,'
      '       burnar.sprdoljnost  sp,'
      '       burnar.org_stru     o'
      ' where k.doljinstru = d.key'
      '   and d.org = o.id'
      '   and d.doljnost = sp.key'
      '   and k.idpeople = :p_id'
      ' order by k.dtenter, k.dtout')
    Left = 763
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_id'
      end>
  end
  object SPEOPLE_ADD: TPgStoredProc
    StoredProcName = 'burnar.people_add'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL burnar.people_add(:afio, :acodr3, :atabn, :afioreports, :af' +
        'iorodpad, :datein, :aorg_id, :adolj_id, :apeople_id)')
    Left = 152
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'afio'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'acodr3'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'atabn'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'afioreports'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'afiorodpad'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datein'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'aorg_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'adolj_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'apeople_id'
        ParamType = ptInputOutput
      end>
    CommandStoredProcName = 'burnar.people_add:0'
  end
  object SKARJERA_ADD: TPgStoredProc
    StoredProcName = 'burnar.karjera_add'
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'CALL burnar.karjera_add(:apeople, :akarjera_id, :datein, :dateou' +
        't, :aorg_id, :adolj_id, :stat)')
    Left = 835
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'apeople'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'akarjera_id'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'datein'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'dateout'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'aorg_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'adolj_id'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'stat'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'burnar.karjera_add:0'
  end
  object qrPrintUser: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'select distinct t.USERS_ID, burnar.getStruct(p.id) as struct, p.' +
        'fio, burnar.getDolgn(p.id) dolgn, t.active, t.dtenter, t.dtout, ' +
        't.note, p.id people_id, t.ora_name'
      
        'from burnar.users t, burnar.people p, burnar.karjera k, burnar.D' +
        'OLJTOSTRUCT d, burnar.org_stru o, burnar.sprdoljnost s'
      'where t.people_id = p.id'
      '      and k.idpeople = p.id'
      '      and d.doljnost = s.key'
      '      and k.doljinstru = d.key'
      '      and o.id = d.org'
      'order by 2,3')
    Left = 384
    Top = 568
  end
  object qrOrgNM: TPgQuery
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
      'select tmp.id as key, tmp.path nm'
      'from tmp'
      'where tmp.id in ('
      '                  WITH RECURSIVE TMP2 AS '
      '                  (                 '
      '                   select o.id'
      '                   from burnar.org_stru o'
      '                   where o.id = :PodrId'
      '                    union'
      '                    select o2.id'
      '                    from burnar.org_stru o2, tmp2 '
      '                    where tmp2.id = o2.parent'
      '                                         )'
      '                  select tmp2.id '
      '                  from tmp2'
      '                 )'
      'order by tmp.path')
    Left = 676
    Top = 83
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PodrId'
      end>
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'c:\'
    Left = 384
    Top = 512
  end
  object qrStruct: TPgQuery
    Connection = frmMain.MConnection
    SQL.Strings = (
      
        'select tt.nm as struct, count(tt.fio0) inactive, count(tt.fio1) ' +
        'active'
      'from'
      
        '((select distinct burnar.getStruct(p.id) as nm, t.active, p.fio ' +
        'fio0, null fio1 '
      
        'from burnar.users t, burnar.people p, burnar.karjera k, burnar.D' +
        'OLJTOSTRUCT d, burnar.org_stru o'
      'where t.people_id = p.id'
      '      and k.idpeople = p.id'
      '      and k.doljinstru = d.key'
      '      and o.id = d.org'
      '      and t.active = 0'
      ')'
      'union all'
      
        '(select burnar.getStruct(p.id) as nm, t.active, null fio0, p.fio' +
        ' fio1 '
      
        'from burnar.users t, burnar.people p, burnar.karjera k, burnar.D' +
        'OLJTOSTRUCT d, burnar.org_stru o'
      'where t.people_id = p.id'
      '      and k.idpeople = p.id'
      '      and k.doljinstru = d.key'
      '      and o.id = d.org'
      '      and t.active = 1'
      ')'
      ')tt'
      'group by tt.nm'
      'order by 1')
    Left = 48
    Top = 512
  end
end
