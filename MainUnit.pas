unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, DB, DBAccess, Ora,
  ExtCtrls, ActnList, MemDS, ImgList, Menus, ComCtrls, ToolWin,
  Mask, formWait, DBXpress, SqlExpr, FMTBcd, midaslib, Registry, Dialogs,
  PgAccess;

{подключаем файл с константами}
{$I ProjectConst.INC}
{$I ProjectStr.INC}

type
  TAppVerType = record
    case byte of
      0: (minor,major, Build,Release: word);
      1: (MinorMajor, BuildRelease: DWORD);
  end;

  TEditAct = (edcopy,edcut,ednone);

  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mnuOpenNar: TMenuItem;
    N4: TMenuItem;
    mnuCloseApp: TMenuItem;
    mnuAboutPrg: TMenuItem;
    ImageList1: TImageList;
    mnuSetting: TMenuItem;
    mnuNewNar: TMenuItem;
    mnuWindows: TMenuItem;
    N14: TMenuItem;
    mnuHelpSection: TMenuItem;
    mnuHelp: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    mnuCloseAllWin: TMenuItem;
    N21: TMenuItem;
    mnuOptions: TMenuItem;
    mnuChangePwd: TMenuItem;
    mnuApps: TMenuItem;
    qrUser: TPgQuery;
    N6: TMenuItem;
    qrNarZadAllRes: TPgQuery;
    sProcCreateNar: TPgStoredProc;
    qrIzmer: TPgQuery;
    qrCountDefNarVip: TPgQuery;
    qrCountDefNarZad: TPgQuery;
    N7: TMenuItem;
    qrNarVipAllRes: TPgQuery;
    ActionList1: TActionList;
    actLogon: TAction;
    actGlobalParams: TAction;
    actStructNars: TAction;
    actNarList: TAction;
    actOpenZad: TAction;
    actOpenVip: TAction;
    qrCountDefNar: TPgQuery;
    qrCountOperVip: TPgQuery;
    qrEdizm: TPgQuery;
    qrBaseEdizm: TPgQuery;
    Timer1: TTimer;
    qrShowTemRazdel: TPgQuery;
    viewUsers: TAction;
    qry: TPgQuery;
    ToolBar1: TToolBar;
    LogonBtn: TToolButton;
    tbtnGlobalParams: TToolButton;
    tbtnDOPRAB: TToolButton;
    tbtnExchangeRab: TToolButton;
    tBtnNarList: TToolButton;
    tbtnOpenZad: TToolButton;
    tbtnOpenVip: TToolButton;
    ToolButton1: TToolButton;
    MConnection: TPgConnection;
    qrBaseEdizmedizm: TFloatField;
    qrEdizmkey: TFloatField;
    qrEdizmznach: TStringField;
    qrEdizmops: TStringField;
    qrEdizmsprcode: TFloatField;
    qrEdizmked: TFloatField;
    qrEdizmgrupa: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure mnuCloseAppClick(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure mnuCloseAllWinClick(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure CallExApp(Sender: TObject);
    procedure mnuAboutPrgClick(Sender: TObject);
    procedure mnuOptionsClick(Sender: TObject);
    procedure LogonBtn1Click(Sender: TObject);
    procedure mnuChangePwdClick(Sender: TObject);
    procedure mnuOpenNarClick(Sender: TObject);
    procedure tbtnStructNarsClick(Sender: TObject);
    procedure mnuNewNarClick(Sender: TObject);
    procedure tbtnGlobalParams1Click(Sender: TObject);
    procedure tBtnNarList1Click(Sender: TObject);
    procedure tbtnOpenZad1Click(Sender: TObject);
    procedure tbtnOpenVip1Click(Sender: TObject);
    procedure mnuHelpClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure actLogonExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure viewUsersExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function  Get_ORA_Exception(const messages : string):string;

  private
    {версию из внутреннего представления в строку}
    function VerToStr(const aVer: TAppVerType): string; //overload;

    {задать основные переменные для расчета наряда}
    procedure SetMainCalcSetting;
  public
    {характеристики текущего наряда(с которым работаем)}
    keynar
    ,Org
    ,PodrID //Код СП из burnar.org_stru.id (где burnar.org_stru.parent=0) ИЭВЦ, УБР,...
    ,OWNERNAR //владелец наряда(подрядчик)
    ,NARAUTHOR
    ,NarType
    ,AtribNum //основной номер атрибута измерителя наряда
    ,Izmer: Longword; //основной(главный) измеритель наряда
    NarCaption: String; //имя(описание) текущего наряда
    procedure WriteToFile(const FileName: string);
    constructor Create(AOwner: TComponent); override;
    {настройка вызовов внешних программ}
    procedure SetCallExpApp;
    {открывает весь наряд: задание, выполнение и устанавливает переменные}
    procedure OpenNar;

  end;

var
  frmMain: TfrmMain;
  PathAndCfgFileName: string;
  oraPwd: string;
  oraUser: string;
  DataBase: string;
  path: string;
  AutoScale: boolean=false;
  OsAuthent: boolean=false;
  AppItems,temp: string;
  WaitIndicator: TfrmWait; //форма индикации длительных операций
  AutoSaveCalcNorms: boolean; //автоматическое сохранение в базе после вычисления каждой работы наряда
  VisibleOperDeepLevel: byte;//кол-во выводимых уровней работ наряда
  fr: TFormatSettings; //формат чисел дат и т.д
  fNFormat: String='%-9.2f'; //формат вывода числовых полей
  helpfile: String='';
  CurPrjVer: TAppVerType; //текущая версия проекта(приложения) важны только Major и Minor Version релиз и билд не учитывается

  BaseEdizm: LongInt; //код единицы измерения главного атрибута основного измерителя наряда
  OutEdizm: LongInt = 219;//код единицы измерения, в которой требуется отображать результаты (нормы)
  kf:  double ;
  edizm: string; //наименование единицы измерения временных атрибутов
  htmlpath: string; //путь где лежат оперкарты(и другие) html документы

  oldRecsSelColor: TColor; //цвет выделения записей до изменения(например для выделения записей при вырезании)
  function isZero( aVal: Variant) : string; overload;
  function isZero( aVal: Variant; flg:boolean) : string; overload;
  function isZeroKeyValue( aVal: variant) : string;
  function isNumber( aVal: variant) : string;
  function Enter_Number(key : char):char;
  procedure Enter_Number_KeyPress  (Sender: TObject; var Key: Char); // ==  Ввод только цифровых значений - для полей ввода (через запятую или точку)
  procedure Enter_Number_Plus_KeyPress  (Sender: TObject; var Key: Char);

procedure StrToArrays(const Str, Separ: String; StartPos: Cardinal; out Fields: TStrings);
function LastInput: DWord;

implementation

{$R *.dfm}

uses IniFiles, shellAPI, formAbout, formSetOptions, LoginFrm, StrUtils,
  UnitChangePass, NarListUnit, GlobalVarUnit,
  formStructNur, CommonNarZadUnit, CommonNarVipUnit, CommSprUnit,
  crypto, OVNIGrids,NarListParUnit, formUsersDoljn, CreateLnk;

function CurrentFileInfo(NameApp: string): string;
var
  dump: DWORD;
  size: integer;
  buffer: PChar;
  VersionPointer, TransBuffer: PChar;
  Tmp: integer;
  CalcLangCharSet: string;
begin
  size := GetFileVersionInfoSize(PChar(NameApp), dump);
  buffer := StrAlloc(size+1);
  try
    GetFileVersionInfo(PChar(NameApp), 0, size, buffer);

    VerQueryValue(buffer, '\VarFileInfo\Translation', pointer(TransBuffer),
    dump);
    if dump >= 4 then
    begin
      tmp:=0;
      StrLCopy(@tmp, TransBuffer, 2);
      CalcLangCharSet:=IntToHex(tmp, 4);
      StrLCopy(@tmp, TransBuffer+2, 2);
      CalcLangCharSet := CalcLangCharSet+IntToHex(tmp, 4);
    end;

    VerQueryValue(buffer, pchar('\StringFileInfo\'+CalcLangCharSet+
    '\'+'FileVersion'), pointer(VersionPointer), dump);
    if (dump > 1) then
    begin
      SetLength(Result, dump);
      StrLCopy(Pchar(Result), VersionPointer, dump);
    end
    else
      Result := '0.0.0.0';
  finally
    StrDispose(Buffer);
  end;
end;

procedure StrToArrays(const Str, Separ: String; StartPos: Cardinal; out Fields: TStrings);
var
  OldPosSepar, NewPosSepar: integer; //текущая позиция разделителя полей
  EndStr: Boolean;
begin
  if (length(Str)=0) or (length(Separ)=0) then
    raise Exception.Create(MsgErrReadParFromIni);
  OldPosSepar := StartPos-length(Separ);
  EndStr := false;
  Fields.Clear;
  while not(EndStr) do
  begin
    NewPosSepar := PosEx(Separ, Str, OldPosSepar+length(Separ));
    if NewPosSepar = 0 then
    begin //очередной заданный разделитель не найден
      EndStr := true; //достигли конец строки
      NewPosSepar := Length(Str)+1;
    end; //endif
    {Формируем массив, помещаем очередное значение поля}
    Fields.Add( Copy(Str,OldPosSepar+length(Separ),NewPosSepar-(OldPosSepar+length(Separ))) );
    OldPosSepar := NewPosSepar; //стартовая позиция для следующей итерации
  end; //endWhile
end;

{версию из внутреннего представления в строку}
function TFrmMain.VerToStr(const aVer: TAppVerType): string;
begin
  result := IntToStr(aVer.major)+'.'+IntToStr(aVer.minor)+'.'+IntToStr(aVer.Release)+'.'+IntToStr(aVer.Build);
end;

{Вызывает внешнюю прогу с указанным именем, вешаем на OnClick каждого пункта}
procedure TFrmMain.CallExApp(Sender: TObject);
var
  StrList: TStringList;
  appname,params: String;
  i: integer;
begin
  if not(Sender is TMenuItem) then exit;

  //имеем приложение с параметрами в формате: ПолноеИмяПриложения&параметр1..&параметрN
  StrList := TStringList.create;
  StrList.Delimiter := ' '{'&'}; //разделитель параметров строки запуска приложения
  StrList.DelimitedText := {st}TMenuItem(Sender).Hint;
  StrList.QuoteChar := '"'; //на случай, если в имени файла тоже будут ' ' то "" решит проблему

  appname := StrList[0]; //получаем имя приложения
  if StrList.Count > 1 then //если у приложения есть свои параметры, обрабатываем
    for i := 1 to StrList.count-1 do params := params + StrList[i]
  else params := '';

  //задаем добавочные параметры на лету
  params := params+' dbalias='+DataBase+' orauser='+orauser+' orapwd='+orapwd;

  if keynar <> 0 then params := params+' narkey='+IntToStr(keynar);

  ShellExecute(0,
    nil, //указатель на операцию, которую хотим выполнить при запуске
    Pchar(appname), //полное имя приложения
    PChar(params), //параметры командной строки
    PChar( ExtractFilePath(appname) ), //рабочая папка для проги
    {SW_SHOW}SW_SHOWNORMAL);

  StrList.Destroy;
end;

procedure TfrmMain.SetCallExpApp;
var
  StrList,tv: TStrings;
  i: integer;
  NewItem: TMenuItem;
begin
  if mnuApps.Count > 0 then mnuApps.Clear;
  {*********************настройка вызовов внешних программ*******************}
  StrList := TStringList.Create;
  StrToArrays(AppItems, ';', 1, StrList);
  tv := TStringList.Create;
  {собираем имена файлов плугинов расширения}
  for i := 0 to StrList.Count-1 do //цикл по записям
  begin
    NewItem := TMenuItem.Create(nil); //Создаём новый пункт меню
    StrToArrays(StrList[i], ',', 1, tv);
    {задаем переменную заголовка пункта меню}
    NewItem.Caption := tv[0];
    {обработка переменной запуска процесса, помещаем ее в хинт}
    if (Pos(':\',tv[1])>0) or
       (Pos('\\',tv[1])>0) then //если путь абсолютный
       NewItem.Hint := tv[1]
    else
      begin
        if Pos('\',tv[1]) > 0 then //если есть хоть одна палка в пути к внеш приложению
          NewItem.Hint := GetCurrentDir+'\'+tv[1] //то относительный
        else //просто имя приложения без пути
          NewItem.Hint := tv[1]
      end;
    NewItem.OnClick := CallExApp; //Устанавливаю событие
    NewItem.ImageIndex := 42;
    mnuApps.Add(NewItem); //Добавляю пункт в меню
  end;
  StrList.Free;
  tv.Free;
  {***********конец настройки вызова внешних программ****************}
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  AppIni: TIniFile;
  sPwd: String;
  StrList: TStringList;
  tFieldsVer: TStrings;
begin
  keynar := 0;

  {считываем инфу о версии проги}

  tFieldsVer := TStringList.Create;
  StrToArrays(CurrentFileInfo(Application.ExeName), '.', 1, tFieldsVer);
  CurPrjVer.minor := StrToInt(tFieldsVer[1]);
  CurPrjVer.major := StrToInt(tFieldsVer[0]);
  CurPrjVer.Build := StrToInt(tFieldsVer[3]);
  CurPrjVer.Release := StrToInt(tFieldsVer[2]);
  tFieldsVer.Destroy;

  {читаем путь к файлу настроек программы}
  PathAndCfgFileName := ChangeFileExt(GetCurrentDir+'\'+
    ExtractFileName(Application.ExeName), '.'+IniFileStr);

  {считываем настройки}
  AppIni := TIniFile.Create( PathAndCfgFileName );
  try

    sPwd := AppIni.ReadString('connection', 'oraPwd', '');
    if sPwd = '' then
      oraPwd := ''
    else
      oraPwd := ArrayOfByteToStr( CryptN(HexStrToArrayOfByte('A212F5B0'), StrToArrayOfByte(sPwd)) );

    oraUser := AppIni.ReadString('connection', 'oraUser', '');
    DataBase := AppIni.ReadString('connection', 'DataBase', '');

    path := AppIni.ReadString('options', 'path', '');
    temp := AppIni.ReadString('options', 'temp', '');
    AutoScale := AppIni.ReadBool('options', 'AutoScale', false);
    OsAuthent := AppIni.ReadBool('options', 'OsAuthent', false);
    AutoSaveCalcNorms := AppIni.ReadBool('options', 'AutoSaveCalcNorms', false);
    VisibleOperDeepLevel := AppIni.ReadInteger('options', 'VisibleOperDeepLevel', 4);
    AppItems := AppIni.ReadString('applications', 'AppItems', '');
    helpfile := AppIni.ReadString('options', 'helpfile', '');
    OutEdizm := AppIni.ReadInteger('options', 'OutEdizm', 219);
    htmlpath := AppIni.ReadString('options','htmlpath','');

    SetCallExpApp; //настройка вызовов внешних программ

    {устанавливаем переменные окружения для текщего процесса}
    if path <> '' then
    begin
      //envPath := GetEnvironmentVariable('path');
      //добавляем в переменную окружения мой путь
      SetEnvironmentVariable(pchar('path'), pchar(path{+';'+EnvPath}));
    end;

    // При запуске программы проверяем наличие папки для хранения ini-файла в личных документах
    // если необходимо то копирует ini файл в рабочую папку и создает ярлык на Рабочем столе
    // 26122023 TIS открыть перед переходом на версию PG (для замены ярлыков на рабочем столе)
    frmCreateLnk.Button2Click(self);


  finally
    AppIni.free;
  end;

  WaitIndicator := TfrmWait.Create(Application);
end;

procedure TfrmMain.WriteToFile(const FileName: string);
var
  AppIni: TIniFile;
  sPwd: string;
begin
  AppIni := TIniFile.Create( PathAndCfgFileName );
  try
    if oraPwd <> '' then
      sPwd := ArrayOfByteToStr(
        CryptN( HexStrToArrayOfByte('A212F5B0'), StrToArrayOfByte(oraPwd) )
        )
    else
      sPwd := '';
    AppIni.WriteString('connection', 'oraPwd', sPwd);
    AppIni.WriteString('connection', 'oraUser', oraUser);
    AppIni.WriteString('connection', 'DataBase', DataBase);

    AppIni.WriteString('options', 'path', path);
    AppIni.WriteString('options', 'temp', temp);
    AppIni.WriteBool('options', 'AutoScale', AutoScale);
    AppIni.WriteBool('options', 'OsAuthent', OsAuthent);
    AppIni.WriteBool('options', 'AutoSaveCalcNorms', AutoSaveCalcNorms);
    AppIni.WriteInteger('options', 'VisibleOperDeepLevel', VisibleOperDeepLevel);
    AppIni.WriteInteger('options', 'OutEdizm', OutEdizm);

    AppIni.WriteString('applications', 'AppItems', AppItems);
    AppIni.WriteString('options','htmlpath', htmlpath);
  finally
    AppIni.free;
  end;
end;

procedure TfrmMain.mnuCloseAppClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.N17Click(Sender: TObject);
var i: integer;
begin
  for i:=MDIChildCount-1 downto 0 do
    MDIChildren[i].WindowState:=wsMinimized;
end;

procedure TfrmMain.N18Click(Sender: TObject);
begin
  Cascade;
end;

procedure TfrmMain.N19Click(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

procedure TfrmMain.mnuCloseAllWinClick(Sender: TObject);
var i: integer;
begin
  for I := MDIChildCount-1 downto 0 do
    MDIChildren[I].Close;
end;

procedure TfrmMain.N21Click(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TfrmMain.mnuAboutPrgClick(Sender: TObject);
begin
  with TfrmAbout.Create(Application) do //генерим экземпляр класса формы
  begin
    Version.Caption := 'Версия: '+VerToStr(CurPrjVer)+'   Разработка:';
    ShowModal; //показываем в модальном режиме
  end;
end;

procedure TfrmMain.mnuOptionsClick(Sender: TObject);
begin
  if frmSetOptions = nil then
  begin
    frmSetOptions := TfrmSetOptions.create(application);
    frmSetOptions.LoadLinkControls;
    frmSetOptions.OptionsTreeView.Items.Item[0].Selected:=true;
  end;
  frmSetOptions.show;
end;

procedure TfrmMain.LogonBtn1Click(Sender: TObject);
var
  i: integer;
  s: string;
begin
  if LogonBtn.Down then //если нажали кнопку главной формы
    begin

      if OsAuthent then
        begin //обработка виндовой аутентификации
        end
      else //обработка оракловой аутентификации
        begin
          {заполняем поля формы данными из файла настроек(если есть)}
          LoginForm.edtUserName.Text := OraUser;
          LoginForm.edtPassWord.Text := OraPwd;
          LoginForm.edtDbAlias.Text := DataBase;
          for i := 1 to 3 do //максимально возможное число попыток вывода диалога коннекта
          begin
            try
              if LoginForm.Showmodal = mrOK then
                begin
                  OraUser := LoginForm.edtUserName.Text;
                  OraPwd := LoginForm.edtPassWord.Text;
                  DataBase := LoginForm.edtDbAlias.Text;

                  MConnection.Password := 'burnar123';
                  MConnection.Username := 'burnar_role';
                  MConnection.Server := '10.135.15.32'; 
                  MConnection.Database := LowerCase(LoginForm.edtDbAlias.text);  //имя БД полностью маленькими буквами, иначе не пустит
                  MConnection.Connected := true; // пытаемся законнектиться


                 OraUser := LoginForm.edtUserName.Text;
                 OraPwd := LoginForm.edtPassWord.Text;
                 DataBase := LoginForm.edtDbAlias.Text;

                 try
                    frmMain.MConnection.ExecSQL('select burnar.valid_user_f( ''' + OraUser + ''',''' + OraPwd + ''');');
                 finally
                 end;

                  //считываем реальные ФИО ораклового юзера
                  qrUser.ParamByName('username').AsString := LoginForm.edtUserName.Text;
                  qrUser.Open;

                  if qrUser.FieldByName('active').AsInteger = 0 then

                  begin
                    Application.MessageBox(pchar('Пользователь не активен, обратитесь к администратору за информацией.'),pchar(MsgErrorRu),MB_OK+MB_ICONERROR);
                    qrUser.Close;
                    LogonBtn.Down := false;
                    MConnection.Connected := false; //трюк т.к даже если ошибка коннекта, почему-то будет true
                    exit;
                  end;

                  //размещаем имя юзера и базы наверху
                  Application.MainForm.Caption := 'Пользователь: ' +qrUser.FieldByName('fio').AsString
                  +', База: '+LoginForm.edtDbAlias.Text;
                  NARAUTHOR := qrUser.FieldByName('users_id').AsInteger;

                  Org := qrUser.FieldByName('org').AsInteger;
                  PodrId := qrUser.FieldByName('podrid').AsInteger;

                  //+PG переменные сессии пользователя
                  MConnection.ExecSQL('set burnar.user_id = '+ qrUser.FieldByName('users_id').AsString);//intToStr(GeneralParam.UserId));
                  MConnection.ExecSQL('set USERENV.OS_USER = '+ OraUser); //наверное, правильнее брать имя из формы логина, не виндовое //GetEnvironmentVariable('username'));  //+PG переменные сессии имя пользователя в windows
//                  s := 'set USERENV.SESSION_USER = '+ GetEnvironmentVariable('username');
//                  MConnection.ExecSQL('set USERENV.SESSION_USER = '+ GetEnvironmentVariable('username'));
                  MConnection.ExecSQL('set USERENV.HOST = '+ QuotedStr(GetEnvironmentVariable('COMPUTERNAME')));  //+PG переменные сессии имя компьютера

                  break; //если дошли до этой точки, значит исключение не возбудилось => коннект прошел успешно и нет смысла больше выводить диалог ввода пароля, выходим из цикла
                end //на диалоге ввода пароля ОК
              else //кнопка отмена или что-либо другое
                break; //досрочный выход из цикла
            except //в попытке коннекта ошибка, обрабатываем ее, чтобы не выйти из цикла досрочно
              on E: Exception do
              begin
                Application.MessageBox(pchar(E.message{'Пароль или имя пользователя не верен, вы не вошли в систему'}),pchar(MsgErrorRu),MB_OK+MB_ICONERROR);
                MConnection.Connected := false; //трюк т.к даже если ошибка коннекта, почему-то будет true
              end;
            end;
          end; //цикл по кол-ву попыток коннекта завершен
        end; //конец обработки оракловой идентификации !!!!!!!!!!!!!!
    end //нажали кнопку главной формы-конец
  else //отжали кнопку главной формы
    begin
      MConnection.Connected := false;
      Caption := Application.Title;
    end;

  {синхронизируем состояние команд и кнопок в соответствии с соединением}
  LogonBtn.Down := MConnection.Connected;
  if not MConnection.Connected then
    begin
      mnuCloseAllWinClick(Self);
      keynar := 0;
    end;
  {синхронизация состояний команд главного окна}
  actStructNars.Enabled := MConnection.Connected;
  actNarList.Enabled := MConnection.Connected;
  actGlobalParams.Enabled := (MConnection.Connected) and (keynar<>0);
  actOpenZad.Enabled := (MConnection.Connected) and (keynar<>0);
  actOpenVip.Enabled := (MConnection.Connected) and (keynar<>0);
  {пункты главного меню}
  mnuNewNar.Enabled := MConnection.Connected;
  mnuOpenNar.Enabled := MConnection.Connected;
  mnuChangePwd.Enabled := MConnection.Connected;
  viewUsers.Enabled:= MConnection.Connected;
end;

constructor TfrmMain.Create(AOwner: TComponent);
var
  fname: string;
begin
  //если есть файл с конфигурацией, читаем все настройки объектов оттуда
  fname := ExtractFilePath(PathAndCfgFileName)+ClassName+FrmExtUserRes;
  if FileExists( fname ) then //файл настроек найден
    begin
      CreateNew(AOwner);
//      LoadComponentFromTextFile(self, fname);
    end
  else //файл настроек не найден
    inherited Create(AOwner); //вызываем стандартный конструктор
end;

procedure TfrmMain.mnuChangePwdClick(Sender: TObject);
var
  sql: string;
begin
  with TFormChangePass.Create(Application) do
  begin
    if Showmodal = mrOk then
    begin
      if (PoleOld.Text = oraPwd) and (PoleNew1.text = PoleNew2.text) then
        begin

          sql := 'CALL burnar.change_password(''%s'', ''%s'', ''%s'');';
          sql := Format(sql, [oraUser, PoleOld.Text, PoleNew1.Text]);

          try
            MConnection.ExecSQL(SQL);
            oraPwd := PoleNew1.Text;
            Application.MessageBox(pchar(MsgPassChangedRu),PChar(MsgAttentionRu));

          except
            on E: Exception do
              Application.MessageBox(pchar(E.Message),pchar(E.HelpContext),MB_OK+MB_ICONERROR);
          end;
        end
      else
        Application.MessageBox(pchar(MsgErrChPwd),pchar(MsgErrorRu),MB_OK+MB_ICONERROR);
    end;
    Free;
  end;
end;

procedure TfrmMain.SetMainCalcSetting;
var
  kedIsh,kedOut: single{Double};
begin
  {получаем код основного измерителя наряда}
  qrIzmer.ParamByName('typenar').asBCD := nartype;
  qrIzmer.open;
  Izmer := qrIzmer.fieldbyname('izmer').Value; //по типу наряда получаем основной измеритель
  AtribNum := qrIzmer.fieldbyname('atribnum').Value;
  qrizmer.Close;

  {находим код базовой единицы измерения базового атрибута}
  qrBaseEdizm.ParamByName('mainIzmer').Value := Izmer;
  qrBaseEdizm.ParamByName('mainATRIBNUM').Value := AtribNum;
  qrBaseEdizm.Open;
  BaseEdizm := qrBaseEdizmEDIZM.AsInteger; //получаем код базовой(расчетной) единицы измерения
  qrBaseEdizm.Close;

  qrEdizm.ParamByName('edizm').AsBCD := BaseEdizm;
  qrEdizm.open;
  kedIsh := qrEdizmKED.AsFloat; //kedIsh=60.000 //получаем код базовой(расчетной) единицы измерения/ всегда = 218! для измерителя 202-бурение и атрибуту 2 
  qrEdizm.Close;

  qrEdizm.ParamByName('edizm').AsBCD := OutEdizm;
  qrEdizm.open;
  kedOut := qrEdizmKED.AsFloat;  //kedOut берется из INI файла. ;код единицы измерени¤, в которой требуетс¤ отображать результаты(нормы)
  edizm := qrEdizmZNACH.Value;
  qrEdizm.Close;

  kf := kedIsh / kedOut;
end;

procedure TfrmMain.OpenNar;
var
  nkey : integer;
begin
  try
    //если тип наряда не бурение то к сожалению нет для него реализации
    if nartype<>1 then
      begin

      end;

    SetMainCalcSetting;
    nkey := keynar;
    {открываем наряд-задание, если есть}

    qrCountDefNarZad.ParamByName('nkey').AsBCD := keynar;

    qrCountDefNarZad.Open;
    if qrCountDefNarZad.FieldByName('defnarzadcount').Value = 1 then
    begin
      TfrmComNarZad.opennar( //открываем, если есть общее представление(совмещенный) наряд-задание
        keynar,
        orauser,
        -1,
        -1,
        Izmer,
        'Наряд-задание: '+IntToStr(keynar)+', '+NarCaption+', общий перечень работ'
        );
      actGlobalParams.Enabled := true;
      actOpenZad.Enabled := true;
      actGlobalParams.Enabled := true;

    end;
    qrCountDefNarZad.Close;

    {открываем наряд-выполнение, если есть}
    qrCountDefNarVip.ParamByName('nkey').AsBCD := keynar;
    qrCountDefNarVip.Open;
    if qrCountDefNarVip.FieldByName('defnarvipcount').Value = 1 then
    begin
      TfrmComNarVip.opennar( //открываем, если есть наряд-выполнение
        keynar,
        orauser,
        -1,
        -1,
        Izmer,
        'Наряд-выполнение: '+IntToStr(keynar)+', '+NarCaption+', общий перечень работ'
        );
      actOpenVip.Enabled := true;
      actGlobalParams.Enabled := true;
    end;
    
    qrCountDefNarVip.Close;

    qry.Close;
    qry.connection :=  MConnection;
    qry.sql.Text := 'select burnar.CheckNarParams(' + inttostr(nkey) + ') as res';
    qry.Open;

    if qry.IsEmpty then raise Exception.Create('Нет ответа от функции CheckNarParams');

    if qry.Fields.Fields[0].AsString <> '' then
    begin

     If messageBox(Handle, PChar(qry.Fields.Fields[0].AsString),'Внимание', mb_YesNo or mb_iconquestion) = mrYes then
       begin
         if frmGlobalVar = nil then
         begin
           frmGlobalVar := TfrmGlobalVar.CreateEx(Application, nkey);
           frmGlobalVar.FormStyle := fsMdiChild;
         end;
         frmGlobalVar.Show;
       end
     else
       begin
        MConnection.ExecSQL('update burnar.defnar set CHECKPARAMS = 1 where key= ' + inttostr(nkey));
       end;
    end;


  finally
    if (qry.Active) then qry.Close;

  end;
end;


procedure TfrmMain.mnuOpenNarClick(Sender: TObject);
begin
  if MDIChildCount > 0 then mnuCloseAllWinClick(Self);
  {вызов формы в модальном режиме}
  with TfrmNarList.Create(Application) do
  begin
    formStyle := fsNormal;
    Borderstyle := bsSizeToolWin;
    visible := false;
    if ShowModal = mrOk then
    begin
      if grdDefNarList.Recs.Count = 0 then begin Destroy; exit; end;
      keynar := strtoint( grdDefNarList.ByFieldName['Код наряда'].Value );
      nartype := strtoint( grdDefNarList.ByFieldName['nartype'].Value );
      OWNERNAR := strtoint( grdDefNarList.ByFieldName['ownernar'].Value );
      NarCaption := grdDefNarList.ByFieldName['Название'].Value;
      OpenNar; //открываем весь наряд
    end;
    Destroy;
  end; //end with
end;

procedure TfrmMain.tbtnStructNarsClick(Sender: TObject);
var
  sql,in_sql: string;

begin
  {загружаем общую структуру наряда}
  if frmStructNar = nil then
  begin
    frmStructNar := TfrmStructNar.create(application);
    frmStructNar.FormStyle := fsMdiChild;
    frmStructNar.Borderstyle := bsSizeable;
    frmStructNar.BitBtnResult.visible := false;
    //----11.01.2012 добавление видимости структурками каталога

    // формируем запрос тем католога
      sql:=' WITH RECURSIVE TMP AS ' +
           ' (select t.id, t.parent_id, case when t.oper is null then t.nm else s.nm end nm, t.oper, t.ord, t.NARTYPE, ' +
           //10112023 убираем говнокод Дениски'       ARRAY[(row_number() OVER (PARTITION BY t.parent_id ORDER BY t.ord))::integer] AS ord2 ' +
           ' ARRAY[coalesce(t.ord, 0)::integer] as ord2 ' +   
           ' from public.tematic_razdel t ' +
           '      left join public.spr_oper s on t.oper = s.key ' +
           ' where t.id in ( ';

    //ищем разрешенные элементы для каталога
     qrShowTemRazdel.Close;
     qrShowTemRazdel.ParamByName('usr').Value:= orauser;
     qrShowTemRazdel.Open;
     qrShowTemRazdel.First;
     in_sql:='';
     if  qrShowTemRazdel.Eof then
         in_sql:='null,'
     else
       while not qrShowTemRazdel.Eof do
          begin
            in_sql:=in_sql+qrShowTemRazdel.FieldByName('tem_cat_id').AsString+',';
            qrShowTemRazdel.Next;
          end;
     setlength(in_sql, (length(in_sql)-1));
     Sql:=sql+in_sql+
                      ' )union all ' +
                      ' select t.id, t.parent_id, case when t.oper is null then t.nm else s.nm end nm, t.oper, t.ord, t.NARTYPE, ' +
                      //10112023 убираем говнокод Дениски'        tmp.ord2 || ARRAY[(row_number() OVER (PARTITION BY t.parent_id ORDER BY t.ord))::integer] AS ord2 ' +
                      ' tmp.ord2 || t.ord::integer  as ord2  ' +
                      ' from public.tematic_razdel t ' +
                      '      left join public.spr_oper s on t.oper = s.key, tmp ' +
                      ' where tmp.id = t.parent_id ' +
                      ' ) ' +
                      ' select tmp.id "Код раздела", tmp.parent_id, tmp.nm::varchar(1500) "Наименование", tmp.oper "Код операции", tmp.ord, tmp.NARTYPE ' +
                      ' from tmp ' +
                      ' order by ord2 ';

    frmStructNar.qrStructNar.Close;
    frmStructNar.qrStructNar.SQL.Text:=sql;
    frmStructNar.qrStructNar.Open;
    frmStructNar.Catalog.LoadTree(frmStructNar.qrStructNar,'Код раздела', 'parent_id', 2,['parent_id','ord','nartype']);
    frmStructNar.qrStructNar.Close;
    frmStructNar.Catalog.Fields.SetDataTypes(['Код раздела','Код операции'],Number);
    frmStructNar.StatusBar1.Panels[0].Text := //получаем кол-во всех элементов дерева
        'Всего запрошено с сервера записей: ' + IntToStr(frmStructNar.Catalog.Items.AllNodeCount);
  end;
  frmStructNar.show;
end;

procedure TfrmMain.mnuNewNarClick(Sender: TObject);
var
  ResVal: TResVal;
  ntype : string; //тип нового наряда
begin
  {загружаем общую структуру наряда}

    //необходимо определить тип наряда
      with TfrmNarListPar.Create(self) do
  begin
    ComboBox1.Items.Clear;
  // скрываем не нужные элементы
      caption:='Выберите тип создаваемого наряда';
      Label2.Caption:='Тип наряда:';
      lbCodeSpr1.Visible:=false;
      Label1.Visible:=false;
      Label3.Visible:=false;
      DateEdit1.Visible:=false;
      BitBtn2.Visible:=false;
      DateEdit2.Visible:=false;
      CheckBox1.Visible:=false;
      Height:=130;
    //заполняем комбобокс списком типов нарядов
    qrNarTypes.Open;
    while not qrNarTypes.eof do
    begin
      ComboBox1.Items.AddObject( qrNarTypes.FieldByName('ops').AsString,
                                  TObject(qrNarTypes.FieldByName('KEY').AsInteger)
                                 );
      qrNarTypes.Next;
    end;
    qrNarTypes.close;
    ComboBox1.ItemIndex := 0;
    if ShowModal = mrOk
    then //если не отказались от формы ввода параметров
          ntype:= IntToStr(Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]))
    else exit;
    Destroy; //убиваем модальную форму параметров
  end;
    {Выводим форму выбора владельца наряда=форма выбора ресурса}
    if TSprSelect.GetVal(-1, 'Владелец наряда',spworkers,[],ResVal) = mrOk then
      OWNERNAR := ResVal.key
    else
      exit;
    {создаем новый наряд на основе выбранного тематического раздела}
   // WaitIndicator.Show;
    try

      //нам не нужен раздел (2-ка для того чтобы тип наряда нашелся :))
      //13.11.2011 это временно придумать откуда взять тип наряда

      nartype:=strtoint(ntype);
      //код раздела? зачем?
      //razdel:=2 ;
      sProcCreateNar.ParamByname('aTypeNar').AsBCD := nartype;
      sProcCreateNar.ParamByname('aOWNERNAR').AsBCD := OWNERNAR;
      sProcCreateNar.ParamByname('aNARAUTHOR').AsBCD := NARAUTHOR;
      sProcCreateNar.ExecProc;
      keynar := sProcCreateNar.ParamByname('RESULT').Value;

      {получаю основные параметры для настройки расчетов}
      SetMainCalcSetting;

      {открываем созданный наряд в разрезе интересующего измерителя}
      TfrmComNarZad.opennar(keynar,orauser,-1,-1,Izmer,
        'Наряд-задание: '+IntToStr(keynar)+', '+NarCaption+', общий перечень работ');
    finally
    //  WaitIndicator.Close;
    end;
  //end;
end;

procedure TfrmMain.tbtnGlobalParams1Click(Sender: TObject);
begin
  if frmGlobalVar = nil then
  begin
    frmGlobalVar := TfrmGlobalVar.CreateEx(Application, keynar);
    frmGlobalVar.FormStyle := fsMdiChild;
  end;
  frmGlobalVar.Show;
end;

procedure TfrmMain.tBtnNarList1Click(Sender: TObject);
begin
  if frmNarList = nil then //для запуска в немодальном режиме
  begin
    frmNarList := TfrmNarList.Create(Application);
    frmNarList.FormStyle := fsMdiChild;
    frmNarList.Borderstyle := bsSizeable;
  end;
  frmNarList.Show;
end;

procedure TfrmMain.tbtnOpenZad1Click(Sender: TObject);
var
  AkeyNar :Longword;
begin
  if keynar=0 then exit;// 11.07.2011  ****Frolov_aa
  AkeyNar:=keynar; // 11.07.2011  ****Frolov_aa
  try
    TfrmComNarZad.opennar( //открываем, если есть общее представление(совмещенный) наряд-задание
      Akeynar,
      orauser,
      -1,
      -1,
      Izmer,
      'Наряд-задание: '+IntToStr(Akeynar)+', '+NarCaption+', общий перечень работ'
      );
  finally
  //  WaitIndicator.close;
  end;
end;

procedure TfrmMain.tbtnOpenVip1Click(Sender: TObject);
var
  AkeyNar :Longword;
begin
  if keynar=0 then exit;// 11.07.2011  ****Frolov_aa
  AkeyNar:=keynar;  // 11.07.2011  ****Frolov_aa
 // WaitIndicator.Show;
  try
    TfrmComNarVip.opennar( //открываем, если есть наряд-выполнение
      Akeynar,
      orauser,
      -1,
      -1,
      Izmer,
      'Наряд-выполнение: '+IntToStr(Akeynar)+', '+NarCaption+', общий перечень работ'
      );
  finally
  //  WaitIndicator.close;
  end;
end;

procedure TfrmMain.mnuHelpClick(Sender: TObject);
begin
  //вызвать оглавление справки
  Application.HelpFile := helpfile;
  Application.HelpCommand(HELP_FINDER, 0);
end;

procedure TfrmMain.N7Click(Sender: TObject);
begin
  TileMode :=  tbVertical;
  Tile;
end;

procedure TfrmMain.actLogonExecute(Sender: TObject);
begin
  LogonBtn.Down := not LogonBtn.Down;
  LogonBtn.OnClick(nil);
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
// закрытие программы через 20 минут простоя
 if LastInput >= 1200000 then {   1200000 - 20 мин}
 begin
   Application.Terminate;
 end;
end;

function LastInput: DWord;
var
  LInput: TLastInputInfo;
begin
  LInput.cbSize := SizeOf(TLastInputInfo);
  GetLastInputInfo(LInput);
  Result := GetTickCount - LInput.dwTime;
end;

procedure TfrmMain.viewUsersExecute(Sender: TObject);
//var frmUsers : TfrmUsersDoljn;
begin
  if MConnection.Connected then
  begin
    frmUsersDoljn := TfrmUsersDoljn.Create(Application);
    frmUsersDoljn.qrUserList.connection := MConnection;
    frmUsersDoljn.qrKarera.connection := MConnection;
    frmUsersDoljn.qrOrgNM.connection := MConnection;
    frmUsersDoljn.qrDoljSpr.connection := MConnection;
    //frmUsersDoljn.qrUserList.ParamByName('usr').Value := orauser;
    frmUsersDoljn.qrOrgNM.ParamByName('podrid').Value := PodrID; //frmUsersDoljn.qrOrgNM.ParamByName('usr').Value := orauser;
    frmUsersDoljn.FormStyle := fsMdiChild;
    frmUsersDoljn.Borderstyle := bsSizeable;
    frmUsersDoljn.Show;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
       if application.MessageBox('Приложение будет закрыто!',
           'Внимание!', MB_OKCANCEL+MB_ICONQUESTION) = IDOK	 then
       Action:=caFree
       else    Action:=caNone;
end;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//по коду ошибки возвращает русское название ошибки!
function TfrmMain.Get_ORA_Exception(const messages : string):string;
var p,i,c : integer;
begin
 Result := '';//инициализируем возвращаемое выражение

 if (pos('ORA-20010', messages) <> 0) then
 begin

   i := pos('*', messages);
   c := pos('#', messages);

   Result := 'Операция код: '+copy(messages, i+1, c-i-1)+ ' не применима для данной даты!';
   exit;
 end; // if (pos('ORA-01017', messages) <> 0)

 p := pos(':', messages) + 1; // позиция ":"
 Result := copy(messages, p, pos('®', messages) - p);
end;

//******************************************************************************
// ****     функция проверки на пустое значение               ******************
// ****     для SQL запросов на добавление и редактирование
function isZero( aVal: Variant) : string; overload;
begin
   try
     if (VarToStr(aVal) = '')or (aVal = null)
         then result:= 'null'
         else begin
                aVal:=aVal;
                result:=trim(aVal);
     end;
   except
        on E:Exception do
           MessageDlg( 'Преобразование невозможно. Функция isZero'+ aVal+#13#10+e.message , mtInformation, [mbOk], 0);
   end;
end;
//******************************************************************************
// ****     функция проверки на пустое значение               ******************
// ****     для SQL запросов на добавление и редактирование
function isZero( aVal: Variant; flg:boolean) : string; overload;
begin
   try
     if (VarToStr(aVal) = '')or (aVal = null)
         then result:= 'null'
         else begin
                aVal:=aVal;
                result:=trim(QuotedStr(aVal));
     end;
   except
        on E:Exception do
           MessageDlg( 'Преобразование невозможно. Функция isZero'+ aVal+#13#10+e.message , mtInformation, [mbOk], 0);
   end;
end;
//******************************************************************************
// ****     функция проверки на пустое значение               ******************
// ****     для SQL запросов на добавление и редактирование считыв
// ****     из dbCombobox значение KeyValue
function isZeroKeyValue( aVal: variant) : string;
begin
   try
     result:='';
    // if aVal=null
     if (VarIsNull(aVal)) or (aVal=0)
         then result:= 'null'
         else  result:=vartoStr(aVal);
   except
        on E:Exception do
           MessageDlg( 'Преобразование невозможно. Функция isZero'+ aVal+#13#10+e.message , mtInformation, [mbOk], 0);
   end;
end;
// *****************************************************************************
// ****     функция проверки на числовое значение                    ***********
// ****     для SQL запросов на добавление и редактирование
function isNumber( aVal: variant) : string;
begin
   try
     result:='';
     if (aVal=null) or (aVal=0)
         then result:= 'null'
         else begin
            FloatToStr(aVal);
            result:= aVal;
         end;
   except
        on E:Exception do
           MessageDlg( 'Неправильно введено цифровое значение:'+ aVal +'. Функция isNumber.'+#13#10+e.message , mtInformation, [mbOk], 0);
   end;
end;
// =============================================================================
// ==  Ввод только цифровых значений - для полей ввода
//     Использовать на KeyPressed компонента
function Enter_Number(key : char):char;
begin
 result:=key;
  if  not (key in ['0'..'9']) and not (key = #8 ) and not(key = DecimalSeparator)
     then  result := Chr(0);
end;
// =============================================================================
// ==  Ввод только цифровых значений - для полей ввода (через запятую или точку)
//     Использовать на KeyPressed компонента
procedure Enter_Number_KeyPress  (Sender: TObject; var Key: Char);
begin
 // Исключаем символы запрещенные для ввода
 case key of
    '0','1','2','3','4','5','6','7','8','9','-',#8: ;
     '.',',':
             begin
               Key := DecimalSeparator;
               if Pos(DecimalSeparator, (Sender as TEdit).Text) <> 0 then
                 Key := #0; // десятичный разделитель
             end
 else
   key:=#0;
 end;
end;
// =============================================================================
// ==  Ввод только цифровых значений + '<','>' - для полей ввода (через запятую или точку)
//     Использовать на KeyPressed компонента
procedure Enter_Number_Plus_KeyPress  (Sender: TObject; var Key: Char);
begin
 // Исключаем символы запрещенные для ввода
 case key of
    '0','1','2','3','4','5','6','7','8','9','<','>',#8: ;
     '.',',':
             begin
               Key := DecimalSeparator;
               if Pos(DecimalSeparator, (Sender as TEdit).Text) <> 0 then
                 Key := #0; // десятичный разделитель
             end
 else
   key:=#0;
 end;
end;
end.
