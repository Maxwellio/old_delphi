unit NarZadResUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ImgList, ComCtrls, ToolWin, Grids,
  ovniDbControls, FMTBcd, DB, SqlExpr, Buttons, StdCtrls,
  ExtCtrls, Menus, OvniGrids, Ora, MemDS,
  DBAccess, PgAccess;

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


  TfrmNarZadRes = class(TForm)
    trGrdNar: TovniDbTreeGrid;
    qrNarZad: TPgQuery;
    qrNormAtribName: TPgQuery;
    qrCalcNorma: TPgQuery;
    qrAllSavedNorms: TPgQuery;
    tbExpandNodes: TToolButton;
    tbAutoWidthCols: TToolButton;
    tbReloadNar: TToolButton;
    tbDelSelOpers: TToolButton;
    tbFindWord: TToolButton;
    sAddRab: TPgStoredProc;
    Image1: TImage;
    qrClosed: TPgQuery;
    sClcBegDateNextOp: TPgStoredProc;
    sMoveRab: TPgStoredProc;
    tbReOrderRab: TToolButton;
    sORDERNAR: TPgStoredProc;
    sCopyZadToVip: TPgStoredProc;
    Image2: TImage;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure tbExpandNodesClick(Sender: TObject);
    procedure tbAutoWidthColsClick(Sender: TObject);
    procedure ReloadTekNar(aKeyNar,ares,aizmer: integer);
    procedure tbReloadNarClick(Sender: TObject);
    //procedure tbSaveCalcedNormsClick(Sender: TObject);
    procedure tbDelSelOpersClick(Sender: TObject);
    procedure trGrdNarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure trGrdNarDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure trGrdNarDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure trGrdNarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbReOrderRabClick(Sender: TObject);
  private
    {загружает все сохраненные нормы наряда и расставляет по гриду}
    procedure LoadSavedNorms;
    procedure SetOperImgs(aNode: TGvTreeNode);
    {!вызывается, когда дезигнер переводит форму в режим дизайна}
    procedure WMOnDsgnMode(var Message:TMessage); message WM_OnDsgnMode;
    {!вызывается при выходе из режима дизайна}
    procedure WMOffDsgnMode(var Message:TMessage); message WM_OffDsgnMode;
  public
    keynar, //код наряда в целом
    res, //ресурс
    izmer,  //измеритель
    IzmerElCount: integer;
    closed: boolean;
    constructor Create(AOwner: TComponent); override;
    class procedure OpenNar(aKeyNar,ares,aizmer: integer; const aCaption: string);
  end;


implementation

uses
  MainUnit, GlobalVarUnit, formStructNur, formSetDate, formSetWorker;

{$R *.dfm}

var
  //DestNode: TGvTreeNode;
  MoveOper: TGvTreeNode;

procedure TfrmNarZadRes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

constructor TfrmNarZadRes.Create(AOwner: TComponent);
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
  closed := false;  
end;

procedure TfrmNarZadRes.FormCreate(Sender: TObject);
begin
  trGrdNar.ColWidths[0] := 10;
end;

procedure TfrmNarZadRes.sSpeedButton3Click(Sender: TObject);
begin
  with trGrdNar do
    Locate(GetField(Col,Row).Value, Edit1.Text, false, Row-FixedRows+1);
end;

procedure TfrmNarZadRes.tbExpandNodesClick(Sender: TObject);
begin
  IF not tbExpandNodes.Down THEN trGrdNar.FullCollapse
  else trGrdNar.FullExpand;
end;

procedure TfrmNarZadRes.tbAutoWidthColsClick(Sender: TObject);
begin
  trGrdNar.SetAutoWidthAllColumns;
end;

{Перечитываем наряд из базы}
procedure TfrmNarZadRes.ReloadTekNar(aKeyNar,ares,aizmer: integer);
var
  n: integer;
  j: cardinal;
  Indexes: array of integer;
begin
    qrNarZad.ParamByName('keynar').AsBCD := aKeyNar; //код наряда
    qrNarZad.ParamByName('CodIzmer').AsBCD := aizmer; //измеритель
    qrNarZad.ParamByName('DeepLev').AsBCD := VisibleOperDeepLevel; //кол-во выводимых уровней
    qrNarZad.ParamByName('worker').AsBCD := ares; //мин значение кода ресурса
    qrNarZad.Open;
    trGrdNar.LoadTree(qrNarZad,'id','parent',6,['key','dateenter','dateout','operkey','id',
      'parent','whowork','proizvodit','volume','numin','findnormtype']);
    qrNarZad.Close;

    {устанавливаем битмэп-значки, признаки типов операций}
    SetOperImgs(trGrdNar.Items.Root);

    {дополняем столбцами норм таблицу наряда}
    qrNormAtribName.ParamByName('CodIzmer').asString := IntToStr(aizmer);
    qrNormAtribName.Open;
    trGrdNar.BeginRebuildStruct;
    j := 1;
    while not qrNormAtribName.Eof do
    begin
      n := trGrdNar.Fields.Add('Field'+IntToStr(j)
        ,qrNormAtribName.fieldByName('Состав').AsString
        ,haLeft,vaTop,nil,nil,Cont,false);
      trGrdNar.Fields[n].DataType := number;
      SetLength(Indexes,length(Indexes)+1);
      Indexes[ High(Indexes) ] := trGrdNar.Fields.Count-1;
      if j = frmMain.AtribNum then
        StatusBar1.Panels[2].Text := qrNormAtribName.FieldByName('edizm').asString;
      qrNormAtribName.Next;
      inc(j);
    end;
    qrNormAtribName.Close;
    IzmerElCount := j-1;

    {наполняем их сохраненными данными, если есть}
    LoadSavedNorms;

    {настраиваем ширины полей и другие атрибуты}
    trGrdNar.ColWidths[2] := 200;
    trGrdNar.ColWidths[4] := 200;
    trGrdNar.Fields.SetTitles([0,1,2, 6,7,8,9,10, 12,13],['Код строки',
      'Порядок блока','Код работы',  'Наименования работ','Начало действия',
      'Окончание действия','Момент применения','Источник нормирования',
      'Тип производителя','Объем работы']);
    trGrdNar.ExclusionFields.Add('istnorm');
    trGrdNar.ExclusionFields.Add('begoperdate');      
    trGrdNar.EndRebuildStruct;

    {устанавливаем доступ на элементы управления по состоянию наряда}
    qrClosed.ParamByName('nar').Value := aKeyNar;
    qrClosed.Open;
    if qrClosed.fieldbyname('closed').AsInteger = 1 then //если закрыт
      begin
        closed := true;
        tbDelSelOpers.Enabled := false;
        tbReOrderRab.Enabled := false;
      end
    else
      begin
        closed := false;
        tbDelSelOpers.Enabled := true;
        tbReOrderRab.Enabled := true;
      end;
    qrClosed.Close;

    {подбиваем все локальные итоги по всему гриду}
    with trGrdNar do begin
    CalcItogs(Items.Root,['Field'+IntToStr(frmMain.AtribNum)]);
    StatusBar1.Panels[1].Text :=
      format(fNFormat,[StrToFloat(Items.Root.Cells[fields.IndexByName['field'+IntToStr(frmMain.AtribNum)]].value)]);
    end;
end;

{загружает все сохраненные нормы наряда и расставляет по гриду}
procedure TfrmNarZadRes.LoadSavedNorms;
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
              := AllNarNorms[tNum].norma[i-1]*kf;
        inc(tNum);
      end
    else //если узел, обходим дальше
      for j := 0 to aNode.Count-1 do
        PutNormsToGrid(aNode.Items[j], tnum);
  end;
begin
  {готовим запрос, задаем параметры}
  qrAllSavedNorms.ParamByName('keynar').AsBCD := KeyNar;
  qrAllSavedNorms.ParamByName('CodIzmer').AsBCD := izmer;
  qrAllSavedNorms.ParamByName('deepLev').AsBCD := VisibleOperDeepLevel;
  qrAllSavedNorms.ParamByName('worker').AsBCD := res;
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
    AllNarNorms[c].norma[i] := qrAllSavedNorms.fieldbyname('norma').Value;
    qrAllSavedNorms.Next;
    inc(i);
  end;
  qrAllSavedNorms.Close;
  if length(AllNarNorms) = 1 then exit;  

  {раскладывем данные по гриду}
  tNum := 0;
  PutNormsToGrid(trGrdNar.Items.Root,tNum);
  AllNarNorms := nil;
end;

procedure TfrmNarZadRes.SetOperImgs(aNode: TGvTreeNode);
var
  j: integer;
begin
  if aNode.Count = 0 then //если лист, пишем
    case StrToInt(aNode.cells[trGrdNar.fields.IndexByName['findnormtype']].Value) of
      79,80: //комбинация, алгоритм
        aNode.imgs[trGrdNar.fields.IndexByName['opernm']]:=Image1.Picture.Bitmap;
      82:
        aNode.imgs[trGrdNar.fields.IndexByName['opernm']]:=Image2.Picture.Bitmap;
    end
  else //если узел, обходим дальше
    for j := 0 to aNode.Count-1 do
      SetOperImgs(aNode.Items[j]);
end;

class procedure TfrmNarZadRes.OpenNar(aKeyNar,ares,aizmer: integer;
  const aCaption: string);
begin
  with TfrmNarZadRes.Create(Application) do
  begin
    keynar := aKeyNar;
    res := ares;
    izmer := aizmer;
    caption := acaption;
    ReloadTekNar(keynar, res, izmer);
  end;
end;

procedure TfrmNarZadRes.tbReloadNarClick(Sender: TObject);
begin
  ReloadTekNar(KeyNar,res,izmer);
end;

procedure TfrmNarZadRes.tbDelSelOpersClick(Sender: TObject);
var
  i: integer;
  Sql: String;
  AllOk: boolean;
begin
  if length(trGrdNar.SelectedRecs) = 0 then exit;

  //будут удалены отмеченные наряды полностью, Вы уверены, что хотите продолжить?
  if Application.MessageBox(
    pchar('Отмеченные работы будут удалены, Вы уверены, что хотите продолжить?'),
    pchar(MsgAttentionRu),
    MB_OKCANCEL+MB_ICONEXCLAMATION) = IDCANCEL then exit;

  WaitIndicator.Show;//сигналим начало длительной операции
  AllOk := true;
  trGrdNar.Items.BeginRebuildStruct;
  for i := 0 to length(trGrdNar.SelectedRecs)-1 do
  begin
    //формируем шаблон запроса на удаление
    sql := 'delete from burnar.narzad where key=%s';
    //удаляем из базы
    sql := Format(sql,[
      trGrdNar.SelectedRecs[i].node.Cells[trGrdNar.Fields.IndexByName['key']].Value
      ]);
    try
      frmMain.MConnection.ExecSQL(SQL);
      //удаляем из памяти таблицы выделенную запись, если изменение в базе прошло благополучно
      trGrdNar.Items.Delete( trGrdNar.SelectedRecs[i].Node );
    except
      on E: Exception do
      begin
        AllOk := false;
        //MessageDlg(E.Message, mtError, [mbOK], 0);
        Application.MessageBox(pchar(E.Message), pchar(E.HelpContext),MB_OK+MB_ICONERROR);
      end;
    end;
  end; //end for
  trGrdNar.SelectedRecs := nil;
  trGrdNar.Items.EndRebuildStruct;
  WaitIndicator.Close;//сигналим окончание длительной операции
  if AllOk then //сигналим пользователю об удачной операции
    Application.MessageBox(Pchar(MsgChangeSavedRu),PChar(MsgAttentionRu),
    MB_OK+MB_ICONEXCLAMATION);
end;

procedure TfrmNarZadRes.trGrdNarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then //клавиша Delete
    tbDelSelOpersClick(self);
end;

procedure TfrmNarZadRes.trGrdNarDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := sender is TOVNIDbTreeGrid{false};
end;

procedure TfrmNarZadRes.trGrdNarDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  acol,arow: integer;
  DestNode: TGvTreeNode;
begin
  if MoveOper <> nil then  //перемещение работы
    begin
      with trGrdNar do//получаем координаты ячейки, в которой бросили работу
      begin
        MouseToCell(X,Y, ACol,ARow);
        if (ARow < 0) or (VisRecs[ARow-fixedRows] = MoveOper) then
        begin
          MoveOper := nil;
          exit; //бросили мимо элемента сетки, или тот же узел-выход
        end;
        {передвигаем работу}
        WaitIndicator.Show;
        try
          sMoveRab.ParamByname('AKEY').value := MoveOper.Cells[Fields.IndexByName['key']].Value;
          sMoveRab.ParamByname('TOPRNUM').value := VisRecs[ARow-fixedRows].Cells[Fields.IndexByName['PRNUM']].Value;
          sMoveRab.ExecProc;
          ReloadTekNar(KeyNar,res,izmer);//перечитываем текущий наряд с сервера
        finally
          MoveOper := nil; //операция закончена, сбрасываем переменную
          WaitIndicator.Close;
        end;
      end;
    end
  else
    begin //добавление работы из структуры
      //получаем координаты ячейки, в которой бросили работу
      trGrdNar.MouseToCell(X,Y, ACol,ARow);
      if ARow < 0 then exit; //бросили мимо элемента сетки
      //сохраняем узел-приёмник
      DestNode := trGrdNar.VisRecs[ARow-trGrdNar.fixedRows];
      //анализируем его
      //сохраняем структуру в базе
      WaitIndicator.Show;
      try
        sAddRab.ParamByname('NKEY').value := keynar;
        sAddRab.ParamByname('OPERKEY').value := SrcNode.Cells[frmStructNar.Catalog.Fields.IndexByName['Код операции']].Value;
        sAddRab.ParamByname('DATEIN').value := null;
        sAddRab.ParamByname('aPRNUM').value := DestNode.Cells[trGrdNar.Fields.IndexByName['PRNUM']].Value;
        sAddRab.ParamByname('RAZDEL').value := SrcNode.Cells[frmStructNar.Catalog.Fields.IndexByName['Код раздела']].Value;;
        sAddRab.ParamByname('WHO').value := res;
        sAddRab.ExecProc;//sAddRab.ParamByname('NarZadKey').Value; //возвращенный результат
        ReloadTekNar(KeyNar,res,izmer);//перечитываем текущий наряд с сервера
      finally
        WaitIndicator.Close;
      end;
    end;
end;

procedure TfrmNarZadRes.trGrdNarMouseDown(Sender: TObject;
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

procedure TfrmNarZadRes.tbReOrderRabClick(Sender: TObject);
begin
  WaitIndicator.Show;
  try
    with trGrdNar do
    begin
      sORDERNAR.ParamByname('aNarKey').value := keynar;
      sORDERNAR.ParamByname('ATIPNAR').value := 1; //задание
    end;
    sORDERNAR.ExecProc;
    ReloadTekNar(KeyNar,res,izmer);//перечитываем текущий наряд с сервера
    //WaitIndicator.Close;
  (*except
    on E: Exception do
    begin
      WaitIndicator.Close;
      Application.MessageBox(pchar(E.Message), pchar(E.HelpContext),MB_OK+MB_ICONERROR);
    end;
  end;*)
  finally
    WaitIndicator.Close;
  end;
end;

procedure TfrmNarZadRes.WMOffDsgnMode(var Message: TMessage);
begin

end;

procedure TfrmNarZadRes.WMOnDsgnMode(var Message: TMessage);
begin

end;


end.
