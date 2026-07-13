unit formUsersDoljn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGrids, ExtCtrls, ComCtrls, Grids, OVNIGrids, OVNIDbControls,
  FMTBcd, DB, SqlExpr, Buttons, DBCtrls, Provider, DBClient,
  DBXpress, StdCtrls, Mask, ToolWin, ComObj, ora, MemDS, DBAccess, PgAccess, Excel_TLB;

  {$I ProjectConst.INC}
{$I ProjectStr.INC}
type
  TfrmUsersDoljn = class(TForm)
    grUsers: TOVNIDbGrid;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    grKareraList: TOVNIDbGrid;
    sDateEdit1: TDateTimePicker;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Panel4: TPanel;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    GroupBox1: TGroupBox;
    DataSourcePodr: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    ClientDataSetPodr: TClientDataSet;
    DataSetProviderPodr: TDataSetProvider;
    ToolButton6: TToolButton;
    EditFind: TEdit;
    SpeedButton8: TSpeedButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    chkPeople: TCheckBox;
    chkUser: TCheckBox;
    Label1: TLabel;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    btnPrintToExcel: TToolButton;
    qrPodr: TPgQuery;
    qrUserList: TPgQuery;
    qrDoljSpr: TPgQuery;
    qrKarera: TPgQuery;
    SPEOPLE_ADD: TPgStoredProc;
    SKARJERA_ADD: TPgStoredProc;
    qrPrintUser: TPgQuery;
    qrOrgNM: TPgQuery;
    SaveDialog1: TSaveDialog;
    qrStruct: TPgQuery;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel1Resize(Sender: TObject);
    procedure grUsersSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sDateEdit1Exit(Sender: TObject);
    procedure sSpeedButton9Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    //потеря фокуса с комбобокса
    procedure cbSprValuesExit(Sender: TObject);
    //получение фокуса комбобобсом
    procedure cbSprValuesEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure grUsersTitleClick(FieldInd: Integer);
    procedure SpeedButton8Click(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure LoadPeople;
    procedure LoadCbxFrmUsersDoljn(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure grUsersDblClick(Sender: TObject);
    procedure grKareraListClick(Sender: TObject);
    procedure chkPeopleClick(Sender: TObject);
    procedure chkUserClick(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure btnPrintToExcelClick(Sender: TObject);
    procedure LoadPeriod;
    procedure ToolButton14Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    oldDate : string;
    EditRow : integer;
    nameField : string;
    KeynameField : string;
    statStr :  string;
    cbSprValues: TOvniComboBox;
    SprValueBefore : string;
    flag : boolean; //Флаг для редактирования пользователей
    GridFont : TFont;
  end;

const strUser = 'select distinct p.id ' +
                '       ,p.fio ' +
                '       ,p.fioreports ' +
                '       ,p.tabn ' +
                '       ,u.users_id ' +
                '       ,u.ora_name ' +
                //'       ,r.role_id ' +
                //'       ,r.nm role_nm ' +
                //'       ,p.telefon ' +
                '       ,case when u.active = 0 then ' +
                '               ''Отключен'' ' +
                '             when u.active = 1 then ' +
                '               ''Подключен'' ' +
                '        end as account_status ' +
                '       ,to_char(u.dtenter, ''dd.mm.yyyy'') dtenter ' +
                '       ,to_char(u.dtout, ''dd.mm.yyyy'') dtout ' +
                '       ,u.Active ' +
                '       ,u.note ' +
                '  from burnar.karjera      k ' +
                '       ,burnar.doljtostruct ds ' +
                '       ,burnar.people p left join burnar.users u on p.id = u.people_id ' +
                //'                            left join burnar.spr_role r on u.role_id = r.role_id ' +
                ' where k.idpeople = p.id ' +
                '   and ds.key = k.doljinstru ' +
                '   and ds.org in (with recursive tr as ' +
                '                   ( ' +
                '                      select od.* ' +
                '                      from burnar.org_stru od ' +
                '                      where od.id = %s ' +
                '                      union all ' +
                '                      select od.* ' +
                '                      from burnar.org_stru od, tr ' +
                '                      where tr.id = od.parent ' +
                '                   ) ' +
                '                   select tr.id from tr ' +
                '                 ) ' +
                ' %s ' +
                ' order by p.fio ';
                

// Итоги для Списока пользователей при выводе в Excel
strListOpenUser = 'select count(case when active = 1 then 1 end) as Open ' +
                  '      ,count(case when active = 0 then 0 end) as Close ' +
                  'from (select distinct u.ora_name, p.fio, u.active ' +
                  '     from burnar.karjera      k ' +
                  '          ,burnar.people       p ' +
                  '          ,burnar.doljtostruct ds ' +
                  '          ,burnar.users        u ' +
                  '          ,burnar.spr_role     r ' +
                  '     where k.idpeople = p.id ' +
                  '           and ds.org in (with recursive tr as ' +
                  '                            ( ' +
                  '                                  select od.* ' +
                  '                                  from burnar.org_stru_date od ' +
                  '                                  where od.id = %s ' +
                  '                                  union all ' +
                  '                                  select od.* ' +
                  '                                  from burnar.org_stru_date od, tr ' +
                  '                                  where tr.id = od.parent ' +
                  '                             ) ' +
                  '                             select tr.id from tr ' +
                  '                          ) ' +
                  '           and ds.key = k.doljinstru ' +
                  '           and p.id = u.people_id ' +
                  '           and k.dtout = (select max(kk.dtout) ' +
                  '                          from burnar.karjera kk ' +
                  '                          where kk.idpeople = p.id) ' +     // берем одну запись должности из карьеры по одному человеку
                  '           and u.role_id = r.role_id ' +
                  '     ) qr';


// Список пользователей Для вывода в Excel
strListUser = 'select distinct p.fio ' +
              '       ,u.dtout ' +
              '       ,u.active ' +
              '       ,case when u.active = 0 then ' +
              '               ''отключен'' ' +
              '             when u.active = 1 then ' +
              '               ''подключен'' ' +
              '        end as activenm ' +
              '       ,u.note ' +
              '       ,u.ora_name username ' +
              '       ,u.dtenter as DateIn ' +
              '       ,r.nm User_Role ' +
              '       ,sd.nm as dolj_nm ' +
              'from burnar.karjera      k ' +
              '     ,burnar.people       p ' +
              '     ,burnar.doljtostruct ds ' +
              '     ,burnar.users        u ' +
              '     ,burnar.spr_role     r ' +
              '     ,burnar.sprdoljnost sd ' +
              'where k.idpeople = p.id ' +
              '      and ds.org in (with recursive tr as ' +
              '                            ( ' +
              '                                  select od.* ' +
              '                                  from burnar.org_stru_date od ' +
              '                                  where od.id = %s ' +
              '                                  union all ' +
              '                                  select od.* ' +
              '                                  from burnar.org_stru_date od, tr ' +
              '                                  where tr.id = od.parent ' +
              '                             ) ' +
              '                             select tr.id from tr ' +
              '                    ) ' +
              '      and ds.key = k.doljinstru ' +
              '      and p.id = u.people_id ' +
              '      and u.role_id = r.role_id ' +
              '      and k.dtout = (select max(kk.dtout) from burnar.karjera kk where kk.idpeople=p.id ) ' +  // берем одну запись должности из карьеры по одному человеку
              '      and ds.doljnost = sd.key ' +
              'order by p.fio ';


//15032024SSS Запрос структурка/c отделами.. для конкретного Подразделения = :PodrId
strqrOrgNMQuerySP =  ' WITH RECURSIVE TMP(id, parent, nm, path, level) AS ( ' +
                     '                                                     select o.id, o.parent, o.nm, cast(o.nm as varchar(100)) as path, 1 ' +
                     '                                                     from burnar.org_stru o ' +
                     '                                                     where o.parent = 0 ' +
                     '                                                     union ' +
                     '                                                     select o2.id, o2.parent, o2.nm, cast(tmp.path||'', ''||o2.nm as varchar(100)), level+1 ' +
                     '                                                     from burnar.org_stru o2, tmp' +
                     '                                                     where tmp.id=o2.parent)' +
                     ' select tmp.id as key, tmp.path nm ' +
                     ' from tmp ' +
                     ' where tmp.id in (' +
                     '                   WITH RECURSIVE TMP2 AS' +
                     '                   (' +
                     '                    select o.id' +
                     '                    from burnar.org_stru o' +
                     '                    where o.id = :PodrId' +
                     '                     union' +
                     '                     select o2.id' +
                     '                     from burnar.org_stru o2, tmp2' +
                     '                     where tmp2.id = o2.parent' +
                     '                                          )' +
                     '                   select tmp2.id' +
                     '                   from tmp2' +
                     '                  )' +
                     ' order by tmp.path';

//15032024SSS Запрос структурка/c отделами.. для АДМИНА BURNAR_ROLE...
strqrOrgNMQueryAdmin =  ' WITH RECURSIVE TMP(id, parent, nm, path, level) AS ( ' +
                        '                                                     select o.id, o.parent, o.nm, cast(o.nm as varchar(100)) as path, 1 ' +
                        '                                                     from burnar.org_stru o ' +
                        '                                                     where o.parent = 0 ' +
                        '                                                     union ' +
                        '                                                     select o2.id, o2.parent, o2.nm, cast(tmp.path||'', ''||o2.nm as varchar(100)), level+1 ' +
                        '                                                     from burnar.org_stru o2, tmp' +
                        '                                                     where tmp.id=o2.parent)' +
                        ' select tmp.id as key, tmp.path nm ' +
                        ' from tmp ' +
                        ' where tmp.id in (' +
                        '                   WITH RECURSIVE TMP2 AS' +
                        '                   (' +
                        '                    select o.id' +
                        '                    from burnar.org_stru o' +
                        '                    where o.id in (1, 5, 6, 7, 8, 91, 123)' +   //Перечень всех СП для ПО Бурения, от них стартуем дерево
                        '                     union' +
                        '                     select o2.id' +
                        '                     from burnar.org_stru o2, tmp2' +
                        '                     where tmp2.id = o2.parent' +
                        '                                          )' +
                        '                   select tmp2.id' +
                        '                   from tmp2' +
                        '                  )' +
                        ' order by tmp.path';



var
  frmUsersDoljn : TfrmUsersDoljn;

implementation

uses formPeopleAdd, MainUnit, Math, UnitChangePass,
  formNewEditCareer, Sprdolj_list;

{$R *.dfm}

procedure TfrmUsersDoljn.FormShow(Sender: TObject);
//var //i:integer;
//    flag : boolean;
begin
  GridFont := TFont.Create;
  GridFont.Size := 12;

  if uppercase(OraUser) = uppercase('burnar') then
     flag := true;
  if uppercase(OraUser) = uppercase('burnar_role') then
     flag := true;


  if  flag then ToolButton14.Visible := true
  else  ToolButton14.Visible := false;


  chkUser.Visible := flag;
  btnPrintToExcel.Visible := flag;
  ToolButton8.Visible := flag; //tbEditUser

  qrPodr.Open;
  ClientDataSetPodr.Open;


  DBLookupComboBox1.KeyValue := frmMain.PodrID; //ПОдставлять сюда структурку пользователя
  DBLookupComboBox1.Enabled := flag; //выбор фильтрации СП, только для админов


  {if (GeneralParam.role_ID = 2) then //25042016SSS Таня просит открыть ведение должностных лиц ОТИЗовцами в своих СП
  begin
    chkPeople.Checked := true; //Должностные лица
    chkUser.Checked := true; //Пользователи
  end;}



  LoadPeople;

  (*for i:=0 to grUsers.RowCount-1-grUsers.FixedRows do
  begin
    if  grUsers.Recs.Count>0 then
    begin
      if grUsers.Recs[i].Items[grUsers.Fields.IndexByName['lockedit']].Value<>'' then
      case StrToInt(grUsers.Recs[i].Items[grUsers.Fields.IndexByName['lockedit']].Value) of
        1: //закрыт
        begin
          grUsers.Recs[i].Items[grUsers.Fields.IndexByName['fioreports']].Img:=Image1.Picture.Bitmap;
          grUsers.Recs[i].Items[grUsers.Fields.IndexByName['fioreports']].Font.Color:=clGray;
          grUsers.Recs[i].Items[grUsers.Fields.IndexByName['tabn']].Font.Color:=clGray;
        end;
        0: //открыт
        begin
          grUsers.Recs[i].Items[grUsers.Fields.IndexByName['fioreports']].Img:=Image2.Picture.Bitmap;
        end;

      end;
    end;
  end;*)
 StatusBar1.Panels[0].Text:='Всего пользователей: '+inttostr(grUsers.Recs.Count);
 StatusBar1.Panels[0].Width:=Panel1.Width+Splitter1.Width;
 StatusBar1.Panels[1].Text:='Всего должностных периодов: ';
 (*if  grUsers.Recs.Count>0 then
 grUsers.OnSelectCell(sender
                      ,grUsers.FixedCols
                      ,grUsers.FixedRows
                      ,flag);*)

 StatusBar1.Panels[1].Text:='Всего должностных периодов: '+inttostr(grKareraList.Recs.Count);
 Show;
end;

procedure TfrmUsersDoljn.LoadPeople;
var s : string;
begin
  grKareraList.Recs.Clear;
  qrUserList.Close;

  if chkUser.Checked and chkPeople.Checked then
    s:= ' '
  else if chkUser.Checked then
    s := ' and u.ora_name is not null '
  else if chkPeople.Checked then
    s := s + ' and u.ora_name is null ';

  qrUserList.sql.text := format(strUser, [DBLookupComboBox1.KeyValue, s ]);
  qrUserList.Open;

  if not flag then // для всех остальных полей не видно
  begin
     grUsers.LoadDataset(qrUserList,['users_id', 'tabn', 'fioreports', 'account_status' , 'dtenter', 'dtout', 'note' ]);
     grUsers.Fields.SetTitles1(['ora_name', 'id', 'fio']
                                ,['Логин', 'Код', 'Ф.И.О']);


  end
  else  // Для разработчиков и наших тенологов - Отображение полей для ведения пользователей
  begin
     grUsers.LoadDataset(qrUserList,['users_id', 'tabn', 'fioreports','active']);
     grUsers.Fields.SetTitles1(['ora_name', 'id', 'fio', 'account_status', 'dtenter', 'dtout', 'note'],
                                                       ['Логин', 'Код', 'Ф.И.О', 'Статус', 'Дата подкл.', 'Дата откл.', 'Примечание']);

     grUsers.ColWidths[5] := 50;
     grUsers.ColWidths[6] := 45;
     grUsers.ColWidths[7] := 65;
     //grUsers.ColWidths[8] := 65;
     //grUsers.ColWidths[9] := 200;
  end;

  grUsers.ColWidths[0] := 15;
  grUsers.ColWidths[1] := 40;
  grUsers.ColWidths[2] := 100;
  grUsers.ColWidths[3] := 80;
  grUsers.ColWidths[4] := 80;

  ToolButton8.Visible := flag;
  ToolButton9.Visible := flag;
  ToolButton11.Visible := flag;
  chkPeople.Visible := flag;

  StatusBar1.Panels[0].Text:='Всего: '+inttostr(grUsers.Recs.Count);


end;

procedure TfrmUsersDoljn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TfrmUsersDoljn.Panel1Resize(Sender: TObject);
begin
  StatusBar1.Panels[0].Width:=Panel1.Width+Splitter1.Width;
end;

procedure TfrmUsersDoljn.grUsersSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if grUsers.Recs.Count > 0 then
  begin
    qrKarera.ParamByName('p_id').Value := grUsers.Recs[aRow-grUsers.FixedRows].items[grUsers.fields.indexbyname['id']].Value;
    LoadPeriod;
  end;
end;

procedure TfrmUsersDoljn.sSpeedButton2Click(Sender: TObject);
var newRec: TGvCellList; //TGvCellList;
begin
if sDateEdit1.Visible then sDateEdit1.Visible:=false;
if cbSprValues.Visible then cbSprValues.Visible:=false;
 //sDateEdit1Exit(nil);
 //stat: 2-добавленная запись, 1- редактированная (возможно редактирование только последней записи из набора), 0 - неизменяемая запись
 newRec := TGvCellList.Create(qrKarera.FieldCount);
 newRec[grKareraList.fields.indexbyname['dtenter']].Value:=grKareraList.Recs[grKareraList.RowCount-1-grKareraList.FixedRows].items[grKareraList.fields.indexbyname['dtout']].Value;
 newRec[grKareraList.fields.indexbyname['stat']].Value:='2';

 grKareraList.Recs.Add(newRec);
end;
type
  tmt = class(TOvniComboBox);

procedure TfrmUsersDoljn.sDateEdit1Exit(Sender: TObject);
begin
//проверяем были ли изменения
if  oldDate<>DateToStr(sDateEdit1.Date) then
  begin
    grKareraList.Recs[EditRow-grKareraList.FixedRows].items[grKareraList.fields.indexbyname['stat']]^.Value := statStr;
    grKareraList.Recs[EditRow-grKareraList.FixedRows].items[grKareraList.fields.indexbyname[nameField]]^.Value := DateToStr(sDateEdit1.Date);
    //кнопки возвращаем
 ToolButton1.Enabled:=true;
 ToolButton2.Enabled:=true;
 ToolButton3.Enabled:=false;
  end;
sDateEdit1.Visible:=false;

end;

procedure TfrmUsersDoljn.sSpeedButton9Click(Sender: TObject);
begin
//генерим потерю фокуса комбобоксов
if sDateEdit1.Visible then sDateEdit1.Visible:=false;
if cbSprValues.Visible then cbSprValues.Visible:=false;
end;

procedure TfrmUsersDoljn.sSpeedButton3Click(Sender: TObject);
begin
//генерим потерю фокуса комбобоксов
if sDateEdit1.Visible then sDateEdit1.Visible:=false;
if cbSprValues.Visible then cbSprValues.Visible:=false;

end;

procedure TfrmUsersDoljn.sSpeedButton1Click(Sender: TObject);
begin
//генерим потерю фокуса комбобоксов
if sDateEdit1.Visible then sDateEdit1.Visible:=false;
if cbSprValues.Visible then cbSprValues.Visible:=false;
end;

procedure TfrmUsersDoljn.cbSprValuesEnter(Sender: TObject);
begin
  SprValueBefore := cbSprValues.Text;
end;

procedure TfrmUsersDoljn.cbSprValuesExit(Sender: TObject);
//var
  //mVal: double; //сохраняемое значение параметра
  //discrZnKey: integer;
  //ind: integer; //найденный объект в списке
  //upd,mVal1: string;
begin
cbSprValues.visible:=false;
if  SprValueBefore<>cbSprValues.Text then
  begin
    grKareraList.Recs[EditRow-grKareraList.FixedRows].items[grKareraList.fields.indexbyname[nameField]]^.Value := cbSprValues.Text;
    //ind:= integer(cbSprValues.PickList.Items.Objects[ cbSprValues.PickList.Items.IndexOf(cbSprValues.Text) ]);
    grKareraList.Recs[EditRow-grKareraList.FixedRows].items[grKareraList.fields.indexbyname[KeynameField]]^.Value :=inttostr( integer(cbSprValues.PickList.Items.Objects[ cbSprValues.PickList.Items.IndexOf(cbSprValues.Text) ]));
  //кнопки возвращаем
 ToolButton1.Enabled:=true;
 ToolButton2.Enabled:=true;
 ToolButton3.Enabled:=false;
 end;
end;

procedure TfrmUsersDoljn.FormCreate(Sender: TObject);
begin
  qrUserList.Connection := frmMain.MConnection;
  qrKarera.Connection := frmMain.MConnection;
  qrOrgNM.Connection := frmMain.MConnection;
  qrDoljSpr.Connection := frmMain.MConnection;
  qrPodr.Connection := frmMain.MConnection;

  // qrOrgNM.ParamByName('usr').Value := orauser;

  (*if flag then // пользователь ИЭВЦ  - видит все структуры
  begin
    qrOrgNM.ParamByName('OrgId1').Value := 0;
    qrOrgNM.ParamByName('OrgId2').Value := 0;
  end
  else
  begin
    qrOrgNM.ParamByName('OrgId1').Value  := frmMain.Org; //СП
    qrOrgNM.ParamByName('OrgId2').Value  := frmMain.Org; //СП
  end;*)



  cbSprValues := TOvniComboBox.Create(nil);
  cbSprValues.Visible := false;
  cbSprValues.PickList.Style := lbOwnerDrawVariable;
  cbSprValues.PickList.BorderItem := true;
  cbSprValues.Parent := grKareraList;
  cbSprValues.OnEnter := cbSprValuesEnter;
  cbSprValues.OnExit := cbSprValuesExit; //обработчик на потерю фокуса комбо
  //cbSprValues.OnKeyPress := EdKeyPress; //фильтр ввода с клавы


end;

procedure TfrmUsersDoljn.FormResize(Sender: TObject);
begin
//генерим потерю фокуса комбобоксов
if sDateEdit1.Visible then sDateEdit1.Visible:=false;
if cbSprValues.Visible then cbSprValues.Visible:=false;
end;

procedure TfrmUsersDoljn.Splitter1Moved(Sender: TObject);
begin
//генерим потерю фокуса комбобоксов
if sDateEdit1.Visible then sDateEdit1.Visible:=false;
if cbSprValues.Visible then cbSprValues.Visible:=false;
end;

procedure TfrmUsersDoljn.ToolButton2Click(Sender: TObject);
var
flag : boolean;
begin
//генерим потерю фокуса комбобоксов
if sDateEdit1.Visible then sDateEdit1.Visible:=false;
if cbSprValues.Visible then cbSprValues.Visible:=false;
grUsers.OnSelectCell(sender,grUsers.Col,grUsers.Row,flag);
 ToolButton1.Enabled:=false;
 ToolButton2.Enabled:=false;
 ToolButton3.Enabled:=true;
end;

/////////////////////////////////////////////////////////////////////////////////
// заполнение комбобоксов формы frmUsersDoljn
procedure TfrmUsersDoljn.LoadCbxFrmUsersDoljn(Sender: TObject);
begin
    // заполнение ДОЛЖНОСТЯМИ комбобокса
    with frmUsersDoljn do
    begin
     qrDoljSpr.Open;
     while not(qrDoljSpr.eof) do
     begin
        frmPeopleAdd.ComboBox2.Items.AddObject( qrDoljSpr.FieldByName('NM').AsString, //значение
          TObject(qrDoljSpr.FieldByName('KEY').AsInteger) ); //код значения
        qrDoljSpr.next;
     end;
     qrDoljSpr.Close;


     if flag then //15032024SSS Для админа все СП; для конкретной СП, как было только ее 
     begin
       qrOrgNM.SQL.Text := strqrOrgNMQueryAdmin;
     end
     else
     begin
       qrOrgNM.SQL.Text := strqrOrgNMQuerySP;
       frmUsersDoljn.qrOrgNM.ParamByName('podrid').Value := frmMain.PodrID;
     end;
     // заполнение ОТДЕЛОМ, БРИГАДОЙ комбобокса
     qrOrgNM.Open;
     while not(qrOrgNM.eof) do
     begin
        frmPeopleAdd.ComboBox1.Items.AddObject( qrOrgNM.FieldByName('NM').AsString, //значение
          TObject(qrOrgNM.FieldByName('key').AsInteger) ); //код значения
        qrOrgNM.next;
     end;
     qrOrgNM.Close;

     
     if frmMain.Org <> 1 then // пользователь не ИЭВЦ
       frmPeopleAdd.ComboBox1.ItemIndex := 0;


     (*// заполнение Ролями комбобокса
     qrySpr_Role.Open;
     while not(qrySpr_Role.eof) do
     begin
        // Роль "ЧИТАТЕЛЬ" не может быть назначена ВМУ (только ИЭВЦ,  УОиНТ)
        if (Integer(DBLookupComboBox1.KeyValue) in [14,15]) and (qrySpr_Role.FieldByName('role_id').AsInteger = 3) then
        begin
           qrySpr_Role.next;
           continue; // не заполняем комбобокс ролью читатель ;
        end;

        frmPeopleAdd.cbxRole.Items.AddObject( qrySpr_Role.FieldByName('NM').AsString, //значение
               TObject(qrySpr_Role.FieldByName('role_id').AsInteger) ); //код значения
        qrySpr_Role.next;
     end;
     qrySpr_Role.Close;
     *)
    end;

end;

////////////////////////////////////////////////////////////////////////////////////////////
///// вызов формы ДОБАВЛЕНИЕ человека / пользователя
procedure TfrmUsersDoljn.ToolButton4Click(Sender: TObject);
var  str : string;
begin
   if sDateEdit1.Visible then sDateEdit1.Visible := false;
   if cbSprValues.Visible then cbSprValues.Visible := false;

   frmPeopleAdd := TfrmPeopleAdd.Create(Application);
   frmPeopleAdd.gbUser.Visible := False;
   frmPeopleAdd.Height := frmPeopleAdd.Height - frmPeopleAdd.gbUser.Height;
   frmPeopleAdd.DatePicker1.Date := Now();

   LoadCbxFrmUsersDoljn(self);


   /////////// СОХРАНЕНИЕ
   if frmPeopleAdd.Showmodal = mrOK then
   begin
   try
      // передаем параметры в процедуру

      if  frmPeopleAdd.ER3.Text='' then
        SPEOPLE_ADD.ParamByname('acodr3').value := null
      else
        SPEOPLE_ADD.ParamByname('acodr3').value := frmPeopleAdd.ER3.Text;

      SPEOPLE_ADD.ParamByname('aFio').Value := frmPeopleAdd.EFIO.Text;
      if  Trim(frmPeopleAdd.ETAB.Text) <> '' then
         SPEOPLE_ADD.ParamByname('atabn').Value := frmPeopleAdd.ETAB.Text //Табельный номер человека
      else
         SPEOPLE_ADD.ParamByname('atabn').Value := null;
      SPEOPLE_ADD.ParamByname('afioreports').Value := frmPeopleAdd.EREP.Text;
      SPEOPLE_ADD.ParamByname('afiorodpad').Value := null; //Фамилия для вывода в отчет в родительном падеже
      SPEOPLE_ADD.ParamByname('datein').Value := frmPeopleAdd.DatePicker1.Date;
      SPEOPLE_ADD.ParamByname('aorg_id').Value := integer(frmPeopleAdd.ComboBox1.Items.Objects[frmPeopleAdd.ComboBox1.ItemIndex]);
      SPEOPLE_ADD.ParamByname('adolj_id').Value := integer(frmPeopleAdd.ComboBox2.Items.Objects[frmPeopleAdd.ComboBox2.ItemIndex]);

      SPEOPLE_ADD.ExecProc;


      (*как в вышках if (Trim(frmPeopleAdd.cbxRole.Text) <> '') and  (Trim(frmPeopleAdd.edOraName.Text) <> '') then
      begin
        str := Format('call burnar.create_user_burnar( aPeople_id  => %s, aOra_nm => %s, aRole_id => %d); '
                       ,[grUsers.ByFieldName['id'].Value
                         ,quotedStr(frmPeopleAdd.edOraName.Text)
                        ]);
        frmMain.MConnection.ExecSQL(str);
      end; *)

      (*как в бурении на оракле if (chkUsers.Checked) and  (Trim(frmPeopleAdd.edOraName.Text)<>'') then
      begin

        if frmPeopleAdd.cbActive.Checked then active := 1;

        str := Format('CALL burnar.create_user(aPeople_id  => %s, aOra_nm => %s, aNote => %s, aDtEnter => to_date(%s, ''dd.mm.yyyy''), aDtOut => to_date(%s, ''dd.mm.yyyy''), aActive => %d);end;',
                     [ SPEOPLE_ADD.ParamByname('apeople_id').value,
                       quotedStr(frmPeopleAdd.edOraName.Text),
                       quotedStr(frmPeopleAdd.osnovanie.Text),
                       quotedstr(DateToStr( frmPeopleAdd.EnterDate.Date)),
                       quotedstr(DateToStr( frmPeopleAdd.OutDate.Date)),
                       active
                     ]);

         frmMain.MConnection.ExecSQL(str);
      end;*)



      Application.MessageBox(Pchar(MsgChangeSavedRu),PChar(MsgAttentionRu), MB_OK+MB_ICONEXCLAMATION);
    except
      on E: Exception do
      begin
        Application.MessageBox(pchar(E.Message), pchar(E.HelpContext),MB_OK+MB_ICONERROR);
      end;
    end;
    LoadPeople;
    end;
end;

////////////////////////////////////////////////////////////////////////////////////////////
///// вызов формы редактирования карьер
procedure TfrmUsersDoljn.ToolButton13Click(Sender: TObject);
var new_car: TfrmNewEditCareer;
    q : boolean;
begin
  new_car := TfrmNewEditCareer.Create(Owner);
  new_car.Tag := 1;
  new_car.Caption := 'Редактирование карьеры';

  new_car.qrDoljSpr.Open;
  new_car.ClientDataSetDoljSPR.Open;

  //new_car.qrOrgNM.ParamByName('usr').Value:= orauser;
  //new_car.qrOrgNM.ParamByName('podrid').Value := frmMain.PodrID;
  if flag then //15032024SSS Для админа все СП; для конкретной СП, как было только ее
  begin
    new_car.qrOrgNM.SQL.Text := strqrOrgNMQueryAdmin;
  end
  else
  begin
    new_car.qrOrgNM.SQL.Text := strqrOrgNMQuerySP;
    new_car.qrOrgNM.ParamByName('podrid').Value := frmMain.PodrID;
  end;
  
  new_car.qrOrgNM.Open;
  new_car.ClientDataSetOrgNM.Open;

  if grKareraList.Recs.Count > 0 then
  begin
    new_car.DatePicker1.date:=strtodatetime(grKareraList.ByFieldName['dtenter'].Value);
    new_car.TimePicker1.time:=strtodatetime(grKareraList.ByFieldName['dtenter'].Value);
    new_car.DatePicker2.date:=strtodatetime(grKareraList.ByFieldName['dtout'].Value);
    new_car.TimePicker2.time:=strtodatetime(grKareraList.ByFieldName['dtout'].Value);

    new_car.DBLookupComboBoxDolj.KeyValue := grKareraList.ByFieldName['dolj_id'].Value;
    new_car.DBLookupComboBoxPodr.KeyValue := grKareraList.ByFieldName['org_id'].Value;
  end;

  if new_car.ShowModal = mrOk then
  begin
     SKARJERA_ADD.ParamByname('apeople').value:= grUsers.Recs[grUsers.Row-grUsers.FixedRows].items[grUsers.fields.indexbyname['id']].Value;
     SKARJERA_ADD.ParamByname('akarjera_id').value := grKareraList.ByFieldName['key'].Value; //изменение карьеры
     SKARJERA_ADD.ParamByname('dateIn').value:= datetostr(new_car.DatePicker1.date);
     SKARJERA_ADD.ParamByname('dateOut').value:= datetostr(new_car.DatePicker2.date);
     SKARJERA_ADD.ParamByname('aorg_id').value:= new_car.DBLookupComboBoxPodr.KeyValue;
     SKARJERA_ADD.ParamByname('adolj_id').value:= new_car.DBLookupComboBoxDolj.KeyValue;
     SKARJERA_ADD.ParamByname('stat').value:= '1';
     SKARJERA_ADD.ExecProc;

     //Обновляем карьеры
     //loadlistperiod(narkey, closed);
     q := true;
     grUsersSelectCell(Self, grUsers.Col, grUsers.Row, q);
  end;
  new_car.Destroy;


  (**)
end;

////////////////////////////////////////////////////////////////////////////////////////////
///// вызов формы Добавить новый должностной период
procedure TfrmUsersDoljn.ToolButton3Click(Sender: TObject);
var new_car: TfrmNewEditCareer;
    //period_key : string;
    //i : integer;
    //isUpdBrigadir : boolean;
    q : boolean;
begin
  new_car := TfrmNewEditCareer.Create(Owner);
  new_car.Tag := 0;
  new_car.Caption := 'Добавление карьеры';

  new_car.qrDoljSpr.Open;
  new_car.ClientDataSetDoljSPR.Open;

  //new_car.qrOrgNM.ParamByName('usr').Value:= orauser;
  //new_car.qrOrgNM.ParamByName('podrid').Value := frmMain.PodrID;
  if flag then //15032024SSS Для админа все СП; для конкретной СП, как было только ее
  begin
    new_car.qrOrgNM.SQL.Text := strqrOrgNMQueryAdmin;
  end
  else
  begin
    new_car.qrOrgNM.SQL.Text := strqrOrgNMQuerySP;
    new_car.qrOrgNM.ParamByName('podrid').Value := frmMain.PodrID;
  end;

  new_car.qrOrgNM.Open;
  new_car.ClientDataSetOrgNM.Open;

  if grKareraList.Recs.Count > 0 then
  begin
    new_car.DatePicker1.date:=strtodatetime(grKareraList.ByFieldName['dtenter'].Value);
    new_car.TimePicker1.time:=strtodatetime(grKareraList.ByFieldName['dtenter'].Value);
    new_car.DatePicker2.date:=strtodatetime(grKareraList.ByFieldName['dtout'].Value);
    new_car.TimePicker2.time:=strtodatetime(grKareraList.ByFieldName['dtout'].Value);

    new_car.DBLookupComboBoxDolj.KeyValue := grKareraList.ByFieldName['dolj_id'].Value;
    new_car.DBLookupComboBoxPodr.KeyValue := grKareraList.ByFieldName['org_id'].Value;
  end;

  if new_car.ShowModal = mrOk then
  begin
     SKARJERA_ADD.ParamByname('apeople').value:= grUsers.Recs[grUsers.Row-grUsers.FixedRows].items[grUsers.fields.indexbyname['id']].Value;
     SKARJERA_ADD.ParamByname('akarjera_id').value := null; //grKareraList.ByFieldName['key'].Value; //изменение карьеры
     SKARJERA_ADD.ParamByname('dateIn').value:= datetostr(new_car.DatePicker1.date);
     SKARJERA_ADD.ParamByname('dateOut').value:= datetostr(new_car.DatePicker2.date);
     SKARJERA_ADD.ParamByname('aorg_id').value:= new_car.DBLookupComboBoxPodr.KeyValue;
     SKARJERA_ADD.ParamByname('adolj_id').value:= new_car.DBLookupComboBoxDolj.KeyValue;
     SKARJERA_ADD.ParamByname('stat').value:= '2';
     SKARJERA_ADD.ExecProc;

     //Обновляем карьеры
     //loadlistperiod(narkey, closed);
     q := true;
     //grUsersSelectCell(Self, grUsers.Col, grUsers.Row, q);
     LoadPeriod; //29062020 Обновляем карьеры
  end;
  new_car.Destroy;

end;

(*
////////////////////////////////////////////////////////////////////////////////////////////
///// вызов формы ДОБАВЛЕНИЕ РОЛИ на человека/пользователя
procedure TfrmUsersDoljn.ToolButton3Click(Sender: TObject);
var newRec: TGvCellList;
begin
//генерим потерю фокуса комбобоксов
if sDateEdit1.Visible then sDateEdit1.Visible:=false;
if cbSprValues.Visible then cbSprValues.Visible:=false;

 //sDateEdit1Exit(nil);
 //stat: 2-добавленная запись, 1- редактированная (возможно редактирование только последней записи из набора), 0 - неизменяемая запись
 newRec := TGvCellList.Create(qrKarera.FieldCount);
 newRec[grKareraList.fields.indexbyname['dtenter']].Value:= datetostr(   StrToDateDef(grKareraList.Recs[grKareraList.RowCount-1-grKareraList.FixedRows].items[grKareraList.fields.indexbyname['dtout']].Value, now()-1)+1);
 newRec[grKareraList.fields.indexbyname['stat']].Value:='2';

 grKareraList.Recs.Add(newRec);
 ToolButton1.Enabled:=true;
 ToolButton2.Enabled:=true;
 ToolButton3.Enabled:=false;
end;
*)


procedure TfrmUsersDoljn.ToolButton1Click(Sender: TObject);
var i: integer;
begin
//генерим потерю фокуса комбобоксов
if sDateEdit1.Visible then sDateEdit1.Visible:=false;
if cbSprValues.Visible then cbSprValues.Visible:=false;
//обновляем набор данных, заносим не существующие записи в БД
//цикл по всем записям
   try
    for i:=0 to grKareraList.RowCount-grKareraList.FixedRows-1 do
      begin
        if grKareraList.Recs[i].items[grKareraList.fields.indexbyname['stat']]^.Value<>'0' then
          begin
             SKARJERA_ADD.ParamByname('apeople').value:= grUsers.Recs[grUsers.Row-grUsers.FixedRows].items[grUsers.fields.indexbyname['id']].Value;
             if grKareraList.Recs[i].items[grKareraList.fields.indexbyname['key']]^.Value='' then
               SKARJERA_ADD.ParamByname('akarjera_id').value:= null
             else
               SKARJERA_ADD.ParamByname('akarjera_id').value:= grKareraList.Recs[i].items[grKareraList.fields.indexbyname['key']]^.Value  ;
             SKARJERA_ADD.ParamByname('dateIn').value:= grKareraList.Recs[i].items[grKareraList.fields.indexbyname['dtenter']]^.Value  ;
             SKARJERA_ADD.ParamByname('dateOut').value:= grKareraList.Recs[i].items[grKareraList.fields.indexbyname['dtout']]^.Value   ;
             SKARJERA_ADD.ParamByname('aorg_id').value:= grKareraList.Recs[i].items[grKareraList.fields.indexbyname['org_id']]^.Value   ;
             SKARJERA_ADD.ParamByname('adolj_id').value:= grKareraList.Recs[i].items[grKareraList.fields.indexbyname['dolj_id']]^.Value   ;
             SKARJERA_ADD.ParamByname('stat').value:= grKareraList.Recs[i].items[grKareraList.fields.indexbyname['stat']]^.Value    ;
             SKARJERA_ADD.ExecProc;
          end;
      end;
       Application.MessageBox(Pchar(MsgChangeSavedRu),PChar(MsgAttentionRu),
        MB_OK+MB_ICONEXCLAMATION);
    except
      on E: Exception do
      begin
        Application.MessageBox(pchar(E.Message), pchar(E.HelpContext),MB_OK+MB_ICONERROR);
      end;
    end;
//кнопки возвращаем
 ToolButton1.Enabled:=false;
 ToolButton2.Enabled:=false;
 ToolButton3.Enabled:=true;
end;

////////////////////////////////////////////////////////////////////////////////
// Сортировка пользователей
procedure TfrmUsersDoljn.grUsersTitleClick(FieldInd: Integer);
begin
  grUsers.fields.Sort(FieldInd);
end;

////////////////////////////////////////////////////////////////////////////////
// Поиск пользователей
procedure TfrmUsersDoljn.SpeedButton8Click(Sender: TObject);
//var j : integer;
begin
  with grUsers do  Locate(GetField(Col, row).Value, EditFind.Text,False, Row - FixedRows + 1);
end;

procedure TfrmUsersDoljn.DBLookupComboBox1CloseUp(Sender: TObject);
begin
 LoadPeople;
end;

////////////////////////////////////////////////////////////////////////////////////
// Создание пользователя, привязка роли
procedure TfrmUsersDoljn.ToolButton8Click(Sender: TObject);
var str, dtBeg, dtEnd: string;
 act : integer;    // act активность подключения пользователя
begin
   if not flag then
      exit; 

   if sDateEdit1.Visible then
      sDateEdit1.Visible := false;
   if cbSprValues.Visible then
      cbSprValues.Visible := false;

   frmPeopleAdd := TfrmPeopleAdd.Create(Application);
   frmPeopleAdd.Caption := 'Редактирование логина и роли';
   frmPeopleAdd.GBPeople.Visible := False;
   frmPeopleAdd.Height := frmPeopleAdd.Height - frmPeopleAdd.GBPeople.Height;
   LoadCbxFrmUsersDoljn(self); // подгрузка комбобоксов
   frmPeopleAdd.edOraName.Text := grUsers.ByFieldName['ora_name'].Value;
   frmPeopleAdd.osnovanie.Text := grUsers.ByFieldName['note'].Value;
   if grUsers.ByFieldName['Active'].value = '1' then
      frmPeopleAdd.cbActive.Checked := true
   else
      frmPeopleAdd.cbActive.Checked := false;

   if grUsers.ByFieldName['dtEnter'].value <> '' then
      frmPeopleAdd.EnterDate.date := strtoDate(grUsers.ByFieldName['dtEnter'].value);
   if grUsers.ByFieldName['dtOut'].value <> '' then
      frmPeopleAdd.OutDate.date := strtoDate(grUsers.ByFieldName['dtOut'].value);

   //if grUsers.ByFieldName['role_id'].value <> '' then frmPeopleAdd.cbxRole.ItemIndex := frmPeopleAdd.cbxRole.Items.IndexOfObject(TObject( StrToInt(grUsers.ByFieldName['role_id'].value)));


   /////////// СОХРАНЕНИЕ
   if frmPeopleAdd.Showmodal = mrOK then
   begin
   try

     if (Trim(frmPeopleAdd.edOraName.Text) <> '') then //and (Trim(frmPeopleAdd.cbxRole.Text) <>'')
     begin
        if frmPeopleAdd.cbActive.Checked then
           act := 1
        else
           act := 0;

        if datetostr(frmPeopleAdd.EnterDate.date) = '30.12.1899' then
           dtBeg := 'null'
        else
           dtBeg := 'to_date('+quotedstr(dateToStr(frmPeopleAdd.EnterDate.date)) + ',''dd.mm.yyyy'')';

        if datetostr(frmPeopleAdd.OutDate.date) ='30.12.1899' then
           dtEnd := 'null'
        else
           dtEnd := 'to_date('+quotedstr(dateToStr(frmPeopleAdd.OutDate.date)) + ',''dd.mm.yyyy'')';

        str := Format(' call burnar.add_user(p_people => %s, p_role_id => null, p_dtenter => %s, p_dtout => %s, p_act => %d, p_note => %s,  p_username => %s, p_password => ''%s'');',
                      [grUsers.ByFieldName['id'].Value //p_people
                      //,integer(frmPeopleAdd.cbxRole.Items.Objects[frmPeopleAdd.cbxRole.ItemIndex]) //p_role_id => v_role_id
                      ,dtBeg //p_dtenter => v_dtenter
                      ,dtEnd //p_dtout => v_dtout
                      ,act //p_act => v_act
                      ,isZero(frmPeopleAdd.osnovanie.text, true) //p_note => v_note
                      ,quotedStr(frmPeopleAdd.edOraName.Text) // p_username => v_username
                      ,'123' //p_password => v_password
                      ]);

        frmMain.MConnection.ExecSQL(str);
     end;

     Application.MessageBox(Pchar(MsgChangeSavedRu),PChar(MsgAttentionRu), MB_OK+MB_ICONEXCLAMATION);
     except
      on E: Exception do
      begin
        Application.MessageBox(pchar(E.Message), pchar(E.HelpContext),MB_OK+MB_ICONERROR);
      end;
     end;
     LoadPeople;
   end;



     (* код из бурения
    if sDateEdit1.Visible then
        sDateEdit1.Visible := false;
    if cbSprValues.Visible then
        cbSprValues.Visible := false;
    frmPeopleAdd := TfrmPeopleAdd.Create(Application);
    frmPeopleAdd.gbUser.visible := false;
    
    frmPeopleAdd.DatePicker1.date := now();

    if chkUser.Checked then
    begin
      frmPeopleAdd.gbUser.Visible := true;
      frmPeopleAdd.Height := frmPeopleAdd.gbUser.Height + frmPeopleAdd.gbPeople.Height + frmPeopleAdd.ToolBar1.Height + 30;
      frmPeopleAdd.EnterDate.date := now();
      frmPeopleAdd.OutDate.date := now();
    end
    else
      frmPeopleAdd.Height := frmPeopleAdd.gbPeople.Height + frmPeopleAdd.ToolBar1.Height + 30;;

    //надо заполнить комбобоксы выбора профессий и т.д.
    qrDoljSpr.Open;
    while not(qrDoljSpr.eof) do
    begin
      frmPeopleAdd.ComboBox2.Items.AddObject( qrDoljSpr.FieldByName('NM').AsString, //значение
                                              TObject(qrDoljSpr.FieldByName('KEY').AsInteger) ); //код значения
      qrDoljSpr.next;
    end;
    qrDoljSpr.Close;

    qrOrgNM.Open;
    while not(qrOrgNM.eof) do
    begin
      frmPeopleAdd.ComboBox1.Items.AddObject( qrOrgNM.FieldByName('NM').AsString, //значение
                                              TObject(qrOrgNM.FieldByName('key').AsInteger) ); //код значения
      qrOrgNM.next;
    end;
    qrOrgNM.Close;

    if frmPeopleAdd.Showmodal = mrOK then
    begin
    try
      // передаем параметры в процедуру
      SPEOPLE_ADD.ParamByname('afio').value := frmPeopleAdd.EFIO.Text;
      if  frmPeopleAdd.ER3.Text = '' then
        SPEOPLE_ADD.ParamByname('acodr3').value := null
      else
        SPEOPLE_ADD.ParamByname('acodr3').value := frmPeopleAdd.ER3.Text;

      SPEOPLE_ADD.ParamByname('atabn').value := frmPeopleAdd.ETAB.Text;
      SPEOPLE_ADD.ParamByname('afioreports').value := frmPeopleAdd.EREP.Text;
      SPEOPLE_ADD.ParamByname('afiorodpad').value := frmPeopleAdd.EROD.Text;
      SPEOPLE_ADD.ParamByname('datein').value := frmPeopleAdd.DatePicker1.Date;
      SPEOPLE_ADD.ParamByname('aorg_id').value := integer(frmPeopleAdd.ComboBox1.Items.Objects[frmPeopleAdd.ComboBox1.ItemIndex]);
      SPEOPLE_ADD.ParamByname('adolj_id').value := integer(frmPeopleAdd.ComboBox2.Items.Objects[frmPeopleAdd.ComboBox2.ItemIndex]);
      SPEOPLE_ADD.ExecProc;

      if (chkUser.Checked) and (Trim(frmPeopleAdd.edOraName.Text) <> '') then
      begin
        if frmPeopleAdd.cbActive.Checked then
           act := 1;

        str := Format('CALL burnar.create_user(aPeople_id  => %s, aOra_nm => %s, aNote => %s, aDtEnter => to_date(%s, ''dd.mm.yyyy''), aDtOut => to_date(%s, ''dd.mm.yyyy''), aActive => %d);end;',
                     [ SPEOPLE_ADD.ParamByname('apeople_id').value,
                       quotedStr(frmPeopleAdd.edOraName.Text),
                       quotedStr(frmPeopleAdd.osnovanie.Text),
                       quotedstr(DateToStr( frmPeopleAdd.EnterDate.Date)),
                       quotedstr(DateToStr( frmPeopleAdd.OutDate.Date)),
                       active
                     ]);
        frmMain.MConnection.ExecSQL(str);
      end;

      Application.MessageBox(Pchar(MsgChangeSavedRu),PChar(MsgAttentionRu), MB_OK+MB_ICONEXCLAMATION);
    except
      on E: Exception do
      begin
        Application.MessageBox(pchar(E.Message), pchar(E.HelpContext),MB_OK+MB_ICONERROR);
      end;                     
    end;


    // добавить проверку и перегружать грид в зависимости от того, кого добавляли пипла или юзера
    /////////////////////////////////////////////////////////////////////////////////////
    //frmUsersDoljn.FormShow(sender);
    //frmUsersDoljn.chkUsersClick(Sender);
    LoadPeople;

    end;

  //перегружаем грид и локате на новой записи при успехе
   *)
end;

procedure TfrmUsersDoljn.grUsersDblClick(Sender: TObject);
begin
  ToolButton8Click(Sender);
end;

procedure TfrmUsersDoljn.grKareraListClick(Sender: TObject);
begin
    if (grKareraList.recs.Count > 0) and (grKareraList.Row=grKareraList.recs.Count) then
    begin
        Panel3.Enabled:=true;
        ToolButton1.Enabled:=true;
        ToolButton2.Enabled:=true;
        ToolButton3.Enabled:=true;
    end
    else
    begin
        ToolButton1.Enabled:=false;
        ToolButton2.Enabled:=false;
        ToolButton3.Enabled:=false;
    end;
end;

procedure TfrmUsersDoljn.chkPeopleClick(Sender: TObject);
begin
  LoadPeople;
end;

procedure TfrmUsersDoljn.chkUserClick(Sender: TObject);
begin
  LoadPeople;
end;
////////////////////////////////////////////////////////////////////////////////
// удаление пользователя
procedure TfrmUsersDoljn.ToolButton9Click(Sender: TObject);
var str : string;
begin

   if Application.MessageBox('Удалить пользователя?',
                            'Внимание', MB_OKCANCEL + MB_ICONQUESTION) <> mrOK then Exit;
   try
     if grUsers.ByFieldName['id'].Value <> '' then
     begin
       str := Format('call burnar.deleteUser(%s); ', [grUsers.ByFieldName['id'].Value]);
       frmMain.MConnection.ExecSQL(str);
     end;
   except
     on E: Exception do
     begin
        Application.MessageBox(pchar(E.Message), pchar(E.HelpContext),MB_OK+MB_ICONERROR);
     end;
   end;
   LoadPeople;

end;

procedure TfrmUsersDoljn.ToolButton10Click(Sender: TObject);
var  str : string;

   active, dtenter, dtout, uid : string;
  i : integer;
begin

   if sDateEdit1.Visible then sDateEdit1.Visible := false;
   if cbSprValues.Visible then cbSprValues.Visible := false;


   frmPeopleAdd := TfrmPeopleAdd.Create(Application);
   frmPeopleAdd.Caption := 'Редактирование пользователя';
   frmPeopleAdd.gbUser.Visible := False;
   frmPeopleAdd.Height := frmPeopleAdd.Height - frmPeopleAdd.gbUser.Height;
   frmPeopleAdd.DatePicker1.Enabled := False;
   frmPeopleAdd.ComboBox1.Enabled  := False;
   frmPeopleAdd.ComboBox2.Enabled  := False;

   frmPeopleAdd.EFIO.Text := grUsers.ByFieldName['FIO'].Value;
   frmPeopleAdd.ETAB.Text := grUsers.ByFieldName['TABN'].Value;
   frmPeopleAdd.EREP.Text := grUsers.ByFieldName['fioreports'].Value;
   //frmPeopleAdd.edTelefon.Text := grUsers.ByFieldName['Telefon'].Value;

   /////////// СОХРАНЕНИЕ
   if frmPeopleAdd.Showmodal = mrOK then
   begin
   try
    // передаем параметры


    str := Format('update burnar.people set fio = %s, tabn = %s, fioreports = %s  where id = %s',
                  [ quotedstr(frmPeopleAdd.EFIO.Text),
                    quotedstr(frmPeopleAdd.ETAB.Text),
                    quotedstr(frmPeopleAdd.EREP.Text),
                    //quotedstr(frmPeopleAdd.edTelefon.Text),
                    grUsers.ByFieldName['id'].Value]);
    frmMain.MConnection.ExecSQL(str);



    Application.MessageBox(Pchar(MsgChangeSavedRu),PChar(MsgAttentionRu), MB_OK+MB_ICONEXCLAMATION);
    except
      on E: Exception do
      begin
        Application.MessageBox(pchar(E.Message), pchar(E.HelpContext),MB_OK+MB_ICONERROR);
      end;
    end;
    LoadPeople;
    end;


    (*if sDateEdit1.Visible then sDateEdit1.Visible:=false;
    if cbSprValues.Visible then cbSprValues.Visible:=false;

    frmPeopleAdd := TfrmPeopleAdd.Create(Application);
    frmPeopleAdd.gbPeople.visible := false;
    frmPeopleAdd.Caption := 'Редактирование пользователя: ' + grUsers.ByFieldName['fio'].Value;
    frmPeopleAdd.Height := frmPeopleAdd.gbUser.Height + frmPeopleAdd.ToolBar1.Height + 30;


    frmPeopleAdd.edOraName.Text := grUsers.ByFieldName['ora_name'].Value;
    frmPeopleAdd.osnovanie.Text := grUsers.ByFieldName['note'].Value;
    frmPeopleAdd.EnterDate.Date := strtodate(grUsers.ByFieldName['dtenter'].Value);
    frmPeopleAdd.OutDate.Date := strtodate(grUsers.ByFieldName['dtout'].Value);
    if grUsers.ByFieldName['active'].Value = '1' then frmPeopleAdd.cbActive.Checked := true;


   /////////// СОХРАНЕНИЕ
   if frmPeopleAdd.Showmodal = mrOK then
   begin
   try
    // передаем параметры

    uid := grUsers.ByFieldName['USERS_ID'].Value;

    if frmPeopleAdd.cbActive.Checked = true then active := '1' else active := '0';

    if DateToStr(frmPeopleAdd.EnterDate.Date) = '  .  .    ' then
     dtenter := '' else dtenter := datetostr(frmPeopleAdd.EnterDate.date);
    if DateToStr(frmPeopleAdd.OutDate.Date) = '  .  .    ' then
     dtout := '' else dtout := datetostr(frmPeopleAdd.OutDate.date);

    str := Format('update burnar.users set note = %s, dtenter = to_date(%s, ''dd.mm.yyyy''), dtout = to_date(%s, ''dd.mm.yyyy''), active = %s, ora_name = %s where USERS_ID = %s',
                  [ quotedstr(frmPeopleAdd.osnovanie.Text),
                    quotedstr(dtenter),
                    quotedstr(dtout),
                    quotedstr(active),
                    quotedstr(frmPeopleAdd.edOraName.text),
                    grUsers.ByFieldName['USERS_ID'].Value]);
    frmMain.MConnection.ExecSQL(str);

    Application.MessageBox(Pchar(MsgChangeSavedRu),PChar(MsgAttentionRu), MB_OK+MB_ICONEXCLAMATION);
    except
      on E: Exception do
      begin
        Application.MessageBox(pchar(E.Message), pchar(E.HelpContext),MB_OK+MB_ICONERROR);
      end;
    end;

      qrPrintUser.Close;
      qrPrintUser.Open;
      grUsers.LoadDataset(qrPrintUser,['USERS_ID', 'dtenter', 'dtout','note','dolgn', 'people_id', 'ora_name']);
      grUsers.Fields.SetTitles1(['fio',  'struct','active'],
                                 ['Ф.И.О.', 'Структурное подразделение','Активность']);
      grUsers.Locate('USERS_ID',uid) ;

     // Установим размер шрифта в гриде
     for i := 0 to grUsers.Fields.Count - 1 do grUsers.Fields.SetAtrib(i, haLeft, vaTop, cont, false, GridFont, true);

     grUsers.AutoSizeRowsHeight := false;
     grUsers.AutoSizeRowsHeight := true;


{
      Panel1.Width := 600;
      grUsers.ColWidths[1] := 100;
      grUsers.ColWidths[2] := 300;
      grUsers.ColWidths[3] := 100;
}
      StatusBar1.Panels[0].Text:='Всего пользователей: '+inttostr(grUsers.Recs.Count);
      StatusBar1.Panels[0].Width:=Panel1.Width+Splitter1.Width;


    end;
    *)
end;

//Сменить пароль пользователя
procedure TfrmUsersDoljn.ToolButton11Click(Sender: TObject);
var sql: string;
begin
   with TFormChangePass.Create(Application) do
   begin
     Label1.Visible := false;
     PoleOld.Visible := false;
     if (Showmodal = mrOk) then
     begin
         if PoleNew1.Text <> PoleNew2.Text then
         begin
            ShowMessage('Пароль не совпадает! Попытайтесь еще раз.');
         end
         else
         begin
             sql := 'CALL burnar.change_password_strict(''%s'', ''%s'');'; //''%s'',
             sql := Format(sql
                           ,[grUsers.ByFieldName['ora_name'].Value
                             //,PoleOld.Text
                             ,PoleNew1.Text
                             ]);
           try
             frmMain.MConnection.ExecSQL(SQL);
             oraPwd := PoleNew1.Text;
             //GlobalNarParam.OraPwd := PoleNew1.Text;
             Application.MessageBox(pchar(MsgPassChangedRu), PChar(MsgAttentionRu), MB_ICONINFORMATION);
           except
             on E: Exception do
               Application.MessageBox(pchar(E.Message),pchar(E.HelpContext),MB_OK + MB_ICONERROR);
           end;
         end
     end; //endif (Showmodal = mrOk) then
     Free;
   end;   // with TFormChangePass.Create(Application) do
end;

// Удаление последней карьеры на должность человека
procedure TfrmUsersDoljn.ToolButton12Click(Sender: TObject);
var str : string;
 q : boolean;
begin
   if Application.MessageBox('Удалить последнюю карьеру пользователя?',
                            'Внимание', MB_OKCANCEL + MB_ICONQUESTION) <> mrOK then Exit;
   try
     if grUsers.ByFieldName['id'].Value <> '' then
     begin
       str := Format('delete from burnar.karjera where key=%s', [grKareraList.ByFieldName['key'].Value]);
       frmMain.MConnection.ExecSQL(str);
       q := false;
       grUsersSelectCell(Self, grUsers.Col, grUsers.Row, q );
     end;
   except
     on E: Exception do
     begin
        Application.MessageBox(pchar(E.Message), pchar(E.HelpContext),MB_OK+MB_ICONERROR);
     end;
   end;
end;



procedure TfrmUsersDoljn.btnPrintToExcelClick(Sender: TObject);
Var
  curRow, cntRabmest : integer;
  MyExcel: Variant;
  str, PathShablon, NameReport, report_path, struct : string;
begin
   try
   //закроем excel открытые
   PostMessage(FindWindow('XLMAIN', nil), WM_Close, 0, 0);

   PathShablon := ExtractFilePath(Application.ExeName) + 'shablon\'; // путь к шаблону
   report_path := ExtractFilePath(Application.ExeName);              // папка отчета
   if SaveDialog1.Execute  then
      report_path := SaveDialog1.FileName
   else
   begin
     Exit;
   end;
   // Открытие шаблона
   try
     MyExcel:=CreateOleObject('Excel.Application');

     MyExcel.Workbooks.open(PathShablon + 'Users.xls'); //  шаблон Микроклимат
     curRow := 2;  // тело отчета с № строки

     MyExcel.Application.EnableEvents := false;

   except
     MessageDlg('Ошибка открытия Excel', mtError, [mbOk], 0);
     MyExcel.quit;
     Exit;
   end;

   // Сохранение отчета
   try
     MyExcel.DisplayAlerts := False;
     MyExcel.ActiveWorkBook.SaveAs(report_path);
     MyExcel.DisplayAlerts := false;

     MyExcel.Visible := False;

   except on e:exception do
     begin
       MessageDlg('MS Excell - '+ NameReport + #10#13 + e.message, mtError, [mbOk], 0);
       MyExcel.quit;
       Exit;
     end;
   end;

   /////////////////////////// тело отчета ///////////////////////
   try
     qrPrintUser.Close;
     qrPrintUser.Open;

     qrStruct.close;
     qrStruct.open;

     struct := qrStruct.FieldByName('struct').AsString;

   except on e:exception do
     begin
       MessageDlg('Ошибка открытия набора данных ' + #10#13 + e.message, mtError, [mbOk], 0);
       MyExcel.quit;
       Exit;
     end;
   end;

   cntRabmest := 1;

   while not qrPrintUser.Eof do
   begin

      MyExcel.ActiveSheet.Cells[curRow, 1]  := cntRabmest;
      MyExcel.ActiveSheet.Cells[ curRow , 2 ] := qrPrintUser.FieldByName('fio').AsString;
      MyExcel.ActiveSheet.Cells[ curRow , 3 ] := qrPrintUser.FieldByName('dolgn').AsString;
      MyExcel.ActiveSheet.Cells[ curRow , 4 ] := qrPrintUser.FieldByName('dtenter').AsString;
      MyExcel.ActiveSheet.Cells[ curRow , 5 ] := qrPrintUser.FieldByName('dtout').AsString;

      MyExcel.ActiveSheet.Cells[ curRow , 6 ] := qrPrintUser.FieldByName('note').AsString;
      MyExcel.ActiveSheet.Cells[ curRow , 7 ] := qrPrintUser.FieldByName('active').AsString;

       MyExcel.Range['A' + IntToStr(curRow) + ':G' + IntToStr(curRow)].WrapText := True;
       MyExcel.Range['A' + IntToStr(curRow) + ':G' + IntToStr(curRow)].HorizontalAlignment := xlLeft;
       MyExcel.Range['A' + IntToStr(curRow) + ':G' + IntToStr(curRow)].VerticalAlignment := xlCenter;

       MyExcel.Range['A' + IntToStr(curRow) + ':G' + IntToStr(curRow)].Borders.LineStyle := 1;
       MyExcel.ActiveSheet.Rows[''+(IntToStr(curRow) + ':' + IntToStr(curRow))+''].EntireRow.AutoFit;

       // добавление строки со сдвигом вниз
       MyExcel.ActiveSheet.Rows[ IntToStr(curRow+1) +':'+ IntToStr(curRow+1)].Select;
       MyExcel.Selection.Insert(xlDown);
       MyExcel.ActiveSheet.Cells[ MyExcel.ActiveCell.Row, 1].Select;

     Inc(curRow);
     Inc(cntRabmest);
     qrPrintUser.next;

     if struct <> qrPrintUser.FieldByName('struct').AsString then
     begin
      MyExcel.Range['A' + IntToStr(curRow) + ':G' + IntToStr(curRow)].Mergecells := True;
      MyExcel.ActiveSheet.Cells[curRow, 1]  :=  'Итого по ' + qrStruct.FieldByName('struct').AsString + ': '
                                                + #10#13 + 'Подключенных пользователей - ' + qrStruct.FieldByName('active').AsString
                                                + #10#13 + 'Отключенных пользователей - ' + qrStruct.FieldByName('inactive').AsString;
      MyExcel.Selection.RowHeight := 50;//Высота строки будет 50
      qrStruct.next;
       MyExcel.Range['A' + IntToStr(curRow) + ':G' + IntToStr(curRow)].Borders.LineStyle := 1;
       // добавление строки со сдвигом вниз
       MyExcel.ActiveSheet.Rows[ IntToStr(curRow+1) +':'+ IntToStr(curRow+1)].Select;
       MyExcel.Selection.Insert(xlDown);
       MyExcel.ActiveSheet.Cells[ MyExcel.ActiveCell.Row, 1].Select;

      struct := qrStruct.FieldByName('struct').AsString;
      Inc(curRow);
     end;

   end;

   MyExcel.ActiveSheet.Cells[ 2, 2].Select;
   MyExcel.ActiveWorkbook.Save;
   MyExcel.Visible := True;
   close;

  finally
    if (qrPrintUser.Active) then qrPrintUser.Close;
    if (qrStruct.Active) then qrStruct.Close;
    FreeAndNil(qrPrintUser);
    Screen.Cursor := crDefault;
  end;//try finally
end;

//29062020 Отображений карьер по пользователю(должностнуму лицу)
procedure TfrmUsersDoljn.LoadPeriod;
begin
  if grUsers.Recs.Count > 0 then
  begin
    //qrKarera.ParamByName('p_id').Value := grUsers.Recs[aRow-grUsers.FixedRows].items[grUsers.fields.indexbyname['id']].Value;
    qrKarera.Open;
    grKareraList.LoadDataset(qrKarera,
                            ['key', 'dolj_id', 'org_id', 'idpeople', 'stat']);
    qrKarera.Close;                            
    grKareraList.ColWidths[0] := 18;
    grKareraList.ColWidths[1] := 70;
    grKareraList.ColWidths[2] := 70;
    grKareraList.ColWidths[3] := 160;
    grKareraList.ColWidths[4] := 160;
    ToolButton1.Enabled := false;
    ToolButton2.Enabled := false;
    ToolButton3.Enabled := false;
    StatusBar1.Panels[1].Text := 'Всего должностных периодов: ' + inttostr(grKareraList.Recs.Count);
    grKareraList.Fields.SetTitles1(['org_nm','dolj_nm','dtenter','dtout'], ['Подразделение/отдел','Должность', 'Дата ввода', 'Дата вывода']);
    grKareraList.Row := 1; // активная запись первая

  end;
end;

{ Справочник }
procedure TfrmUsersDoljn.ToolButton14Click(Sender: TObject);
begin
   frmSprdolj_list := TfrmSprdolj_list.Create(Application);
   frmSprdolj_list.Show;

end;

end.
