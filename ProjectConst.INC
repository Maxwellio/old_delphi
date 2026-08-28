const
  wm_user = $000400;

  (************************пользовательские сообщения**************************)
  WM_SaveZnParam = wm_user + $000001; //сохранить значения параметров
  WM_Update2 = wm_user + $000002;
  WM_ObjInspClose = WM_USER + $000003; //новое Windows сообщение
  WM_OnDsgnMode = WM_USER + $000004;
  WM_OffDsgnMode = WM_USER + $000005;

  vk = #13; //символ возврата каретки
  DefPlugPath = '.\Plugins\'; //относительный путь(от запускаемого файла) расположения модулей плугинов
  FrmExtUserRes = '.svg'; //расширения файла ресурса формы (индивидуальные настройки пользователей)

  {индексы внешних функций}
  SetAccessProc = 0;
  LoadCompFromDfmFile = 1;
  DbErrorProc = 2;
  GetDfmFromModule = 3;
  ParseDfmAndBuildTree = 4;

  {индексы форматов файлов данных}
  IniFile = 0;
  XmlFile = 1;
  HtmlFile = 2;
  DfmFile = 3;

  {типы форматов в кратком строковом представлении}
  IniFileStr = 'ini';
  XmlFileStr = 'xml';

