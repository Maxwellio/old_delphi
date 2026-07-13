unit CommonNarZadUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  {Dialogs,}  ImgList, ComCtrls, ToolWin, 
  Grids, FMTBcd, DB, SqlExpr, Buttons,
  StdCtrls, ExtCtrls, Menus, NarZadResUnit,
  ActnList, formSkvZadVar, MainUnit,
  OVNIDbControls, Dialogs, DBCtrls, Provider, DBClient, DBXpress, OvniGrids,
  Ora, MemDS, DBAccess, PgAccess;

{$I ProjectConst.INC}
{$I ProjectStr.INC}

type

  tk = record
    key,      //код блока в наряде
    idoplife, //код времени жизни измерителя операции
    parent: integer; //код родителя времени жизни
    numin: integer; //порядковый номер внутри уровня
    norma: array of {single}variant;//компоненты вектора нормы
  end;

  TOvniComboBox = class (OVNIGrids.TOvniComboBox)
   protected
//    procedure MouseWheel(Var Msg: TWMMOUSEWHEEL); message WM_MOUSEWHEEL;
  end;


  TfrmComNarZad = class(TForm)
    trGrdNar: TOVNIDbTreeGrid;
    qrNarZad: TPgQuery;
    qrNormAtribName: TPgQuery;
    qrCalcNorma1: TPgQuery;
    qrAllSavedNorms: TPgQuery;
    tbCreateCopyNarVip: TToolButton;
    tbExpandNodes: TToolButton;
    tbAutoWidthCols: TToolButton;
    tbReloadNar: TToolButton;
    tbCalcOper: TToolButton;
    tbNarToRes: TToolButton;
    tbCloseNarZad: TToolButton;
    tbDelSelOpers: TToolButton;
    tbFindWord: TToolButton;
    sAddRab: TPgStoredProc;
    Image1: TImage;
    qrClosed: TPgQuery;
    sClcBegDateNextOp: TPgStoredProc;
    sMoveRab: TPgStoredProc;
    tbSetWorker: TToolButton;
    tbReOrderRab: TToolButton;
    sORDERNAR: TPgStoredProc;
    sCopyZadToVip: TPgStoredProc;
    Image2: TImage;
    qrAlgInfo: TPgQuery;
    qrAllZnTekDiscrParam: TPgQuery;
    qrParamZ: TPgQuery;
    ActionList1: TActionList;
    actCalcOperAndSaveRes: TAction;
    actCreateCopyNarVip: TAction;
    actExpandNodes: TAction;
    actAutoWidthCols: TAction;
    actReloadNar: TAction;
    actNarToRes: TAction;
    actCloseNarZad: TAction;
    actDelSelOpers: TAction;
    actFindWord: TAction;
    actSetPlanMoment: TAction;
    actSetWorker: TAction;
    actReOrderRab: TAction;
    actOpenSkvZad: TAction;
    ToolButton1: TToolButton;
    actCopyRab: TAction;
    actPasteRab: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    sCopyOper: TPgStoredProc;
    actShowOk: TAction;
    ToolButton5: TToolButton;
    qrHtmlOk: TPgQuery;
    ToolButton6: TToolButton;
    actCutRab: TAction;
    actSaveSelElems: TAction;
    ColorDialog1: TColorDialog;
    Image3: TImage;
    sZadanie_Calc_OperP: TPgStoredProc;
    SZadanie_operac_copy: TPgStoredProc;
    sZadanie_operac_move: TPgStoredProc;
    actSelelColorRow: TAction;
    ToolButton7: TToolButton;
    actClearColor: TAction;
    ToolButton8: TToolButton;
    sZADANIE_OPERAC_DEL: TPgStoredProc;
    ToolButton9: TToolButton;
    actZadanie_add_emptyblock: TAction;
    sZADANIE_ADD_EMPTYBLOCK: TPgStoredProc;
    qrSetNextDateOper: TPgQuery;
    sZADANIE_RENUMLEVEL: TPgStoredProc;
    actRenameBlock: TAction;
    ToolButton2: TToolButton;
    ToolButton10: TToolButton;
    actFontDown: TAction;
    actFontUp: TAction;
    ToolButton11: TToolButton;
    SVIPOLNENIE_CREATE: TPgStoredProc;
    SZADANIE_REBUILD_OPER: TPgStoredProc;
    SZADANIE_CLOSENAR: TPgStoredProc;
    SZADANIE_ADD_RAZDEL: TPgStoredProc;
    actOpenDefNar: TAction;
    actViewOperInfo: TAction;
    ToolButton12: TToolButton;
    actZadanie_del_block: TAction;
    SZADANIE_OPERAC_DEL_BLOCK: TPgStoredProc;
    Panel1: TPanel;
    ToolButton13: TToolButton;
    qrEKS: TPgQuery;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    DataSource1: TDataSource;
    ToolBar1: TToolBar;
    DBLookupComboBox2: TDBLookupComboBox;
    sEdit1: TEdit;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    RightDockPanel: TPanel;
    Splitter2: TSplitter;
    GrdParams: TOVNIDbGrid;
    algInfo: TMemo;
    StatusBar1: TStatusBar;
    RightDockPanelSplitter: TSplitter;
    procedure tbCreateCopyNarVipClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure tbExpandNodesClick(Sender: TObject);
    procedure tbAutoWidthColsClick(Sender: TObject);
    procedure ReloadTekNar(aKeyNar,aminres,amaxres,aizmer: integer);
    procedure tbReloadNarClick(Sender: TObject);
    procedure tbNarToResClick(Sender: TObject);
    procedure tbDelSelOpersClick(Sender: TObject);
    procedure trGrdNarDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ReadOpParams(Sender: TObject);
    procedure SetWorker(Sender: TObject);
    procedure tbCloseNarZadClick(Sender: TObject);
    procedure trGrdNarDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure trGrdNarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbReOrderRabClick(Sender: TObject);
    //потеря фокуса с комбобокса ("До..")
    procedure cbParValuesExit(Sender: TObject);
    //потеря фокуса с комбобокса ("До..")
    procedure cbNormEditExit(Sender: TObject);
    //получение фокуса комбобобсом для редактирования нормы
    procedure cbParValuesEnter(Sender: TObject);
    //получение фокуса комбобобсом
    procedure cbNormEditEnter(Sender: TObject);
    {обработчик "фокусируемся на ячейке" До..}
    procedure GrdParams2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure actOpenSkvZadExecute(Sender: TObject);
    procedure actCopyRabExecute(Sender: TObject);
    procedure actPasteRabExecute(Sender: TObject);
    procedure tbCalcOperClick(Sender: TObject);
    procedure actShowOkExecute(Sender: TObject);
    //вырезать работу
    procedure actCutRabExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure actSelelColorRowExecute(Sender: TObject);
    procedure actClearColorExecute(Sender: TObject);
    procedure actZadanie_add_emptyblockExecute(Sender: TObject);
    procedure actRenameBlockExecute(Sender: TObject);
    procedure actFontDownExecute(Sender: TObject);
    procedure actFontUpExecute(Sender: TObject);
    procedure actOpenDefNarExecute(Sender: TObject);
    procedure actViewOperInfoExecute(Sender: TObject);
    procedure actZadanie_del_blockExecute(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);

  private
    GoingUp: boolean;
    BeforModifyStr: String;
    BeforModifyNorm: String;
    fEdAct: TEditAct;
    {загружает все сохраненные вектора норм наряда и расставляет по гриду}
    procedure LoadSavedNorms;
    procedure SetOperImgs(aNode: TGVTreeNode);
    {устанавливает сохраненные выделения элементов}
    procedure SetSaveSel(aNode: TGVTreeNode);
    {проверяет, закрытие наряда}
    function IsClosed: boolean;
    {итератор}
    procedure SetVal(aNode: TGVTreeNode; const aFieldNm,aFieldVal: String);
  public
    orauser:string;
    F : Tfont;
    keynar, //код наряда в целом
    minres, maxres, izmer, IzmerElCount: integer;
    lclosed: boolean;
    cbParValues: TOvniComboBox;
    cbNormEdit: TOvniComboBox;
    constructor Create(AOwner: TComponent); override;
    class procedure OpenNar(aKeyNar:integer; aorauser:string; aminres,amaxres,aizmer: integer; const aCaption: string);
    //фильтр ввода
    procedure EdKeyPress(Sender: TObject; var Key: Char);
  end;


implementation

uses
  formStructNur, formSetDate, formSetWorker, CommonNarVipUnit,
  UnitFormExplore;

{$R *.dfm}

var
  MoveOper: TGvTreeNode;

type
  tm = class(TCustomGrid)
  end;

procedure TfrmComNarZad.tbCreateCopyNarVipClick(Sender: TObject);
begin

  try
    //создаем пустое выполнение, т.е. его описание, копию сквозных параметров задания и т.д.
    SVIPOLNENIE_CREATE.ParamByname('aNarKey').value := keynar;
    SVIPOLNENIE_CREATE.ExecProc;
    TfrmComNarVip.OpenNar(keynar,orauser,minres,maxres,izmer,
        'Наряд-выполнение: '+IntToStr(frmmain.keynar)+', '+frmmain.NarCaption+', общий перечень работ');
  finally

  end;
end;

procedure TfrmComNarZad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

constructor TfrmComNarZad.Create(AOwner: TComponent);
var
  fname: string;
begin
  //если есть файл с конфигурацией, читаем все настройки объектов оттуда
  fname := ExtractFilePath(PathAndCfgFileName)+ClassName+FrmExtUserRes;
  if FileExists( fname ) then //файл настроек найден
    begin
      CreateNew(AOwner);
    end
  else //файл настроек не найден
    begin
      inherited Create(AOwner); //вызываем стандартный конструктор
      {**********************настройки по-умолчанию*************************}
      //ширины полей
      trGrdNar.ColWidths[0] := 25;
      trGrdNar.ColWidths[1] := 50;
      trGrdNar.ColWidths[2] := 40;
      trGrdNar.ColWidths[3] := 250;
      trGrdNar.ColWidths[4] := 75;
      trGrdNar.ColWidths[5] := 90;
      trGrdNar.ColWidths[6] := 36;
      trGrdNar.ColWidths[7] := 36;

      //исключаемые из автоподбора бысоты поля
      trGrdNar.ExclusionFields.Add('istnorm');
      trGrdNar.ExclusionFields.Add('Ресурс');

      GrdParams.ColWidths[0] := 15;
      GrdParams.ColWidths[1] := 100;
      GrdParams.ColWidths[2] := 100;

    end;
  fEdAct := edNone;
  qrEKS.Open;
  ClientDataSet1.Open;
end;

procedure TfrmComNarZad.EdKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9',#8: {Key := Key}; //в данном случае, тоже самое если бы просто был пустой оператор :;
    ',' :
      if pos(',',cbParValues.Text) > 0 then
        Key := #0; {если ',' уже есть}
    '-' :
      if (pos('-',cbParValues.Text) > 0) or (cbParValues.SelStart>0) then
        Key := #0;
    else
      Key := #0;
  end;
end;

procedure TfrmComNarZad.FormCreate(Sender: TObject);
begin
  {создаем и настраиваем параметры комбо-бокса для редактир-я знач параметров}
  F:= tfont.Create;
  f.Assign((sender as tform).Font);
  f.Size:=8;
  cbNormEdit := TOvniComboBox.Create(nil);
  cbNormEdit.Visible := false;
  cbNormEdit.Style:=csSimple;
  cbNormEdit.Parent := trGrdNar;
  cbNormEdit.OnEnter := cbNormEditEnter;
  cbNormEdit.OnExit := cbNormEditExit; //обработчик на потерю фокуса комбо
  cbNormEdit.OnKeyPress := EdKeyPress; //фильтр ввода с клавы

  cbParValues := TOvniComboBox.Create(nil);
  cbParValues.Visible := false;
  cbParValues.PickList.Style := lbOwnerDrawVariable;
  cbParValues.PickList.BorderItem := true;
  cbParValues.Parent := GrdParams;
  cbParValues.OnEnter := cbParValuesEnter;
  cbParValues.OnExit := cbParValuesExit; //обработчик на потерю фокуса комбо
  cbParValues.OnKeyPress := EdKeyPress; //фильтр ввода с клавы
 end;

procedure TfrmComNarZad.sSpeedButton3Click(Sender: TObject);
begin
  with trGrdNar do
    Locate(GetField(Col,Row).Value, sEdit1.Text, false, Row-FixedRows+1);
end;

procedure TfrmComNarZad.tbExpandNodesClick(Sender: TObject);
begin
  IF not tbExpandNodes.Down THEN trGrdNar.FullCollapse
  else trGrdNar.FullExpand;
end;

procedure TfrmComNarZad.tbAutoWidthColsClick(Sender: TObject);
begin
  trGrdNar.SetAutoWidthAllColumns;
end;

{Перечитываем наряд из базы}
procedure TfrmComNarZad.ReloadTekNar(aKeyNar,aminres,amaxres,aizmer: integer);
var
  i: integer;
  fieldVal : string;  
begin
  with trGrdNar do
  begin
    trGrdNar.SaveExpandNodes('key', fieldVal);  // запоминаем все раскрытые ноды и позицию на которой стоим  
    lclosed := IsClosed;
    qrNarZad.ParamByName('keynar').AsBCD := aKeyNar; //код наряда
    qrNarZad.Open;
    LoadTree(qrNarZad,'key','parent',4,['parent','prnum','oper','operlifeid','operlifetype','colorsel','locked', 'narkey','RS']);
    qrNarZad.Close;
                      // if   trGrdNar.Items.AllNodeCount >0 then
    trGrdNar.ColorValueField:='colorsel';
    {устанавливаем битмэп-значки, признаки типов операции}
    if Items.Root.Count > 0 then SetOperImgs(Items.Root);

    {настраиваем заголовки полей для пользователя и другие атрибуты}
   Fields.SetTitles1(['key','parent','prnum','ord','istnorm','begoperdate','nm', 'oper','ot','do_','n1','n2',
      'operlifeid','operlifetype','colorsel','locked', 'narkey','tipbur'],
      ['Код строки','Код родителя', '№ п/п', '№ п/п','Источник нормирования','Время начала работы','Название работы','Код операции',
      'Интервал от','Интервал до','Н.в. на ед. измер.','Н.в. на объем раб.','Код нормообразования'
      ,'Тип нормообразования','Цвет выделения','Блокировка','Код наряда','ЭКС']);
      StatusBar1.Panels[1].Text := floattostr  ( trGrdNar.CalcItogsNS( trGrdNar.Items.Root, 'n2'));
      trGrdNar.BeginRebuildStruct;
       for i:=0 to trGrdNar.Fields.Count-1 do
          trGrdNar.Fields.SetAtrib(i,haLeft,vaTop,cont,false,F,true);
      trGrdNar.EndRebuildStruct;
  end;
  trGrdNar.LoadExpandNodes('key', fieldVal); // раскрываем запомненные ноды
    qrEKS.close;
  ClientDataSet1.close;
    qrEKS.Open;
  ClientDataSet1.Open;
  end;

{загружает все сохраненные нормы наряда и расставляет по гриду}
procedure TfrmComNarZad.LoadSavedNorms;
var
  AllNarNorms: array of tk; //все нормы наряда
  c,i,tNum: integer;

  procedure PutNormsToGrid(aNode: TGVTreeNode; var tNum: integer);
  var
    i,j: integer;
  begin
    if aNode.Count = 0 then //если лист, пишем
      begin
        for i := 1 to IzmerElCount do //цикл по полям вектора нормы
          if AllNarNorms[tNum].norma[i-1] <> null then //!
            aNode.cells[ trGrdNar.fields.IndexByName['field'+IntToStr(i)] ].Value
              := {FloatToStr}(AllNarNorms[tNum].norma[i-1]*kf);
        inc(tNum);
      end
    else //если узел, обходим дальше
      for j := 0 to aNode.Count-1 do
        PutNormsToGrid(aNode.Items[j], tnum);
  end;
begin
  {готовим запрос, задаем параметры}
  qrAllSavedNorms.ParamByName('keynar').AsBCD := keynar;
  qrAllSavedNorms.ParamByName('CodIzmer').AsBCD := izmer;
  qrAllSavedNorms.ParamByName('deepLev').AsBCD := VisibleOperDeepLevel;
  qrAllSavedNorms.open;

  {забрасываем данные в спец массив}
  SetLength(AllNarNorms, 1);
  SetLength(AllNarNorms[0].norma, IzmerElCount);
  AllNarNorms[0].key := qrAllSavedNorms.fieldbyname('key').asInteger;
  AllNarNorms[0].idoplife := qrAllSavedNorms.fieldbyname('id').asInteger;
  AllNarNorms[0].parent := qrAllSavedNorms.fieldbyname('parent').asInteger;
  AllNarNorms[0].numin := qrAllSavedNorms.fieldbyname('numin').asInteger;
  i := 0; //счетчик компонент нормы
  c := 0; //индекс строки массива
  while not qrAllSavedNorms.eof do //бежим по записям всех норм дерева
  begin
    if i = IzmerElCount then //очередная норма со всеми компонентами считана
    begin
      inc(c); //новая запись массива
      SetLength(AllNarNorms, length(AllNarNorms)+1);
      SetLength(AllNarNorms[c].norma, IzmerElCount);
      AllNarNorms[c].key := qrAllSavedNorms.fieldbyname('key').asInteger;
      AllNarNorms[c].idoplife := qrAllSavedNorms.fieldbyname('id').asInteger;
      AllNarNorms[c].parent := qrAllSavedNorms.fieldbyname('parent').asInteger;
      AllNarNorms[c].numin := qrAllSavedNorms.fieldbyname('numin').asInteger;
      i := 0;
    end;
    AllNarNorms[c].norma[i] := qrAllSavedNorms.fieldbyname('norma').Value{AsFloat};
    qrAllSavedNorms.Next;
    inc(i);
  end;
  qrAllSavedNorms.Close;
  if length(AllNarNorms)=1 then exit;

  {раскладывем данные по гриду}
  tNum := 0;
  PutNormsToGrid(trGrdNar.Items.Root,tNum);
end;

procedure TfrmComNarZad.SetOperImgs(aNode: TGvTreeNode);
var
  j: integer;
begin
  if (aNode.Count = 0) and (aNode.cells[trGrdNar.fields.IndexByName['operlifetype']].Value<>'')  then //если лист, пишем
    begin
      case StrToInt(aNode.cells[trGrdNar.fields.IndexByName['operlifetype']].Value) of
        79,80: //комбинация, алгоритм
          aNode.imgs[trGrdNar.fields.IndexByName['nm']]:=Image1.Picture.Bitmap;
        82: //ненормируемая(экспериментальная) работа
          aNode.imgs[trGrdNar.fields.IndexByName['nm']]:=Image2.Picture.Bitmap;
      end
    end
  else //если узел, обходим дальше
    begin
    //структура имеет свой значек
    if   (aNode.cells[trGrdNar.fields.IndexByName['operlifetype']].Value)<>''
    then aNode.imgs[trGrdNar.fields.IndexByName['nm']]:=Image3.Picture.Bitmap;
    for j := 0 to aNode.Count-1 do
      SetOperImgs(aNode.Items[j]);
    end;
end;

class procedure TfrmComNarZad.OpenNar(aKeyNar:integer; aorauser:string; aMinres,aMaxres,aizmer: integer;
  const aCaption: string);
begin
  with TfrmComNarZad.Create(Application) do
  begin
    keynar := aKeyNar;
    orauser:=  aorauser ;
    Minres := aMinres;
    Maxres := aMaxres;
    izmer := aizmer;
    caption := acaption;
    ReloadTekNar(keynar, minres, maxres, izmer);
  end;
end;

procedure TfrmComNarZad.tbReloadNarClick(Sender: TObject);
begin
  ReloadTekNar(keynar,minres,maxres,izmer);
end;

procedure TfrmComNarZad.tbCalcOperClick(Sender: TObject);
var
  i: LongInt;
  loc: string;                   //19.10.2011
begin  
 if cbParValues.Focused then
    cbParValuesExit(Self); //если фокус не снят, принуждаем и значение параметра сохранится
  {********вычисление операции по заданным визуально! параметрам***************}

 with trGrdNar do
 begin
   if ((ByFieldName['operlifetype'].Value='79') or (ByFieldName['operlifetype'].Value='80')) then
     begin
       //проверяем надо ли перестраивать операцию :)
        SZADANIE_REBUILD_OPER.ParamByname('AKEY').value:=ByFieldName['key'].Value;
        SZADANIE_REBUILD_OPER.ParamByname('AnarKEY').value:=ByFieldName['narkey'].Value;
        SZADANIE_REBUILD_OPER.ExecProc;

        if SZADANIE_REBUILD_OPER.ParamByname('AISREBUILD').value=1 then
        begin
                  Application.MessageBox( pchar('Операция была перестроена проверьте параметры и повторите рассчет!'),
                                pchar('Внимание!'));
                  loc:=ByFieldName['key'].Value;
                   ReloadTekNar(keynar,minres,maxres,izmer); //перечитываем наряд
                   if loc <>'' then
                   trGrdNar.Locate('key',loc);

        end
        else
        begin
       //рассчитываем норму
       //--------------------
       sZadanie_Calc_OperP.ParamByname('AKEY').value:=ByFieldName['key'].Value;
       sZadanie_Calc_OperP.ParamByname('aoperlifeid').value:=ByFieldName['operlifeid'].value;
       sZadanie_Calc_OperP.ParamByname('AIZMER').value := izmer;
       sZadanie_Calc_OperP.ParamByname('normaed').value := 0;
       sZadanie_Calc_OperP.ParamByname('normaob').value := 0;
       sZadanie_Calc_OperP.ParamByname('istochniki').value := '';
       sZadanie_Calc_OperP.ExecProc;
       
       //обновили источник и норму в гриде
       if    sZadanie_Calc_OperP.ParamByname('istochniki').value<>null then
       ByFieldName['istnorm'].Value:= sZadanie_Calc_OperP.ParamByname('istochniki').value;
       if sZadanie_Calc_OperP.ParamByname('normaed').value<>null then
       ByFieldName['n1'].Value:=sZadanie_Calc_OperP.ParamByname('normaed').value;
       if sZadanie_Calc_OperP.ParamByname('normaob').value<>null then
       ByFieldName['n2'].Value:=sZadanie_Calc_OperP.ParamByname('normaob').value;


       if    sZadanie_Calc_OperP.ParamByname('aot').value<>null then
       ByFieldName['ot'].Value:=sZadanie_Calc_OperP.ParamByname('aot').value ;

       if    sZadanie_Calc_OperP.ParamByname('ado').value<>null then
       ByFieldName['do_'].Value:=sZadanie_Calc_OperP.ParamByname('ado').value ;

       trGrdNar.Invalidate; //обновляем грид, данные уже есть


      frmMain.MConnection.ExecSQL('CALL burnar.SetNextDateOperZAD( ''' + ByFieldName['key'].Value + ''',''' + ByFieldName['narkey'].Value + ''');');

       //считаем даты для всех операций что ниже
       qrSetNextDateOper.Close;
       qrSetNextDateOper.ParamByname('usr').value := OraUser;//GetEnvironmentVariable('username');
       qrSetNextDateOper.ParamByname('AnarKEY').value := ByFieldName['narkey'].Value;
       qrSetNextDateOper.Open;

       //нужно обойти те узлы где значение даты изменилось и проставить новые даты
       UpdateTree(qrSetNextDateOper,'key',['begoperdate']);
         end;
     end;
 end;

   frmMain.MConnection.ExecSQL('DELETE FROM burnar.tkeydate where os_user = ''' +OraUser
                                       //GetEnvironmentVariable('username')
                                       + ''' and narkey = ' + trGrdNar.ByFieldName['narkey'].Value);


   StatusBar1.Panels[1].Text := floattostr  ( trGrdNar.CalcItogsNS( trGrdNar.Items.Root, 'n2'));
end;

procedure TfrmComNarZad.SetVal(aNode: TGvTreeNode; const aFieldNm,aFieldVal: String);
var j: integer;
begin
  aNode.cells[ trGrdNar.fields.IndexByName[aFieldNm] ].Value := aFieldVal;
  if aNode.Count > 0 then //если узел, обходим дальше
    for j := 0 to aNode.Count-1 do SetVal(aNode.Items[j], aFieldNm,aFieldVal);
end;

procedure TfrmComNarZad.tbNarToResClick(Sender: TObject);
begin
  {раскладываем уже созданный в базе наряд-задание по всем ресурсам}
  with frmMain.qrNarZadAllRes do
  begin
    ParamByName('narkey').asBCD := keynar;
    Open;
    while not eof do
    begin
      TfrmNarZadRes.opennar(
        keynar,
        FieldByName('whowork').AsInteger,
        izmer,
        'Наряд-задание: '+IntToStr(keynar)+', '+frmMain.NarCaption+', Исполнитель: '+FieldByName('nm').AsString
        );
      Next;
    end;
    close;
  end;
end;


procedure TfrmComNarZad.tbDelSelOpersClick(Sender: TObject);
var
  i: integer;
  AllOk: boolean;
begin

  if length(trGrdNar.SelectedRecs) = 0 then exit;
   //будут удалены отмеченные наряды полностью, Вы уверены, что хотите продолжить?
  if Application.MessageBox(
    pchar('Отмеченные работы будут удалены, Вы уверены, что хотите продолжить?'),
    pchar(MsgAttentionRu),
   MB_OKCANCEL+MB_ICONEXCLAMATION) = IDCANCEL then exit;

  AllOk := true;
  trGrdNar.Items.BeginRebuildStruct;
  trGrdNar.SortSelected; //сортируем выделенные записи
  for i := length(trGrdNar.SelectedRecs)-1 downto 0 do

  begin
    //заполняем параметры процедуры удаления параметров
    sZADANIE_OPERAC_DEL.ParamByName('akey').value:= trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value;
    if trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['parent']].Value='' then
    sZADANIE_OPERAC_DEL.ParamByName('aparent').value := null
    else
    sZADANIE_OPERAC_DEL.ParamByName('aparent').value := trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['parent']].Value;
    sZADANIE_OPERAC_DEL.ParamByName('aprnum').value := trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['prnum']].Value;
    sZADANIE_OPERAC_DEL.ParamByName('anarkey').value := trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['narkey']].Value;
   // loc:= trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['parent']].Value;
    try
    sZADANIE_OPERAC_DEL.ExecProc;
    trGrdNar.Items.Delete( trGrdNar.SelectedRecs[i].Node );
      //удаляем из памяти таблицы выделенную запись, если изменение в базе прошло благополучно
    except
      on E: Exception do
      begin
        AllOk := false;
        Application.MessageBox(pchar(E.Message), pchar(E.HelpContext),MB_OK+MB_ICONERROR);
      end;
    end;
  end; //end for
  trGrdNar.SelectedRecs := nil;
 trGrdNar.Items.EndRebuildStruct;

  if AllOk then //сигналим пользователю об удачной операции
    Application.MessageBox(Pchar(MsgChangeSavedRu),PChar(MsgAttentionRu),
    MB_OK+MB_ICONEXCLAMATION);
  qrNarzad.Open;
 trGrdNar.UpdateTree(qrNarzad,'key',['prnum','ord']);
 trGrdNar.Invalidate;
 qrNarzad.Close;
  StatusBar1.Panels[1].Text := floattostr  ( trGrdNar.CalcItogsNS( trGrdNar.Items.Root, 'n2'));
end;                                

procedure TfrmComNarZad.trGrdNarDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if source is TOVNIDbTreeGrid then
  begin
    if ((source as TOVNIDbTreeGrid).Parent.parent as TForm).Name='frmStructNar' then
    begin
      Accept := true;
    end
    else
    if ((sender as TOVNIDbTreeGrid).Parent.parent as TForm).Caption<>((Source as TOVNIDbTreeGrid).Parent.parent as TForm).Caption then
    begin
      Accept := False;
    end
    else
      Accept := true;
  end;
end;

procedure TfrmComNarZad.ReadOpParams(Sender: TObject);
var
  i: integer;
  FieldName: String;
  mR: TRect;
begin
  if trGrdNar.CurNode = nil then exit;
  if AlgInfo.Text <> '' then AlgInfo.Text := '';
  if GrdParams.Recs.Count > 0 then GrdParams.Recs.Clear;
  lclosed:=IsClosed;

      //Выводим код операции в systemtray
      if (trGrdNar.Items.AllNodeCount > 0) and (trGrdNar.ByFieldName['oper'].Value <> '') then
         StatusBar1.Panels[4].Text := trGrdNar.ByFieldName['oper'].Value
      else
         StatusBar1.Panels[4].Text := '';


  //если работа экспериментальная нужно дать пользователю ввести предполагаемую норму
   if (trGrdNar.ByFieldName['operlifetype'].Value='82') and ( not lclosed ) then
     begin
       FieldName := UpperCase( trGrdNar.GetField( trGrdNar.Col, trGrdNar.Row).Value );
       if FieldName = 'N2' then

           mR := trGrdNar.CellRect(trGrdNar.Col, trGrdNar.Row);
           if mR.Left+trGrdNar.ColWidths[trGrdNar.Col] > trGrdNar.ClientWidth then exit;
           if mR.Top+trGrdNar.RowHeights[trGrdNar.Row] > trGrdNar.ClientHeight then exit;
           cbNormEdit.PickList.Items.Clear;
           cbNormEdit.Text := '';
          {показываем комбо для редактирования}
          cbNormEdit.BoundsRect := mR; //получаем координаты ячейки
          //03.01.2011 если

          cbNormEdit.BorderStyle := bsNone;
          cbNormEdit.Text:= trGrdNar.ByFieldName['N2'].Value ;
          cbNormEdit.Visible := True;
          cbNormEdit.SetFocus; //ставим фокус на себя
        end
      else
        if cbNormEdit.Visible then cbNormEdit.Visible := false;

  with trGrdNar do
  begin
    if (RightDockPanel.Width < 50) or
      (
        (ByFieldName['operlifetype'].Value<>'79') //комбинация
        and (ByFieldName['operlifetype'].Value<>'80') //алгоритм
      )
    then exit;

    {считываем параметры, если операция предполагает это}
    qrParamZ.ParamByName('narkey').AsString := ByFieldName['narkey'].Value;
    qrParamZ.ParamByName('zadkey').AsString := ByFieldName['key'].Value;
    qrParamZ.ParamByName('aoperlifeid').AsString := ByFieldName['operlifeid'].Value;

    qrParamZ.Open;
    
    GrdParams.LoadDataset(qrParamZ,['PTYPE','parcode', 'КодЗначения','zad_key','isskv']);
    qrParamZ.Close;
    GrdParams.ColorValueField:='isskv';

    {укажем типы для визуального отображения}

    with GrdParams do
    for i := 0 to GrdParams.Recs.Count-1 do
    begin
      if Recs[i][Fields.IndexByName['ptype']].Value = '2' then
        Recs[i][Fields.IndexByName['Значение']].TypeF := Discr
      else
        Recs[i][Fields.IndexByName['Значение']].TypeF := Cont;
      Recs[i][Fields.IndexByName['Значение']].ShowType := true;
    end;

    {загружаем доп инфу по алгоритмам}
    if (AlgInfo.Visible) and (AlgInfo.ClientHeight > 10) then
      if (ByFieldName['operlifetype'].Value='80') then //если алгоритм
        begin
          qrAlgInfo.ParamByName('oplife').AsString := ByFieldName['operlifeid'].Value;
          qrAlgInfo.Open;
          AlgInfo.Text := qrAlgInfo.FieldByName('ops').AsString;
          qrAlgInfo.Close;
        end ;
    //если работа заблокирована менять параметры нельзя!
     if lclosed 
       then
         GrdParams.enabled:=false
       else
         GrdParams.enabled:=true ;
      GrdParams.BeginRebuildStruct;
       for i:=0 to GrdParams.Fields.Count-1 do
          GrdParams.Fields.SetAtrib(i,haLeft,vaTop,cont,false,F,true);
      GrdParams.EndRebuildStruct;
      cbParValues.Font:=f;
  end;

end;

procedure TfrmComNarZad.SetWorker(Sender: TObject);
var
  keyRes: integer;
  i: integer;
  sql: string;
begin
  keyRes := -1;
  //задаем исполнителей на операции
  with TfrmSetWorker.Create(self) do
  begin
    if ShowModal = mrOk then
      keyRes := Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]); //получаем код ресурса
    destroy;
  end;

  if keyRes = -1 then exit;
  try
    for i := 0 to length(trGrdNar.SelectedRecs)-1 do
    begin
      //формируем шаблон запроса на обновление
      sql := 'update burnar.narzad set whowork=%d where key=%s';
      sql := Format(sql,[keyRes,
        trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value
        ]);
      try
        frmMain.MConnection.ExecSQL(SQL);
      except
        on E: Exception do
          Application.MessageBox(pchar(E.Message), pchar(E.HelpContext),MB_OK+MB_ICONERROR);
      end;
    end; //end for
    trGrdNar.SelectedRecs := nil;
    ReloadTekNar(keynar,minres,maxres,izmer); //перечитываем наряд
  finally
  end
end;

procedure TfrmComNarZad.tbCloseNarZadClick(Sender: TObject);
var str:string;
    i, c : integer;
begin
 try
   if application.MessageBox('Наряд-задание будет закрыто!', 'Внимание!', MB_OKCANCEL+MB_ICONQUESTION) = IDCANCEL	 then
      exit
   else
     try
       SZADANIE_CLOSENAR.ParamByname('ANARKEY').value := keynar;
       SZADANIE_CLOSENAR.ExecProc;
       lclosed := true;            
     except
     on E: Exception do
     begin
       str := frmMain.Get_ORA_Exception(E.Message);
       if Length(str) <> 0 then
       begin
          i := pos('*', E.Message);
          c := pos('#', E.Message);
          sEdit1.Text := Trim(copy(E.Message, i + 1, c - i - 1));
          Application.MessageBox(PChar(str), 'Ошибка', MB_ICONWARNING);
       end
       else
       begin
          i := pos('*', E.Message);
          c := pos('#', E.Message);
          sEdit1.Text := Trim(copy(E.Message, i + 1, c - i - 1));
          Application.MessageBox(PChar(E.Message), 'Error', MB_ICONERROR);
       end;
       Screen.Cursor := crDefault;
     end; // on E: Exception do
   end;
   finally
     ReloadTekNar(keynar,minres,maxres,izmer);//перечитываем текущий наряд с сервераOper := nil; //операция закончена, сбрасываем переменную
   end;


 (*try
 if application.MessageBox('Наряд-задание будет закрыто!',
           'Внимание!', MB_OKCANCEL+MB_ICONQUESTION) = IDCANCEL	 then
       exit
       else
   try

  SZADANIE_CLOSENAR.ParamByname('ANARKEY').value := keynar;
  SZADANIE_CLOSENAR.ExecProc;
  lclosed := true;


  except
   on E: Exception do

   begin
      str := frmMain.Get_ORA_Exception(E.Message);
     if Length(str) <> 0 then
        Application.MessageBox(PChar(str), 'Ошибка', MB_ICONWARNING)
     else
        Application.MessageBox(PChar(E.Message), 'Error', MB_ICONERROR);
     Screen.Cursor := crDefault;
   end; // on E: Exception do
  end;
  finally
  ReloadTekNar(keynar,minres,maxres,izmer);//перечитываем текущий наряд с сервераOper := nil; //операция закончена, сбрасываем переменную
  end;*)


end;

procedure TfrmComNarZad.trGrdNarDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  acol,arow: integer;
  DestNode: TGVTreeNode;
  loc: string;
begin
  if lclosed then
  begin
    MoveOper := nil;
    DestNode := nil;
    exit;
  end;
  if MoveOper <> nil then  //перемещение работы
    begin
      with trGrdNar do//получаем координаты ячейки, в которой бросили работу
      begin
        MouseToCell(X,Y, ACol,ARow);
        if (ARow <= {0}FixedRows-1) or (VisRecs[ARow-FixedRows] = MoveOper) then
        begin
          MoveOper := nil;
          exit; //бросили мимо элемента сетки, или тот же узел-выход, либо на шапку притащили
        end;
        {передвигаем работу}
        try
          if MoveOper.Cells[Fields.IndexByName['narkey']].Value<>VisRecs[ARow-fixedRows].Cells[Fields.IndexByName['narkey']].Value  then
            begin
              Application.MessageBox(Pchar('Перемещение между разными нарядами запрещено!'),PChar(MsgAttentionRu),
              MB_OK+MB_ICONEXCLAMATION);
              exit;
            end   ;

          if MoveOper.Cells[Fields.IndexByName['parent']].Value=''
          then
          sZadanie_operac_move.ParamByname('aparent').value :=null
          else
          sZadanie_operac_move.ParamByname('aparent').value := MoveOper.Cells[Fields.IndexByName['parent']].Value;

          sZadanie_operac_move.ParamByname('AKEY').value := MoveOper.Cells[Fields.IndexByName['key']].Value;

          sZadanie_operac_move.ParamByname('Aprnum').value := MoveOper.Cells[Fields.IndexByName['prnum']].Value;
          sZadanie_operac_move.ParamByname('newprnum').value :=  VisRecs[ARow-fixedRows].Cells[Fields.IndexByName['PRNUM']].Value;

          if VisRecs[ARow-fixedRows].Cells[Fields.IndexByName['parent']].Value=''then
          sZadanie_operac_move.ParamByname('newparent').value := null
          else
          sZadanie_operac_move.ParamByname('newparent').value :=  VisRecs[ARow-fixedRows].Cells[Fields.IndexByName['parent']].Value;
           sZadanie_operac_move.ParamByname('anarkey').value :=  MoveOper.Cells[Fields.IndexByName['narkey']].Value ;

          if ( VisRecs[ARow-fixedRows].Cells[Fields.IndexByName['operlifetype']].Value='') and  (VisRecs[ARow-fixedRows].Count=0) then
          if application.MessageBox('Данный блок пустой! Выберите действие:'+#13+'OK - данные будут вставлены внутрь блока'+#13+'ОТМЕНА - данные  будут вставлены перед блоком',
           'Внимание!',  MB_OKCANCEL+MB_ICONQUESTION) = IDOK
          then        begin
          sZadanie_operac_move.ParamByname('newparent').value := VisRecs[ARow-fixedRows].Cells[Fields.IndexByName['key']].Value; // пользователь вставляет в пустой блок
         sZadanie_operac_move.ParamByname('newprnum').value := 1 // пользователь вставляет в пустой блок

          end ;

          loc:=MoveOper.Cells[trGrdNar.Fields.IndexByName['key']].Value ;

          sZadanie_operac_move.ExecProc;
          ReloadTekNar(keynar,minres,maxres,izmer);//перечитываем текущий наряд с сервера
          if loc<>'' then
          trGrdNar.Locate('key',loc);
        finally
          MoveOper := nil; //операция закончена, сбрасываем переменную
        end;
      end;
    end //конец перемещения работы
  else
    begin //добавление работы из структуры
      //получаем координаты ячейки, в которой бросили работу
      trGrdNar.MouseToCell(X,Y, ACol,ARow);
      if ARow <= 0 then exit; //бросили мимо "правильного" элемента сетки
      //сохраняем узел-приёмник
      if length(trGrdNar.VisRecs) = 0 then
        begin
          //нет видимых строк, наряд пустой
          SZADANIE_ADD_RAZDEL.ParamByname('aprnum').value := 1;
          SZADANIE_ADD_RAZDEL.ParamByname('aparent').value := null;
        end
      else
        begin
          //наряд не пустой
          DestNode := trGrdNar.VisRecs[ARow-trGrdNar.fixedRows];
          SZADANIE_ADD_RAZDEL.ParamByname('aprnum').value := DestNode.Cells[trGrdNar.Fields.IndexByName['PRNUM']].Value;
          if DestNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value=''
          then
          SZADANIE_ADD_RAZDEL.ParamByname('Aparent').value :=null
          else
          SZADANIE_ADD_RAZDEL.ParamByname('Aparent').value := DestNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value;

          if (DestNode.Cells[trGrdNar.Fields.IndexByName['operlifetype']].Value='') and  (DestNode.Count=0) then

          if application.MessageBox('Данный блок пустой! Выберите действие:'+#13+'OK - данные будут добавлены внутрь блока'+#13+'ОТМЕНА - данные  будут добавлены перед блоком',
           'Внимание!',  MB_OKCANCEL+MB_ICONQUESTION) = IDOK
          then  begin
          SZADANIE_ADD_RAZDEL.ParamByname('Aparent').value := DestNode.Cells[trGrdNar.Fields.IndexByName['key']].Value; // пользователь вставляет в пустой блок
          SZADANIE_ADD_RAZDEL.ParamByname('aprnum').value:=1;
          end ;
        end;
      try
        SZADANIE_ADD_RAZDEL.ParamByname('NKEY').value := keynar;
        SZADANIE_ADD_RAZDEL.ParamByname('DATEIN').value := null;
        SZADANIE_ADD_RAZDEL.ParamByname('WHO').value := null;
        SZADANIE_ADD_RAZDEL.ParamByname('WITHNAME').value := 1;
        SZADANIE_ADD_RAZDEL.ParamByname('RAZDEL').value := SrcNode.Cells[frmStructNar.Catalog.Fields.IndexByName['Код раздела']].Value;

        if trGrdNar.Items.AllNodeCount > 0 then
          loc := DestNode.Cells[trGrdNar.Fields.IndexByName['key']].Value; //29032024

        SZADANIE_ADD_RAZDEL.ExecProc;
        ReloadTekNar(keynar,minres,maxres,izmer);//перечитываем текущий наряд с сервера
        if loc <> '' then
        trGrdNar.Locate('key',loc);

      finally
      end;
    end;
end;

procedure TfrmComNarZad.trGrdNarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ACol,ARow: integer;
begin
  if Button = mbRight then
  begin
    //запоминаем, какую видимую запись потащили
    trGrdNar.MouseToCell(X,Y, ACol,ARow); //получаем координаты ячейки, в которой нажали мышь
    if (arow < 0) or (acol < 0) or (arow < trGrdNar.fixedrows) then exit;
    MoveOper := trGrdNar.VisRecs[ARow-TGvTreeGrid(Sender).fixedRows];
    TControl(Sender).BeginDrag(True);
  end;
end;

procedure TfrmComNarZad.tbReOrderRabClick(Sender: TObject);
begin
  sZADANIE_RENUMLEVEL.ParamByname('aNarKey').value := trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['narkey']].Value;

  if  trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['Parent']].Value<>'' then
    sZADANIE_RENUMLEVEL.ParamByname('aParent').value := trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['Parent']].Value
  else
    sZADANIE_RENUMLEVEL.ParamByname('aParent').value :=null;
    sZADANIE_RENUMLEVEL.ExecProc;
    qrNarzad.Close;
    qrNarzad.Open;
    trGrdNar.UpdateTree(qrNarzad,'key',['ord','prnum']);
    trGrdNar.Invalidate;
    qrNarzad.Close;
end;

procedure TfrmComNarZad.cbParValuesEnter(Sender: TObject);
begin
  BeforModifyStr := cbParValues.Text; //запоминаем что было до
end;

procedure TfrmComNarZad.cbNormEditEnter(Sender: TObject);
begin
  BeforModifyNorm := cbNormEdit.Text; //запоминаем что было до
end;

procedure TfrmComNarZad.cbParValuesExit(Sender: TObject);
var
  mVal: double; //сохраняемое значение параметра
  discrZnKey: integer;
  ind: integer; //найденный объект в списке
  upd,mVal1,del: string;
begin
  cbParValues.Visible := false;
  if cbParValues.Text = BeforModifyStr then exit; //ничего не изменилось, нет смысла в дальнейших действиях

  with GrdParams do
  begin
    mval := 0;
    ind := -1;

    try
      if ByFieldName['ptype'].Value = '1' then //если параметр непрерывный
        begin
          if cbParValues.text <> '' then
            mval := StrToFloat(cbParValues.text); //пытаемся преобразовать в число - трюк для возбуждения экзепта
        end
      else //if ByFieldName['ptype'].Value = '2' then //если параметр дискретный (из справочника значений)
        begin
          Ind := cbParValues.PickList.Items.IndexOf(cbParValues.Text);
          if Ind = 0 then //выбрано фиктивное пустое значение дискретного параметра
            ByFieldName['КодЗначения']^.Value := '' //это аналог nil
          else //было выбрано значение из справочника
            begin
              discrZnKey:= Integer( cbParValues.PickList.Items.Objects[ ind ] ); //получаем код дискретного параметра
              ByFieldName['КодЗначения']^.Value := IntToStr(discrZnKey); //записываем код дискретного значения
            end;
        end;
      ByFieldName['Значение']^.Value := cbParValues.Text; //записываем само выбранное значение в ячейку таблицы
      //SendMessage(self.Handle, WM_SaveZnParam, 0, 0); //сохраняем значение в базе

      {***************************сохраняем значение в базе********************}
      //если параметр дискретный, будем сохранять код его значения, если непрерывный - само значение
      if ByFieldName['ptype'].Value = '2' then
        mVAL1 := ByFieldName['КодЗначения'].Value
      else
        mVAL1 := ByFieldName['Значение'].Value;
      if mVAL1 = '' then mVAL1 := 'null';
      mval1 := StringReplace(mVAL1,',','.',[]); //если в числе есть запятая, меняем ее на '.'
      upd := Format( 'update burnar.zadanie_param set znach = %s where zad_key=%s and parcode=%s',
                     [
                     mVAL1,
                     ByFieldName['zad_key'].Value,
                     ByFieldName['parcode'].Value
                     ]);
      frmMain.MConnection.ExecSQL(upd);
      ByFieldName['Значение']^.Value := cbParValues.Text;
      //меняем логически на клиенте код нового дискр парам
      if ByFieldName['ptype'].Value = '2' then
         ByFieldName['КодЗначения']^.Value := mVAL1;

      upd:=Format('update burnar.zadanie_norm set norma=null where zad_key=%s;', [ByFieldName['zad_key'].Value]);
      frmMain.MConnection.ExecSQL(upd);
      del:=Format('delete from burnar.zadanie_ist where zad_key=%s;', [ByFieldName['zad_key'].Value]);
      frmMain.MConnection.ExecSQL(del);
      trGrdNar.ByFieldName['n1']^.Value:='';
      trGrdNar.ByFieldName['n2']^.Value:='';
      trGrdNar.ByFieldName['istnorm']^.Value:='';
      trGrdNar.Invalidate;
    except
    end;
  end;

end;
procedure TfrmComNarZad.cbNormEditExit(Sender: TObject);
var
  upd, temp: string;
begin
     if cbNormEdit.Text = BeforModifyNorm then exit;
     if cbNormEdit.Text='' then
        temp:='null'
      else
        temp:=cbNormEdit.Text;

     upd := Format('update burnar.zadanie_norm set norma=%s/%s where zad_key=%s and prnum=2;',
        [StringReplace( temp, ',','.',[]),StringReplace( FloatToStr(kf), ',','.',[]), trGrdNar.ByFieldName['key'].Value]);
     frmMain.MConnection.ExecSQL('DO $$ begin '+upd+ '  end; $$ LANGUAGE ''plpgsql'';'); //commit;
     trGrdNar.ByFieldName['N2']^.Value:=temp;
     StatusBar1.Panels[1].Text := floattostr  ( trGrdNar.CalcItogsNS( trGrdNar.Items.Root, 'n2'));
end;

type
  tmt = class(TGvComboBox);

procedure TfrmComNarZad.GrdParams2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  CodeZnDiscrPar,parType,FieldName: String;
  mR: TRect; aField: PGvCell;
begin
  if GrdParams.Recs.count = 0 then exit; //дальнейшие действия не имеют смысла
  FieldName := UpperCase( GrdParams.GetField(ACol,ARow).Value );
  with GrdParams do
  if FieldName = 'Значение' then //кликнули на ячейке, принадлежащей полю "Значения параметров"
    begin
      mR := CellRect(ACol,ARow);
      if mR.Left+ColWidths[ACol] > GrdParams.ClientWidth then exit;
      if mR.Top+RowHeights[ARow] > GrdParams.ClientHeight then exit;

      cbParValues.PickList.Items.Clear;
      cbParValues.Text := '';
      parType := Recs[ARow-fixedrows][Fields.Indexbyname['ptype']].Value;
      if parType ='2' then //дискретный параметр
        begin
          cbParValues.Style := OVNIgrids.csDropDown;

          {открываем запрос на получение справочника всех возможных значений дискретного параметра}
          qrAllZnTekDiscrParam.Close;
          qrAllZnTekDiscrParam.ParamByName('CodePar').Value :=
            Recs[ARow-fixedrows][Fields.indexbyname['parcode']].Value;
          qrAllZnTekDiscrParam.ParamByName('oplife').Value :=
            trGrdNar.ByFieldName['operlifeid'].Value;
          {Заполняем комбо значениями дискретного параметра и его кодами(ключами)}
          cbParValues.PickList.Items.AddObject(' ',nil); //фиктивное пустое значение
          qrAllZnTekDiscrParam.Open;
          while not(qrAllZnTekDiscrParam.eof) do
          begin
            cbParValues.PickList.Items.AddObject( qrAllZnTekDiscrParam.FieldByName('ZNACH').AsString, //значение
                      TObject(qrAllZnTekDiscrParam.FieldByName('KEY').AsInteger) ); //код значения
            qrAllZnTekDiscrParam.next;
          end;
          try
            {Выбираем текущее значение параметра в комбе по коду(ключу) дискретного параметра}
            CodeZnDiscrPar := Recs[ARow-fixedrows][Fields.indexbyname['КодЗначения']].Value;
            if CodeZnDiscrPar <> '' then
              cbParValues.ItemIndex := cbParValues.PickList.Items.IndexOfObject(
                TObject( StrToInt(CodeZnDiscrPar) )
                );
          except //обрабатывает ошибки когда например 'КодЗначения' еще пуст
          end;
        end;
      if parType = '1' then //если параметр непрерывный
        begin
          cbParValues.Style := OVNIgrids.csSimple;
          aField := GetField(ACol,ARow);
          case aField.DataType of
            str,date:
              cbParValues.Text := Recs[ARow-fixedrows][Fields.IndexByName['Значение']].Value;
            number: //форматируем редактируемое число для показа согласно заданому формату
              begin
                if Recs[ARow-fixedrows][Fields.IndexByName['Значение']].Value <> '' then
                  try
                    cbParValues.Text := TrimRight( format(fNFormat,
                        [ StrToFloat( Recs[ARow-fixedrows][Fields.IndexByName['Значение']].Value ) ]
                      ) );
                  except //если строковое значение, не соответствует числу ("мусор")
                    cbParValues.Text := Recs[ARow-fixedrows][Fields.IndexByName['Значение']].Value;
                  end
                else
                  cbParValues.Text := Recs[ARow-fixedrows][Fields.IndexByName['Значение']].Value;
              end
          end;
        end;
      {показываем комбо для редактирования}
      cbParValues.BoundsRect := mR; //получаем координаты ячейки
      //03.01.2011 если
      if cbParValues.PickList.Width<ColWidths[ACol] then
      cbParValues.PickList.Width:= ColWidths[ACol];
      cbParValues.BorderStyle := bsNone;
      cbParValues.Visible := True;
      cbParValues.SetFocus; //ставим фокус на себя
      if cbParValues.Style = OVNIgrids.csDropDown then
        if cbParValues.PtInScrollButton( cbParValues.ScreenToClient(Mouse.CursorPos) ) then
          tmt(cbParValues).DropDown;
    end
  else
    if cbParValues.Visible then cbParValues.Visible := false;
end;

function TfrmComNarZad.IsClosed: boolean;
begin
  qrClosed.ParamByName('nar').Value := keynar;
  qrClosed.Open;
  if qrClosed.fieldbyname('closed').AsInteger = 1 then //если закрыт
    result := true
  else
    result := false;
  GrdParams.Enabled := not result;
  qrClosed.Close;
end;

procedure TfrmComNarZad.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  {готовности выполнить операции(команды)}
  with trGrdNar do
  begin
    actRenameBlock.Enabled:=(trGrdNar.Items.AllNodeCount   >0) and(ByFieldName['operlifetype'].Value='') and (ByFieldName['locked'].Value<>'1' )and (not lclosed) and (ByFieldName['RS'].Value='0');

    actCalcOperAndSaveRes.Enabled :=(trGrdNar.Items.AllNodeCount   >0) and( (CurNode <> nil)
    and (RightDockPanel.Width > 50) and (CurNode.Count = 0) and (not lclosed)

      and (ByFieldName['operlifetype'].Value<>'78')   //константы не считаем
      and (ByFieldName['operlifetype'].Value<>'')  // и  блоки
      and (ByFieldName['locked'].Value<>'1' ));
      actPasteRab.Enabled :=(trGrdNar.Items.AllNodeCount   >0) and ((fEdAct = edcopy) or (fEdAct = edCut)) and (CurNode <> nil) and (ByFieldName['locked'].Value<>'1');
     actZadanie_del_block.Enabled:=(trGrdNar.Items.AllNodeCount   >0) and(ByFieldName['operlifetype'].Value='') and (ByFieldName['locked'].Value<>'1' )and (not lclosed) and (ByFieldName['RS'].Value='0');

    actSelelColorRow.Enabled:=(length(SelectedRecs) > 0) and (not lclosed);
    actClearColor.Enabled:=(length(SelectedRecs) > 0) and (not lclosed);
    actZadanie_add_emptyblock.Enabled:=(not lclosed);
    actCreateCopyNarVip.Enabled := (Items.Root.Count > 0) and (lclosed);
    actExpandNodes.Enabled := Items.Root.Count > 0;
    actAutoWidthCols.Enabled := length(trGrdNar.VisRecs) > 0;
    actReloadNar.Enabled := keynar > 0;
    actNarToRes.Enabled := Items.Root.Count > 0;
    actCloseNarZad.Enabled := not lclosed;
    actDelSelOpers.Enabled := (length(SelectedRecs) > 0) and (not lclosed);
    actFindWord.Enabled := (sEdit1.Text <> '') and (length(VisRecs) > 0);
    actSetWorker.Enabled := (length(SelectedRecs) > 0) and (not lclosed);
    actReOrderRab.Enabled := (length(VisRecs) > 0) and (not lclosed);
    actCopyRab.Enabled := (length(SelectedRecs) > 0) and (not lclosed)and (fEdAct = ednone);
    actCutRab.Enabled := (length(SelectedRecs) > 0) and (not lclosed) and (fEdAct = ednone);
    actSaveSelElems.Enabled := (Items.Root.Count > 0) and (not lclosed);
  end;
end;

procedure TfrmComNarZad.actOpenSkvZadExecute(Sender: TObject);
begin
  with TfrmSkvZadVar.CreateEx(Self, keynar) do
  begin
    FormStyle := fsMdiChild;
    Show;
  end;
end;

{копировать блок работы в буфер}
procedure TfrmComNarZad.actCopyRabExecute(Sender: TObject);
begin
  fEdAct := edcopy;
  trGrdNar.SortSelected; //сортируем выделенные записи
end;

{вставить ранее копированые/вырезаные работыd}
procedure TfrmComNarZad.actPasteRabExecute(Sender: TObject);
var
  i: LongInt;
  pol_vib : boolean; //выбор пользователя
  loc : string;
begin
 pol_vib:=false;
  try
  loc:=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['key']].Value ;
  // если текущая запись пустой блок даем пользователю выбор в блок копировать или перед ним
   if (trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['operlifetype']].Value='') and  (trGrdNar.CurNode.Count=0) then
    begin
      //сообщение для выбора действия пользователем
    case fEdAct of
      edcopy:
        begin

       if application.MessageBox('Данный блок пустой! Выберите действие:'+#13+'OK - данные будут скопированы внутрь блока'+#13+'ОТМЕНА - данные  будут скопированы перед блоком',
           'Внимание!',  MB_OKCANCEL+MB_ICONQUESTION) = IDOK	 then
          pol_vib:= true // пользователь вставляет в пустой блок
        else
          pol_vib:= false // пользователь вставляет пелед блоком
        end;
       edcut: //было инициировано вырезание
        begin
        if application.MessageBox('Данный блок пустой! Выберите действие:'+#13+'OK - данные будут вставлены внутрь блока'+#13+'ОТМЕНА - данные  будут вставлены перед блоком',
          'Внимание!',  MB_OKCANCEL+MB_ICONQUESTION) = IDOK	 then
          pol_vib:= true // пользователь вставляет в пустой блок
        else
          pol_vib:= false // пользователь вставляет пелед блоком
        end;
        end;
    end;

    case fEdAct of
      edcopy: //было инициировано копирование
        begin
          for i := length(trGrdNar.SelectedRecs)-1 downto 0 do
          begin

          // у нас свое копирование
              //если в пустой блок нужно переопределить парента на код блока, а не на парента блока

             if pol_vib then
              begin
              sZadanie_operac_copy.ParamByName('aparent_where_copy').value:=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['key']].Value;
              sZadanie_operac_copy.ParamByName('aprnum_where_copy').value :='1';
              end
              else
              begin
              if trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value='' then
               sZadanie_operac_copy.ParamByName('aparent_where_copy').value :=null
               else
               sZadanie_operac_copy.ParamByName('aparent_where_copy').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value ;

              sZadanie_operac_copy.ParamByName('aprnum_where_copy').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['prnum']].Value ;
              end  ;


              if trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['parent']].Value='' then
                sZadanie_operac_copy.ParamByName('parent_oper').value := null
               else
               sZadanie_operac_copy.ParamByName('parent_oper').value := trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['parent']].Value;

               sZadanie_operac_copy.ParamByName('key_oper').value := trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value;

               sZadanie_operac_copy.ParamByName('anarkey').value :=trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['narkey']].Value ;
               sZadanie_operac_copy.ExecProc;
          end;
        end;
      edcut: //было инициировано вырезание
        begin
          for i := length(trGrdNar.SelectedRecs)-1 downto 0 do
          begin
            // у нас свое перемещение
              sZadanie_operac_move.ParamByName('akey').value := trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value;
              if trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['parent']].Value='' then
              sZadanie_operac_move.ParamByName('aparent').value :=null
              else
              sZadanie_operac_move.ParamByName('aparent').value := trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['parent']].Value;
              sZadanie_operac_move.ParamByName('aprnum').value :=  trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['prnum']].Value;
              sZadanie_operac_move.ParamByName('anarkey').value :=trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['narkey']].Value ;

             if pol_vib then
              begin
               sZadanie_operac_move.ParamByName('newparent').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['key']].Value    ;
               sZadanie_operac_move.ParamByName('newprnum').value:='1';
              end
              else
              begin
               if trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value='' then
                sZadanie_operac_move.ParamByName('newparent').value :=null
              else
               sZadanie_operac_move.ParamByName('newparent').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value ;
               sZadanie_operac_move.ParamByName('newprnum').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['prnum']].Value ;
              end ;
          sZadanie_operac_move.ExecProc;
          end;
          trGrdNar.SelRecsColor := oldRecsSelColor;
        end;
    end;
    trGrdNar.SelectedRecs := nil;
    ReloadTekNar(keynar,minres,maxres,izmer);
    if loc<>'' then
    trGrdNar.Locate('key',loc);
  finally
  fEdAct := edNone;
  end;
end;

procedure TfrmComNarZad.actShowOkExecute(Sender: TObject);
var
  htmlDoc: string;//файл html
begin
  {получаем имя карты}
  qrHtmlOk.ParamByName('operkey').Value := trGrdNar.ByFieldName['key'].Value;
  if (trGrdNar.ByFieldName['operlifeid'].Value <> '') then
    qrHtmlOk.ParamByName('oplife').Value := trGrdNar.ByFieldName['operlifeid'].Value
  else
    qrHtmlOk.ParamByName('oplife').Value := 0;
    
  qrHtmlOk.Open;

 while not qrHtmlOk.Eof do
 begin

  htmlDoc := qrHtmlOk.FieldByName('lnkfile').AsString;

  //загружаем и показываем оперкарту
  if htmlDoc <> '' then
  with TFormExplore.Create(Application) do
  begin
    WebBrowser.Navigate(htmlpath+'\'+HtmlDoc);
    Show;
  end;

   qrHtmlOk.Next;
 end;

  qrHtmlOk.Close;
end;

procedure TfrmComNarZad.actCutRabExecute(Sender: TObject);
//var
//  i: longint;
begin
  fEdAct := edcut;
  oldRecsSelColor := trGrdNar.SelRecsColor;
  trGrdNar.SelRecsColor := clSkyBlue;
  trGrdNar.Invalidate;
  trGrdNar.SortSelected; //сортируем выделенные записи
end;

procedure TfrmComNarZad.SetSaveSel(aNode: TGvTreeNode);
var
  j,lastInd,m,k: longint;
begin
  k := 0;
  m := trGrdNar.fields.IndexByName['colorsel'];
  for j := 0 to trGrdNar.Items.Root.Count-1 do
  begin
    aNode := trGrdNar.Items.Root[j];
    if aNode.Cells[ m ].Value='1' then
    begin
      lastInd := length(trGrdNar.SelectedRecs);
      SetLength(trGrdNar.SelectedRecs, lastInd+1);
      trGrdNar.SelectedRecs[lastInd].Node := aNode;
      trGrdNar.SelectedRecs[lastInd].Ind := k;
      inc(k);
    end;
  end;
end;

procedure TfrmComNarZad.FormActivate(Sender: TObject);
begin
  if keynar <> 0 then //аналогичный код должен повторятся на форме "ComNarVip"   // 11.07.2011  ****Frolov_aa
    begin
      //переопределяем переменную "keynar" главной формы
      if keynar<> TfrmMain(application.MainForm).keynar then TfrmMain(application.MainForm).keynar:=keynar;
      //активируем элементы управления нарядом на основной форме
      TfrmMain(application.MainForm).actGlobalParams.Enabled := true;
      TfrmMain(application.MainForm).actOpenZad.Enabled := true;
      TfrmMain(application.MainForm).actGlobalParams.Enabled := true;
    end;
end;

procedure TfrmComNarZad.FormDeactivate(Sender: TObject);
begin //аналогичный код должен повторятся на форме "ComNarVip"    // 11.07.2011  ****Frolov_aa
  //деактивируем элементы управления нарядом на основной форме
  TfrmMain(application.MainForm).actGlobalParams.Enabled := false;
  TfrmMain(application.MainForm).actGlobalParams.Enabled := false;
  //обнуляем переменную "keynar" главной формы
  TfrmMain(application.MainForm).keynar:=0;
end;

procedure TfrmComNarZad.FormPaint(Sender: TObject);
begin
  if keynar <> 0 then //аналогичный код должен повторятся на форме "ComNarVip"   // 11.07.2011  ****Frolov_aa
    begin
      //переопределяем переменную "keynar" главной формы
      if keynar<> TfrmMain(application.MainForm).keynar then TfrmMain(application.MainForm).keynar:=keynar;
      //активируем элементы управления нарядом на основной форме
      TfrmMain(application.MainForm).actGlobalParams.Enabled := true;
      TfrmMain(application.MainForm).actOpenZad.Enabled := true;
      TfrmMain(application.MainForm).actGlobalParams.Enabled := true;
    end;
end;

procedure TfrmComNarZad.SpeedButton1Click(Sender: TObject);
begin
trGrdNar.CellSelectColorFont:=clRed;
end;

procedure TfrmComNarZad.SpeedButton2Click(Sender: TObject);
begin
if      ColorDialog1.Execute then begin
trGrdNar.BeginRebuildStruct;
trGrdNar.ByFieldName['colorsel']^.Value:=inttostr(ColorDialog1.color);
trGrdNar.EndRebuildStruct;  end;
end;

procedure TfrmComNarZad.actSelelColorRowExecute(Sender: TObject);
var i: integer;
begin
if trGrdNar.Items.AllNodeCount>0 then
begin
if  ColorDialog1.Execute then
  begin
  trGrdNar.BeginRebuildStruct;
  for i := 0 to length(trGrdNar.SelectedRecs)-1 do
  begin
  trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['colorsel']]^.Value:=inttostr(ColorDialog1.color);
  frmMain.MConnection.ExecSQL('update burnar.zadanie_oper set colorsel='+inttostr(ColorDialog1.color)+' where key='+trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value+';');
  end;
  trGrdNar.SelectedRecs := nil;
  trGrdNar.EndRebuildStruct;
  end;
end;
end;

procedure TfrmComNarZad.actClearColorExecute(Sender: TObject);
var i: integer;
begin

  trGrdNar.BeginRebuildStruct;
  for i := 0 to length(trGrdNar.SelectedRecs)-1 do
  begin
  trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['colorsel']]^.Value:='0';
  frmMain.MConnection.ExecSQL('update burnar.zadanie_oper set colorsel=0 where key='+trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value+';');
  end;
  trGrdNar.SelectedRecs := nil;
  trGrdNar.EndRebuildStruct;

end;

procedure TfrmComNarZad.actZadanie_add_emptyblockExecute(Sender: TObject);
begin
       if not IsClosed then
  begin
  if trGrdNar.Items.AllNodeCount>0 then
  begin  //наряд не пустой и надо добавить соотвественно где нажали
  if trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value='' then
    sZADANIE_ADD_EMPTYBLOCK.ParamByName('aparent').value :=null
  else
    sZADANIE_ADD_EMPTYBLOCK.ParamByName('aparent').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value ;
    sZADANIE_ADD_EMPTYBLOCK.ParamByName('aprnum').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['prnum']].Value ;
    sZADANIE_ADD_EMPTYBLOCK.ParamByName('nkey').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['narkey']].Value ;
    sZADANIE_ADD_EMPTYBLOCK.ParamByName('who').value:=null ;
  if trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['begoperdate']].Value<>'' then
    sZADANIE_ADD_EMPTYBLOCK.ParamByName('dateIn').value:=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['begoperdate']].Value
  else
    sZADANIE_ADD_EMPTYBLOCK.ParamByName('dateIn').value:=null;
    sZADANIE_ADD_EMPTYBLOCK.ParamByName('textik').value:= InputBox('Введите название блока', 'Название:', '');
  end
  else //наряд пустой и надо в него добавить блок
  begin
    sZADANIE_ADD_EMPTYBLOCK.ParamByName('nkey').value:=keynar;
    sZADANIE_ADD_EMPTYBLOCK.ParamByName('aprnum').value:=1;
    sZADANIE_ADD_EMPTYBLOCK.ParamByName('aprnum').value:=null;
    sZADANIE_ADD_EMPTYBLOCK.ParamByName('who').value:=null;
    sZADANIE_ADD_EMPTYBLOCK.ParamByName('dateIn').value:=null;
    sZADANIE_ADD_EMPTYBLOCK.ParamByName('textik').value:= InputBox('Введите название блока', 'Название:', '');
  end;

  sZADANIE_ADD_EMPTYBLOCK.ExecProc;
  ReloadTekNar(keynar,minres,maxres,izmer);
  trGrdNar.Locate('nm',sZADANIE_ADD_EMPTYBLOCK.ParamByName('textik').value);
  end;
end;

procedure TfrmComNarZad.actRenameBlockExecute(Sender: TObject);
var newnm : string;
begin
//переименование блока
newnm:= InputBox('Введите название блока', 'Название:', trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['nm']].Value);
if newnm<>'' then
  begin
    trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['nm']]^.Value :=newnm ;
    trGrdNar.Invalidate;
    frmMain.MConnection.ExecSQL('update burnar.zadanie_anynm set nm='''+newnm+''' where ZAD_KEY='+trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['key']].Value+';');
  end;
// trGrdNar.
end;

procedure TfrmComNarZad.actFontUpExecute(Sender: TObject);
var
  i:integer;
begin
   if f.Size < 24 then
      begin
       trGrdNar.BeginRebuildStruct;
       f.Size := f.Size+2;
       for i:=0 to trGrdNar.Fields.Count-1 do
          trGrdNar.Fields.SetAtrib(i,haLeft,vaTop,cont,false,F,true);
       trGrdNar.EndRebuildStruct;
            GrdParams.BeginRebuildStruct;
       for i:=0 to GrdParams.Fields.Count-1 do
          GrdParams.Fields.SetAtrib(i,haLeft,vaTop,cont,false,F,true);
      GrdParams.EndRebuildStruct;
      cbParValues.Font:=f;
     end;
end;

procedure TfrmComNarZad.actFontDownExecute(Sender: TObject);
var
  i:integer;
begin
   if f.Size > 8 then
     begin
       trGrdNar.BeginRebuildStruct;
       f.Size := f.Size-2;
       for i:=0 to trGrdNar.Fields.Count-1 do
         trGrdNar.Fields.SetAtrib(i,haLeft,vaTop,cont,false,F,true);
       trGrdNar.EndRebuildStruct;
             GrdParams.BeginRebuildStruct;
       for i:=0 to GrdParams.Fields.Count-1 do
          GrdParams.Fields.SetAtrib(i,haLeft,vaTop,cont,false,F,true);
      GrdParams.EndRebuildStruct;
      cbParValues.Font:=f;
    end;
end;

procedure TfrmComNarZad.actOpenDefNarExecute(Sender: TObject);
begin
 frmMain.MConnection.ExecSQL('update burnar.defnarzad set closed = 0 where narkey='+inttostr(keynar));
end;

procedure TfrmComNarZad.actViewOperInfoExecute(Sender: TObject);
begin

     if  trGrdNar.Items.AllNodeCount>0 then
      Application.MessageBox(
      pchar('Код операции:'+trGrdNar.ByFieldName['oper'].Value+#13+
            'Код оперлайфа:'+trGrdNar.ByFieldName['operlifeid'].Value+#13+
            'Код нормообразования:'+trGrdNar.ByFieldName['operlifetype'].Value
            ),
        pchar(MsgAttentionRu+' Код строки наряда:'+trGrdNar.ByFieldName['key'].Value) ,
        MB_OK)  ;
end;
procedure TfrmComNarZad.actZadanie_del_blockExecute(Sender: TObject);
var loc : string;
begin
    if Application.MessageBox(
      pchar(MsgDelBlock+#13+MsgQuestionPodtverdit),
        pchar(MsgAttentionRu) ,
        MB_OKCANCEL+MB_ICONEXCLAMATION) = IDCANCEL then
    begin
      exit;
    end;
    loc:= trGrdNar.ByFieldName['ord'].Value ;
    sZADANIE_OPERAC_DEL_BLOCK.ParamByName('akey').value:= trGrdNar.ByFieldName['key'].Value;
    if trGrdNar.ByFieldName['parent'].Value='' then
    sZADANIE_OPERAC_DEL_BLOCK.ParamByName('aparent').value := null
    else
    sZADANIE_OPERAC_DEL_BLOCK.ParamByName('aparent').value := trGrdNar.ByFieldName['parent'].Value;
    sZADANIE_OPERAC_DEL_BLOCK.ParamByName('aprnum').value := trGrdNar.ByFieldName['prnum'].Value;
    sZADANIE_OPERAC_DEL_BLOCK.ParamByName('anarkey').value := trGrdNar.ByFieldName['narkey'].Value;
       try
    sZADANIE_OPERAC_DEL_BLOCK.ExecProc;
       Application.MessageBox(Pchar(MsgChangeSavedRu),PChar(MsgAttentionRu),
    MB_OK+MB_ICONEXCLAMATION);
     except
      on E: Exception do
      begin
        Application.MessageBox(pchar(E.Message), pchar(E.HelpContext),MB_OK+MB_ICONERROR);
      end;
    end;
    ReloadTekNar(keynar,minres,maxres,izmer);//перечитываем текущий наряд с сервера
        if loc<>'' then
        trGrdNar.Locate('ord',loc);
end;

procedure TfrmComNarZad.DBLookupComboBox2Click(Sender: TObject);
var
  AllOk: boolean;
  str : string;
  i:integer;
  si : string;
begin
  if trGrdNar.Items.AllNodeCount>0 then
  for i := 0 to length(trGrdNar.SelectedRecs)-1 do
    begin
      si := DBLookupComboBox2.KeyValue;
      str := ' update burnar.zadanie_oper set tipbur = '+ si +
             ' where key='+trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value+';';
      frmMain.MConnection.ExecSQL(str); //сохраняем нормы узла на серваке
      AllOk := true;
    end;
   ReloadTekNar(keynar,minres,maxres,izmer);
   if (AllOk) then //сигналим пользователю об удачной операции
   Application.MessageBox('Изменения успешно сохранены!',PChar(MsgAttentionRu),
   MB_OK+MB_ICONEXCLAMATION);
   trGrdNar.SelectedRecs := nil;
   exit;
end;

end.
