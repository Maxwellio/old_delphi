unit NarVipResUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ImgList, ComCtrls, ToolWin, 
  Grids, OVNIGrids, ovniDbControls, FMTBcd, DB, SqlExpr, Buttons,
  StdCtrls,  ExtCtrls,   Menus,  Ora,
  MemDS, DBAccess, PgAccess;


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


  TfrmNarVipRes = class(TForm)
    trGrdNar: TovniDbTreeGrid;
    qrNarVip: TPgQuery;
    qrNormAtribName: TPgQuery;
    qrCalcNorma: TPgQuery;
    qrAllSavedNorms: TPgQuery;
    sAddRab: TPgStoredProc;
    Image1: TImage;
    qrClosed: TPgQuery;
    sClcBegDateNextOp: TPgStoredProc;
    sMoveRab: TPgStoredProc;
    sORDERNAR: TPgStoredProc;
    Image2: TImage;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    tbExpandNodes: TToolButton;
    tbAutoWidthCols: TToolButton;
    tbReloadNar: TToolButton;
    tbDelSelOpers: TToolButton;
    Edit1: TEdit;
    tbFindWord: TToolButton;
    tbReOrderRab: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure tbExpandNodesClick(Sender: TObject);
    procedure tbAutoWidthColsClick(Sender: TObject);
    procedure ReloadTekNar(aKeyNar,ares,aizmer: integer);
    procedure tbReloadNarClick(Sender: TObject);
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
  public
    keynar, //код наряда в целом
    res, izmer,
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
  MoveOper: TGvTreeNode;

procedure TfrmNarVipRes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

constructor TfrmNarVipRes.Create(AOwner: TComponent);
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

procedure TfrmNarVipRes.FormCreate(Sender: TObject);
begin
  trGrdNar.ColWidths[0] := 10;
end;

procedure TfrmNarVipRes.sSpeedButton3Click(Sender: TObject);
begin
  with trGrdNar do
    Locate(GetField(Col,Row).Value, Edit1.Text, false, Row-FixedRows+1);
end;

procedure TfrmNarVipRes.tbExpandNodesClick(Sender: TObject);
begin
  IF not tbExpandNodes.Down THEN trGrdNar.FullCollapse
  else trGrdNar.FullExpand;
end;

procedure TfrmNarVipRes.tbAutoWidthColsClick(Sender: TObject);
begin
  trGrdNar.SetAutoWidthAllColumns;
end;

{Перечитываем наряд из базы}
procedure TfrmNarVipRes.ReloadTekNar(aKeyNar,ares,aizmer: integer);
var
  n: integer;
  j: cardinal;
  Indexes: array of integer;
begin
    qrNarVip.ParamByName('keynar').AsBCD := aKeyNar; //код наряда
    qrNarVip.ParamByName('CodIzmer').AsBCD := aizmer; //измеритель
    qrNarVip.ParamByName('DeepLev').AsBCD := VisibleOperDeepLevel; //кол-во выводимых уровней
    qrNarVip.ParamByName('worker').AsBCD := res; //мин значение кода ресурса
    qrNarVip.Open;
    trGrdNar.LoadTree(qrNarVip,'id','parent',6,['key','dateenter','dateout','operkey','id',
      'parent','whowork','proizvodit','volume','numin','findnormtype']);
    qrNarVip.Close;

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

    {добавляем поле факт(фактическая продолжительность)}
    n := trGrdNar.Fields.Add('Fact','Факт. продолж., мин',haLeft,vaTop,nil,nil,Cont,false);
    trGrdNar.Fields[n].DataType := number;

    {наполняем их сохраненными данными, если есть}
    LoadSavedNorms;

    {настраиваем ширины полей и другие атрибуты}
    //trGrdNar.Fields.SetAtrib(2, haCenter, vaTop, Cont, true, nil, true);
    trGrdNar.ColWidths[2] := 200;
    trGrdNar.ColWidths[4] := 200;
    trGrdNar.Fields.SetTitles([0,1,2, 6,7,8,9,10, 12,13],['Код строки',
      'Порядок блока','Код работы','Наименования работ','Начало действия',
      'Окончание действия','Момент применения','Источник нормирования'
      ,'Тип производителя','Объем работы']);
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
    CalcItogs(Items.Root,['Field'+IntToStr(frmMain.AtribNum),'Fact']); //подбиваем все локальные итоги по всему гриду
    StatusBar1.Panels[1].Text :=
      format(fNFormat,[StrToFloat(Items.Root.Cells[fields.IndexByName['Field'+IntToStr(frmMain.AtribNum)]].value)]);
    StatusBar1.Panels[4].Text :=
      format(fNFormat,[StrToFloat(Items.Root.Cells[fields.IndexByName['Fact']].value)]);
    end;
end;

{загружает все сохраненные нормы наряда и расставляет по гриду}
procedure TfrmNarVipRes.LoadSavedNorms;
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

        if AllNarNorms[tNum].fact[0] <> null then //!
          aNode.cells[ trGrdNar.fields.IndexByName['Fact'] ].Value
            := AllNarNorms[tNum].fact[0]*kf;
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
  SetLength(AllNarNorms[0].fact, IzmerElCount);
  AllNarNorms[0].key := qrAllSavedNorms.fieldbyname('key').asInteger;
  AllNarNorms[0].idoplife := qrAllSavedNorms.fieldbyname('id').asInteger;
  AllNarNorms[0].parent := qrAllSavedNorms.fieldbyname('parent').asInteger;
  AllNarNorms[0].numin := qrAllSavedNorms.fieldbyname('numin').asInteger;
  //AllNarNorms[0].fact := 0;
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
      //AllNarNorms[c].fact := qrAllSavedNorms.fieldbyname('fact').AsFloat;
      i := 0;
    end;
    AllNarNorms[c].norma[i] := qrAllSavedNorms.fieldbyname('norma').Value;
    AllNarNorms[c].fact[i] := qrAllSavedNorms.fieldbyname('fact').Value;
    qrAllSavedNorms.Next;
    inc(i);
  end;
  qrAllSavedNorms.Close;
  if length(AllNarNorms)=1 then exit;

  {раскладывем данные по гриду}
  tNum := 0;
  PutNormsToGrid(trGrdNar.Items.Root,tNum);
  AllNarNorms := nil;
end;

procedure TfrmNarVipRes.SetOperImgs(aNode: TGvTreeNode);
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

class procedure TfrmNarVipRes.OpenNar(aKeyNar,ares,aizmer: integer;
  const aCaption: string);
begin
  with TfrmNarVipRes.Create(Application) do
  begin
    keynar := aKeyNar;
    res := ares;
    izmer := aizmer;
    caption := acaption;
    ReloadTekNar(keynar, res, izmer);
  end;
end;

procedure TfrmNarVipRes.tbReloadNarClick(Sender: TObject);
begin
  ReloadTekNar(KeyNar,res,izmer);
end;

procedure TfrmNarVipRes.tbDelSelOpersClick(Sender: TObject);
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
    sql := 'delete from burnar.narvip where key=%s';
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

procedure TfrmNarVipRes.trGrdNarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then //клавиша Delete
    tbDelSelOpersClick(self);
end;

procedure TfrmNarVipRes.trGrdNarDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := sender is TOVNIDbTreeGrid{false};
end;

procedure TfrmNarVipRes.trGrdNarDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  acol,arow: integer;
  DestNode: TGvTreeNode;
begin
  if MoveOper <> nil then
    begin
      //получаем координаты ячейки, в которой бросили работу
      with trGrdNar do
      begin
        MouseToCell(X,Y, ACol,ARow);
        if (ARow < 0) or (VisRecs[ARow-fixedRows] = MoveOper) then
        begin
          MoveOper := nil;
          exit;
        end; //если бросили мимо элемента сетки или тот же узел, досрочный выход
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
      end; //end width
    end
  else
    begin
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
        sAddRab.ExecProc;//sAddRab.ParamByname('NarVipKey').Value; //возвращенный результат
        ReloadTekNar(KeyNar,res,izmer);//перечитываем текущий наряд с сервера
      finally
        WaitIndicator.Close;
      end;
    end;
end;

procedure TfrmNarVipRes.trGrdNarMouseDown(Sender: TObject;
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

procedure TfrmNarVipRes.tbReOrderRabClick(Sender: TObject);
begin
  WaitIndicator.Show;
  try
    with trGrdNar do
    begin
      sORDERNAR.ParamByname('aNarKey').value := keynar;
      sORDERNAR.ParamByname('ATIPNAR').value := 2; //выполнение
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


type
  tm = class(TCustomGrid)
  end;

end.
