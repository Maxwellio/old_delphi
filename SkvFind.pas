unit SkvFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, Grids, DB, SqlExpr, Buttons, ExtCtrls, MemDS, DBAccess, Ora, ComCtrls, ToolWin, PgAccess;

type
  TfrmSkvFind = class(TForm)
    Label2: TLabel;
    edSkvFind: TEdit;
    strgrdSkv: TStringGrid;
    btnSave: TButton;
    btnCancel: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    edMest: TEdit;
    EdKust: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    edIdSkv: TEdit;
    qrySkv: TPgQuery;
    Label4: TLabel;
    edTehMesto: TEdit;
    SpeedButton1: TSpeedButton;
    procGetskvfromoracledbbytehmesto: TPgStoredProc;
    ToolBar1: TToolBar;
    sbtnFind: TToolButton;
    ToolBar2: TToolBar;
    sSpeedButton1: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnFindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure strgrdSkvEnter(Sender: TObject);
    procedure edSkvFindKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgrdSkvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgrdSkvDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure EdKustKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edMestKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTehMestoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgrdSkvDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);

  private

    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmSkvFind: TfrmSkvFind;
  Podr_id : integer;
 // SkvStr,
 // MestStr,
 // KustStr : string;

implementation

{$R *.dfm}

uses GlobalVarUnit, Types;

procedure TfrmSkvFind.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  frmSkvFind := nil;
//  Action := caFree;
end;


procedure TfrmSkvFind.sbtnFindClick(Sender: TObject);
Var
   Str_ : string;
   i,
   j : integer;
   Save_Cursor : TCursor;

begin
   Save_Cursor := Screen.Cursor;
   Screen.Cursor := crHourGlass;
//---------------------------------------------------------------------------------------------------------
{
Str_ :=
' select' + #13#10 +
'       m.id_msr   ID_MSR' + #13#10 +
'      ,m.nm_msr   MSR' + #13#10 +
'      ,m.znach_msr ZN_MSR' + #13#10 +
'      ,k.id_kust ID_KST' + #13#10 +
'      ,k.nm_kust  KST_' + #13#10 +
'      ,k.znach_kust ZN_KST' + #13#10 +
'      ,sk.id_skv  ID_SKV' + #13#10 +
'      ,sk.nm_skv SKV_' + #13#10 +
'      ,sk.znach_skv ZN_SKV' + #13#10 +
'      ,sk.TechMst TechMST' + #13#10 +
'      ,lower(replace(upper(sk.nm_skv),''СКВ.'','''')) SKV ' + #13#10 +
'      ,lower(replace(upper(k.nm_kust),''К.'','''')) KST ' + #13#10 +
'      ,k.znach_msr' + #13#10 +
'from ' + #13#10 +
'      (select' + #13#10 +
'            s.id id_Msr,' + #13#10 +
'            s.nm nm_Msr,' + #13#10 +
'            o.znach znach_Msr' + #13#10 +
'      from' + #13#10 +
'            exper.object_atribute o' + #13#10 +
'           ,exper.common_spr s' + #13#10 +
'      where' + #13#10 +
'           s.parent_id = 5' + #13#10 +
'           and s.id = o.keyspr' + #13#10 +
'           and o.ord = 1 '+
'      union ' +
'      select s.id,' + #13#10 +
'              s.nm mest_nm,' + #13#10 +
'              o.znach nm_Msr' + #13#10 +
'      from exper.object_atribute o,' + #13#10 +
'              (select *' + #13#10 +
'                 from exper.common_spr c' + #13#10 +
'                start with c.id = 3015' + #13#10 +
'               connect by prior c.id = c.parent_id) s' + #13#10 +
'        where s.id = o.keyspr' + #13#10 +
'          and o.atribname = ''Key MDM''' + #13#10 +
' ) m,' + #13#10 +
'      (select' + #13#10 +
'            s.id id_kust,' + #13#10 +
'            s.nm nm_kust,' + #13#10 +
'            o1.znach znach_kust,' + #13#10 +
'            o2.znach znach_Msr' + #13#10 +
'      from' + #13#10 +
'            exper.object_atribute o1' + #13#10 +
'           ,exper.object_atribute o2' + #13#10 +
'           ,exper.common_spr s' + #13#10 +
'      where' + #13#10 +
'           s.parent_id = 470' + #13#10 +
'           and s.id = o1.keyspr' + #13#10 +
'           and o1.ord = 1' + #13#10 +
'           and s.id = o2.keyspr' + #13#10 +
'           and o2.ord = 2 )  k,' + #13#10 +
'      (select' + #13#10 +
'            s.id id_Skv,' + #13#10 +
'            s.nm nm_Skv,' + #13#10 +
'            o1.znach znach_Skv,' + #13#10 +
'            o2.znach znach_Kust,' + #13#10 +
'            o3.znach TechMst' + #13#10 +
'      from' + #13#10 +
'            exper.object_atribute o1' + #13#10 +
'           ,exper.object_atribute o2' + #13#10 +
'           ,exper.object_atribute o3' + #13#10 +
'           ,exper.common_spr s' + #13#10 +
'      where' + #13#10 +
'           s.parent_id = 149' + #13#10 +
'           and s.id = o1.keyspr' + #13#10 +
'           and o1.ord =1' + #13#10 +
'           and s.id = o2.keyspr' + #13#10 +
'           and o2.ord =2' + #13#10 +
'           and s.id = o3.keyspr' + #13#10 +
'           and o3.ord =3' + #13#10 +
'            )sk' + #13#10 +
'where' + #13#10 +
'           k.znach_msr = m.znach_msr' + #13#10 +
'       and sk.znach_kust = k.znach_kust (+)';
}
Str_ :=
' select ' +
'       m.id_msr   ID_MSR ' +
'      ,m.nm_msr   MSR ' +
'      ,m.znach_msr ZN_MSR ' +
'      ,k.id_kust ID_KST ' +
'      ,k.nm_kust  KST_ ' +
'      ,k.znach_kust ZN_KST ' +
'      ,sk.id_skv  ID_SKV ' +
'      ,sk.nm_skv SKV_ ' +
'      ,sk.znach_skv ZN_SKV ' +
'      ,sk.TechMst TechMST ' +
'      ,lower(replace(upper(sk.nm_skv),''СКВ.'','''')) SKV  ' +
'      ,lower(replace(upper(k.nm_kust),''К.'','''')) KST ' +
'      ,k.znach_msr ' +
'from ' +
'      (select ' +
'            s.id id_Msr, ' +
'            s.nm nm_Msr, ' +
'            o.znach znach_Msr ' +
'      from ' +
'            object_atribute o ' +
'           ,common_spr s ' +
'      where ' +
'           s.parent_id = 5 ' +
'           and s.id = o.keyspr ' +
'           and o.ord = 1       union       select s.id, ' +
'              s.nm mest_nm, ' +
'              o.znach nm_Msr ' +
'      from object_atribute o, ' +
'           (with recursive tmp as ( ' +
'                      select * ' +
'                      from common_spr c ' +
'                      where c.id = 3015 ' +
'                      union all ' +
'                      select c.* ' +
'                      from common_spr c, tmp ' +
'                      where tmp.id = c.parent_id ' +
'                      ) ' +
'            select * from tmp) s ' +
'        where s.id = o.keyspr ' +
'          and o.atribname = ''Key MDM'' ' +
' ) m, ' +
'            (select ' +
'            s.id id_Skv, ' +
'            s.nm nm_Skv, ' +
'            o1.znach znach_Skv, ' +
'            o2.znach znach_Kust, ' +
'            o3.znach TechMst ' +
'      from ' +
'            object_atribute o1 ' +
'           ,object_atribute o2 ' +
'           ,object_atribute o3 ' +
'           ,common_spr s ' +
'      where ' +
'           s.parent_id = 149 ' +
'           and s.id = o1.keyspr ' +
'           and o1.ord =1 ' +
'           and s.id = o2.keyspr ' +
'           and o2.ord =2 ' +
'           and s.id = o3.keyspr ' +
'           and o3.ord =3 ' +
'            )sk ' +
'      left join ' +
'      (select ' +
'            s.id id_kust, ' +
'            s.nm nm_kust, ' +
'            o1.znach znach_kust, ' +
'            o2.znach znach_Msr ' +
'      from ' +
'            object_atribute o1 ' +
'           ,object_atribute o2 ' +
'           ,common_spr s ' +
'      where ' +
'           s.parent_id = 470 ' +
'           and s.id = o1.keyspr ' +
'           and o1.ord = 1 ' +
'           and s.id = o2.keyspr ' +
'           and o2.ord = 2 ) k on (sk.znach_kust = k.znach_kust) ' +
' where ' +
'           k.znach_msr = m.znach_msr ';

//==============================================================================================
//if edIdSkv.Text <> ''
//then Str_ := Str_+  '    and sk.id_Skv = ' + edIdSkv.Text ;

if edSkvFind.Text <> ''
then Str_ := Str_+  '    and lower(replace(upper(sk.nm_skv),''СКВ.'','''')) like lower(''' + edSkvFind.Text+ '%'')';

if edMest.Text <> ''
then Str_ := Str_+  '    and upper(m.nm_msr) like upper(''%' + edMest.Text+ '%'')';

if edKust.Text <> ''
then Str_ := Str_+  '    and lower(replace(upper(k.nm_kust),''К.'','''')) like lower(''' + edKust.Text+ '%'')';

if (edTehMesto.Text <> '') and (length(edTehMesto.Text) > 4)
then Str_ := Str_+  '    and lower(sk.TechMst) like lower(''' + edTehMesto.Text+ '%'')';

//edIdSkv.Text := '';

//if Podr_id <> 0  //ИЭВЦ и УОиОТ видят все скважины = 0
//then Str_ := Str_+ '    and d.znach_dep_stru =  ''' + inttostr(Podr_id)+'''';

{
if NOT (GeneralParam.MainPodrID in [1,167]) //ИЭВЦ и УОиОТ видят все скважины
then Str_ := Str_+ '    and d.znach_dep_stru =  ''' + inttostr(GeneralParam.PodrID) +'''';
}

Str_:= Str_ +
       ' order by m.nm_msr,k.nm_kust,sk.nm_skv';


   qrySkv.Close;
   qrySkv.SQL.Text := Str_;
   //Очистка грида
   strgrdSkv.RowCount := 2;
   strgrdSkv.FixedCols := 1;
   strgrdSkv.FixedRows := 1;

   for j := 0 to strgrdSkv.ColCount
     do strgrdSkv.cells[j, 1] := '';


   try
       qrySkv.Open;
      // strgrdSkv.RowCount := qrySkv.RecordCount+1;
       qrySkv.first;
       i := 1;
       while not qrySkv.Eof
       do begin
           strgrdSkv.cells[0, i] :=  inttostr(i);
           strgrdSkv.cells[1, i] := qrySkv.fieldbyname('SKV').AsString;
           strgrdSkv.cells[2, i] := qrySkv.fieldbyname('KST').AsString;
           strgrdSkv.cells[3, i] := qrySkv.fieldbyname('MSR').AsString;
           strgrdSkv.cells[4, i] := qrySkv.fieldbyname('TechMst').AsString;
           strgrdSkv.cells[5, i] := qrySkv.fieldbyname('ID_SKV').AsString;
           strgrdSkv.cells[6, i] := qrySkv.fieldbyname('ID_KST').AsString;
           strgrdSkv.cells[7, i] := qrySkv.fieldbyname('ID_MSR').AsString;
           strgrdSkv.cells[8, i] := qrySkv.fieldbyname('ZN_SKV').AsString;
           strgrdSkv.cells[9, i] := qrySkv.fieldbyname('ZN_KST').AsString;
           strgrdSkv.cells[10, i] := qrySkv.fieldbyname('ZN_MSR').AsString;
           strgrdSkv.cells[11, i] := qrySkv.fieldbyname('SKV_').AsString;
           strgrdSkv.cells[12, i] := qrySkv.fieldbyname('KST_').AsString;

          if strgrdSkv.cells[5, i] = edIdSkv.Text
          then begin
             strgrdSkv.cells[0, i] := 'Выбрана';
          end;

           i := i+1;
           qrySkv.next;
       end;
       qrySkv.Close;
       strgrdSkv.RowCount := i;
     //  strgrdSkv.;
   except on e: exception
   do begin
       ShowMessage('Ошибка выбора скважин!'+#10#13+e.message);
   end;
  end;
    Screen.Cursor := Save_Cursor;
end;

procedure TfrmSkvFind.FormCreate(Sender: TObject);
begin
   strgrdSkv.FixedCols := 1;
   strgrdSkv.FixedRows := 1;
   strgrdSkv.ColCount := 13;
   strgrdSkv.RowCount := 2;


   strgrdSkv.Cells[0,0 ] := '№пп';
   strgrdSkv.Cells[1,0 ] := 'Скв.';
   strgrdSkv.Cells[2,0 ] := 'Куст';
   strgrdSkv.Cells[3,0 ] := 'Месторождение';
   strgrdSkv.Cells[4,0 ] := 'Тех.место';
   strgrdSkv.Cells[5,0 ] := 'Код скважины';
   strgrdSkv.Cells[6,0 ] := 'ID_MST';
   strgrdSkv.Cells[7,0 ] := 'ID_KST';
   strgrdSkv.Cells[8,0 ] := 'ZN_SKV';
   strgrdSkv.Cells[9,0 ] := 'ZN_MST';
   strgrdSkv.Cells[10,0 ] := 'ZN_KST';
   strgrdSkv.Cells[11,0 ] := 'NM_SKV';
   strgrdSkv.Cells[12,0 ] := 'NM_KST';


   strgrdSkv.ColWidths[0 ] := 60;
   strgrdSkv.ColWidths[1 ] := 100;
   strgrdSkv.ColWidths[2 ] := 120;
   strgrdSkv.ColWidths[3 ] := 320;
   strgrdSkv.ColWidths[4 ] := 220;
   strgrdSkv.ColWidths[5 ] := 120;
   strgrdSkv.ColWidths[6 ] := 0;
   strgrdSkv.ColWidths[7 ] := 0;
   strgrdSkv.ColWidths[8 ] := 0;
   strgrdSkv.ColWidths[9 ] := 0;
   strgrdSkv.ColWidths[10] := 0;
   strgrdSkv.ColWidths[11] := 0;
   strgrdSkv.ColWidths[12] := 0;

end;

procedure TfrmSkvFind.strgrdSkvEnter(Sender: TObject);
begin
//      SgrdRow := strgrdSkv.Row;
 //     edSkv.Text  := strgrdSkv.Cells[1,SgrdRow];
  //    edKust.Text := strgrdSkv.Cells[2,SgrdRow];
   //   edMest.Text := strgrdSkv.Cells[3,SgrdRow];
end;

procedure TfrmSkvFind.edSkvFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 13
     then sbtnFind.Click;
end;

procedure TfrmSkvFind.strgrdSkvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 13
     then btnSave.Click;
end;

procedure TfrmSkvFind.strgrdSkvDblClick(Sender: TObject);
begin
         btnSave.Click;
end;

procedure TfrmSkvFind.FormShow(Sender: TObject);
begin
   edSkvFind.Text := SkvStr;
   edMest.Text    := MestStr;
   EdKust.Text    := KustStr;
//   edIdSkv.Text   := SkvId;

   If (edSkvFind.Text <> '') or (edMest.Text <> '') or (EdKust.Text <> '') then  sbtnFindClick(self);

end;

procedure TfrmSkvFind.sSpeedButton1Click(Sender: TObject);
begin
  edSkvFind.Text := '';
  edMest.Text    := '';
  EdKust.Text    := '';
  edTehMesto.Text:= '';
end;

procedure TfrmSkvFind.EdKustKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 13
     then sbtnFind.Click;
end;

procedure TfrmSkvFind.edMestKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13
     then sbtnFind.Click;
end;

procedure TfrmSkvFind.edTehMestoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13
     then sbtnFind.Click;
end;

procedure TfrmSkvFind.strgrdSkvDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Arect : Trect;
begin
  with strgrdSkv.Canvas do
  begin
    FillRect(Rect);
{    if ACol > 6 then
      begin
        InflateRect(Rect, 2, 2);
        //brush.Color:= clWhite;
        FillRect(Rect);
        InflateRect(Rect, -2, -2);
      end
     else
        FillRect(Rect);
 }

    if ARow = 0 then Font.Style :=Font.Style+[fsbold]
    else Font.Style :=Font.Style -[fsbold];


    if ACol > 6 then  Font.Color := clWhite
    else
      if gdSelected in  State then
         Font.Color := clWhite
         else Font.Color := clBlack;

    TextOut(Rect.Left,Rect.Top,strgrdSkv.Cells[Acol,Arow]);


  end;
end;

procedure TfrmSkvFind.SpeedButton1Click(Sender: TObject);
begin
  if length(edTehMesto.Text) < 9 then
    begin
      ShowMessage('Для выполнения загрузки данных по скважинам из ИС "Бурение"'+#10+
                   'необходимо в поле "Тех. место" указать не менее 9 символов');
      exit;
    end;

  If messageBox(Handle, PChar('Загрузка данных может занять несколько минут.' +#10+'Продолжить?'),'Внимание', mb_YesNo or mb_iconquestion) = mrYes then
    begin
      try
         screen.cursor := crHourGlass;
      //вызыаем процедуру загрузки данных
         procGetskvfromoracledbbytehmesto.ParamByName('TEHMESTO').Value := edTehMesto.Text;
         procGetskvfromoracledbbytehmesto.ExecProc;
         screen.cursor := crSQLWait;
         //обновляем отображенный на экране список скважин
         sbtnFind.Click;
         ShowMessage('Данные по тех.месту: '+edTehMesto.Text +'*  обновлены');
      finally
         screen.cursor := crDefault;
      end;
    end;


end;

end.
