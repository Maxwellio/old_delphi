unit CommonNarVipUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ImgList, ComCtrls, ToolWin, MainUnit,
  Grids, OVNIGrids,  FMTBcd, DB, SqlExpr, Buttons,
  StdCtrls, ExtCtrls, Menus, NarVipResUnit,
  ActnList, formSkvVipVar, OVNIDbControls, Dialogs,formSetPeriod,formListPeriod, formMehBurIntervals,
  DBCtrls, Provider, DBClient, MemDS, DBAccess, PgAccess;

{$I ProjectConst.INC}
{$I ProjectStr.INC}

type

  tk = record
    key,      //код блока в наряде
    idoplife, //код времени жизни измерителя операции
    parent: integer; //код родителя времени жизни
    numin: integer; //порядковый номер внутри уровня
    norma: array of {single}variant;//компоненты вектора нормы
    fact: array of {single}variant;//фактическая продолжительность
  end;

  TfrmComNarVip = class(TForm)
    trGrdNar: TOvniDbTreeGrid;
    qrNarVip: TPgQuery;
    qrNormAtribName: TPgQuery;
    qrAllSavedNorms: TPgQuery;
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
    Image2: TImage;
    qrAllZnTekDiscrParam: TPgQuery;
    qrAlgInfo: TPgQuery;
    qrParamV: TPgQuery;
    ActionList1: TActionList;
    actCalcOperAndSaveRes: TAction;
    actExpandNodes: TAction;
    actAutoWidthCols: TAction;
    actReloadNar: TAction;
    actNarToRes: TAction;
    actCloseNarVip: TAction;
    actDelSelOpers: TAction;
    actFindWord: TAction;
    actSetFactMoment: TAction;
    actSetWorker: TAction;
    actReOrderRab: TAction;
    actSaveFact: TAction;
    actOpenSkvVip: TAction;
    ToolButton1: TToolButton;
    qrfactkorr: TPgQuery;
    actCopyRab: TAction;
    actPasteRab: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    sCopyOper: TPgStoredProc;
    qrCalcNorma1: TPgQuery;
    qrHtmlOk: TPgQuery;
    actShowOk: TAction;
    ToolButton5: TToolButton;
    actCutRab: TAction;
    ToolButton6: TToolButton;
    actSaveSelElems: TAction;
    Image3: TImage;
    actSelelColorRow: TAction;
    actClearColor: TAction;
    actVipolnenie_add_emptyblock: TAction;
    actRenameBlock: TAction;
    actFontDown: TAction;
    actFontUp: TAction;
    ColorDialog1: TColorDialog;
    ToolButton2: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    sVIPOLNENIE_ADD_EMPTYBLOCK: TPgStoredProc;
    sVIPOLNENIE_RENUMLEVEL: TPgStoredProc;
    sVIPOLNENIE_OPERAC_MOVE: TPgStoredProc;
    sVIPOLNENIE_OPERAC_DEL: TPgStoredProc;
    SVIPOLNENIE_OPERAC_COPY: TPgStoredProc;
    sZadanie_Calc_OperP: TPgStoredProc;
    ToolButton12: TToolButton;
    actImportRabZad: TAction;
    SZADANIE_TO_VIPOLNENIE: TPgStoredProc;
    SVIPOLNENIE_CALC_OPERP: TPgStoredProc;
    qrSetNextDateOperVIP: TPgQuery;
    actLockOper: TAction;
    ToolButton13: TToolButton;
    Image4: TImage;
    Image5: TImage;
    SVIPOLNENIE_LOCK_OPER: TPgStoredProc;
    SVIPOLNENIE_REBUILD_OPER: TPgStoredProc;
    qrLocked: TPgQuery;
    qrColNotLocked: TPgQuery;
    SVIPOLNENIE_ADD_RAZDEL: TPgStoredProc;
    actUnLockOper: TAction;
    ToolButton14: TToolButton;
    SVIPOLNENIE_UN_LOCK_OPER: TPgStoredProc;
    actOpenNarVip: TAction;
    ToolButton15: TToolButton;
    actListPeriod: TAction;
    ToolButton16: TToolButton;
    actSelPeriodOper: TAction;
    actViewOperInfo: TAction;
    qrUnLock: TPgQuery;
    ToolButton17: TToolButton;
    actVipolnenie_del_block: TAction;
    SVIPOLNENIE_OPERAC_DEL_BLOCK: TPgStoredProc;
    grItog: TOVNIDbGrid;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    qrITOGtable: TPgQuery;
    N1: TMenuItem;
    Panel2: TPanel;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    sbShowItogi: TSpeedButton;
    sbHideItogi: TSpeedButton;
    ToolButton18: TToolButton;
    actsetdateHANDmla: TAction;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ActSetD: TAction;
    ActSetNotD: TAction;
    ToolButton22: TToolButton;
    actIntervals: TAction;
    qrEKS: TPgQuery;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    DataSource1: TDataSource;
    ToolButton23: TToolButton;
    ToolBar1: TToolBar;
    sEdit1: TEdit;
    ToolButton58: TToolButton;
    DBLookupComboBox1: TDBLookupComboBox;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    RightDockPanelSplitter: TSplitter;
    RightDockPanel: TPanel;
    GrdParams: TOVNIDbGrid;
    Splitter2: TSplitter;
    algInfo: TMemo;
    ToolButton24: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure tbExpandNodesClick(Sender: TObject);
    procedure tbAutoWidthColsClick(Sender: TObject);
    procedure ReloadTekNar(aKeyNar,aminres,amaxres,aizmer: integer);
    procedure tbReloadNarClick(Sender: TObject);
    procedure tbCalcOperClick(Sender: TObject);
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
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure GrdParamsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    //потеря фокуса с комбобокса
    procedure cbParValuesExit(Sender: TObject);
    //получение фокуса комбобоксом
    procedure cbParValuesEnter(Sender: TObject);
    procedure actOpenSkvVipExecute(Sender: TObject);
    procedure trGrdNarCellValChange(aChangeCell: PGvCell;
      aFieldInd: Integer; const newVal: String);
    procedure actCopyRabExecute(Sender: TObject);
    procedure actPasteRabExecute(Sender: TObject);
    procedure actShowOkExecute(Sender: TObject);
    procedure actCutRabExecute(Sender: TObject);
    procedure actSaveSelElemsExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure actSelelColorRowExecute(Sender: TObject);
    procedure actClearColorExecute(Sender: TObject);
    procedure actVipolnenie_add_emptyblockExecute(Sender: TObject);
    procedure actRenameBlockExecute(Sender: TObject);
    procedure actFontDownExecute(Sender: TObject);
    procedure actFontUpExecute(Sender: TObject);
    procedure actImportRabZadExecute(Sender: TObject);
    procedure actLockOperExecute(Sender: TObject);
    procedure actUnLockOperExecute(Sender: TObject);
    procedure actOpenNarVipExecute(Sender: TObject);
    procedure actListPeriodExecute(Sender: TObject);
    procedure actSelPeriodOperExecute(Sender: TObject);
    procedure actViewOperInfoExecute(Sender: TObject);
    procedure actIntervalsExecute(Sender: TObject);
    procedure trGrdNarSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure actVipolnenie_del_blockExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure sbHideItogiClick(Sender: TObject);
    procedure sbShowItogiClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure actsetdateHANDmlaExecute(Sender: TObject);
    procedure ActSetDExecute(Sender: TObject);
    procedure ActSetNotDExecute(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure ToolButton23Click(Sender: TObject);
  private
    BeforModifyStr: String;
    fEdAct: TEditAct;
    {сохраняет весь вектор нормы и факт}
    procedure SaveNormaAndFact(aNode: TGvTreeNode);
    {сохраняет только факт}
    procedure SaveFact(aNode: TGvTreeNode);
    {загружает все сохраненные нормы наряда и расставляет по гриду}
    procedure LoadSavedNorms;
    procedure SetOperImgs(aNode: TGvTreeNode);
    {устанавливает сохраненные выделения элементов}
    procedure SetSaveSel(aNode: TGvTreeNode);
    {проверяет, закрытие наряда}
    function IsClosed: boolean;
    {проверяет, блокировки работ наряда}
    function IsLocked: boolean;
    function IsUnLocked: boolean;
    {итератор}
    procedure SetVal(aNode: TGvTreeNode; const aFieldNm,aFieldVal: String);

    procedure KeyPressCellGrid(Sender: TObject; var Key: Char);

  public
    orauser:string;
    panelheight:integer;
    keynar, //код наряда в целом
    minres, maxres, izmer,
    IzmerElCount: integer;
    F : Tfont;
    lclosed: boolean;
    llocked: boolean;
    lunlock: boolean;

    fEnter : boolean;
    fBell : boolean;
    fBellDC : boolean;

    cbParValues: TOvniComboBox;
    constructor Create(AOwner: TComponent); override;
    class procedure OpenNar(aKeyNar:integer; aorauser:string;aminres,amaxres,aizmer: integer; const aCaption: string);
    //фильтр ввода
    procedure EdKeyPress(Sender: TObject; var Key: Char);
  end;


implementation

uses
  formStructNur, formSetDate, formSetWorker, pascalc, pasfunc,CommonNarZadUnit,
  UnitFormExplore;

{$R *.dfm}

var
  MoveOper: TGvTreeNode;

type
  tm = class(TCustomGrid)

end;

procedure TfrmComNarVip.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

constructor TfrmComNarVip.Create(AOwner: TComponent);
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
    begin
      inherited Create(AOwner); //вызываем стандартный конструктор

      {**********************настройки по-умолчанию*************************}
      //ширины полей
      panelheight:=160;
      panel2.Height:=30;
       sbHideItogi.Visible:=false;
      sbshowItogi.Visible:=true;
      trGrdNar.ColWidths[0] := 25;
      trGrdNar.ColWidths[1] := 50;
      trGrdNar.ColWidths[2] := 40;
      trGrdNar.ColWidths[3] := 250;
      trGrdNar.ColWidths[4] := 75;
      trGrdNar.ColWidths[5] := 90;
      trGrdNar.ColWidths[6] := 36;
      trGrdNar.ColWidths[7] := 36;
      trGrdNar.ColWidths[9] := 58;
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

procedure TfrmComNarVip.EdKeyPress(Sender: TObject; var Key: Char);
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


procedure TfrmComNarVip.KeyPressCellGrid(Sender: TObject; var Key: Char);
begin
  if key= #0 then //fEnter := true;
    begin
      if trGrdNar.Row < trGrdNar.RowCount-trGrdNar.FixedRows then

          if fBell <> true then
           begin
              trGrdNar.Row:=trGrdNar.row+1;
           end
          else
            begin

            end;

    end;
end;


procedure TfrmComNarVip.FormCreate(Sender: TObject);
begin
  {создаем и настраиваем параметры комбо-бокса для редактир-я знач параметров}
  F:= tfont.Create;
  f.Assign((sender as tform).Font);
  f.Size:=8;

  if (frmMain.Org = 1) or (frmMain.Org = 8) then ToolButton23.Visible := true
  else ToolButton23.Visible := false;

  cbParValues := TOvniComboBox.Create(nil);
  cbParValues.Visible := false;
  cbParValues.PickList.Style := lbOwnerDrawVariable;
  cbParValues.PickList.BorderItem := true;
  cbParValues.Parent := GrdParams;
  cbParValues.OnEnter := cbParValuesEnter;
  cbParValues.OnExit := cbParValuesExit; //обработчик на потерю фокуса комбо
  cbParValues.OnKeyPress := EdKeyPress; //фильтр ввода с клавы

  trGrdNar.CellEditorEx.OnKeyPress:=KeyPressCellGrid;

end;

procedure TfrmComNarVip.sSpeedButton3Click(Sender: TObject);
begin
  with trGrdNar do
    Locate(GetField(Col,Row).Value, sEdit1.Text, false, Row-FixedRows+1);
end;

procedure TfrmComNarVip.tbExpandNodesClick(Sender: TObject);
begin
  IF not tbExpandNodes.Down THEN trGrdNar.FullCollapse
  else trGrdNar.FullExpand;
end;

procedure TfrmComNarVip.tbAutoWidthColsClick(Sender: TObject);
begin
  trGrdNar.SetAutoWidthAllColumns;
end;

{Перечитываем наряд из базы}
procedure TfrmComNarVip.ReloadTekNar(aKeyNar,aminres,amaxres,aizmer: integer);
var
  i: integer;
  fieldVal : string;
begin
  with trGrdNar do
  begin
    trGrdNar.SaveExpandNodes('key', fieldVal);  // запоминаем все раскрытые ноды и позицию на которой стоим
    lclosed := IsClosed;
    llocked :=IsLocked;

    qrNarVip.ParamByName('keynar').AsBCD := aKeyNar; //код наряда

    qrNarVip.Open;
    LoadTree(qrNarVIP,'key','parent',4,['parent','prnum','oper','operlifeid','operlifetype','colorsel','locked', 'narkey','kor','RS']);
    qrNarVip.Close;
    trGrdNar.ColorValueField:='colorsel';
        {устанавливаем битмэп-значки, признаки типов операции}
    if Items.Root.Count > 0 then SetOperImgs(Items.Root);

    Fields.SetTitles1(['key','parent','prnum','ord','istnorm','begoperdate','nm', 'oper','ot','do_','n1','n2',
      'operlifeid','operlifetype','colorsel','locked', 'narkey','fact', 'period_nm','tipbur'],
      ['Код строки','Код родителя', '№ п/п', '№ п/п','Источник нормирования','Время начала работы','Название работы','Код операции',
      'Интервал от','Интервал до','Н.в. на ед. измер.','Н.в. на объем раб.','Код нормообразования'
      ,'Тип нормообразования','Цвет выделения','Блокировка','Код наряда','Факт','Период','ЭКС']);
      EditedFields.Add('Fact'); //редактируемые поля
       trGrdNar.ColWidths[0] := trGrdNar.ColWidths[0] +1;
       trGrdNar.ColWidths[0] := trGrdNar.ColWidths[0] -1;
     StatusBar1.Panels[1].Text := floattostr  ( trGrdNar.CalcItogsNS( trGrdNar.Items.Root, 'n2'));
      StatusBar1.Panels[4].Text:= floattostr (trGrdNar.CalcItogsNS(trGrdNar.Items.Root, 'fact'));
     trGrdNar.BeginRebuildStruct;
       for i:=0 to trGrdNar.Fields.Count-1 do
          trGrdNar.Fields.SetAtrib(i,haLeft,vaTop,cont,false,F,true);
      trGrdNar.Fields.SetDataTypes(['Fact'],TdataType(number));

      trGrdNar.EndRebuildStruct;
  end;
  trGrdNar.LoadExpandNodes('key', fieldVal); // раскрываем запомненные ноды
     qrEKS.close;
  ClientDataSet1.close;
    qrEKS.Open;
  ClientDataSet1.Open;
 end;

{загружает все сохраненные нормы наряда и расставляет по гриду}
procedure TfrmComNarVip.LoadSavedNorms;
var
  AllNarNorms: array of tk; //все нормы наряда
  c,i,tNum: integer;
  procedure PutNormsToGrid(aNode: TGvTreeNode; var tNum: integer);
  var
    i,j: integer;
  begin
    if aNode.Count = 0 then //если лист, пишем
      begin
        for i := 1 to IzmerElCount do //цикл по полям вектора нормы
          if AllNarNorms[tNum].norma[i-1] <> null then //!
            aNode.cells[ trGrdNar.fields.IndexByName['field'+IntToStr(i)] ].Value
              := {FloatToStr}(AllNarNorms[tNum].norma[i-1]*kf);

        if AllNarNorms[tNum].fact[0] <> null then //!
          aNode.cells[ trGrdNar.fields.IndexByName['Fact'] ].Value
            := {FloatToStr}(AllNarNorms[tNum].fact[0]*kf);
        inc(tNum);
      end
    else //если узел, обходим дальше
      for j := 0 to aNode.Count-1 do
        PutNormsToGrid(aNode.Items[j], tnum);
  end;
begin
  {готовим запрос, задаем параметры}
  qrAllSavedNorms.ParamByName('keynar').AsString := IntToStr(KeyNar);
  qrAllSavedNorms.ParamByName('CodIzmer').AsString := IntToStr(izmer);
  qrAllSavedNorms.ParamByName('deepLev').AsString := IntToStr(VisibleOperDeepLevel);
  qrAllSavedNorms.open;

  {забрасываем данные в спец массив}
  SetLength(AllNarNorms, 1);
  SetLength(AllNarNorms[0].norma, IzmerElCount);
  SetLength(AllNarNorms[0].fact, IzmerElCount);
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
      SetLength(AllNarNorms[c].fact, IzmerElCount);
      AllNarNorms[c].key := qrAllSavedNorms.fieldbyname('key').asInteger;
      AllNarNorms[c].idoplife := qrAllSavedNorms.fieldbyname('id').asInteger;
      AllNarNorms[c].parent := qrAllSavedNorms.fieldbyname('parent').asInteger;
      AllNarNorms[c].numin := qrAllSavedNorms.fieldbyname('numin').asInteger;

      i := 0;
    end;
    AllNarNorms[c].norma[i] := qrAllSavedNorms.fieldbyname('norma').{AsFloat}value;
    AllNarNorms[c].fact[i] := qrAllSavedNorms.fieldbyname('fact').{AsFloat}value;
    qrAllSavedNorms.Next;
    inc(i);
  end;
  qrAllSavedNorms.Close;
  if length(AllNarNorms)=1 then exit;

  {раскладывем данные по гриду}
  tNum := 0;
  PutNormsToGrid(trGrdNar.Items.Root,tNum);
end;

procedure TfrmComNarVip.SetOperImgs(aNode: TGvTreeNode);
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
      end ;
      if aNode.cells[trGrdNar.fields.IndexByName['kor']].Value<>'' then
        if aNode.cells[trGrdNar.fields.IndexByName['kor']].Value='1' then
           aNode.imgs[trGrdNar.fields.IndexByName['n2']]:=Image4.Picture.Bitmap;
      if aNode.cells[trGrdNar.fields.IndexByName['locked']].Value<>'' then
        if aNode.cells[trGrdNar.fields.IndexByName['locked']].Value='1' then
           aNode.imgs[trGrdNar.fields.IndexByName['ord']]:=Image5.Picture.Bitmap;
    end
  else //если узел, обходим дальше
    begin
    //структура имеет свой значек
    if aNode.cells[trGrdNar.fields.IndexByName['locked']].Value<>'' then
    if aNode.cells[trGrdNar.fields.IndexByName['locked']].Value='1' then
           aNode.imgs[trGrdNar.fields.IndexByName['ord']]:=Image5.Picture.Bitmap;
    if   (aNode.cells[trGrdNar.fields.IndexByName['operlifetype']].Value)<>''
    then aNode.imgs[trGrdNar.fields.IndexByName['nm']]:=Image3.Picture.Bitmap;
    for j := 0 to aNode.Count-1 do
      SetOperImgs(aNode.Items[j]);
    end;
end;

class procedure TfrmComNarVip.OpenNar(aKeyNar:integer; aorauser:string; aMinres,aMaxres,aizmer: integer;
  const aCaption: string);
begin
  with TfrmComNarVip.Create(Application) do
  begin
    keynar := aKeyNar;
    orauser:=aorauser;
    Minres := aMinres;
    Maxres := aMaxres;
    izmer := aizmer;
    caption := acaption;
    ReloadTekNar(keynar, minres, maxres, izmer);
  end;
end;

procedure TfrmComNarVip.tbReloadNarClick(Sender: TObject);
begin
  ReloadTekNar(KeyNar,minres,maxres,izmer);
end;

procedure TfrmComNarVip.tbCalcOperClick(Sender: TObject);
var
//  cmd: String;
//  i: LongInt;
  loc: string;
begin
    if cbParValues.Focused then
    cbParValuesExit(Self); //если фокус не снят, принуждаем и значение параметра сохранится
  {********вычисление операции по заданным визуально! параметрам***************}
 with trGrdNar do
 begin
   if ((ByFieldName['operlifetype'].Value='79') or (ByFieldName['operlifetype'].Value='80')) then
     begin
        //проверяем надо ли перестраивать операцию :)
        SVIPOLNENIE_REBUILD_OPER.ParamByname('AKEY').value:=ByFieldName['key'].Value;
        SVIPOLNENIE_REBUILD_OPER.ParamByname('AnarKEY').value:=ByFieldName['narkey'].Value;
        SVIPOLNENIE_REBUILD_OPER.ExecProc;
        if SVIPOLNENIE_REBUILD_OPER.ParamByname('AISREBUILD').value=1 then
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
       SVIPOLNENIE_CALC_OPERP.ParamByname('AKEY').value:=ByFieldName['key'].Value;
       SVIPOLNENIE_CALC_OPERP.ParamByname('aoperlifeid').value:=ByFieldName['operlifeid'].value;
       SVIPOLNENIE_CALC_OPERP.ParamByname('AIZMER').value := izmer;
       SVIPOLNENIE_CALC_OPERP.ParamByname('normaed').value := 0;
       SVIPOLNENIE_CALC_OPERP.ParamByname('normaob').value := 0;
       SVIPOLNENIE_CALC_OPERP.ParamByname('istochniki').value := '';
       SVIPOLNENIE_CALC_OPERP.ExecProc;
       //обновили источник и норму в гриде
       if    SVIPOLNENIE_CALC_OPERP.ParamByname('istochniki').value<>null then
       ByFieldName['istnorm'].Value:= SVIPOLNENIE_CALC_OPERP.ParamByname('istochniki').value;
       if    SVIPOLNENIE_CALC_OPERP.ParamByname('normaed').value<>null then
       ByFieldName['n1'].Value:=SVIPOLNENIE_CALC_OPERP.ParamByname('normaed').value;
       if    SVIPOLNENIE_CALC_OPERP.ParamByname('normaob').value<>null then
         begin
           ByFieldName['n2'].Value:=SVIPOLNENIE_CALC_OPERP.ParamByname('normaob').value;
            if ByFieldName['fact'].Value<>null then
              trGrdNarCellValChange(ByFieldName['fact'],Fields.IndexByName['fact'],ByFieldName['fact'].Value);
         end;
       if    SVIPOLNENIE_CALC_OPERP.ParamByname('aot').value<>null then
       ByFieldName['ot'].Value:=SVIPOLNENIE_CALC_OPERP.ParamByname('aot').value ;

       if    SVIPOLNENIE_CALC_OPERP.ParamByname('ado').value<>null then
       ByFieldName['do_'].Value:=SVIPOLNENIE_CALC_OPERP.ParamByname('ado').value ;
       trGrdNar.Invalidate; //обновляем грид, данные уже есть

      frmMain.MConnection.ExecSQL('CALL burnar.SetNextDateOperVIP( ''' + ByFieldName['key'].Value + ''',''' + ByFieldName['narkey'].Value + ''');');

       //считаем даты для всех операций что ниже
       qrSetNextDateOperVIP.Close;
       qrSetNextDateOperVIP.ParamByname('usr').value := OraUser;//GetEnvironmentVariable('username');
       qrSetNextDateOperVIP.ParamByname('AnarKEY').value := ByFieldName['narkey'].Value;
       qrSetNextDateOperVIP.Open;


       //нужно обойти те узлы где значение даты изменилось и проставить новые даты
       UpdateTree(qrSetNextDateOperVIP,'key',['begoperdate']);

       invalidate;

       frmMain.MConnection.ExecSQL('DELETE FROM burnar.tkeydate where os_user = ''' + OraUser
                                           //GetEnvironmentVariable('username')
                                           + ''' and narkey = ' + trGrdNar.ByFieldName['narkey'].Value);

       StatusBar1.Panels[4].Text:= floattostr( trGrdNar.CalcItogsNS( trGrdNar.Items.Root, 'fact'));
       StatusBar1.Panels[1].Text := floattostr  ( trGrdNar.CalcItogsNS( trGrdNar.Items.Root, 'n2'));
     end;
     end;
 end;

   frmMain.MConnection.ExecSQL('DELETE FROM burnar.tkeydate where os_user = ''' + OraUser
                                       //GetEnvironmentVariable('username') \
                                       + ''' and narkey = ' + trGrdNar.ByFieldName['narkey'].Value);

end;

procedure TfrmComNarVip.SetVal(aNode: TGvTreeNode; const aFieldNm,aFieldVal: String);
var j: integer;
begin
  aNode.cells[ trGrdNar.fields.IndexByName[aFieldNm] ].Value := aFieldVal;
  if aNode.Count > 0 then //если узел, обходим дальше
    for j := 0 to aNode.Count-1 do SetVal(aNode.Items[j], aFieldNm,aFieldVal);
end;

procedure TfrmComNarVip.tbNarToResClick(Sender: TObject);
begin
  {раскладываем уже созданный в базе наряд-выполнение по всем ресурсам}
  with frmMain.qrNarVipAllRes do
  begin
    ParamByName('narkey').asBCD := keynar;
    Open;
    while not eof do
    begin
      TfrmNarVipRes.opennar(
        keynar,
        FieldByName('whowork').AsInteger,
        izmer,
        'Наряд-выполнение: '+IntToStr(keynar)+', '+frmMain.NarCaption+', Исполнитель: '+FieldByName('nm').AsString
        );
      Next;
    end;
    close;
  end;
end;

procedure TfrmComNarVip.tbDelSelOpersClick(Sender: TObject);
var
  i: integer;
  AllOk: boolean;
  sellock :   boolean;
begin
  if length(trGrdNar.SelectedRecs) = 0 then exit;

    //будут удалены отмеченные наряды полностью, Вы уверены, что хотите продолжить?
 sellock :=false;
  for i := 0 to length(trGrdNar.SelectedRecs)-1 do
  if trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['locked']].Value ='1'
  then
  begin
   sellock:=true;
   break;
  end;
  if sellock then
  //среди выделенных есть заблокированные! нельзя ни чего с ними делать, снимаем все выделения
  begin
  trGrdNar.SelectedRecs := nil;
  trGrdNar.Invalidate;
     Application.MessageBox(
      pchar(MsgDelLockedOper),
        pchar(MsgAttentionRu) ,
        MB_OK);
   exit;
  end  ;

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
    svipolnenie_OPERAC_DEL.ParamByName('akey').value:= trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value;
    if trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['parent']].Value='' then
    svipolnenie_OPERAC_DEL.ParamByName('aparent').value := null
    else
    svipolnenie_OPERAC_DEL.ParamByName('aparent').value := trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['parent']].Value;
    svipolnenie_OPERAC_DEL.ParamByName('aprnum').value := trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['prnum']].Value;
    svipolnenie_OPERAC_DEL.ParamByName('anarkey').value := trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['narkey']].Value;
    try
    svipolnenie_OPERAC_DEL.ExecProc;
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
 qrNarvip.Close;
 qrNarvip.Open;
 trGrdNar.UpdateTree(qrNarvip,'key',['prnum', 'ord']);
 trGrdNar.Invalidate;
 qrNarvip.Close;
      StatusBar1.Panels[1].Text := floattostr  ( trGrdNar.CalcItogsNS( trGrdNar.Items.Root, 'n2'));
      StatusBar1.Panels[4].Text:= floattostr  ( trGrdNar.CalcItogsNS( trGrdNar.Items.Root, 'fact'));
end;

procedure TfrmComNarVip.trGrdNarDragOver(Sender, Source: TObject; X,
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

procedure TfrmComNarVip.ReadOpParams(Sender: TObject);
var
  //fnt: TFont;
  i: integer;
begin
 if trGrdNar.CurNode = nil then exit;
  if AlgInfo.Text <> '' then AlgInfo.Text := '';
  if GrdParams.Recs.Count > 0 then GrdParams.Recs.Clear;

  //Выводим код операции в systemtray
  if (trGrdNar.Items.AllNodeCount > 0) and (trGrdNar.ByFieldName['oper'].Value <> '') then
     StatusBar1.Panels[7].Text := trGrdNar.ByFieldName['oper'].Value
  else
     StatusBar1.Panels[7].Text := '';


  with trGrdNar do
  begin
    if (RightDockPanel.Width < 50) or
      (
        (ByFieldName['operlifetype'].Value<>'79') //комбинация
        and (ByFieldName['operlifetype'].Value<>'80') //алгоритм
      )
    then exit;

    {считываем параметры, если операция предполагает это}
    qrParamv.ParamByName('narkey').AsString := ByFieldName['narkey'].Value;
    qrParamv.ParamByName('vipkey').AsString := ByFieldName['key'].Value;
    qrParamv.ParamByName('aoperlifeid').AsString := ByFieldName['operlifeid'].Value;

    qrParamv.Open;

    GrdParams.LoadDataset(qrParamv,['PTYPE','parcode', 'КодЗначения','VIP_key','isskv']);
    qrParamv.Close;
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
     if trGrdNar.ByFieldName['locked'].Value='1'
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

procedure TfrmComNarVip.SetWorker(Sender: TObject);
var
  keyRes: integer;
  i: integer;
  sql: string;
begin
  if length(trGrdNar.SelectedRecs) = 0 then exit;

  keyRes := -1;
  //задаем исполнителей на операции
  with TfrmSetWorker.Create(self) do
  begin
    if ShowModal = mrOk then
      keyRes := Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]); //получаем код ресурса
    destroy;
  end;

  if keyRes = -1 then exit;
  for i := 0 to length(trGrdNar.SelectedRecs)-1 do
  begin
    //формируем шаблон запроса на обновление
    sql := 'update burnar.narvip set whowork=%d where key=%s';
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
  ReloadTekNar(KeyNar,minres,maxres,izmer); //перечитываем наряд
end;

procedure TfrmComNarVip.tbCloseNarZadClick(Sender: TObject);
var str : string;
    i, c : integer;
begin
  if application.MessageBox('Наряд-выполнение будет закрыто!', 'Внимание!', MB_OKCANCEL+MB_ICONQUESTION) = IDCANCEL	 then
     exit
  else
  try

    //надо проверить если количество не заблокированных работ больше 0 то хер а не
    lunlock := IsUnLocked;
    if lunlock then //если закрыт
    begin
      Application.MessageBox(Pchar(MsgNotAllLocked), PChar(MsgAttentionRu), MB_OK);
    end
    else
    begin
      frmMain.MConnection.ExecSQL(Format('update burnar.defnarvip set closed = 1 where narkey = %d', [keynar]));
      Application.MessageBox(Pchar(MsgChangeSavedRu),PChar(MsgAttentionRu), MB_OK+MB_ICONEXCLAMATION);
      lclosed := true;
  end;
  except
    on E: Exception do
    begin
        i := pos('*', E.Message);
        c := pos('#', E.Message);
        sEdit1.Text := Trim(copy(E.Message, i + 1, c - i - 1));
        
        Application.MessageBox(pchar(E.Message), pchar(E.HelpContext), MB_OK + MB_ICONERROR);
    end;
  end;

end;

procedure TfrmComNarVip.trGrdNarDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  acol,arow: integer;
  DestNode: TGvTreeNode;
  loc: string; //код операции
begin
  if lclosed then
  begin
    MoveOper := nil;
    exit;
  end;
  //изменить в плане реализации сущечтвующей логики...
  if MoveOper <> nil then
    begin
      //получаем координаты ячейки, в которой бросили работу
      with trGrdNar do
      begin
        MouseToCell(X,Y, ACol,ARow);
        if (ARow <= fixedrows-1) or (VisRecs[ARow-fixedRows] = MoveOper) then
        begin
          MoveOper := nil;
          exit; //бросили мимо элемента сетки, или тот же узел-выход, либо на шапку притащили
        end; //если бросили мимо элемента сетки или тот же узел, досрочный выход
        {передвигаем работу}
        try
        if MoveOper.Cells[Fields.IndexByName['narkey']].Value<>VisRecs[ARow-fixedRows].Cells[Fields.IndexByName['narkey']].Value  then
            begin
              Application.MessageBox(Pchar('Перемещение между разными нарядами запрещено!'),PChar(MsgAttentionRu),
              MB_OK+MB_ICONEXCLAMATION);
              exit;
            end   ;
        //если работа заблокирована оставляем ее в покое
         if MoveOper.Cells[Fields.IndexByName['locked']].Value='1'
           then
             begin

                  Application.MessageBox(
                                  pchar(MsgCutLockedOper),
                                  pchar(MsgAttentionRu) ,
                                   MB_OK);
                  exit;
             end;
         //вставлять перед заблокиравонными - зло!
         if  VisRecs[ARow-fixedRows].Cells[Fields.IndexByName['locked']].Value='1'
           then
             begin

                  Application.MessageBox(
                                  pchar(MsgCutBetLockedOper),
                                  pchar(MsgAttentionRu) ,
                                   MB_OK);
                  exit;
             end;

          if MoveOper.Cells[Fields.IndexByName['parent']].Value=''
          then
          sVIPOLNENIE_OPERAC_MOVE.ParamByname('Aparent').value :=null
          else
          sVIPOLNENIE_OPERAC_MOVE.ParamByname('Aparent').value := MoveOper.Cells[Fields.IndexByName['parent']].Value;

          sVIPOLNENIE_OPERAC_MOVE.ParamByname('Aprnum').value := MoveOper.Cells[Fields.IndexByName['prnum']].Value;
          sVIPOLNENIE_OPERAC_MOVE.ParamByname('newprnum').value :=  VisRecs[ARow-fixedRows].Cells[Fields.IndexByName['PRNUM']].Value;

          if VisRecs[ARow-fixedRows].Cells[Fields.IndexByName['parent']].Value=''then
          sVIPOLNENIE_OPERAC_MOVE.ParamByname('newparent').value := null
          else
          sVIPOLNENIE_OPERAC_MOVE.ParamByname('newparent').value :=  VisRecs[ARow-fixedRows].Cells[Fields.IndexByName['parent']].Value;

          sVIPOLNENIE_OPERAC_MOVE.ParamByname('AKEY').value := MoveOper.Cells[Fields.IndexByName['key']].Value;

          sVIPOLNENIE_OPERAC_MOVE.ParamByname('anarkey').value :=  MoveOper.Cells[Fields.IndexByName['narkey']].Value ;

          if (VisRecs[ARow-fixedRows].Cells[Fields.IndexByName['operlifetype']].Value='') and  (VisRecs[ARow-fixedRows].Count=0) then
          if application.MessageBox('Данный блок пустой! Выберите действие:'+#13+'OK - данные будут вставлены внутрь блока'+#13+'ОТМЕНА - данные  будут вставлены перед блоком',
           'Внимание!',  MB_OKCANCEL+MB_ICONQUESTION) = IDOK
          then    begin
           sVIPOLNENIE_OPERAC_MOVE.ParamByname('newparent').value := VisRecs[ARow-fixedRows].Cells[Fields.IndexByName['key']].Value; // пользователь вставляет в пустой блок
           sVIPOLNENIE_OPERAC_MOVE.ParamByname('newprnum').value :=1;
          end      ;


          loc := MoveOper.Cells[trGrdNar.Fields.IndexByName['key']].Value;

          sVIPOLNENIE_OPERAC_MOVE.ExecProc;
          ReloadTekNar(keynar,minres,maxres,izmer);//перечитываем текущий наряд с сервера
          if loc<>'' then
          trGrdNar.Locate('key',loc);

        finally
          MoveOper := nil; //операция закончена, сбрасываем переменную
        end;
      end; //end width
    end
  else
    begin
      //получаем координаты ячейки, в которой бросили работу
      trGrdNar.MouseToCell(X,Y, ACol,ARow);
      if ARow <= 0 then exit; //бросили мимо элемента сетки
      //сохраняем узел-приёмник
      if length(trGrdNar.VisRecs) = 0 then
        begin
          SVIPOLNENIE_ADD_RAZDEL.ParamByname('aprnum').value := 1;
          SVIPOLNENIE_ADD_RAZDEL.ParamByname('aparent').value := null;
        end
      else
        begin
          //наряд не пустой
          DestNode := trGrdNar.VisRecs[ARow-trGrdNar.fixedRows];
         if  DestNode.Cells[trGrdNar.Fields.IndexByName['locked']].Value='1'
           then
             begin

                  Application.MessageBox(
                                  pchar(MsgCutBetLockedOper),
                                  pchar(MsgAttentionRu) ,
                                   MB_OK);
                  exit;
             end;

         // prnum := DestNode.Cells[trGrdNar.Fields.IndexByName['PRNUM']].Value;
          SVIPOLNENIE_ADD_RAZDEL.ParamByname('aprnum').value := DestNode.Cells[trGrdNar.Fields.IndexByName['PRNUM']].Value;
          if DestNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value=''
          then
          SVIPOLNENIE_ADD_RAZDEL.ParamByname('Aparent').value :=null
          else
          SVIPOLNENIE_ADD_RAZDEL.ParamByname('Aparent').value := DestNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value;


          if (DestNode.Cells[trGrdNar.Fields.IndexByName['operlifetype']].Value='') and  (DestNode.Count=0) then
          if application.MessageBox('Данный блок пустой! Выберите действие:'+#13+'OK - данные будут добавлены внутрь блока'+#13+'ОТМЕНА - данные  будут добавлены перед блоком',
           'Внимание!',  MB_OKCANCEL+MB_ICONQUESTION) = IDOK
          then  begin
          SVIPOLNENIE_ADD_RAZDEL.ParamByname('Aparent').value := DestNode.Cells[trGrdNar.Fields.IndexByName['key']].Value; // пользователь вставляет в пустой блок
          SVIPOLNENIE_ADD_RAZDEL.ParamByname('aprnum').value :=1;
          end;

        end;
      try
        SVIPOLNENIE_ADD_RAZDEL.ParamByname('NKEY').value := keynar;
        SVIPOLNENIE_ADD_RAZDEL.ParamByname('DATEIN').value := null;
        SVIPOLNENIE_ADD_RAZDEL.ParamByname('WHO').value := null;
        SVIPOLNENIE_ADD_RAZDEL.ParamByname('WITHNAME').value := 1;
        SVIPOLNENIE_ADD_RAZDEL.ParamByname('RAZDEL').value := SrcNode.Cells[frmStructNar.Catalog.Fields.IndexByName['Код раздела']].Value;

        if trGrdNar.Items.AllNodeCount > 0 then
          loc := DestNode.Cells[trGrdNar.Fields.IndexByName['key']].Value; //29032024

        SVIPOLNENIE_ADD_RAZDEL.ExecProc;
        ReloadTekNar(keynar,minres,maxres,izmer);//перечитываем текущий наряд с сервера
        if loc<>'' then
        trGrdNar.Locate('key',loc);
      finally
      end;
    end;
end;

procedure TfrmComNarVip.trGrdNarMouseDown(Sender: TObject;
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
    trGrdNar.BeginDrag(True); //начало перетаскивания
  end;
end;

procedure TfrmComNarVip.tbReOrderRabClick(Sender: TObject);
begin
if trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['Parent']].Value<>'' then
   sVIPOLNENIE_RENUMLEVEL.ParamByname('aParent').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value
else
    sVIPOLNENIE_RENUMLEVEL.ParamByname('aParent').value :=null;
    sVIPOLNENIE_RENUMLEVEL.ParamByname('aNarKey').value :=keynar;
    sVIPOLNENIE_RENUMLEVEL.ExecProc;
    qrNarvip.Close;
    qrNarvip.Open;
    trGrdNar.UpdateTree(qrNarvip,'key',['ord','prnum']);
    trGrdNar.Invalidate;
    qrNarvip.Close;
end;

procedure TfrmComNarVip.trGrdNarCellValChange(aChangeCell: PGvCell;
  aFieldInd: Integer; const newVal: String);
var
  Calc : TPasCalc;
  oldnorma,oldfact,newfact: string; //значения считанных с грида норм "до расчета"
  oldnormaInit,oldfactInit,newfactInit: string; //выражения, собирающие входные параметры

  logicfact,logicnorma: string; //логическо-расчетная часть скриптов
  NormScript,FactScript: String; //выражения(блоки скриптов) полностью готовые для расчета
  factresult,normaresult: TVar; //результаты
begin
  //если изменили ячейку колонки факт и тип данной работы=82, применяем правила корреляции ячеек
  with trGrdNar do
  begin
  ///********************************
  // для заблокированных не меняем факт :)
  if ByFieldName['locked'].Value='1' then exit;
  ///*********************************
    qrfactkorr.ParamByName('idlife').Value := ByFieldName['operlifeid'].Value;
    qrfactkorr.Open;

    if qrfactkorr.eof then //правил корреляции нет, пишется поле факт и всё
    begin
      aChangeCell.Value := newVal;
      qrfactkorr.Close;
      SaveFact(CurNode);  //пишем только факт
      StatusBar1.Panels[1].Text := floattostr  (trGrdNar.CalcItogsNS( trGrdNar.Items.Root, 'n2'));
      StatusBar1.Panels[4].Text:= floattostr  (trGrdNar.CalcItogsNS( trGrdNar.Items.Root, 'fact'));

      fBell := false;

      exit;
    end;

    //читаем нормативное поле до расчета
    if ByFieldName['n2'].Value='' then
    oldnorma := '0'
    else
    oldnorma := ByFieldName['n2'].Value;

    //для констант перед тем провести корреляцию в норму на объем пишем значения нормы на единицу (по логике изначально они равны)
    if (ByFieldName['n1'].Value <> '') and ( ByFieldName['operlifetype'].Value='78') then
       oldnorma := ByFieldName['n1'].Value;


    if oldnorma <> '' then
    begin
      oldnorma := StringReplace( format( fNFormat, [StrToFloat(oldnorma)] ), ',','.',[]); //приводим число к виду, пригодному для интерпритации
      oldnormaInit := 'oldnorma:='+oldnorma+';'; //формируем оператор присваивания переменной oldnorma
    end;

    //читаем фактическое поле до расчета
    if ByFieldName['Fact'].Value='' then
    oldfact := '0'
    else
    oldfact := StringReplace(ByFieldName['Fact'].Value,',','.',[]);
    if oldfact <> '' then //формируем оператор присваивания переменной oldfact
      oldfactInit := 'oldfact:='+oldfact+';';

    //читаем новое, вводимое фактическое значение
    newfact := StringReplace(newVal,',','.',[]);
    if newfact <> '' then //формируем оператор присваивания переменной newfact
      newfactInit := 'newfact:='+newfact+';';

    {читаем расчетную логику для полей из базы}
    //логика для результата нормативного поля
    if qrfactkorr.fieldbyname('norma').Value = Null then //если логика на поле нормы задана
      logicnorma := ''
    else
      logicnorma := qrfactkorr.fieldbyname('norma').Value+';';
    //логика для результата фактического поля
    if qrfactkorr.fieldbyname('fact').Value = Null then //если логика на поле факта не задана
      logicfact := ''
    else
      logicfact := qrfactkorr.fieldbyname('fact').Value+';';
    qrfactkorr.Close; //набор данных уже не нужен

    {формируем окончательно расчетные скрипты}
    FactScript := oldnormaInit+oldfactInit+newfactInit+logicfact;
    NormScript := oldnormaInit+oldfactInit+newfactInit+logicnorma;

    ////////////////////////Вычисляем выражения(скрипты)///////////////////////
    Calc := TPasCalc.Create;
    if logicfact <> '' then //нет логики для факта - считать нЕчего!
    begin
      Calc.Execute(FactScript); //фактическое выражение
      if Calc.ErrCode <> 0 then //показываем ошибки (если есть)
      begin
        algInfo.Lines.Add(Calc.ErrMsg);
        algInfo.Lines.Add(Calc.ErrLine);
        algInfo.Lines.Add('');
        exit; //выходим дальше делать нечего, результата не будет
      end;
      Calc.VarByName('result', factresult);//Забираем вычисленный результат
      //Пишем вычисленное значение в поле таблицы
      ByFieldName['Fact'].Value := FloatToStr(factresult.Num);
    end;
    if logicnorma <> '' then //нет логики для поля нормы - считать нЕчего!
    begin
      Calc.ClearVars; //чистим переменные
      Calc.Execute(NormScript); //нормативное выражение
      if Calc.ErrCode <> 0 then //показываем ошибки (если есть)
      begin
        algInfo.Lines.Add(Calc.ErrMsg);
        algInfo.Lines.Add(Calc.ErrLine);
        algInfo.Lines.Add('');
        exit; //выходим дальше делать нечего, результата не будет
      end;
      Calc.VarByName('result', normaresult);//Забираем вычисленный результат
      //Пишем вычисленное значение в поле таблицы
      ByFieldName['n2'].Value := FloatToStr(normaresult.Num);
      invalidate;
    end;
    Calc.Free;


    fBell := true;

    //////////////////////////////////////////////////////////////////////////

    {подбиваем все итоги по гриду}
      SaveNormaAndFact(CurNode); //пишем готовую ноду в базу и норму и факт
      StatusBar1.Panels[1].Text := floattostr  ( trGrdNar.CalcItogsNS( trGrdNar.Items.Root, 'n2'));
      StatusBar1.Panels[4].Text:= floattostr  ( trGrdNar.CalcItogsNS( trGrdNar.Items.Root, 'fact'));
  end;
end;

{сохраняет весь вектор нормы и факт}
procedure TfrmComNarVip.SaveNormaAndFact(aNode: TGvTreeNode);
var
  cmd,norms,Fact,n1,n2: string;
begin
  // факт прежде всего :)
  Fact := aNode.cells[trGrdNar.fields.IndexByName['Fact']].value;
  if Fact = '' then
    Fact := 'null'
  else
    Fact := StringReplace( FloatToStr(StrToFloat(Fact)/kf), ',','.',[]); //если в числе есть запятая, меняем ее на '.'
  cmd := 'update burnar.vipolnenie_norm set fact= ' + Fact + ' where vip_key= '+aNode.cells[trGrdNar.fields.IndexByName['key']].value+';  ';
  // единичная норма
    n1 := aNode.cells[trGrdNar.fields.IndexByName['n1']].value;
  if n1 = '' then
    n1 := 'null'
  else
    n1 := StringReplace( FloatToStr(StrToFloat(n1)/kf), ',','.',[]); //если в числе есть запятая, меняем ее на '.'
  //  норма на объем
    n2 := aNode.cells[trGrdNar.fields.IndexByName['n2']].value;
  if n2 = '' then
    n2 := 'null'
  else
    n2 := StringReplace( FloatToStr(StrToFloat(n2)/kf), ',','.',[]); //если в числе есть запятая, меняем ее на '.'

  norms :=  ' update burnar.vipolnenie_norm set norma= ' + n1 + ' where vip_key='+aNode.cells[trGrdNar.fields.IndexByName['key']].value+' and prnum=1; ' +
            ' update burnar.vipolnenie_norm set norma= ' + n2 + ' where vip_key='+aNode.cells[trGrdNar.fields.IndexByName['key']].value+' and prnum=2; ' ;

  cmd:= cmd+norms+  '; '   ;
  frmMain.MConnection.ExecSQL(cmd); //сохраняем нормы узла на серваке

end;

procedure TfrmComNarVip.SaveFact(aNode: TGvTreeNode);
var
  cmd,Fact: string;
begin
  Fact := aNode.cells[trGrdNar.fields.IndexByName['Fact']].value;
  if Fact = '' then
    Fact := 'null'
  else
    Fact := StringReplace( FloatToStr(StrToFloat(Fact)/kf), ',','.',[]); //если в числе есть запятая, меняем ее на '.'

  cmd := 'update burnar.vipolnenie_norm set fact='+Fact+' where vip_key='+aNode.cells[trGrdNar.fields.IndexByName['key']].value+';';
  frmMain.MConnection.ExecSQL(cmd); //сохраняем нормы узла на серваке
end;


procedure TfrmComNarVip.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  {готовности выполнить операции(команды)}
  with trGrdNar do
  begin
    actVipolnenie_add_emptyblock.Enabled:=(trGrdNar.Items.AllNodeCount   >0) and(ByFieldName['locked'].Value<>'1')and (not lclosed);
    actRenameBlock.Enabled:=(trGrdNar.Items.AllNodeCount   >0) and(ByFieldName['operlifetype'].Value='')and (ByFieldName['locked'].Value<>'1' )and (not lclosed)  and (ByFieldName['RS'].Value='0');
    actCalcOperAndSaveRes.Enabled :=(trGrdNar.Items.AllNodeCount   >0) and( (CurNode <> nil)
    and (RightDockPanel.Width > 50) and (CurNode.Count = 0) and (not lclosed)
      and (ByFieldName['operlifetype'].Value<>'78')   //константы не считаем
      and (ByFieldName['operlifetype'].Value<>'')  // и  блоки
      and (ByFieldName['locked'].Value<>'1' ));
        actsetdateHANDmla.Enabled:=(trGrdNar.Items.AllNodeCount   >0) and (CurNode <> nil) and(ByFieldName['locked'].Value<>'1')and (not lclosed);

    actPasteRab.Enabled := (trGrdNar.Items.AllNodeCount   >0) and((fEdAct = edcopy) or (fEdAct = edCut)) and (CurNode <> nil) and (ByFieldName['locked'].Value<>'1')and (not lclosed);
    actLockOper.Enabled := (trGrdNar.Items.AllNodeCount   >0) and(ByFieldName['locked'].Value='0') and (not lclosed);
    actUnLockOper.Enabled :=(trGrdNar.Items.AllNodeCount   >0) and (ByFieldName['locked'].Value='1') and (not lclosed);
    actVipolnenie_del_block.Enabled:=(trGrdNar.Items.AllNodeCount   >0) and(ByFieldName['operlifetype'].Value='') and (ByFieldName['locked'].Value<>'1' )and (not lclosed) and (ByFieldName['RS'].Value='0');
        actSelelColorRow.Enabled:=(length(SelectedRecs) > 0) and (not lclosed);
    actClearColor.Enabled:=(length(SelectedRecs) > 0) and (not lclosed);
    actExpandNodes.Enabled := Items.Root.Count > 0;
    actAutoWidthCols.Enabled := length(trGrdNar.VisRecs) > 0;
    actReloadNar.Enabled := keynar > 0;
    actNarToRes.Enabled := Items.Root.Count > 0;
    actCloseNarVip.Enabled := not lclosed;
    actDelSelOpers.Enabled := (length(SelectedRecs) > 0) and (not lclosed);
    actFindWord.Enabled := (sEdit1.Text <> '') and (length(VisRecs) > 0);
    actSetWorker.Enabled := (length(SelectedRecs) > 0) and (not lclosed);
    actReOrderRab.Enabled := (length(VisRecs) > 0) and (not lclosed);
    actSaveFact.Enabled := (length(VisRecs) > 0) and (not lclosed);
    actCopyRab.Enabled := (length(SelectedRecs) > 0) and (not lclosed)and (fEdAct = ednone);
    actCutRab.Enabled := (length(SelectedRecs) > 0) and (not lclosed) and (fEdAct = ednone);
    actSaveSelElems.Enabled := (Items.Root.Count > 0) and (not lclosed);
    actSelPeriodOper.Enabled := (length(SelectedRecs) > 0) and (not lclosed)and (fEdAct = ednone);
        actImportRabZad.Enabled := (not lclosed) and (not llocked);
  end;
end;

procedure TfrmComNarVip.cbParValuesEnter(Sender: TObject);
begin
  BeforModifyStr := cbParValues.Text; //запоминаем что было до
end;

procedure TfrmComNarVip.cbParValuesExit(Sender: TObject);
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

      {***************************сохраняем значение в базе********************}
      //если параметр дискретный, будем сохранять код его значения, если непрерывный - само значение
      if ByFieldName['ptype'].Value = '2' then
        mVAL1 := ByFieldName['КодЗначения'].Value
      else
        mVAL1 := ByFieldName['Значение'].Value;
      if mVAL1 = '' then mVAL1 := 'null';
      mval1 := StringReplace(mVAL1,',','.',[]); //если в числе есть запятая, меняем ее на '.'
      upd := Format( 'update burnar.vipolnenie_param set znach = %s where vip_key=%s and parcode=%s',
                     [
                     mVAL1,
                     ByFieldName['vip_key'].Value,
                     ByFieldName['parcode'].Value
                     ]);
      frmMain.MConnection.ExecSQL(upd);
      ByFieldName['Значение']^.Value := cbParValues.Text;
      //меняем логически на клиенте код нового дискр парам
      if ByFieldName['ptype'].Value = '2' then
         ByFieldName['КодЗначения']^.Value := mVAL1;
      upd:=Format('update burnar.vipolnenie_norm set norma=null where vip_key=%s;', [ByFieldName['vip_key'].Value]);
      frmMain.MConnection.ExecSQL(upd);
      del:=Format('delete from burnar.vipolnenie_ist where vip_key=%s;', [ByFieldName['vip_key'].Value]);
      frmMain.MConnection.ExecSQL(del);
      trGrdNar.ByFieldName['n1']^.Value:='';
      trGrdNar.ByFieldName['n2']^.Value:='';
      trGrdNar.ByFieldName['istnorm']^.Value:='';
      trGrdNar.Invalidate;
    except
    end;
  end;
end;

type
  tmt = class(TGvComboBox);

procedure TfrmComNarVip.GrdParamsSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  CodeZnDiscrPar,parType,FieldName: String;
  mR: TRect; aField: PGvCell;
begin
  if GrdParams.Recs.count = 0 then exit;

  FieldName := UpperCase( GrdParams.GetField(ACol,ARow).Value );
  with GrdParams do
  if FieldName = 'Значение' then //кликнули на ячейке, принадлежащей полю "Значения параметров"
    begin
      mR := CellRect(ACol,ARow);
      if mR.Left+ColWidths[ACol] > GrdParams.ClientWidth then exit;
      if mR.Top+RowHeights[ARow] > GrdParams.ClientHeight then exit;

      cbParValues.PickList.Items.Clear;
      cbParValues.Text := '';
      parType := Recs[ARow-fixedrows][Fields.indexbyname['ptype']].Value;
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
            if CodeZnDiscrPar<>'' then
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
            number:
              begin
                if Recs[ARow-fixedrows][Fields.IndexByName['Значение']].Value <> '' then
                  try
                    cbParValues.Text := TrimRight( format(fNFormat,
                      [ StrToFloat( Recs[ARow-fixedrows][Fields.IndexByName['Значение']].Value) ]
                      ) );
                  except
                    cbParValues.Text := Recs[ARow-fixedrows][Fields.IndexByName['Значение']].Value;
                  end
                else
                  cbParValues.Text := Recs[ARow-fixedrows][Fields.IndexByName['Значение']].Value;
              end;
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

function TfrmComNarVip.IsClosed: boolean;
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

function TfrmComNarVip.IsLocked: boolean;
begin
  qrLocked.Close;
  qrLocked.ParamByName('nar').Value := keynar;
  qrLocked.Open;
  if qrLocked.fieldbyname('kol').AsInteger > 0 then //если закрыт
    result := true
  else
    result := false;
  GrdParams.Enabled := not result;
  qrLocked.Close;
end;

function TfrmComNarVip.IsUnLocked: boolean;
begin
  qrUnLock.Close;
  qrUnLock.ParamByName('nar').Value := keynar;
  qrUnLock.Open;
  if qrUnLock.fieldbyname('kol').AsInteger > 0 then //если закрыт
    result := true
  else
    result := false;
  GrdParams.Enabled := not result;
  qrUnLock.Close;
end;

procedure TfrmComNarVip.actOpenSkvVipExecute(Sender: TObject);
begin
  {сквозные параметры выполнения}
  with TfrmSkvVipVar.CreateEx(Self, keynar) do
  begin
    FormStyle := fsMdiChild;      
    Show;
  end;
end;

procedure TfrmComNarVip.actCopyRabExecute(Sender: TObject);
begin
  fEdAct := edcopy;
  trGrdNar.SortSelected; //сортируем выделенные записи
end;

procedure TfrmComNarVip.actPasteRabExecute(Sender: TObject);
var
  i: LongInt;
  pol_vib : boolean; //выбор пользователя
  loc : string;
begin
 pol_vib:=false;
  try
  loc:=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['key']].Value  ;
    // если текущая запись пустой блок даем пользователю выбор в блок копировать или перед ним
   if (trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['operlifetype']].Value='') and  (trGrdNar.CurNode.Count=0) then
    begin

          //сообщение для выбора действия пользователем
    case fEdAct of
      edcopy:
        begin

       if application.MessageBox('Данный блок пустой! Выберите действие:'+#13+'ОК - данные будут скопированы внутрь блока'+#13+'ОТМЕНА - данные  будут скопированы перед блоком',
           'Внимание!', MB_OKCANCEL+MB_ICONQUESTION) = IDOK	 then
          pol_vib:= true // пользователь вставляет в пустой блок
        else
          pol_vib:= false // пользователь вставляет пелед блоком
        end;
       edcut: //было инициировано вырезание
        begin
        if application.MessageBox('Данный блок пустой! Выберите действие:'+#13+'ОК - данные будут вставлены внутрь блока'+#13+'ОТМЕНА - данные  будут вставлены перед блоком',
          'Внимание!', MB_OKCANCEL+MB_ICONQUESTION) = IDOK	 then
          pol_vib:= true // пользователь вставляет в пустой блок
        else
          pol_vib:= false // пользователь вставляет пелед блоком
        end;
        end;
    end;


    case fEdAct of
      edcopy:
        begin
          // у нас свое копирование
           for i := length(trGrdNar.SelectedRecs)-1 downto 0 do
          begin
              //если в пустой блок нужно переопределить парента на код блока, а не на парента блока
             if pol_vib then
              begin
              sVipolnenie_operac_copy.ParamByName('aparent_where_copy').value:=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['key']].Value;
              sVipolnenie_operac_copy.ParamByName('aprnum_where_copy').value :='1';
              end
              else
              begin
              if trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value='' then
               sVipolnenie_operac_copy.ParamByName('aparent_where_copy').value :=null
               else
               sVipolnenie_operac_copy.ParamByName('aparent_where_copy').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value ;

              sVipolnenie_operac_copy.ParamByName('aprnum_where_copy').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['prnum']].Value ;
              end  ;


              if trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['parent']].Value='' then
                sVipolnenie_operac_copy.ParamByName('parent_oper').value := null
               else
               sVipolnenie_operac_copy.ParamByName('parent_oper').value := trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['parent']].Value;

              sVipolnenie_operac_copy.ParamByName('key_oper').value := trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value;

              sVipolnenie_operac_copy.ParamByName('anarkey').value :=trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['narkey']].Value ;
              sVipolnenie_operac_copy.ExecProc;
          end;
        end;
      edcut:
        begin
        for i := length(trGrdNar.SelectedRecs)-1 downto 0 do
          begin
            // у нас свое перемещение
              sVipolnenie_operac_move.ParamByName('akey').value := trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value;
              if trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['parent']].Value='' then
              sVipolnenie_operac_move.ParamByName('aparent').value :=null
              else
              sVipolnenie_operac_move.ParamByName('aparent').value := trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['parent']].Value;
              sVipolnenie_operac_move.ParamByName('aprnum').value :=  trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['prnum']].Value;
              sVipolnenie_operac_move.ParamByName('anarkey').value :=trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['narkey']].Value ;

             if pol_vib then
              begin
               sVipolnenie_operac_move.ParamByName('newparent').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['key']].Value    ;
               sVipolnenie_operac_move.ParamByName('newprnum').value:='1';
              end
              else
              begin
               if trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value='' then
                sVipolnenie_operac_move.ParamByName('newparent').value :=null
              else
               sVipolnenie_operac_move.ParamByName('newparent').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value ;
               sVipolnenie_operac_move.ParamByName('newprnum').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['prnum']].Value ;
              end ;
              sVipolnenie_operac_move.ExecProc;
          end;

        end;
    end;
    fEdAct := edNone;
    trGrdNar.SelectedRecs := nil;
    ReloadTekNar(keynar,minres,maxres,izmer);
    if loc<>'' then
    trGrdNar.Locate('key',loc);
  finally
  fEdAct := edNone;
  end;
end;

procedure TfrmComNarVip.actShowOkExecute(Sender: TObject);
var
  htmlDoc: string;
begin
  {получаем имя карты}
  qrHtmlOk.ParamByName('operkey').Value := trGrdNar.ByFieldName['key'].Value;
  qrHtmlOk.ParamByName('oplife').Value := trGrdNar.ByFieldName['operlifeid'].Value;  
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

procedure TfrmComNarVip.actCutRabExecute(Sender: TObject);
var sellock :boolean;
    i: integer;
begin
  //если среди вырезанных есть заблокированные работы то нельзя допускать их вырезания и вообще каких-либо действий
  sellock :=false;
  for i := 0 to length(trGrdNar.SelectedRecs)-1 do
  if trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['locked']].Value ='1'
  then
  begin
   sellock:=true;
   break;
  end;
  if sellock then
  //среди выделенных есть заблокированные! нельзя ни чего с ними делать, снимаем все выделения
  begin
  trGrdNar.SelectedRecs := nil;
  trGrdNar.Invalidate;
     Application.MessageBox(
      pchar(MsgCutLockedOper),
        pchar(MsgAttentionRu) ,
        MB_OK);

  end
  else
  //заблокированных нет, выполняем стандартные действия
  begin
  fEdAct := edcut;
  oldRecsSelColor := trGrdNar.SelRecsColor;
  trGrdNar.SelRecsColor := clSkyBlue;
  trGrdNar.Invalidate;
  trGrdNar.SortSelected; //сортируем выделенные записи
  end;
end;

procedure TfrmComNarVip.SetSaveSel(aNode: TGvTreeNode);
var
  j,lastInd,m,k: longint;
begin
  k := 0;
  m := trGrdNar.fields.IndexByName['sel'];
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

procedure TfrmComNarVip.actSaveSelElemsExecute(Sender: TObject);
var
  i: longint;
  upd: string;
begin
  try
    if length(trGrdNar.SelectedRecs) > 0 then
      begin
        {снимаем старые сохраненные закладки}
        upd := Format('update burnar.narvip set sel=null where narkey=%d',[frmMain.keynar]);
        frmMain.MConnection.ExecSQL(upd);
        for i := 0 to length(trGrdNar.SelectedRecs)-1 do
        begin
          upd := Format('update burnar.narvip set sel=%s where key=%s',
            ['1', trGrdNar.SelectedRecs[i].node.GetFirst.Cells[trGrdNar.Fields.IndexByName['key']].Value]);
          frmMain.MConnection.ExecSQL(upd);
        end
      end
    else
      begin
        upd := Format('update burnar.narvip set sel=null where narkey=%d',[frmMain.keynar]);
        frmMain.MConnection.ExecSQL(upd);
      end;
    Application.MessageBox(Pchar(MsgChangeSavedRu),PChar(MsgAttentionRu),
      MB_OK+MB_ICONEXCLAMATION);
  finally
  end;
end;

procedure TfrmComNarVip.FormActivate(Sender: TObject);
begin
  if keynar <> 0 then //аналогичный код должен повторятся на форме "ComNarZad"   // 11.07.2011  ****Frolov_aa
    begin
      //переопределяем переменную "keynar" главной формы
      if keynar<> TfrmMain(application.MainForm).keynar then TfrmMain(application.MainForm).keynar:=keynar;
      //активируем элементы управления нарядом на основной форме
      TfrmMain(application.MainForm).actGlobalParams.Enabled := true;
      TfrmMain(application.MainForm).actOpenZad.Enabled := true;
      TfrmMain(application.MainForm).actGlobalParams.Enabled := true;
      TfrmMain(application.MainForm).actOpenVip.Enabled := true;
    end;
end;

procedure TfrmComNarVip.FormDeactivate(Sender: TObject);
begin //аналогичный код должен повторятся на форме "ComNarZad"    // 11.07.2011  ****Frolov_aa
  //деактивируем элементы управления нарядом на основной форме
  TfrmMain(application.MainForm).actGlobalParams.Enabled := false;
  TfrmMain(application.MainForm).actGlobalParams.Enabled := false;
  //обнуляем переменную "keynar" главной формы
  TfrmMain(application.MainForm).keynar:=0;
end;

procedure TfrmComNarVip.FormPaint(Sender: TObject);
begin
  if keynar <> 0 then //аналогичный код должен повторятся на форме "ComNarZad"   // 11.07.2011  ****Frolov_aa
    begin
      //переопределяем переменную "keynar" главной формы
      if keynar<> TfrmMain(application.MainForm).keynar then TfrmMain(application.MainForm).keynar:=keynar;
      //активируем элементы управления нарядом на основной форме
      TfrmMain(application.MainForm).actGlobalParams.Enabled := true;
      TfrmMain(application.MainForm).actOpenZad.Enabled := true;
      TfrmMain(application.MainForm).actGlobalParams.Enabled := true;
      TfrmMain(application.MainForm).actOpenVip.Enabled := true;
    end;

end;

procedure TfrmComNarVip.actSelelColorRowExecute(Sender: TObject);
var i:integer;
begin
if  ColorDialog1.Execute then
  begin
  trGrdNar.BeginRebuildStruct;
  for i := 0 to length(trGrdNar.SelectedRecs)-1 do
  begin
  trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['colorsel']]^.Value:=inttostr(ColorDialog1.color);
  frmMain.MConnection.ExecSQL('update burnar.vipolnenie_oper set colorsel='+inttostr(ColorDialog1.color)+' where key='+trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value+';');
  end;
  trGrdNar.SelectedRecs := nil;
  trGrdNar.EndRebuildStruct;
  end;
end;


procedure TfrmComNarVip.actClearColorExecute(Sender: TObject);
var i:integer;
begin
  trGrdNar.BeginRebuildStruct;
  for i := 0 to length(trGrdNar.SelectedRecs)-1 do
  begin
  trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['colorsel']]^.Value:='0';
  frmMain.MConnection.ExecSQL('update burnar.vipolnenie_oper set colorsel=0 where key='+trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value+';');
  end;
  trGrdNar.SelectedRecs := nil;
  trGrdNar.EndRebuildStruct;
end;

procedure TfrmComNarVip.actVipolnenie_add_emptyblockExecute(
  Sender: TObject);
begin
  if not IsClosed then
  begin
  if trGrdNar.Items.AllNodeCount>0 then
  begin  //наряд не пустой и надо добавить соотвественно где нажали
  if trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value='' then
  sVIPOLNENIE_ADD_EMPTYBLOCK.ParamByName('aparent').value :=null
  else
  sVIPOLNENIE_ADD_EMPTYBLOCK.ParamByName('aparent').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['parent']].Value ;
  sVIPOLNENIE_ADD_EMPTYBLOCK.ParamByName('aprnum').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['prnum']].Value ;
  sVIPOLNENIE_ADD_EMPTYBLOCK.ParamByName('nkey').value :=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['narkey']].Value ;
  sVIPOLNENIE_ADD_EMPTYBLOCK.ParamByName('who').value:=null ;
  sVIPOLNENIE_ADD_EMPTYBLOCK.ParamByName('dateIn').value:=trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['begoperdate']].Value ;
  sVIPOLNENIE_ADD_EMPTYBLOCK.ParamByName('textik').value:= InputBox('Введите название блока', 'Название:', '');
  end
  else //наряд пустой и надо в него добавить блок
  begin
  sVIPOLNENIE_ADD_EMPTYBLOCK.ParamByName('nkey').value:=keynar;
  sVIPOLNENIE_ADD_EMPTYBLOCK.ParamByName('aprnum').value:=1;
  sVIPOLNENIE_ADD_EMPTYBLOCK.ParamByName('aprnum').value:=null;
  sVIPOLNENIE_ADD_EMPTYBLOCK.ParamByName('who').value:=null;
  sVIPOLNENIE_ADD_EMPTYBLOCK.ParamByName('dateIn').value:=null;
  sVIPOLNENIE_ADD_EMPTYBLOCK.ParamByName('textik').value:= InputBox('Введите название блока', 'Название:', '');
  end;

  sVIPOLNENIE_ADD_EMPTYBLOCK.ExecProc;
  ReloadTekNar(keynar,minres,maxres,izmer);
  trGrdNar.Locate('nm',sVIPOLNENIE_ADD_EMPTYBLOCK.ParamByName('textik').value);
 end;
end;

procedure TfrmComNarVip.actRenameBlockExecute(Sender: TObject);
var newnm : string;
begin
//переименование блока
newnm:= InputBox('Введите название блока', 'Название:', trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['nm']].Value);
if newnm<>'' then
  begin
    trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['nm']]^.Value :=newnm ;
    trGrdNar.Invalidate;
    frmMain.MConnection.ExecSQL('update burnar.vipolnenie_anynm set nm='''+newnm+''' where VIP_KEY='+trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['key']].Value+';');
  end;
end;


procedure TfrmComNarVip.actFontDownExecute(Sender: TObject);
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

procedure TfrmComNarVip.actFontUpExecute(Sender: TObject);
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


procedure TfrmComNarVip.actImportRabZadExecute(Sender: TObject);
begin

  if trGrdNar.Items.AllNodeCount > 0 then exit;       //костыль. не добвлять пока есть работы


  if Application.MessageBox(
      pchar(MsgZadaniCopyToVipolnenie),
        pchar(MsgAttentionRu) ,
        MB_OKCANCEL+MB_ICONEXCLAMATION) = IDOK then
  begin



    SZADANIE_TO_VIPOLNENIE.ParamByname('nKey').value := keynar;
    SZADANIE_TO_VIPOLNENIE.ParamByname('Datein').value := null;
    SZADANIE_TO_VIPOLNENIE.ExecProc;
     ReloadTekNar(keynar,minres,maxres,izmer);
  end;
     ReloadTekNar(keynar,minres,maxres,izmer);
end;

procedure TfrmComNarVip.actLockOperExecute(Sender: TObject);
var loc, str : string;
    i, c : integer;
begin
try
    loc := trGrdNar.ByFieldName['key'].Value;
    SVIPOLNENIE_LOCK_OPER.ParamByname('aKey').value := trGrdNar.ByFieldName['key'].Value;
    SVIPOLNENIE_LOCK_OPER.ParamByname('anarKey').value := trGrdNar.ByFieldName['narkey'].Value;

    try
        SVIPOLNENIE_LOCK_OPER.ExecProc;
    except on E: Exception do
       (*было до 26062024 begin
          str := frmMain.Get_ORA_Exception(E.Message);
         if Length(str) <> 0 then
            Application.MessageBox(PChar(str), 'Ошибка', MB_ICONWARNING)
         else
            Application.MessageBox(PChar(E.Message), 'Error', MB_ICONERROR);
         Screen.Cursor := crDefault;
       end; // on E: Exception do
       *)
       begin
         str := frmMain.Get_ORA_Exception(E.Message);

         i := pos('*', E.Message);
         c := pos('#', E.Message);
         sEdit1.Text := Trim(copy(E.Message, i + 1, c - i - 1));

         if Length(str) <> 0 then
            Application.MessageBox(PChar(str), 'Ошибка', MB_ICONWARNING)
         else
            Application.MessageBox(PChar(E.Message), 'Error', MB_ICONERROR);

         Screen.Cursor := crDefault;
       end; // on E: Exception do
    end;

 finally

    ReloadTekNar(keynar,minres,maxres,izmer); //перечитываем наряд
    
    if loc <>'' then
      trGrdNar.Locate('key',loc);
      trGrdNar.OnClick(nil);
    end

end;

procedure TfrmComNarVip.actUnLockOperExecute(Sender: TObject);
var loc : string;
begin
    SVIPOLNENIE_UN_LOCK_OPER.ParamByname('aKey').value := trGrdNar.ByFieldName['key'].Value;
    SVIPOLNENIE_UN_LOCK_OPER.ParamByname('anarKey').value := trGrdNar.ByFieldName['narkey'].Value;
    SVIPOLNENIE_UN_LOCK_OPER.ExecProc;
     llocked :=IsLocked;
    ReloadTekNar(keynar,minres,maxres,izmer); //перечитываем наряд
    if loc <>'' then
    trGrdNar.Locate('key',loc);
    trGrdNar.OnClick(nil);
end;

procedure TfrmComNarVip.actOpenNarVipExecute(Sender: TObject);
begin
 frmMain.MConnection.ExecSQL('update burnar.defnarvip set closed=0 where narkey='+inttostr(keynar));
end;

procedure TfrmComNarVip.actListPeriodExecute(Sender: TObject);
var period :TfrmListPeriod;
begin
//открываем окно настройки периодов
  period:=  TfrmListPeriod.Create(owner);
  period.aorauser:= orauser ;
  period.loadlistperiod(keynar,lclosed);
  period.ShowModal;
  qrNarvip.Close;
  qrNarvip.Open;
  trGrdNar.UpdateTree(qrNarvip,'key',['period_nm']);
  trGrdNar.Invalidate;
  qrNarvip.Close;

end;

procedure TfrmComNarVip.actIntervalsExecute(Sender: TObject);
var Intervals :TfrmMehBurIntervals;
begin
//открываем окно настройки периодов
  Intervals:=  TfrmMehBurIntervals.Create(owner);
  Intervals.loadlistIntervals(keynar);
  Intervals.ShowModal;
end;


procedure TfrmComNarVip.actSelPeriodOperExecute(Sender: TObject);
var sel:TfrmSetPeriod;
    sellock :boolean;
    i: integer;
    sql : string;
begin
//нужно проверить если среди выделнных есть не заблокированные ни чего не делаем
  sellock :=false;
  for i := 0 to length(trGrdNar.SelectedRecs)-1 do
  if trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['locked']].Value ='0'
  then
  begin
   sellock:=true;
   break;
  end;
  if sellock then
  //среди выделенных есть не заблокированные! нельзя ни чего с ними делать, снимаем все выделения
  begin
  trGrdNar.SelectedRecs := nil;
  trGrdNar.Invalidate;
     Application.MessageBox(
      pchar(MsgNotAllLocked),
        pchar(MsgAttentionRu) ,
        MB_OK);

  end
  else
  begin
    sel:=TfrmSetPeriod.Create(owner);
    sel.loadcombo(keynar);
    //проверяем есть ли у нас периоды
    if sel.ComboBox1.Items.Count>0 then
    begin
     sel.ComboBox1.ItemIndex:=0;
     //периоды есть пользователь выбирает
     if sel.ShowModal=mrOk then
       begin
       //сохраняем для всех выделенных работ выбранный период:
         for i := 0 to length(trGrdNar.SelectedRecs)-1 do
         sql := sql + 'update burnar.vipolnenie_oper set PERIOD='+IntToStr(Integer(sel.ComboBox1.Items.Objects[sel.ComboBox1.ItemIndex])) +
              ' where  key='+ trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value+'; ' ;
         frmMain.MConnection.ExecSQL(sql);
         trGrdNar.SelectedRecs := nil;
         //обновляем поле название периода
         qrNarvip.Close;
         qrNarvip.Open;
         trGrdNar.UpdateTree(qrNarvip,'key',['period_nm']);
         qrNarvip.Close;
         trGrdNar.Invalidate;

       end;
    end;   
  end;
end;

procedure TfrmComNarVip.actViewOperInfoExecute(Sender: TObject);
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



procedure TfrmComNarVip.trGrdNarSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
if trGrdNar.Items.AllNodeCount>0 then
begin
if trGrdNar.VisRecs[ARow-trGrdNar.FixedRows].Cells[trGrdNar.fields.indexbyname['locked']]^.Value='1'
   then
   begin
   CanSelect:=false;
   end;
 if (trGrdNar.VisRecs[ARow-trGrdNar.FixedRows].Cells[trGrdNar.fields.indexbyname['operlifetype']]^.Value='81') or
    (trGrdNar.VisRecs[ARow-trGrdNar.FixedRows].Cells[trGrdNar.fields.indexbyname['operlifetype']]^.Value='')
   then
   begin
   CanSelect:=false;
   end
end
end;

procedure TfrmComNarVip.actVipolnenie_del_blockExecute(Sender: TObject);
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
    sVIPOLNENIE_OPERAC_DEL_BLOCK.ParamByName('akey').value:= trGrdNar.ByFieldName['key'].Value;
    if trGrdNar.ByFieldName['parent'].Value='' then
    sVIPOLNENIE_OPERAC_DEL_BLOCK.ParamByName('aparent').value := null
    else
    sVIPOLNENIE_OPERAC_DEL_BLOCK.ParamByName('aparent').value := trGrdNar.ByFieldName['parent'].Value;
    sVIPOLNENIE_OPERAC_DEL_BLOCK.ParamByName('aprnum').value := trGrdNar.ByFieldName['prnum'].Value;
    sVIPOLNENIE_OPERAC_DEL_BLOCK.ParamByName('anarkey').value := trGrdNar.ByFieldName['narkey'].Value;
       try
    sVIPOLNENIE_OPERAC_DEL_BLOCK.ExecProc;
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


procedure TfrmComNarVip.N1Click(Sender: TObject);
begin
   qrITOGtable.Close;
   qrITOGtable.ParamByName('narkey').value := keynar;
   qrITOGtable.Open;
   grItog.LoadDataset(qrITOGtable,['narkey','key']);
   grItog.Fields.SetTitles1(['narkey','key','NM','SUMM_N','SUMM_F','NORMATIV','REMONT_N','VAHT_N', 'FACT','REMONT_F','VAHT_F'],
      ['Код наряда','Код периода','Название периода', 'Итог Н.В.', 'Итог Факт.','Сумма Н.В.','Ремонт Н.В.','Вахт. Н.В.','Сумма Факт.','Ремонт Факт.','Вахт. Факт.']);
end;

procedure TfrmComNarVip.sbHideItogiClick(Sender: TObject);
begin
sbHideItogi.Visible:=false;
      sbshowItogi.Visible:=true;
panelheight:= Panel2.Height;
Panel2.Height:=30;
  Splitter1.Visible:=false;
end;

procedure TfrmComNarVip.sbShowItogiClick(Sender: TObject);
begin
sbHideItogi.Visible:=true;
      sbshowItogi.Visible:=false;
Panel2.Height:= panelheight;
Splitter1.Visible:=true;
end;

procedure TfrmComNarVip.SpeedButton2Click(Sender: TObject);
begin
   qrITOGtable.Close;
   qrITOGtable.ParamByName('narkey').value := keynar;
   qrITOGtable.Open;
   grItog.LoadDataset(qrITOGtable,['narkey','key']);
   grItog.ColWidths[0] := 270;
   grItog.Fields.SetTitles1(['narkey','key','NM','SUMM_N','SUMM_F','NORMATIV','REMONT_N', 'FACT','REMONT_F'],
      ['Код наряда','Код периода','Название периода', 'Итог Н.В.', 'Итог Факт.','Сумма Н.В.','Ремонт Н.В.','Сумма Факт.','Ремонт Факт.']);
   grItog.ColWidths[0]:=grItog.ColWidths[0]+1;
   grItog.ColWidths[0] := grItog.ColWidths[0]-1;
end;

procedure TfrmComNarVip.actsetdateHANDmlaExecute(Sender: TObject);
var str : string;
begin
    try
     with TfrmSetBegDateOp.Create(Application) do
      begin
      DatePicker1.date:=strtodatetime(trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['BEGOPERDATE']].Value);
      TimePicker1.time:=strtodatetime(trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['BEGOPERDATE']].Value);
      CAption:='Дата начала работ в новом наряде:';
      if ShowModal = mrOk then
      begin
//        str := ' update burnar.vipolnenie_oper set BEGOPERDATE=to_date('''+datetostr(DatePicker1.date) + ' ' + timetostr(TimePicker1.time)+''',''dd.mm.yyyy hh24:mi:ss''), EDITDATE=1 where key='+trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['key']].Value+';';
        str := ' update burnar.vipolnenie_oper set BEGOPERDATE=to_timestamp('''+datetostr(DatePicker1.date) + ' ' + timetostr(TimePicker1.time)+''',''dd.mm.yyyy hh24:mi:ss'')::timestamp without time zone, EDITDATE=1 where key='+trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['key']].Value+';';
//                   'to_timestamp('''+datetostr(newper.DatePicker2.date) + ' ' + timetostr(newper.TimePicker2.time)+''',''dd.mm.yyyy hh24:mi:ss'')::timestamp without time zone); ' ;
        frmMain.MConnection.ExecSQL(str);
      //перечитываем список
      //сигналим пользователю об удачной операции
      Application.MessageBox(Pchar(MsgChangeSavedRu),PChar(MsgAttentionRu),
        MB_OK+MB_ICONEXCLAMATION);
      //  obnovlyaem derevo
       //нужно обойти те узлы где значение даты изменилось и проставить новые даты
           qrNarvip.Close;
           qrNarvip.Open;
           trGrdNar.UpdateTree(qrNarvip,'key',['begoperdate']);
           trGrdNar.invalidate;
      end;
      end;
    finally
    end;
end;

procedure TfrmComNarVip.ActSetDExecute(Sender: TObject);
var i:integer;
s :string;
begin

  for i := 0 to length(trGrdNar.SelectedRecs)-1 do
  begin
{    frmMain.MConnection.ExecSQL('update burnar.vipolnenie_oper set priznak=1 where key in '+
    'update burnar.vipolnenie_oper set priznak=1 where key in '+
    '(select key from burnar.vipolnenie_oper start with key = '+
    trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value+
    'connect by prior key=parent);';}

    frmMain.MConnection.ExecSQL(' update burnar.vipolnenie_oper set priznak=1 where key in ( ' +
                                ' WITH RECURSIVE TMP AS (select t.key from burnar.vipolnenie_oper t where t.key = ' +
                                  trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value +
                                ' union all select t.key from burnar.vipolnenie_oper t, tmp where tmp.key = t.parent) select tmp.key from tmp)');

  end;

 tbReloadNarClick(sender);

 trGrdNar.SelectedRecs := nil;

end;

procedure TfrmComNarVip.ActSetNotDExecute(Sender: TObject);
var i:integer;
begin

  for i := 0 to length(trGrdNar.SelectedRecs)-1 do
  begin
{
    frmMain.MConnection.ExecSQL('update burnar.vipolnenie_oper set priznak=0 where key in '+
    '(select key from burnar.vipolnenie_oper start with key = '+
    trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value+
    'connect by prior key=parent);');
}
    frmMain.MConnection.ExecSQL(' update burnar.vipolnenie_oper set priznak=0 where key in ( ' +
                                ' WITH RECURSIVE TMP AS (select t.key from burnar.vipolnenie_oper t where t.key = ' +
                                  trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value +
                                ' union all select t.key from burnar.vipolnenie_oper t, tmp where tmp.key = t.parent) select tmp.key from tmp)');
  end;

 tbReloadNarClick(sender);

 trGrdNar.SelectedRecs := nil;

end;


procedure TfrmComNarVip.DBLookupComboBox1Click(Sender: TObject);
var
  AllOk: boolean;
  str : string;
  i:integer;
  si : string;
begin
  if trGrdNar.Items.AllNodeCount>0 then
  for i := 0 to length(trGrdNar.SelectedRecs)-1 do
    begin
      si := DBLookupComboBox1.keyValue;
      str := 'update burnar.vipolnenie_oper set tipbur = '+ si +
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

procedure TfrmComNarVip.ToolButton23Click(Sender: TObject);
var
  AllOk: boolean;
  str : string;
  i : integer;
begin

  if Application.MessageBox(
    pchar('Наряд-задание будет заменено на наряд-выполнение, Вы уверены, что хотите продолжить?'),
    pchar(MsgAttentionRu),

   MB_OKCANCEL+MB_ICONEXCLAMATION) = IDCANCEL then exit;


    str := Format ('CALL burnar.Copy_Vip_to_Zad (nkey => %d);',
                   [keynar]);

    frmMain.MConnection.ExecSQL(str); //сохраняем нормы узла на серваке

    AllOk := true;

    for I := 0 to frmMain.MDIChildCount-1 do
    if (frmMain.MDIChildren[I] is TfrmComNarZad) then
    begin
     with TfrmComNarZad(frmMain.MDIChildren[I]) do
        ReloadTekNar(keynar,minres,maxres,izmer);
    end;

    if (AllOk) then //сигналим пользователю об удачной операции
      Application.MessageBox('Изменения успешно сохранены!',PChar(MsgAttentionRu),
      MB_OK+MB_ICONEXCLAMATION);
    exit;


end;

end.
