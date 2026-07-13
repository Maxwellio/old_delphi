unit NarListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, Grids, OVNIGrids, FMTBcd, DB,ToolWin, ActnList, SqlExpr,
  ExtCtrls, ComCtrls,   
  OVNIDbControls, MainUnit, formSetDate,dialogs,IniFiles,
  OleCtnrs, Ora, MemDS, DBAccess, PgAccess;

{$I ProjectConst.INC}
{$I ProjectStr.INC}

type
  TfrmNarList = class(TForm)
    grdDefNarList: TOVNIDbGrid;
    ActionList1: TActionList;
    actFindWord: TAction;
    actAutoWidthCols: TAction;
    actDelNars: TAction;
    actCopyNar: TAction;
    actFirstRec: TAction;
    actPrevRec: TAction;
    actNextRec: TAction;
    actLastRec: TAction;
    actOpenNar: TAction;
    Image1: TImage;
    Image2: TImage;
    Label3: TLabel;
    Splitter1: TSplitter;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    asCopyToTest: TAction;
    TreeView1: TTreeView;
    CbxStruct: TComboBox;
    Label11: TLabel;
    Label1: TLabel;
    EdOwner: TEdit;
    EdMaster: TEdit;
    Label4: TLabel;
    EdCodNar: TEdit;
    Label5: TLabel;
    edSkv: TEdit;
    Label6: TLabel;
    edKust: TEdit;
    edMest: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    EdNameNar: TEdit;
    rgDate: TRadioGroup;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnOpenNar: TBitBtn;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    StatusBar1: TStatusBar;
    QryLoad: TPgQuery;
    qrDefNarList: TPgQuery;
    SQLQuery1: TPgQuery;
    CopyToTest: TPgStoredProc;
    spCopyNar: TPgStoredProc;
    //procedure FormCreate(Sender: TObject);
    procedure grdDefNarListTitleClick(FieldInd: Integer);
    procedure grdDefNarListDblClick(Sender: TObject);
    procedure grdDefNarListDeleteNars(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DeleteNars(Sender: TObject);
//    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOpenNarClick(Sender: TObject);
    procedure sBtnFirstRecClick(Sender: TObject);
    procedure SBtnLastRecClick(Sender: TObject);
    procedure sBtnPrevRecClick(Sender: TObject);
    procedure SBtnNextRecClick(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure CreateCopyNar(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure CbxItemsLoad_(var  Cbx_ : TComboBox; StrSQL_ :string);
    procedure LoadCBX;
    procedure WriteToFile(const FileName: string);
    procedure ReadFromFile(const FileName: string);
    procedure BitBtn1Click(Sender: TObject);
    procedure EdMasterChange(Sender: TObject);
    procedure EdOwnerChange(Sender: TObject);
    procedure EdNameNarChange(Sender: TObject);
    procedure EdCodNarChange(Sender: TObject);
    procedure edSkvChange(Sender: TObject);
    procedure edKustChange(Sender: TObject);
    procedure edMestChange(Sender: TObject);
    procedure TreeLoad;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdOwnerExit(Sender: TObject);
    procedure EdCodNarExit(Sender: TObject);
    procedure EdMasterExit(Sender: TObject);
    procedure EdNameNarExit(Sender: TObject);
    procedure edSkvExit(Sender: TObject);
    procedure edKustExit(Sender: TObject);
    procedure edMestExit(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgDateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CbxStructChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sSpeedButton5Click(Sender: TObject);



  private
    {!вызывается, когда дезигнер переводит форму в режим дизайна}
    procedure WMOnDsgnMode(var Message:TMessage); message WM_OnDsgnMode;
    {!вызывается при выходе из режима дизайна}
    procedure WMOffDsgnMode(var Message:TMessage); message WM_OffDsgnMode;


  public

  end;

var frmNarList: TfrmNarList;
    PathAndCfgFileName: string;
    DateNar_ : string;
    FlagFirst : boolean;
implementation

uses NarListParUnit;

{$R *.dfm}

procedure TfrmNarList.grdDefNarListTitleClick(FieldInd: Integer);
begin
  grdDefNarList.fields.Sort(FieldInd);
    If grdDefNarList.colwidths[1] > 30
    then grdDefNarList.colwidths[1] := 30
    else grdDefNarList.colwidths[1] := 31;
end;

procedure TfrmNarList.grdDefNarListDblClick(Sender: TObject);
begin
 if grdDefNarList.Recs.Count > 0
 then BtnOpenNarClick(self)
 else ShowMessage('Нет наряда для редактирования!');
end;

procedure TfrmNarList.grdDefNarListDeleteNars(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then //клавиша Delete
    DeleteNars(self);
      {копируем наряд (текущая запись)}
  If ((GetKeyState(VK_CONTROL) AND 128)=128) and
     ((GetKeyState(ord('C'))   AND 128)=128) then
  CreateCopyNar(Self);
end;

procedure TfrmNarList.DeleteNars(Sender: TObject);
var
  i: integer;
  Sql: String;
  AllOk: boolean;
begin
  if grdDefNarList.SelectedRecs.count = 0 then exit;
                                                         //будут удалены отмеченные наряды полностью, Вы уверены, что хотите продолжить?
  if Application.MessageBox(
    pchar(MsgSelNarToBeDelRu+' '+MsgQuestionPodtverdit),pchar(MsgAttentionRu),
    MB_OKCANCEL+MB_ICONEXCLAMATION) = IDCANCEL then exit;

 // WaitIndicator.Show; //сигналим начало длительной операции
  AllOk := true;
  grdDefNarList.Recs.BeginRebuildStruct;
  for i := 0 to grdDefNarList.SelectedRecs.count-1 do
  begin
    //если у нас есть закрытое задание удалять мы не можем:
    if grdDefNarList.SelectedRecs[i][grdDefNarList.Fields.IndexByName['ZadClose']].Img<>Image1.Picture.Bitmap then
    begin
    //формируем шаблон запроса на удаление
    sql := 'DO $$ begin ' +
           'delete from burnar.vipolnenie_period t where t.narkey=%s; '+
           'delete from burnar.zadanie_oper t where t.narkey=%s; '+
           'delete from burnar.vipolnenie_oper t where t.narkey=%s; '+
           'delete from burnar.defnar where key=%s; ' +
           'end $$ language ''plpgsql'';';

    //удаляем из базы
    sql := Format(sql,[
      grdDefNarList.SelectedRecs[i][grdDefNarList.Fields.IndexByName['CodNar']].Value,
      grdDefNarList.SelectedRecs[i][grdDefNarList.Fields.IndexByName['CodNar']].Value,
      grdDefNarList.SelectedRecs[i][grdDefNarList.Fields.IndexByName['CodNar']].Value,
      grdDefNarList.SelectedRecs[i][grdDefNarList.Fields.IndexByName['CodNar']].Value
      ]);
    try
      frmMain.MConnection.ExecSQL(SQL);
      //удаляем из памяти таблицы выделенную запись, если изменение в базе прошло благополучно
      grdDefNarList.SelectedRecs[i].Destroy; //разрушаем запись таблицы
      grdDefNarList.Recs.Remove( grdDefNarList.SelectedRecs[i] ); //убиваем указатель на бывший объект
      grdDefNarList.SelectedRecs[i] := nil; //обнуляем элемент списка выделенных(такое действие не сжимает сам список)
    except
      on E: Exception do
      begin
        AllOk := false;
        Application.MessageBox(pchar(E.Message),pchar(E.HelpContext),MB_OK+MB_ICONERROR);
      end;
    end;
    end ;
  end; //end for
  grdDefNarList.SelectedRecs.Pack;
  grdDefNarList.Recs.EndRebuildStruct;
  //WaitIndicator.Close;//сигналим окончание длительной операции
  if AllOk then //сигналим пользователю об удачной операции
    Application.MessageBox(Pchar(MsgChangeSavedRu),PChar(MsgAttentionRu),
    MB_OK+MB_ICONEXCLAMATION);
end;

procedure TfrmNarList.BtnOpenNarClick(Sender: TObject);
begin
  with grdDefNarList do
  begin
    if Recs.Count = 0 then exit;
    frmMain.keynar := strtoint( CurRec[Fields.IndexByName['CodNar']].Value );
    frmMain.nartype := strtoint( CurRec[Fields.IndexByName['NarType']].Value );
    frmMain.OWNERNAR := strtoint( CurRec[Fields.IndexByName['CodOwner']].Value );
    frmMain.NarCaption := CurRec[ Fields.IndexByName['NameNar'] ].Value;
    frmMain.OpenNar;
  end;
end;

procedure TfrmNarList.WMOffDsgnMode(var Message: TMessage);
begin
  Caption := 'Спиcок нарядов';
end;

procedure TfrmNarList.WMOnDsgnMode(var Message: TMessage);
begin
  Caption := '';
  grdDefNarList.Recs.Clear;
end;

procedure TfrmNarList.sSpeedButton2Click(Sender: TObject);
begin
  grdDefNarList.SetAutoWidthAllColumns;
end;

procedure TfrmNarList.sBtnFirstRecClick(Sender: TObject);
begin
  grdDefNarList.Row := grdDefNarList.FixedRows;
end;

procedure TfrmNarList.SBtnLastRecClick(Sender: TObject);
begin
  grdDefNarList.Row := grdDefNarList.RowCount-1;
end;

procedure TfrmNarList.sBtnPrevRecClick(Sender: TObject);
begin
  //if grdDefNarList.Row > grdDefNarList.FixedRows then
  grdDefNarList.Row := grdDefNarList.Row - 1;
end;

procedure TfrmNarList.SBtnNextRecClick(Sender: TObject);
begin
  //if grdDefNarList.Row < grdDefNarList.RowCount-1 then
  grdDefNarList.Row := grdDefNarList.Row + 1;
end;

procedure TfrmNarList.CreateCopyNar(Sender: TObject);
Var
   NewNarID : integer;
   str : string;
begin
  //if grdDefNarList.Recs.count = 0 then exit;
  with grdDefNarList do
  begin
    {создаем новый наряд на основе тематического раздела}
   // WaitIndicator.Show;
    try
     with TfrmSetBegDateOp.Create(Application) do
      begin
        CAption:='Дата начала работ в новом наряде:';
        DatePicker1.Date := now();
        if ShowModal = mrOk then
          begin
            spCopyNar.ParamByName('ANARKEY').Value := grdDefNarList.ByFieldName['CodNar'].Value;
            spCopyNar.ParamByName('AUSERNAME').Value := OraUser;

            str := datetostr(DatePicker1.date) + ' ' + timetostr(TimePicker1.time);

            spCopyNar.ParamByName('ABEGINOPERDATE').Value := str;

            DateNar_ := datetostr(DatePicker1.date);
            spCopyNar.ExecProc;
            NewNarID := spCopyNar.ParamByname('RESULT').Value;

            Application.MessageBox(Pchar(MsgNarCopyCreated + #10#13 + 'Код нового наряда - "' + inttostr(NewNarID)+ '"'),PChar(MsgAttentionRu),
            MB_OK+MB_ICONEXCLAMATION);
            BitBtn1.Click;
            EdCodNar.Text := inttostr(NewNarID);
            BitBtn2.Click;

        //grdDefNarList.Locate('CodNar',inttostr(NewNarID));
      end;
      end;
    finally
   //   WaitIndicator.Close;
    end;
  end;

  //BitBtn2.Click;
end;

procedure TfrmNarList.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  actAutoWidthCols.Enabled := grdDefNarList.Recs.Count > 0;
  actDelNars.Enabled := grdDefNarList.SelectedRecs.count > 0;
  actCopyNar.Enabled := (grdDefNarList.Recs.Count > 0) and (grdDefNarList.CurRec <> nil);
  actFirstRec.Enabled := grdDefNarList.Recs.Count > 0;
  actPrevRec.Enabled := grdDefNarList.Row > grdDefNarList.FixedRows;
  actNextRec.Enabled := grdDefNarList.Row < grdDefNarList.RowCount-1;
  actLastRec.Enabled := grdDefNarList.Recs.Count > 0;
end;

Procedure TfrmNarList.CbxItemsLoad_(var Cbx_ : TComboBox; StrSQL_ :string); //заполнение комбобоксов из базы =Мацола=
var
   str_ :string;
begin
  // --Заполнение комбобоксов Мацола
  qryLoad.Close;
  qryLoad.SQL.Text := StrSQL_;
   try
     qryLoad.Connection :=  frmMain.MConnection;
     qryLoad.Open;
     qryLoad.First;
     Cbx_.Clear;
     while not qryLoad.Eof
      do begin
         str_ := qryLoad.FieldByName('NM').AsString+'                    #'+qryLoad.FieldByName('ID').AsString;
         Cbx_.Items.Add(Str_);
         qryLoad.Next;
      end;
   qryLoad.close;
   except
   end; //try
end;



procedure TfrmNarList.BitBtn2Click(Sender: TObject);
var
  Str_,            //для временной сборки строки
  StrF_,           //для обработки комбобоксов
  Date_,            //для даты в строчном виде
  Mask_: string;    //маска даты 'yyyy'(год) или 'yyyy.mm'(месяц)
  i     : integer; //счетчик цикла
  Year,
  Month,
  Day : word;
begin
try
//  grdDefNarList.Recs.Clear;
  if TreeView1.Items.Count = 0
  then exit;
  Mask_ := '';
  Date_ := '';
  if TreeView1.SelectionCount <> 0
  then Date_ := trim(TreeView1.Selected.Text)
  else begin
    DecodeDate(now,Year,Month,Day);
    Date_ := intToStr(Year);
    Mask_ := 'yyyy';
  end;
  DateNar_ :=  Date_;

  if Length(date_) > 4  //подготовка маски по формату даты
  then Mask_ := 'yyyy.mm'
  else Mask_ := 'yyyy';

   str_ := ' select dfg.CodNar, ' +
           '        dfg.CodOwner, ' +
           '        dfg.NarType, ' +
           '        dfg.NameNar, ' +
           '        dfg.OwnerNar, ' +
           '        dfg.MasterNar, ' +
           '        dfg.ShifrNar, ' +
           '        dfg.ZadClose, ' +
           '        dfg.VipClose, ' +
           '        dfg.VipBegDate, ' +
           '        dfg.PerVip, ' +
           '        dfg.BegDate, ' +
           '        dfg.SKV::varchar as SKV, ' +
           '        dfg.Kust::varchar as Kust, ' +
           '        dfg.Mest::varchar as Mest, ' +
           '        dfg.DateCreate, ' +
           '        dfg.AutorNar' +
           ' from ' +
           ' (select distinct ' +
           '     d.key  CodNar ' +
           '     ,d.ownernar CodOwner ' +
           '     ,d.nartype nartype ' +
           '     ,d.nm  NameNAr ' +

          // '     ,(select ' +
          // '       ltrim(SYS_CONNECT_BY_PATH(  replace(o.nm,  '',''),  '',  ''),  '',  '')  nm ' +
          // '       from  org_stru  o  where  o.id=s.org  start  with  o.parent=0 ' +
          // '       connect  by  prior  o.id=o.parent)  OwnerNar ' +

           ' ,(WITH RECURSIVE TMP(id, parent, nm, path, level) AS ( ' +
           ' select o.id, o.parent, o.nm, cast(o.nm as varchar(100)) as path, 1 ' +
           ' from burnar.org_stru o where o.parent = 0 '+
           ' union all '+
           ' select o2.id, o2.parent, o2.nm, cast(tmp.path||'', ''||o2.nm as varchar(100)), level+1 ' +
           ' from burnar.org_stru o2 '+
           ' inner join tmp on(tmp.id=o2.parent)) '+
           ' select tmp.path from tmp where tmp.id=s.org ) as OwnerNar ' +

           '     ,burnar.getmasters(d.key)  MasterNar ' +
           '     ,d.shifr  ShifrNar ' +
           '     ,case  when    (select  z.closed  from burnar.defnarzad  z  where  d.key=z.narkey)=1  then  ''1'' ' +
           '            when    (select  z.closed  from burnar.defnarzad  z  where  d.key=z.narkey)=0  then  ''0'' ' +
           '     else  null  end  ZadClose ' +
           '     ,case  when    (select  z.closed  from burnar.defnarvip  z  where  d.key=z.narkey)=1  then  ''1'' ' +
           '            when    (select  z.closed  from burnar.defnarvip  z  where  d.key=z.narkey)=0  then  ''0'' ' +
           '     else  null  end  VipClose ' +
           '     ,burnar.GetAllPerVip(d.key) PerVip ' +
           '     ,to_char(dfp.begdate,''dd.mm.yyyy'')  VipBegDate ' +
           '     ,to_char(dfz.begdate,''dd.mm.yyyy'')  BegDate, ' +

{
           ' (select case when z.val is null then ' +
           '  case when z.valstr is null then ' +
           '          case when z.znval is null then null ' +
           '          else(select sp.nm from common_spr sp ' +
           '               where sp.id = z.znval) ' +
           '          end ' +
           '   else z.valstr ' +
           '   end ' +
           ' else z.val::varchar ' +
           ' end as Skv ' +
           ' from burnar.znparams z ' +
           ' where z.defnar = d.key ' +
           ' and z.parcode = 149) as skv, ' +
}

           ' (select CASE WHEN z.znval is null THEN ' +
           ' CASE WHEN z.val is null THEN z.valstr ' +
           ' ELSE z.val::varchar END ' +
           ' ELSE (select c.nm from public.common_spr c where c.id = z.znval) END as Skv ' +
           ' from burnar.znparams z ' +
           ' where z.defnar = d.key and z.parcode = 149) AS skv, ' +

{
           ' (select case when z.val is null then ' +
           '  case when z.valstr is null then ' +
           '          case when z.znval is null then null ' +
           '          else(select sp.nm from common_spr sp ' +
           '               where sp.id = z.znval) ' +
           '          end ' +
           '   else z.valstr ' +
           '   end ' +
           ' else z.val::varchar ' +
           ' end as kust ' +
           ' from burnar.znparams z ' +
           ' where z.defnar = d.key ' +
           ' and z.parcode = 470) as kust, ' +
}
           ' (select CASE WHEN z.znval is null THEN ' +
           ' CASE WHEN z.val is null THEN z.valstr ' +
           ' ELSE z.val::varchar END ' +
           ' ELSE (select c.nm from public.common_spr c where c.id = z.znval) END as Skv ' +
           ' from burnar.znparams z ' +
           ' where z.defnar = d.key and z.parcode = 470) AS kust, ' +

{
           ' (select case when z.val is null then ' +
           '  case when z.valstr is null then ' +
           '          case when z.znval is null then null ' +
           '          else(select sp.nm from common_spr sp ' +
           '               where sp.id = z.znval) ' +
           '          end ' +
           '   else z.valstr ' +
           '   end ' +
           ' else z.val::varchar ' +
           ' end as mest ' +
           ' from burnar.znparams z ' +
           ' where z.defnar = d.key ' +
           ' and z.parcode = 5) as mest, ' +
}

           ' (select CASE WHEN z.znval is null THEN ' +
           ' CASE WHEN z.val is null THEN z.valstr ' +
           ' ELSE z.val::varchar END ' +
           ' ELSE (select c.nm from public.common_spr c where c.id = z.znval) END as Skv ' +
           ' from burnar.znparams z ' +
           ' where z.defnar = d.key and z.parcode = 5) AS mest, ' +



           ' to_char(d.createdate,  ''dd.mm.yyyy'') as DateCreate ' +
           '     ,u.ora_name  AutorNar ' +
       //-from-добавление заголовков таблиц------------------------------------

           ' from burnar.people p, '+
           ' burnar.defnar  d left join burnar.defnarvip dfp on d.key=dfp.narkey '+
           ' left join burnar.people p1 on d.brigadir=p1.id '+
           ' left join burnar.defnarzad dfz on d.key=dfz.narkey '+
           ' left join burnar.vipolnenie_period vpd on d.key=vpd.narkey, '+
           ' burnar.spr_workers s left join burnar.org_stru o on s.org=o.id, '+
           ' burnar.users u left join (select  ds.org,k.idpeople from burnar.karjera k, burnar.doljtostruct ds '+
           ' where 1=1 and k.dtenter <= now() and  ds.key = k.doljinstru) userstru on u.people_id=userstru.idpeople';


        //-where ---------------------------------------------------------------
           Str_ := Str_ +
           ' where ' +
           '          d.nartype = 1 ' +//'' + ntype +''' ' +
           //'     and  d.key = dfp.narkey(+)  ' +
           '     and  d.ownernar=s.key ' +
           //'     and  d.brigadir=p1.id(+) ' +
           '     and  d.narauthor=u.users_id ' +
           //'     and  o.id(+)=s.org ' +
           //'     and  u.people_id=userstru.idpeople(+) ' +
           '     and  u.people_id=p.id ';
           //'     and  d.key  =  vpd.narkey(+) ' +
           //'     and  d.key =  dfz.narkey(+) ' ;
         if EdCodNar.Text = ''
         then
         Case  rgDate.ItemIndex of
         0 : begin //создание
              Str_ := Str_ +
              '     and to_char(d.createdate, '''+ Mask_ +''') = ''' + Date_ + ''''
              end; //0
         1 : begin //плановое начало бурения
              Str_ := Str_ +
             '     and  to_char(dfz.begdate,'''+ Mask_ +''')  =  '''+ Date_ +'''';
             end; //1
         2 : begin //Начало бурения
              Str_ := Str_ +
           '     and  to_char(dfp.begdate,'''+ Mask_ +''')  =  '''+ Date_ +''''

           // '  and  to_char(vpd.begoperdate,'''+ Mask_ +''')  =  '''+ Date_ +''''+
           //  '  and vpd.begoperdate = (select min(begoperdate) ' +
           //                            ' from burnar.vipolnenie_period ' +
           //                            ' where vpd.narkey = narkey) '  ;
             end; //2
         3 : begin  //Учетный периоды
              Str_ := Str_ +
            '     and  (to_char(vpd.outoperdate,'''+ Mask_ +''')  =  '''+ Date_ +''' or to_char(vpd.begoperdate,'''+ Mask_ +''')  =  '''+ Date_ +''') ';
             end; //3
         4 : begin  //Закрытие периода
              Str_ := Str_ +
              '     and  to_char(vpd.outoperdate,'''+ Mask_ +''')  =  '''+ Date_ +'''' +
              '     and  dfp.closed = 1' +
              '     and vpd.outoperdate = (select max(outoperdate) ' +
                                         ' from burnar.vipolnenie_period ' +
                                         ' where vpd.narkey = narkey) '  ;
             end; //4
         end;// case

                      //Обрезка по структуре
              if (pos('#',CbxStruct.Text) <> 0)
                 then begin
                   StrF_ := CbxStruct.Text;
                   StrF_ := copy(StrF_, pos('#',StrF_)+1,length(StrF_)-pos('#',StrF_));
                 //  Str_:= Str_ +
                 // ' and c.id = ' + StrF_ ;
                 // ' c.id = ' + StrF_ ;
                 strf_ := 'where tr.id='+strf_;
                end;


       Str_ := Str_ +

           '     and  userstru.org  in ' +
           //'     (select  c.id '+
           //'      from org_stru  c ' +
           //'      where 1=1 ' ;
             '( with recursive tr as ' +
             ' (select c.id from burnar.org_stru c ' +
             ' where c.id = (select distinct ds.org ' +
             ' from burnar.karjera k, burnar.doljtostruct ds, burnar.users u ' +
             ' where upper(u.ora_name) = '''+Uppercase(oraUser)+'''' +
             '       and k.idpeople = u.people_id ' +
             '       and k.dtenter <= current_date ' +
             '       and ds.key = k.doljinstru ' +
             '       ) ' +
             ' union all ' +
             ' select c.id ' +
             ' from burnar.org_stru c, tr ' +
             ' where c.sysboss=tr.id) ' +
             ' select tr.id from tr ' + strf_ + ')) dfg where 1=1';
           //----------------------------------------------------
           //Обрезка по структуре
{           if (pos('#',CbxStruct.Text) <> 0)
           then begin
               StrF_ := CbxStruct.Text;
               StrF_ := copy(StrF_, pos('#',StrF_)+1,length(StrF_)-pos('#',StrF_));
               Str_:= Str_ +
               ' and c.id = ' + StrF_ ;
           end;
 }
           //----------------------------------------------------
{           Str_:= Str_ +
           '         start  with  c.id= ' +
           '         ( ' +
           '         select  distinct ds.org ' +
           '           from  karjera  k, ' +
           '                 doljtostruct  ds, ' +
           '                 users  u ' +
           '           where  upper(u.ora_name)  = ''' + uppercase(oraUser) + ''' ' +
           '               and  k.idpeople  =  u.people_id ' +
           '               and  k.dtenter  <=  Sysdate ' +
        //   '               and  k.dtout  >=  Sysdate ' +
           '               and  ds.key  =  k.doljinstru ' +
           '         ) ' +
           '       connect  by  prior  c.id=c.sysboss)) dfg '+
           ' where 1=1 ';    }
           if EdOwner.Text <> ''
             then begin
             Str_ :=Str_ +
                    ' and Upper(dfg.OwnerNar) like Upper(''%' + EdOwner.Text + '%'')';
             end;
           if EdMaster.Text <> ''
             then begin
             Str_ :=Str_ +
                    ' and Upper(dfg.MasterNar) like Upper(''%' + EdMaster.Text + '%'')';
             end;
           if EdNameNar.Text <> ''
             then begin
             Str_ :=Str_ +
                    ' and Upper(dfg.NameNar) like Upper(''%' + EdNameNar.Text + '%'')';
             end;
           if  EdCodNar.Text <> ''
             then begin
             Str_ :=Str_ +
                    ' and Upper(dfg.CodNar::varchar) like Upper(''%' + EdCodNar.Text + '%'')';
             end;
           if  edSkv.Text <> ''
             then begin
             Str_ :=Str_ +
                    ' and Upper(dfg.Skv::varchar) like Upper(''%' + EdSkv.Text + '%'')';
             end;
           if  edKust.Text <> ''
             then begin
             Str_ :=Str_ +
                    ' and Upper(dfg.kust::varchar) like Upper(''%' + EdKust.Text + '%'')';
             end;
           if  EdMest.Text <> ''
             then begin
             Str_ :=Str_ +
                    ' and Upper(dfg.Mest::varchar) like Upper(''%' + EdMest.Text + '%'')';
              end;
           QryLoad.Close;
           QryLoad.SQL.Clear;
           QryLoad.SQL.Text := str_;
       //    Memo1.Text :=  str_;
           QryLoad.Open;
           QryLoad.First;

 if not QryLoad.IsEmpty
  then begin
    grdDefNarList.LoadDataset(QryLoad,['NarType','CodOwner','ShifrNar','BegDate','PerVip']);
    QryLoad.Close;
    grdDefNarList.Fields.SetDataTypes(['CodNar'], Number);
    grdDefNarList.Fields.SetDataTypes(['DateCreate'], Date);

    for i:=0 to grdDefNarList.RowCount-1-grdDefNarList.FixedRows do
       begin
         if  grdDefNarList.Recs.Count>0
            then begin
               if grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['ZadClose']].Value<>''
                 then
                 case StrToInt(grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['ZadClose']].Value) of
                    1: //закрыт
                    begin
                       grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['ZadClose']].Img:=Image1.Picture.Bitmap;
                       grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['ZadClose']]^.Value:= grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['BegDate']].Value;
                    end;
                    0: //открыт
                    begin
                       grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['ZadClose']].Img:=Image2.Picture.Bitmap;
                       grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['ZadClose']]^.Value:= grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['BegDate']].Value;
                    end;
                 end ; //case
               if grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['VipClose']].Value<>''
                 then
                 case StrToInt(grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['VipClose']].Value) of
                    1: //закрыт
                    begin
                       grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['VipClose']].Img:=Image1.Picture.Bitmap;
                       grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['VipClose']]^.Value:= grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['PerVip']].Value;
                    end;
                    0: //открыт
                    begin
                       grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['VipClose']].Img:=Image2.Picture.Bitmap;
                       grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['VipClose']]^.Value:= grdDefNarList.Recs[i].Items[grdDefNarList.Fields.IndexByName['PerVip']].Value;
                    end;
                  end;//case
            end;
           end; //for

      StatusBar1.Panels[0].Text := 'Всего запрошено с сервера записей: ' + IntToStr(grdDefNarList.Recs.Count);



//---------------------------------------------------
    // str_:=  grdDefNarList.Fields[0].Value;
    //  grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[0].Value, Number);
     // grdDefNarList.Fields.SetDataTypes(['CodNar'], Number);
     // grdDefNarList.Fields.SetDataTypes(['NameNar'], Str);
     // grdDefNarList.Fields.SetDataTypes(['OwnerNar'], Str);
     // grdDefNarList.Fields.SetDataTypes(['MasterNar'], Str);
     // grdDefNarList.Fields.SetDataTypes(['BegDate'], Date);
     // grdDefNarList.Fields.SetDataTypes(['VipBegDate'], Date);
     //  grdDefNarList.Fields.SetDataTypes(['ZadClose'], Date);
     // grdDefNarList.Fields.SetDataTypes(['VipClose'], Str);
    //  grdDefNarList.Fields.SetDataTypes(['Skv'], Str);
    //  grdDefNarList.Fields.SetDataTypes(['Kust'], Str);
    //  grdDefNarList.Fields.SetDataTypes(['Mest'], Str);
    //  grdDefNarList.Fields.SetDataTypes(['AutorNar'], Str);
    //  grdDefNarList.Fields.SetDataTypes(['DateCreate'], Date);

     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[ 0].Value, Number);      // 'Код';            //   1
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[ 1].Value, Str);         // '1';              // *
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[ 2].Value, Str);         // '2';              // *
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[ 3].Value, Str);        //  'Наименование';   //   2
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[ 4].Value, Str);        //  'Бригада';        //   3
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[ 5].Value, Str);        //  'Мастер';         //   4
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[ 6].Value, Str);        //  '6';              // *
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[ 7].Value, Date);        //  'План.Нач.Бур.'; //  5
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[ 8].Value, Str);       //   'Учетные периоды'; //  6
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[ 9].Value, Date);       //   'Нач.Бур.';        //
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[10].Value, Str);       //   '10';              //*
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[11].Value, Str);       //   '11';              //
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[12].Value, Str);       //   'Скв.';            //  7
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[13].Value, Str);       //   'Куст';            //  8
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[14].Value, Str);      //   'Мест.';           //  9
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[15].Value, Date);      //   'Создан';          //  10
     grdDefNarList.Fields.SetDataTypes(grdDefNarList.Fields[16].Value, Str);      //   'Автор';            // 11

      //dfg.CodNar,
      //dfg.CodOwner,
      //dfg.NarType,
      //dfg.NameNar,
      //dfg.OwnerNar,
      //dfg.MasterNar,
      //dfg.ShifrNar,
      //dfg.ZadClose,
      //dfg.VipClose,
      //dfg.VipBegDate,
      //dfg.PerVip,
      //dfg.BegDate,
      //dfg.SKV,
      //dfg.Kust,
      //dfg.Mest,
      //dfg.DateCreate,
      //dfg.AutorNar










      //обзываем по человечески
      grdDefNarList.Fields[0].Title  := 'Код';            //   1       dfg.CodNar
      grdDefNarList.Fields[1].Title  := '1';              // *         dfg.CodOwner
      grdDefNarList.Fields[2].Title  := '2';              // *         dfg.NarType
      grdDefNarList.Fields[3].Title  := 'Наименование';   //   2       dfg.NameNar
      grdDefNarList.Fields[4].Title  := 'Бригада';        //   3       dfg.OwnerNar
      grdDefNarList.Fields[5].Title  := 'Мастер';         //   4       dfg.MasterNar
      grdDefNarList.Fields[6].Title  := '6';              // *         dfg.ShifrNar
      grdDefNarList.Fields[7].Title  := 'План.Нач.Бур.'; //  5        dfg.ZadClose
      grdDefNarList.Fields[8].Title  := 'Учетные периоды'; //  6       dfg.VipClose
      grdDefNarList.Fields[9].Title  := 'Нач.Бур.';        //       *  dfg.VipBegDate
      grdDefNarList.Fields[10].Title := '10';              //*         dfg.PerVip
      grdDefNarList.Fields[11].Title := '11';              //          dfg.BegDate
      grdDefNarList.Fields[12].Title := 'Скв.';            //  7       dfg.SKV
      grdDefNarList.Fields[13].Title := 'Куст';            //  8       dfg.Kust
      grdDefNarList.Fields[14].Title := 'Мест.';           //  9       dfg.Mest
      grdDefNarList.Fields[15].Title := 'Создан';          //  10      dfg.DateCreate
      grdDefNarList.Fields[16].Title := 'Автор';            // 11      dfg.AutorNar

      grdDefNarList.SetAutoWidthAllColumns;
      //задаем жесткий размер грида
      grdDefNarList.colwidths[0]  := 15;
      grdDefNarList.colwidths[1]  := 50;   //код
      grdDefNarList.colwidths[2]  := 160;   //Наименование
      grdDefNarList.colwidths[3]  := 160;   //Бригада
      grdDefNarList.colwidths[4]  := 85;   //Мастер
      grdDefNarList.colwidths[5]  := 85;   //План.Нач.Осв.
      grdDefNarList.colwidths[6]  := 138;   //Уч.Периоды
      grdDefNarList.colwidths[7]  := 75;   //Нач. осв.
      grdDefNarList.colwidths[8]  := 60;   //Скв
      grdDefNarList.colwidths[9]  := 50;   //Куст
      grdDefNarList.colwidths[10] := 130;   //Мест
      grdDefNarList.colwidths[11] := 60;  //Создан
      grdDefNarList.colwidths[12] := 140;  //Создан
      BtnOpenNar.Enabled := true;
  end
 else begin
      grdDefNarList.Recs.Clear;
      ShowMessage('Нет подходящих нарядов для установленных параметров!'+#10#13+'Проверьте установленный месяц!');
      QryLoad.Close;
      BtnOpenNar.Enabled := false;
 end;     //if
except
  on e :exception do ShowMessage('Ошибка загрузки данных!'+ #10#13 + e.Message  );
end; //try
//Shape1.Brush.Color := clGreen;
end;

procedure TfrmNarList.sSpeedButton4Click(Sender: TObject);
begin
  with grdDefNarList do
  begin
      CopyToTest.ParamByname('nkey').Value := grdDefNarList.ByFieldName['CodNar'].Value;
      CopyToTest.ExecProc;
  end;
end;

procedure TfrmNarList.TreeLoad;
var
  str_,
  str1_,
  StrF_ : string;
  i,
  j : integer;
  Year,Month,Day : word;
  Flag_ : boolean;
begin
  //  Даты для заполнения дерева
      str_ := '';
      TreeView1.Items.clear;
      TreeView1.Enabled := false;
//-----------------------------------
      case  rgDate.ItemIndex of
       0 : begin //создание

              //Обрезка по структуре
              if (pos('#',CbxStruct.Text) <> 0)
                 then begin
                   StrF_ := CbxStruct.Text;
                   StrF_ := copy(StrF_, pos('#',StrF_)+1,length(StrF_)-pos('#',StrF_));
                 //  Str_:= Str_ +
                 // ' and c.id = ' + StrF_ ;
                 // ' c.id = ' + StrF_ ;
                 strf_ := 'where tr.id='+strf_;
                end;

              str_ := str_ +
              ' select  distinct ' +
              '      to_char(d.createdate,    ''yyyy.mm'')  Date_ ' +
              '      from  burnar.defnar    d, ' +
              '      burnar.spr_workers    s left join  ' +
              '      burnar.org_stru    o on s.org=o.id, ' +
              '      burnar.people    p, ' +
              '      burnar.users    u left join  ' +
              '      ( ' +
              '          select    ds.org,k.idpeople ' +
              '          from  burnar.karjera    k, ' +
              '                burnar.doljtostruct    ds ' +
              '          where 1=1 ' +
              '                and  k.dtenter    <=    current_date ' +
              '                  and    ds.key    =    k.doljinstru ' +
              '    )    userstru on u.people_id=userstru.idpeople' +
              '  where ' +
              '  d.ownernar=s.key ' +
              '  and    d.narauthor=u.users_id ' +
              '  and    u.people_id=p.id ' +
              '  and    userstru.org    in ' +

             '( with recursive tr as ' +
             ' (select c.id from burnar.org_stru c ' +
             ' where c.id = (select distinct ds.org ' +
             ' from burnar.karjera k, burnar.doljtostruct ds, burnar.users u ' +
             ' where upper(u.ora_name) = '''+Uppercase(oraUser)+'''' +
             '       and k.idpeople = u.people_id ' +
             '       and k.dtenter <= current_date ' +
             '       and ds.key = k.doljinstru ' +
             '       ) ' +
             ' union all ' +
             ' select c.id ' +
             ' from burnar.org_stru c, tr ' +
             ' where c.sysboss=tr.id) ' +
             ' select tr.id from tr ' + strf_ + ')';
           end;
       1 : begin  //плановое начало освоения
              //Обрезка по структуре
              if (pos('#',CbxStruct.Text) <> 0)
                 then begin
                   StrF_ := CbxStruct.Text;
                   StrF_ := copy(StrF_, pos('#',StrF_)+1,length(StrF_)-pos('#',StrF_));
                 //  Str_:= Str_ +
                 // ' and c.id = ' + StrF_ ;
                 // ' c.id = ' + StrF_ ;
                 strf_ := 'where tr.id='+strf_;
                end;

              str_ := str_ +
              ' select  distinct ' +
              '      to_char(dfz.begdate,    ''yyyy.mm'')  Date_ ' +

              '      from  burnar.defnar    d left join burnar.defnarzad dfz on d.key =  dfz.narkey, ' +
              '      burnar.spr_workers    s left join  ' +
              '      burnar.org_stru    o on s.org=o.id, ' +
              '      burnar.people    p, ' +
              '      burnar.users    u left join  ' +
              '      ( ' +
              '          select    ds.org,k.idpeople ' +
              '          from  burnar.karjera    k, ' +
              '                burnar.doljtostruct    ds ' +
              '          where 1=1 ' +
              '                and  k.dtenter    <=    current_date ' +
              '                  and    ds.key    =    k.doljinstru ' +
              '    )    userstru on u.people_id=userstru.idpeople' +
              '  where ' +
              '  d.ownernar=s.key ' +
              '  and    d.narauthor=u.users_id ' +
              '  and    u.people_id=p.id ' +
              '  and    userstru.org    in ' +

             '( with recursive tr as ' +
             ' (select c.id from burnar.org_stru c ' +
             ' where c.id = (select distinct ds.org ' +
             ' from burnar.karjera k, burnar.doljtostruct ds, burnar.users u ' +
             ' where upper(u.ora_name) = '''+Uppercase(oraUser)+'''' +
             '       and k.idpeople = u.people_id ' +
             '       and k.dtenter <= current_date ' +
             '       and ds.key = k.doljinstru ' +
             '       ) ' +
             ' union all ' +
             ' select c.id ' +
             ' from burnar.org_stru c, tr ' +
             ' where c.sysboss=tr.id) ' +
             ' select tr.id from tr ' + strf_ + ')';
           end;
       2 : begin //начало освоения
              //Обрезка по структуре
              if (pos('#',CbxStruct.Text) <> 0)
                 then begin
                   StrF_ := CbxStruct.Text;
                   StrF_ := copy(StrF_, pos('#',StrF_)+1,length(StrF_)-pos('#',StrF_));
                   strf_ := 'where tr.id='+strf_;
                end;

              str_ := str_ +
              ' select  distinct ' +
              '      to_char(osvp.begoperdate,    ''yyyy.mm'')  Date_ ' +
              '      from  burnar.defnar    d, burnar.vipolnenie_period osvp,' +
              '      burnar.spr_workers    s left join  ' +
              '      burnar.org_stru    o on s.org=o.id, ' +
              '      burnar.people    p, ' +
              '      burnar.users    u left join  ' +
              '      ( ' +
              '          select    ds.org,k.idpeople ' +
              '          from  burnar.karjera    k, ' +
              '                burnar.doljtostruct    ds ' +
              '          where 1=1 ' +
              '                and  k.dtenter    <=    current_date ' +
              '                  and    ds.key    =    k.doljinstru ' +
              '    )    userstru on u.people_id=userstru.idpeople' +
              '  where ' +
              '  d.ownernar=s.key ' +
              '  and    d.narauthor=u.users_id ' +
              '  and osvp.begoperdate = (select min(begoperdate) ' +
                                       ' from burnar.vipolnenie_period ' +
                                       ' where osvp.narkey = narkey) '  +
              '  and    osvp.narkey = d.key'   +
              '  and    u.people_id=p.id ' +
              '  and    userstru.org    in ' +

             '( with recursive tr as ' +
             ' (select c.id from burnar.org_stru c ' +
             ' where c.id = (select distinct ds.org ' +
             ' from burnar.karjera k, burnar.doljtostruct ds, burnar.users u ' +
             ' where upper(u.ora_name) = '''+Uppercase(oraUser)+'''' +
             '       and k.idpeople = u.people_id ' +
             '       and k.dtenter <= current_date ' +
             '       and ds.key = k.doljinstru ' +
             '       ) ' +
             ' union all ' +
             ' select c.id ' +
             ' from burnar.org_stru c, tr ' +
             ' where c.sysboss=tr.id) ' +
             ' select tr.id from tr ' + strf_ + ')';
           end;
       3 : begin  //учетные периоды
              //Обрезка по структуре
              if (pos('#',CbxStruct.Text) <> 0)
                 then begin
                   StrF_ := CbxStruct.Text;
                   StrF_ := copy(StrF_, pos('#',StrF_)+1,length(StrF_)-pos('#',StrF_));
                   strf_ := 'where tr.id='+strf_;
                end;
       
              str_ := str_ +
              ' select  distinct ' +
              '      dsvp.date_ ' +
              '      from  burnar.defnar    d, ' +
              '      burnar.spr_workers    s left join  ' +
              '      burnar.org_stru    o on s.org=o.id, ' +
              '      burnar.people    p, ' +
              '      (select  distinct  to_char(osvp.begoperdate,''yyyy.mm'')  date_  ' +
              '      ,  osvp.narkey              ' +
              '      from  burnar.vipolnenie_period osvp'+
              '      Union '+
              '      select  distinct  to_char(osvp.outoperdate,''yyyy.mm'')  date_ ' +
              '      ,  osvp.narkey ' +
              '      from  burnar.vipolnenie_period osvp) dsvp,' +
              '      burnar.users    u left join  ' +
              '      ( ' +
              '          select    ds.org,k.idpeople ' +
              '          from  burnar.karjera    k, ' +
              '                burnar.doljtostruct    ds ' +
              '          where 1=1 ' +
              '                and  k.dtenter    <=    current_date ' +
              '                  and    ds.key    =    k.doljinstru ' +
              '    )    userstru on u.people_id=userstru.idpeople' +
              '  where ' +
              '  d.ownernar=s.key ' +
              '  and    d.narauthor=u.users_id ' +
              '  and    u.people_id=p.id ' +
              '  and    dsvp.narkey = d.key ' +
              '  and    userstru.org    in ' +

             '( with recursive tr as ' +
             ' (select c.id from burnar.org_stru c ' +
             ' where c.id = (select distinct ds.org ' +
             ' from burnar.karjera k, burnar.doljtostruct ds, burnar.users u ' +
             ' where upper(u.ora_name) = '''+Uppercase(oraUser)+'''' +
             '       and k.idpeople = u.people_id ' +
             '       and k.dtenter <= current_date ' +
             '       and ds.key = k.doljinstru ' +
             '       ) ' +
             ' union all ' +
             ' select c.id ' +
             ' from burnar.org_stru c, tr ' +
             ' where c.sysboss=tr.id) ' +
             ' select tr.id from tr ' + strf_ + ')';
           end;
       4 : begin  //закрытие
              //Обрезка по структуре
              if (pos('#',CbxStruct.Text) <> 0)
                 then begin
                   StrF_ := CbxStruct.Text;
                   StrF_ := copy(StrF_, pos('#',StrF_)+1,length(StrF_)-pos('#',StrF_));
                   strf_ := 'where tr.id='+strf_;
                end;
       
              str_ := str_ +
              ' select  distinct to_char(vp.outoperdate,''yyyy.mm'') date_ ' +
              '      from  burnar.defnar    d, ' +
              '      burnar.spr_workers    s left join  ' +
              '      burnar.org_stru    o on s.org=o.id, ' +
              '      burnar.people    p, ' +
              '      burnar.defnarvip dv, ' +
              '      burnar.vipolnenie_period vp, ' +
              '      burnar.users    u left join  ' +
              '      ( ' +
              '          select    ds.org,k.idpeople ' +
              '          from  burnar.karjera    k, ' +
              '                burnar.doljtostruct    ds ' +
              '          where 1=1 ' +
              '                and  k.dtenter    <=    current_date ' +
              '                  and    ds.key    =    k.doljinstru ' +
              '    )    userstru on u.people_id=userstru.idpeople' +
              '  where ' +
              '  d.ownernar=s.key ' +
              '  and    d.narauthor=u.users_id ' +
              '  and    u.people_id=p.id ' +
              '  and    dv.narkey = d.key'  +
              '  and    d.key = vp.narkey ' +
              '  and  vp.outoperdate = (select max(outoperdate) ' +
                                       ' from burnar.vipolnenie_period ' +
                                       ' where vp.narkey = narkey) '  +
              '  and  dv.closed = 1' +
              '  and    userstru.org    in ' +

             '( with recursive tr as ' +
             ' (select c.id from burnar.org_stru c ' +
             ' where c.id = (select distinct ds.org ' +
             ' from burnar.karjera k, burnar.doljtostruct ds, burnar.users u ' +
             ' where upper(u.ora_name) = '''+Uppercase(oraUser)+'''' +
             '       and k.idpeople = u.people_id ' +
             '       and k.dtenter <= current_date ' +
             '       and ds.key = k.doljinstru ' +
             '       ) ' +
             ' union all ' +
             ' select c.id ' +
             ' from burnar.org_stru c, tr ' +
             ' where c.sysboss=tr.id) ' +
             ' select tr.id from tr ' + strf_ + ')';

           end;
      end;//case

      if str_ <> ''
      then begin
         str_ := str_ + ' Order  by  date_ ';
         qryLoad.Close;
         qryLoad.SQL.Text := Str_;
       //  memo1.text := str_;
         try
            qryLoad.Open;
         except
         end; //try
         if not qryLoad.IsEmpty
            then begin
               qryLoad.First;
               str_ := qryLoad.FieldByName('date_').AsString;
               str_ := copy(str_,1,4);
               TreeView1.Items.add(nil,str_);
               i := 0;
               j := 0;
               while not qryLoad.Eof
               do begin
                  str1_ := qryLoad.FieldByName('date_').AsString;
                  str1_ := copy(str1_,1,4);
                  if (trim(str_)<>'') and (trim(str1_) <> '')
                  then
                     if  (str_ = str1_)
                     then TreeView1.Items.AddChild(TreeView1.items[j],qryLoad.FieldByName('date_').AsString)
                     else begin
                          i :=i+1;
                          j := i;
                          TreeView1.Items.add(nil,str1_);
                          TreeView1.Items.AddChild(TreeView1.items[j],qryLoad.FieldByName('date_').AsString);
                     end;
                     i:=i+1;
                     str_ := qryLoad.FieldByName('date_').AsString;
                     str_ := copy(str_,1,4);
                     qryLoad.Next;
               end;
               qryLoad.Close;
               flag_ := false;
               if TreeView1.Items.Count > 0
               then begin
                    TreeView1.Enabled := true;
                    DecodeDate(now,Year,Month,Day);
                    Str_ := IntToStr(Year);
                    Str1_ := IntToStr(Month);
                    if Length(Str1_) = 1
                    then Str1_ := '0' + Str1_;
                    Str1_ := IntToStr(Year) + '.' + Str1_;
                    for i := 0 to  TreeView1.Items.Count -1
                    do begin
                        if TreeView1.Items[i].Text =  DateNar_ //выбранная дата
                        then begin
                             TreeView1.Items[i].Selected := true;
                             flag_ := true;
                        end;
                    end;
                    if not flag_
                    then begin
                        for i := 0 to  TreeView1.Items.Count -1
                        do begin
                            if (TreeView1.Items[i].Text = str1_)  //текущий месяц
                            then begin
                                 TreeView1.Items[i].Selected := true;
                                 flag_ := true;
                            end;
                        end;
                    end;
                    if not flag_
                    then begin
                         TreeView1.Items[TreeView1.Items.Count -1].Selected  := true;
                    end;
               end
               else TreeView1.Items.Clear;

          end
          else TreeView1.Items.Clear;
      end;

end;

procedure TfrmNarList.LoadCBX;
var
  str_ : string;
begin
  //Мацола --Заполнение комбобоксов
  //структуры
  str_ := ' select  id, ' +
          '         parent, ' +
          '         nm, ' +
          '         fullnm, ' +
          '         sysboss, ' +
          '         rep_nm ' +
          ' from burnar.org_stru ' +
          ' where id in (4,5,6,7,8)' +
          ' order by nm ';

  qryLoad.Close;
  qryLoad.SQL.Text := Str_;
  try
     qryLoad.Connection :=  frmMain.MConnection;
     qryLoad.Open;
     qryLoad.First;
     CbxStruct.Clear;
     while not qryLoad.Eof
      do begin
         str_ := qryLoad.FieldByName('NM').AsString +
                '                                              #' +
                 qryLoad.FieldByName('ID').AsString;
         CbxStruct.Items.Add(Str_);
         qryLoad.Next;
      end;
      qryLoad.Close;
      CbxStruct.Items.Add('Все');
   except
   end; //try
end;


//запись параметров формы
procedure TfrmNarList.WriteToFile(const FileName: string);
var
  AppIni: TIniFile;
  Str_: string;
begin
  AppIni := TIniFile.Create( PathAndCfgFileName );
  try
    AppIni.WriteString('NarList', 'TreeDate', Str_);
  finally
    AppIni.free;
  end;
end;

procedure TfrmNarList.ReadFromFile(const FileName: string);
var
  AppIni: TIniFile;
  Str_: string;
begin
  {читаем путь к файлу настроек программы}
  PathAndCfgFileName := ChangeFileExt(GetCurrentDir+'\'+
  ExtractFileName(Application.ExeName), '.'+IniFileStr);
  {считываем настройки}
  AppIni := TIniFile.Create( PathAndCfgFileName );
  try
    Str_ := AppIni.ReadString('NarList', 'TreeDate', '');
  finally
    AppIni.free;
  end;
end;

procedure TfrmNarList.BitBtn1Click(Sender: TObject);
begin
  //отмена выбора даты в дереве
  if TreeView1.SelectionCount <> 0
  then TreeView1.Selected.Selected := false;
  EdOwner.text := '';
  EdMaster.text := '';
  EdCodNar.text := '';
  edSkv.text := '';
  edKust.text := '';
  edMest.text := '';
  BitBtn2.Click;
end;

procedure TfrmNarList.EdMasterChange(Sender: TObject);
begin
 if EdMaster.Text <> ''
 then EdMaster.Color := clInfoBk
 else EdMaster.Color := clWindow;
end;

procedure TfrmNarList.EdOwnerChange(Sender: TObject);
begin
 if EdOwner.Text <> ''
 then EdOwner.Color := clInfoBk
 else EdOwner.Color := clWindow;
end;

procedure TfrmNarList.EdNameNarChange(Sender: TObject);
begin
 if EdNameNar.Text <> ''
 then EdNameNar.Color := clInfoBk
 else EdNameNar.Color := clWindow;
end;


procedure TfrmNarList.EdCodNarChange(Sender: TObject);
begin
 if EdCodNar.Text <> ''
 then EdCodNar.Color := clInfoBk
 else EdCodNar.Color := clWindow;
 if EdCodNar.Text <> ''
 then begin
    rgDate.Enabled := false;
    TreeView1.Enabled := false;
 end
 else begin
    rgDate.Enabled := true;
    TreeView1.Enabled := true;
 end;
end;

procedure TfrmNarList.edSkvChange(Sender: TObject);
begin
 if EdSkv.Text <> ''
 then EdSkv.Color := clInfoBk
 else EdSkv.Color := clWindow;
end;

procedure TfrmNarList.edKustChange(Sender: TObject);
begin
 if edKust.Text <> ''
 then edKust.Color := clInfoBk
 else edKust.Color := clWindow;
end;

procedure TfrmNarList.edMestChange(Sender: TObject);
begin
 if edMest.Text <> ''
 then edMest.Color := clInfoBk
 else edMest.Color := clWindow;
end;

procedure TfrmNarList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //BitBtn1.Click;
  frmNarList := nil;
  Action := caFree;
end;

function RusToEng(Str_: string): string;
//меняет английские символы на русские
Const
  eng_ : string = 'qwertyuiop[]asdfghjkl;''\zxcvbnm,./';
  rus_ : string = 'йцукенгшщзхъфывапролджэ\ячсмитьбю.';
var
  tmp_ : string;
  i    : integer;
begin
   if Str_ <> ''
     then begin
         Tmp_ := Str_;
         for i := 0 to length(Str_)
         do begin
          if  pos(Str_[i],eng_) > 0
            then Tmp_[i] := rus_[pos(Str_[i],eng_)];
         end;
         result := tmp_;
     end;
end;


procedure TfrmNarList.EdOwnerExit(Sender: TObject);
begin
   EdOwner.Text := RusToEng(EdOwner.Text);
end;

procedure TfrmNarList.EdCodNarExit(Sender: TObject);
begin
   EdCodNar.Text := RusToEng(EdCodNar.Text)
end;

procedure TfrmNarList.EdMasterExit(Sender: TObject);
begin
   EdMaster.Text := RusToEng(EdMaster.Text)
end;

procedure TfrmNarList.EdNameNarExit(Sender: TObject);
begin
   EdNameNar.Text := RusToEng(EdNameNar.Text)
end;

procedure TfrmNarList.edSkvExit(Sender: TObject);
begin
   edSkv.Text := RusToEng(edSkv.Text)
end;

procedure TfrmNarList.edKustExit(Sender: TObject);
begin
   edKust.Text := RusToEng(edKust.Text)
end;

procedure TfrmNarList.edMestExit(Sender: TObject);
begin
    edMest.Text := RusToEng(edKust.Text)
end;

procedure TfrmNarList.TreeView1Click(Sender: TObject);
begin
   if TreeView1.Items.Count > 0
    then TreeView1.Color := clInfoBk
    else TreeView1.Color := clWindow;
  BitBtn2.Click;
end;



procedure TfrmNarList.TreeView1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
BitBtn2.Click;
end;

procedure TfrmNarList.rgDateClick(Sender: TObject);
begin
 if rgDate.ItemIndex <> -1
     then rgDate.Color := clInfoBk
     else rgDate.Color := clWindow;
  TreeLoad;
  BitBtn2.Click;
end;

procedure TfrmNarList.FormCreate(Sender: TObject);
var
flag : boolean;
begin
  DateNar_ := '';
  flag := false;
 // FlagFirst_ := true;
  //-проверка на базу
  if uppercase(database) = uppercase('testdb') then flag := true;

  //-проверка на узера
  if not flag then
  if uppercase(OraUser) = uppercase('burnar_role') then flag := true;
  if uppercase(OraUser) = uppercase('ievc') then flag := true;
   // if uppercase(OraUser) = uppercase('Matsola_AP')   then flag := true;
   // if uppercase(OraUser) = uppercase('Shestakov_DA') then flag := true;
   // if uppercase(OraUser) = uppercase('Deryabina_OV') then flag := true;
   // if uppercase(OraUser) = uppercase('Frolov_AA')    then flag := true;

//    ToolButton3.Visible:=flag; пока убираем кнопку копирования на тестовую БД
    CbxStruct.Enabled := flag;

    LoadCBX;
    if flag then CbxStruct.Text := 'Все';
    rgDate.ItemIndex := 0;
    FlagFirst := true;
  // TreeLoad;
  //  BitBtn2.Click;
end;

procedure TfrmNarList.CbxStructChange(Sender: TObject);
begin
 TreeLoad;
 BitBtn2.Click;
end;

procedure TfrmNarList.BitBtn3Click(Sender: TObject);
begin
  with grdDefNarList do
  begin
    if Recs.Count = 0 then exit;
    frmMain.keynar := strtoint( CurRec[Fields.IndexByName['CodNar']].Value );
    frmMain.nartype := strtoint( CurRec[Fields.IndexByName['NarType']].Value );
    frmMain.OWNERNAR := strtoint( CurRec[Fields.IndexByName['CodOwner']].Value );
    frmMain.NarCaption := CurRec[ Fields.IndexByName['NameNar'] ].Value;
    frmMain.OpenNar;
  end;
end;

procedure TfrmNarList.FormShow(Sender: TObject);
begin
   if FlagFirst
   then begin
      FlagFirst := false;
      EdCodNar.SetFocus;
   end;
end;

procedure TfrmNarList.sSpeedButton5Click(Sender: TObject);
var
  NarID : string;
begin
  NarID := grdDefNarList.ByFieldName['CodNar'].Value;
  BitBtn2Click(sender);
  grdDefNarList.Locate('CodNar',NarID);
end;

end.

