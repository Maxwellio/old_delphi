object frmMain: TfrmMain
  Left = 342
  Top = 178
  Width = 853
  Height = 637
  Caption = #1056#1072#1089#1095#1077#1090' '#1085#1072#1088#1103#1076#1086#1074' '#1085#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086' '#1073#1091#1088#1086#1074#1099#1093' '#1088#1072#1073#1086#1090
  Color = 14933984
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Icon.Data = {
    }
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  WindowMenu = mnuWindows
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 837
    Height = 29
    Caption = 'ToolBar1'
    Ctl3D = False
    EdgeBorders = []
    EdgeInner = esNone
    EdgeOuter = esNone
    Images = ImageList1
    TabOrder = 0
    object LogonBtn: TToolButton
      Left = 0
      Top = 2
      Hint = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103' '#1082' '#1073#1072#1079#1077' (F7)'
      Caption = 'actLogon'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      Style = tbsCheck
      OnClick = LogonBtn1Click
    end
    object tbtnGlobalParams: TToolButton
      Left = 23
      Top = 2
      Action = actGlobalParams
      ParentShowHint = False
      ShowHint = True
    end
    object tbtnDOPRAB: TToolButton
      Left = 46
      Top = 2
      Action = actStructNars
      ParentShowHint = False
      ShowHint = True
    end
    object tbtnExchangeRab: TToolButton
      Left = 69
      Top = 2
      Hint = #1042#1079#1072#1080#1084#1086#1079#1072#1084#1077#1085#1103#1077#1084#1099#1077' '#1088#1072#1073#1086#1090#1099
      Caption = 'tbtnExchangeRab'
      Enabled = False
      ImageIndex = 60
      ParentShowHint = False
      ShowHint = True
    end
    object tBtnNarList: TToolButton
      Left = 92
      Top = 2
      Action = actNarList
      ParentShowHint = False
      ShowHint = True
    end
    object tbtnOpenZad: TToolButton
      Left = 115
      Top = 2
      Action = actOpenZad
      ParentShowHint = False
      ShowHint = True
    end
    object tbtnOpenVip: TToolButton
      Left = 138
      Top = 2
      Action = actOpenVip
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton1: TToolButton
      Left = 161
      Top = 2
      Action = viewUsers
      ParentShowHint = False
      ShowHint = True
    end
  end
  object MainMenu1: TMainMenu
    Images = ImageList1
    Left = 440
    Top = 41
    object N1: TMenuItem
      Caption = '&'#1056#1072#1089#1095#1077#1090
      object mnuNewNar: TMenuItem
        Caption = #1053#1086'&'#1074#1099#1081'...'
        Enabled = False
        ImageIndex = 33
        ShortCut = 16462
        OnClick = mnuNewNarClick
      end
      object mnuOpenNar: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        Enabled = False
        ImageIndex = 34
        ShortCut = 16463
        OnClick = tBtnNarList1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuCloseApp: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
        ImageIndex = 32
        OnClick = mnuCloseAppClick
      end
    end
    object mnuSetting: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      object mnuOptions: TMenuItem
        Caption = #1054#1087#1094#1080#1080'...'
        ImageIndex = 30
        ShortCut = 16506
        OnClick = mnuOptionsClick
      end
      object mnuChangePwd: TMenuItem
        Caption = #1057#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        Enabled = False
        ImageIndex = 35
        ShortCut = 16464
        OnClick = mnuChangePwdClick
      end
      object N6: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1092#1086#1088#1084#1099
        ImageIndex = 31
        ShortCut = 122
        Visible = False
      end
    end
    object mnuWindows: TMenuItem
      Caption = #1054#1082#1085#1072
      object N17: TMenuItem
        Caption = '&'#1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
        ImageIndex = 37
        OnClick = N17Click
      end
      object N18: TMenuItem
        Caption = '&'#1050#1072#1089#1082#1072#1076#1086#1084
        ImageIndex = 8
        OnClick = N18Click
      end
      object N19: TMenuItem
        Caption = #1056#1103#1076#1086#1084' &'#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086
        ImageIndex = 27
        OnClick = N19Click
      end
      object N7: TMenuItem
        Caption = #1056#1103#1076#1086#1084' &'#1074#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086
        ImageIndex = 43
        OnClick = N7Click
      end
      object mnuCloseAllWin: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1074#1089#1077
        ImageIndex = 38
        OnClick = mnuCloseAllWinClick
      end
      object N21: TMenuItem
        Caption = #1059#1087#1086#1088#1103#1076#1086#1095#1080#1090#1100' '#1089#1074#1077#1088#1085#1091#1090#1099#1077
        ImageIndex = 40
        OnClick = N21Click
      end
      object N14: TMenuItem
        Caption = '-'
      end
    end
    object mnuApps: TMenuItem
      Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1103
    end
    object mnuHelpSection: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object mnuAboutPrg: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
        ImageIndex = 39
        ShortCut = 16496
        OnClick = mnuAboutPrgClick
      end
      object mnuHelp: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1082#1072
        ImageIndex = 36
        ShortCut = 112
        Visible = False
        OnClick = mnuHelpClick
      end
    end
  end
  object ImageList1: TImageList
    Left = 556
    Top = 41
    Bitmap = {
      }
  end
  object qrUser: TPgQuery
    Connection = MConnection
    SQL.Strings = (
      'select u.users_id, u.ora_name, p.fio, d.org, u.active'
      '       ,(with recursive tr as'
      '        ('
      '          select o.* '
      '          from burnar.org_stru o'
      '          where o.id = d.org'
      '        '
      '          union all'
      '          select o.* '
      '          from burnar.org_stru o, tr'
      '          where o.id = tr.parent'
      '        )'
      '        select tr.id from tr'
      '        where tr.parent = 0) as PodrId'
      
        'from burnar.users u left join burnar.people p on (u.people_id=p.' +
        'id)'
      
        '                         join burnar.karjera k on (k.idpeople = ' +
        'u.people_id and k.dtenter <= now() and k.dtout >= now())'
      
        '                         join burnar.doljtostruct d on (d.key = ' +
        'k.doljinstru)'
      'where upper(u.ora_name)=upper(:username)')
    Left = 8
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'username'
        ParamType = ptInput
        Value = 'BURNAR'
      end>
  end
  object qrNarZadAllRes: TPgQuery
    Connection = MConnection
    SQL.Strings = (
      ' WITH RECURSIVE TMP(id, parent, nm, path, level) AS ('
      
        'select o.id, o.parent, o.nm, cast(o.nm as varchar(100)) as path,' +
        ' 1'
      'from burnar.org_stru o'
      'where o.parent = 0'
      'union'
      
        'select o2.id, o2.parent, o2.nm, cast(tmp.path||'#39', '#39'||o2.nm as va' +
        'rchar(100)), level+1'
      'from burnar.org_stru o2'
      'inner join tmp on(tmp.id=o2.parent))'
      'select tmp.path from tmp where tmp.id=25'
      ' ')
    Left = 72
    Top = 168
  end
  object sProcCreateNar: TPgStoredProc
    StoredProcName = 'burnar.CREATENAR'
    Connection = MConnection
    SQL.Strings = (
      
        'CALL burnar.CREATENAR(:atypenar, :aownernar, :anarauthor, :resul' +
        't)')
    Left = 376
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'atypenar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'aownernar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'anarauthor'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'result'
        ParamType = ptInputOutput
      end>
    CommandStoredProcName = 'burnar.CREATENAR:0'
  end
  object qrIzmer: TPgQuery
    Connection = MConnection
    SQL.Strings = (
      
        'select izmer, atribnum from burnar.sprnartype where key = :typen' +
        'ar')
    Left = 184
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'typenar'
        ParamType = ptInput
        Value = '1'
      end>
  end
  object qrCountDefNarVip: TPgQuery
    Connection = MConnection
    SQL.Strings = (
      'select count(*) defnarvipcount from burnar.defnarvip dv'
      'where dv.narkey=:nkey')
    Left = 304
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'nkey'
        ParamType = ptInput
        Value = '2'
      end>
  end
  object qrCountDefNarZad: TPgQuery
    Connection = MConnection
    SQL.Strings = (
      'select count(*) defnarzadcount from burnar.defnarzad dv'
      'where dv.narkey=:nkey')
    Left = 480
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nkey'
      end>
  end
  object qrNarVipAllRes: TPgQuery
    SQL.Strings = (
      ''
      'select s.whowork, (select'
      '   ltrim(SYS_CONNECT_BY_PATH( replace(o.nm, '#39','#39'), '#39', '#39'), '#39', '#39')'
      '   from burnar.org_stru o where o.id=t.org start with o.parent=0'
      '   connect by prior o.id=o.parent) nm'
      'from '
      
        '(select distinct(n.whowork) from burnar.narvip n where n.narkey=' +
        ':narkey) s, '
      ' burnar.spr_workers t'
      'where t.key=s.whowork')
    Left = 56
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'narkey'
      end>
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 616
    Top = 42
    object actLogon: TAction
      Category = 'cmdPanel'
      Caption = 'actLogon'
      Hint = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103' '#1082' '#1073#1072#1079#1077
      ImageIndex = 0
      ShortCut = 118
      OnExecute = actLogonExecute
    end
    object actGlobalParams: TAction
      Category = 'cmdPanel'
      Caption = 'actGlobalParams'
      Enabled = False
      Hint = #1054#1073#1097#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1085#1072#1088#1103#1076#1091
      ImageIndex = 42
      ShortCut = 117
      OnExecute = tbtnGlobalParams1Click
    end
    object actStructNars: TAction
      Category = 'cmdPanel'
      Caption = 'actStructNars'
      Enabled = False
      Hint = #1057#1090#1088#1091#1082#1090#1091#1088#1099' '#1085#1072#1088#1103#1076#1086#1074
      ImageIndex = 29
      ShortCut = 113
      OnExecute = tbtnStructNarsClick
    end
    object actNarList: TAction
      Category = 'cmdPanel'
      Caption = 'actNarList'
      Enabled = False
      Hint = #1057#1087#1080#1089#1086#1082' '#1085#1072#1088#1103#1076#1086#1074
      ImageIndex = 7
      ShortCut = 114
      OnExecute = tBtnNarList1Click
    end
    object actOpenZad: TAction
      Category = 'cmdPanel'
      Caption = 'actOpenZad'
      Enabled = False
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1079#1072#1076#1072#1085#1080#1077#13#10#1074' '#1085#1086#1074#1086#1084' '#1086#1082#1085#1077
      ImageIndex = 24
      ShortCut = 115
      OnExecute = tbtnOpenZad1Click
    end
    object actOpenVip: TAction
      Category = 'cmdPanel'
      Caption = 'actOpenVip'
      Enabled = False
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077#13#10#1074' '#1085#1086#1074#1086#1084' '#1086#1082#1085#1077
      ImageIndex = 25
      ShortCut = 116
      OnExecute = tbtnOpenVip1Click
    end
    object viewUsers: TAction
      Category = 'cmdPanel'
      Caption = 'viewUsers'
      Enabled = False
      ImageIndex = 59
      OnExecute = viewUsersExecute
    end
    object actGrafBur: TAction
      Category = 'cmdPanel'
      Caption = 'actGrafBur'
      ImageIndex = 11
    end
  end
  object qrCountDefNar: TPgQuery
    Connection = MConnection
    SQL.Strings = (
      'select count(*) opercount from burnar.defnar dv'
      'where dv.key=:nkey')
    Left = 304
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'nkey'
        Value = '2'
      end>
  end
  object qrCountOperVip: TPgQuery
    Connection = MConnection
    SQL.Strings = (
      
        'select count(*) opercount from burnar.narvip nv where nv.narkey=' +
        ':nkey')
    Left = 392
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'nkey'
        ParamType = ptInput
        Value = '2'
      end>
  end
  object qrEdizm: TPgQuery
    Connection = MConnection
    SQL.Strings = (
      'select * from spr_edizm t where t.key=:edizm')
    Left = 184
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'edizm'
      end>
    object qrEdizmkey: TFloatField
      FieldName = 'key'
      Required = True
    end
    object qrEdizmznach: TStringField
      FieldName = 'znach'
      Required = True
      Size = 30
    end
    object qrEdizmops: TStringField
      FieldName = 'ops'
      Size = 100
    end
    object qrEdizmsprcode: TFloatField
      FieldName = 'sprcode'
    end
    object qrEdizmked: TFloatField
      FieldName = 'ked'
    end
    object qrEdizmgrupa: TFloatField
      FieldName = 'grupa'
    end
  end
  object qrBaseEdizm: TPgQuery
    Connection = MConnection
    SQL.Strings = (
      
        'select c.edizm from cfg_izmer c where c.izmer=:mainIzmer and c.p' +
        'rnum=:mainATRIBNUM')
    Left = 184
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'mainIzmer'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'mainATRIBNUM'
        ParamType = ptInput
      end>
    object qrBaseEdizmedizm: TFloatField
      FieldName = 'edizm'
      Required = True
    end
  end
  object Timer1: TTimer
    Interval = 300000
    OnTimer = Timer1Timer
    Left = 496
    Top = 40
  end
  object qrShowTemRazdel: TPgQuery
    Connection = MConnection
    SQL.Strings = (
      'select t.*, row_number() over ()'
      'from burnar.org_stru_tem_cat t'
      'where t.org_id in ('
      ' WITH RECURSIVE TMP(id, sysboss, nm) AS ('
      'select o.id, o.sysboss, o.nm'
      'from burnar.org_stru o'
      'where o.id in'
      '      (select ds.org'
      
        '      from burnar.karjera k, burnar.doljtostruct ds, burnar.user' +
        's u'
      '     where upper(u.ora_name) = upper(:usr)'
      '       and k.idpeople = u.people_id'
      '       and k.dtenter <= now() '
      '       and k.dtout >= now() '
      '       and ds.key = k.doljinstru)--)'
      '       '
      'union'
      'select o2.id, o2.sysboss, o2.nm'
      'from burnar.org_stru o2'
      'inner join tmp on(tmp.id=o2.sysboss))'
      'select tmp.id from tmp)')
    Left = 41
    Top = 238
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usr'
      end>
  end
  object qry: TPgQuery
    Connection = MConnection
    Left = 8
    Top = 120
  end
  object MConnection: TPgConnection
    Username = 'burnar_role'
    Server = '10.135.15.32'
    Database = 'exper'
    Schema = 'public'
    Left = 24
    Top = 48
    EncryptedPassword = '9DFF8AFF8DFF91FF9EFF8DFFCEFFCDFFCCFF'
  end
end
