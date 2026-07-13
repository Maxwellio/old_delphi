unit HIERARCHY1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Menus, SqlExpr, FMTBcd, DB, DBXpress, DBClient,
  Provider, Grids, DBGrids, OVNIGrids, StdCtrls, DBCtrls, Buttons,
  MainUnit, MemDS, DBAccess, Ora, OVNIDbControls, ToolWin, PgAccess;

type
  TFrmIerarh = class(TForm)
    qrSprCommon: TPgQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GvDbTreeGrid1: TOVNIDbTreeGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    Edit5: TEdit;
    //procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N8Click(Sender: TObject);
    procedure FullExpandButton4Click(Sender: TObject);
    procedure FindButton1Click(Sender: TObject);
    procedure FullCollapseButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton7Click(Sender: TObject);
    procedure GvDbTreeGrid1TitleClick(FieldInd: Integer);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure sSpeedButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private

  public
    constructor Create(AOwner: TComponent); override;
    {получить значениe справочника}
    class function GetSprHierarchyItem(const
      inKeyVal, //значение ключевого поля для локации(выделения) редактируемого значения
      inCaption, //заголовок
      inSprKey: string; //код необходимого для загрузки иерархического справочника
      outVals: TStrings //возвращаемые результаты
      ): word;
  end;

  {получить значение(запись) справочника}
  function GetSprHierarchyItem(const
    inKeyVal, //значение ключевого поля для локации(выделения) редактируемого значения
    inCaption, //заголовок или другая доп. инфа
    inSprKey: string; //код необходимого для загрузки иерархического справочника
    outVals: TStrings //возвращаемые результаты
  ): word;

var
  FrmIerarh: TFrmIerarh;
  inspr : string;  
  //groupFrm : TGroupForm3;

implementation


{$R *.dfm}
{$I ProjectConst.INC}
{$I ProjectStr.INC}
{$I HIERARCHY.INC}

{получить значениe справочника}
function GetSprHierarchyItem(const
  inKeyVal, //значение ключевого поля для локации(выделения) редактируемого значения
  inCaption, //заголовок
  inSprKey: string; //код необходимого для загрузки иерархического справочника
  outVals: TStrings //возвращаемые результаты
  ): word;
var
  frm: TFrmIerarh;
begin

  inspr := inSprKey;
  Result := mrCancel;
  frm := TFrmIerarh.Create(Application);
  try
    frm.Caption := inCaption; //даем заголовок форме справочника
    if inSprKey= '149' then
      begin
{        frm.qrSprCommon.SQL.Text := 'select t.id, t.mest_nm, t.kust_nm, t.key_ubr_well, t.well_nm, t.techplace ' +
                                'from exper.vw_mest_kust_well t ' +
                                'order by 2,3,5 ';

        frm.qrSprCommon.SQL.Text := ' select  t.id as "Код", to_number(t.ubrID) ubrID, to_number(t.parentID) parentID, t.nm as "Наименование", t.techplace as "Техническое место", tip, ' +
                                    ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =2 then t.id end,''/'')) kustKEY, ' +
                                    ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =2 then t.nm end,''/'')) kustNM,  ' +
                                    ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =1 then t.id end,''/'')) mestKEY, ' +
                                    ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =1 then t.nm end,''/'')) mestNM ' +
                                    'from exper.vw_mest_kust_well2 t ' +
                                    'start with t.parentID is null ' +
                                    'connect by prior t.ubrid = t.parentid ' +
                                    'order siblings by t.nm ';
}


        frm.qrSprCommon.SQL.Text := ' select  t.id as "Код", to_number(t.ubrID) ubrID, to_number(t.parentID) parentID, t.nm as "Наименование", t.techplace as "Техническое место", tip, ' +
                                    ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =2 then t.id end,''/'')) kustKEY, ' +
                                    ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =2 then t.nm end,''/'')) kustNM, ' +
                                    ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =1 then t.id end,''/'')) mestKEY, ' +
                                    ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =1 then t.nm end,''/'')) mestNM ' +
                                    ' from ' +
                                    ' ((select s.id, (o3.znach) as ubrID, (o.znach) parentID, s.nm nm, o2.znach techplace, ''well'' as tip ' +
                                    ' from public.object_atribute o, ' +
                                    '       public..object_atribute o2, ' +
                                    '       public..object_atribute o3, ' +
                                    '       (select * ' +
                                    '          from exper.common_spr c ' +
                                    '         start with c.id = 149 ' +
                                    '        connect by prior c.id = c.parent_id) s ' +
                                    ' where s.id = o.keyspr ' +
                                    '   and s.id = o2.keyspr ' +
                                    '   and s.id = o3.keyspr ' +
                                    '   and o.atribname = ''KEY_UBR_KUST'' ' +
                                    '   and o2.atribname = ''WELL_TECHPLACE'' ' +
                                    '   and o3.atribname = ''KEY_UBR_WELL'') ' +
                                    ' union all ' +
                                    ' (select s.id,(o.znach) as ubrid, (o2.znach) parentID, s.nm nm, null as techplace, ''kust'' as tip ' +
                                    '  from exper.object_atribute o, ' +
                                    '       exper.object_atribute o2, ' +
                                    '       (select * ' +
                                    '          from exper.common_spr c ' +
                                    '         start with c.id = 470 ' +
                                    '        connect by prior c.id = c.parent_id) s ' +
                                    ' where s.id = o.keyspr ' +
                                    '   and s.id = o2.keyspr ' +
                                    '   and o.atribname = ''KEY_UBR_KUST'' ' +
                                    '   and o2.atribname = ''KEY_MEST_MDM'') ' +
                                    ' union all ' +
                                    ' (select s.id, (o.znach) as ubrid, null as parentid, s.nm nm, null as techplace, ''mest'' as tip ' +
                                    '          from exper.object_atribute o, ' +
                                    '               (select * ' +
                                    '                  from exper.common_spr c ' +
                                    '                 start with c.id = 5 ' +
                                    '                connect by prior c.id = c.parent_id) s ' +
                                    '         where s.id = o.keyspr ' +
                                    '           and o.atribname = ''Key MDM'' ' +
                                    '        union all ' +
                                    '       select s.id, ' +
                                    '              (o.znach) as ubrid, ' +
                                    '              null as parentid, ' +
                                    '              s.nm nm, ' +
                                    '              null as techplace, ' +
                                    '              ''mest'' as tip ' +
                                    '          from exper.object_atribute o, ' +
                                    '               (select * ' +
                                    '                  from exper.common_spr c ' +
                                    '                 start with c.id = 3015 ' +
                                    '                connect by prior c.id = c.parent_id) s ' +
                                    '         where s.id = o.keyspr ' +
                                    '           and o.atribname = ''Key MDM'')) T ' +
                                    ' start with t.parentID is null ' +
                                    ' connect by prior t.ubrid = t.parentid ' +
                                    ' order siblings by t.nm';
                                


//        qrSprCommon.ParamByName('val').Value := inSprKey; //подготавливаем запрос
        frm.qrSprCommon.Open; //открываем запрос
//        frm.GvDbTreeGrid1.LoadTree(frm.qrSprCommon, 'id','id',1, ['key_ubr_well']); //грузим дерево в грид
        frm.GvDbTreeGrid1.LoadTree(frm.qrSprCommon, 'ubrID','parentID',3, ['ubrid', 'parentID', 'kustKEY', 'kustNM', 'mestKEY', 'mestNM', 'tip']); //грузим дерево в грид
        frm.qrSprCommon.Close; //закрываем запрос

        frm.GvDbTreeGrid1.Fields.SetDataTypes(['Код'], Number); //выставляем тип данных поля
        frm.GvDbTreeGrid1.Locate('Код', inKeyVal, true); //позиционируемся, если уже есть значение

        Result := frm.ShowModal;
        if Result = mrOk then
        begin
          outVals.Add('KeyVal=');
          outVals.Add('Znach=');
          outVals.Add('KustKey=');
          outVals.Add('KustNM=');
          outVals.Add('MestKey=');
          outVals.Add('MestNM=');

          if frm.GvDbTreeGrid1.CurNode.Cells[frm.GvDbTreeGrid1.Fields.IndexByName['tip']].Value <> 'well' then
            result := mrCancel
          else
            outVals.Values['KeyVal'] := frm.GvDbTreeGrid1.CurNode.Cells[
              frm.GvDbTreeGrid1.Fields.IndexByName['Код']
              ].Value;
            outVals.Values['Znach'] := frm.GvDbTreeGrid1.CurNode.Cells[
              frm.GvDbTreeGrid1.Fields.IndexByName['Наименование']
              ].Value;
            outVals.Values['KustKey'] := frm.GvDbTreeGrid1.CurNode.Cells[
              frm.GvDbTreeGrid1.Fields.IndexByName['kustKEY']
              ].Value;
            outVals.Values['KustNM'] := frm.GvDbTreeGrid1.CurNode.Cells[
              frm.GvDbTreeGrid1.Fields.IndexByName['kustNM']
              ].Value;
            outVals.Values['MestKey'] := frm.GvDbTreeGrid1.CurNode.Cells[
              frm.GvDbTreeGrid1.Fields.IndexByName['mestKEY']
              ].Value;
            outVals.Values['MestNM'] := frm.GvDbTreeGrid1.CurNode.Cells[
              frm.GvDbTreeGrid1.Fields.IndexByName['mestNM']
              ].Value;
        end;
      end
    else
      begin
        frm.qrSprCommon.ParamByName('val').Value := inSprKey; //подготавливаем запрос
        frm.qrSprCommon.Open; //открываем запрос
        frm.GvDbTreeGrid1.LoadTree(frm.qrSprCommon, 'Код','КодПредка',1, ['КодПредка','Порядок']); //грузим дерево в грид
        frm.qrSprCommon.Close; //закрываем запрос

        frm.GvDbTreeGrid1.Fields.SetDataTypes(['Код'], Number); //выставляем тип данных поля
        frm.GvDbTreeGrid1.Locate('Код', inKeyVal, true); //позиционируемся, если уже есть значение

        Result := frm.ShowModal;
        if Result = mrOk then
        begin
          outVals.Add('KeyVal='); outVals.Add('Znach=');
          outVals.Values['KeyVal'] := frm.GvDbTreeGrid1.CurNode.Cells[
            frm.GvDbTreeGrid1.Fields.IndexByName['Код']
            ].Value;
          outVals.Values['Znach'] := frm.GvDbTreeGrid1.CurNode.Cells[
            frm.GvDbTreeGrid1.Fields.IndexByName['Значение']
            ].Value;
        end;
      end;
  finally
    frm.Free;
  end;
end;

class function TFrmIerarh.GetSprHierarchyItem(const
      inKeyVal, //значение ключевого поля для локации(выделения) редактируемого значения
      inCaption, //заголовок
      inSprKey: string; //код необходимого для загрузки иерархического справочника
      outVals: TStrings //возвращаемые результаты
      ): word;
begin
  inspr := inSprKey;
  Result := mrCancel;
  with TFrmIerarh.Create(Application) do
  try
    Caption := inCaption; //даем заголовок форме справочника
    if inSprKey= '149' then
      begin
{        qrSprCommon.SQL.Text := ' select  t.id as "Код", to_number(t.ubrID) ubrID, to_number(t.parentID) parentID, t.nm as "Наименование", t.techplace as "Техническое место", tip, ' +
                                ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =2 then t.id end,''/'')) kustKEY, ' +
                                ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =2 then t.nm end,''/'')) kustNM,  ' +
                                ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =1 then t.id end,''/'')) mestKEY, ' +
                                ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =1 then t.nm end,''/'')) mestNM ' +
                                'from exper.vw_mest_kust_well2 t ' +
                                'start with t.parentID is null ' +
                                'connect by prior t.ubrid = t.parentid ' +
                                'order siblings by t.nm ';
}


        qrSprCommon.SQL.Text := ' select  t.id as "Код", to_number(t.ubrID) ubrID, to_number(t.parentID) parentID, t.nm as "Наименование", t.techplace as "Техническое место", tip, ' +
                                    ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =2 then t.id end,''/'')) kustKEY, ' +
                                    ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =2 then t.nm end,''/'')) kustNM, ' +
                                    ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =1 then t.id end,''/'')) mestKEY, ' +
                                    ' trim(''/'' from Sys_Connect_By_Path(case when LEVEL =1 then t.nm end,''/'')) mestNM ' +
                                    ' from ' +
                                    ' ((select s.id, (o3.znach) as ubrID, (o.znach) parentID, s.nm nm, o2.znach techplace, ''well'' as tip ' +
                                    ' from exper.object_atribute o, ' +
                                    '       exper.object_atribute o2, ' +
                                    '       exper.object_atribute o3, ' +
                                    '       (select * ' +
                                    '          from exper.common_spr c ' +
                                    '         start with c.id = 149 ' +
                                    '        connect by prior c.id = c.parent_id) s ' +
                                    ' where s.id = o.keyspr ' +
                                    '   and s.id = o2.keyspr ' +
                                    '   and s.id = o3.keyspr ' +
                                    '   and o.atribname = ''KEY_UBR_KUST'' ' +
                                    '   and o2.atribname = ''WELL_TECHPLACE'' ' +
                                    '   and o3.atribname = ''KEY_UBR_WELL'') ' +
                                    ' union all ' +
                                    ' (select s.id,(o.znach) as ubrid, (o2.znach) parentID, s.nm nm, null as techplace, ''kust'' as tip ' +
                                    '  from exper.object_atribute o, ' +
                                    '       exper.object_atribute o2, ' +
                                    '       (select * ' +
                                    '          from exper.common_spr c ' +
                                    '         start with c.id = 470 ' +
                                    '        connect by prior c.id = c.parent_id) s ' +
                                    ' where s.id = o.keyspr ' +
                                    '   and s.id = o2.keyspr ' +
                                    '   and o.atribname = ''KEY_UBR_KUST'' ' +
                                    '   and o2.atribname = ''KEY_MEST_MDM'') ' +
                                    ' union all ' +
                                    ' (select s.id, (o.znach) as ubrid, null as parentid, s.nm nm, null as techplace, ''mest'' as tip ' +
                                    '          from exper.object_atribute o, ' +
                                    '               (select * ' +
                                    '                  from exper.common_spr c ' +
                                    '                 start with c.id = 5 ' +
                                    '                connect by prior c.id = c.parent_id) s ' +
                                    '         where s.id = o.keyspr ' +
                                    '           and o.atribname = ''Key MDM'' ' +
                                    '        union all ' +
                                    '       select s.id, ' +
                                    '              (o.znach) as ubrid, ' +
                                    '              null as parentid, ' +
                                    '              s.nm nm, ' +
                                    '              null as techplace, ' +
                                    '              ''mest'' as tip ' +
                                    '          from exper.object_atribute o, ' +
                                    '               (select * ' +
                                    '                  from exper.common_spr c ' +
                                    '                 start with c.id = 3015 ' +
                                    '                connect by prior c.id = c.parent_id) s ' +
                                    '         where s.id = o.keyspr ' +
                                    '           and o.atribname = ''Key MDM'')) T ' +
                                    ' start with t.parentID is null ' +
                                    ' connect by prior t.ubrid = t.parentid ' +
                                    ' order siblings by t.nm';

//                                'order by 2,3,5 ';
//        qrSprCommon.ParamByName('val').Value := inSprKey; //подготавливаем запрос
        qrSprCommon.Open; //открываем запрос
        GvDbTreeGrid1.LoadTree(qrSprCommon, 'ubrID','parentID',3, ['ubrid', 'parentID', 'kustKEY', 'kustNM', 'mestKEY', 'mestNM', 'tip']); //грузим дерево в грид
        qrSprCommon.Close; //закрываем запрос

        GvDbTreeGrid1.Fields.SetDataTypes(['Код'], Number); //выставляем тип данных поля
        GvDbTreeGrid1.Locate('Код', inKeyVal, true); //позиционируемся, если уже есть значение

        Result := ShowModal;
        if Result = mrOk then
        begin
          outVals.Add('KeyVal=');
          outVals.Add('Znach=');
          outVals.Add('KustKey=');
          outVals.Add('KustNM=');
          outVals.Add('MestKey=');
          outVals.Add('MestNM=');

          if GvDbTreeGrid1.CurNode.Cells[GvDbTreeGrid1.Fields.IndexByName['tip']].Value <> 'well' then
            result := mrCancel
          else
            outVals.Values['KeyVal'] := GvDbTreeGrid1.CurNode.Cells[
              GvDbTreeGrid1.Fields.IndexByName['Код']
              ].Value;
            outVals.Values['Znach'] := GvDbTreeGrid1.CurNode.Cells[
              GvDbTreeGrid1.Fields.IndexByName['Наименование']
              ].Value;
            outVals.Values['KustKey'] := GvDbTreeGrid1.CurNode.Cells[
              GvDbTreeGrid1.Fields.IndexByName['kustKEY']
              ].Value;
            outVals.Values['KustNM'] := GvDbTreeGrid1.CurNode.Cells[
              GvDbTreeGrid1.Fields.IndexByName['kustNM']
              ].Value;
            outVals.Values['MestKey'] := GvDbTreeGrid1.CurNode.Cells[
              GvDbTreeGrid1.Fields.IndexByName['mestKEY']
              ].Value;
            outVals.Values['MestNM'] := GvDbTreeGrid1.CurNode.Cells[
              GvDbTreeGrid1.Fields.IndexByName['mestNM']
              ].Value;
        end;
      end
    else
      begin
        qrSprCommon.ParamByName('val').Value := inSprKey; //подготавливаем запрос
        qrSprCommon.Open; //открываем запрос
        GvDbTreeGrid1.LoadTree(qrSprCommon, 'Код','КодПредка',1, ['КодПредка','Порядок']); //грузим дерево в грид
        qrSprCommon.Close; //закрываем запрос

        GvDbTreeGrid1.Fields.SetDataTypes(['Код'], Number); //выставляем тип данных поля
        GvDbTreeGrid1.Locate('Код', inKeyVal, true); //позиционируемся, если уже есть значение

        Result := ShowModal;
        if Result = mrOk then
        begin
          outVals.Add('KeyVal='); outVals.Add('Znach=');
          outVals.Values['KeyVal'] := GvDbTreeGrid1.CurNode.Cells[
            GvDbTreeGrid1.Fields.IndexByName['Код']
            ].Value;
          outVals.Values['Znach'] := GvDbTreeGrid1.CurNode.Cells[
            GvDbTreeGrid1.Fields.IndexByName['Значение']
            ].Value;
        end;
      end;
  finally
    Free;
  end;
end;

//Закрытие формы
(*procedure TFrmIerarh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not(fsModal in FormState) then //если форма не в модальном режиме
    Action := caFree;
end;*)

//Подобрать ширину столбцов левого дерева
procedure TFrmIerarh.N8Click(Sender: TObject);
begin
  GvDbTreeGrid1.SetAutoWidthAllColumns;
end;

procedure TFrmIerarh.FullExpandButton4Click(Sender: TObject);
begin
  GvDbTreeGrid1.FullExpand;
end;

procedure TFrmIerarh.FindButton1Click(Sender: TObject);
var j: integer;
begin
  with GvDbTreeGrid1 do
  for j := 0 to Fields.Count-1 do //так поступаем, когда таблица в режими выделения всей строки [goRowSelect]
    if Locate({GetField(Col, Row)}Fields[j].Value, Edit5.Text, false, Row - FixedRows + 1)
    >-1 then break;
end;

procedure TFrmIerarh.FullCollapseButton1Click(Sender: TObject);
begin
  GvDbTreeGrid1.FullCollapse;
end;

constructor TFrmIerarh.Create(AOwner: TComponent);
var
  fname: string;
begin
  //если есть файл с конфигурацией, читаем все настройки объектов оттуда
  fname := ExtractFilePath(PathAndCfgFileName)+ClassName+FrmExtUserRes;
  if FileExists( fname ) then //файл настроек найден
    begin
      CreateNew(AOwner);
//      TComponent(self) := LoadComponentFromTextFile(self, fname);
    end
  else //файл настроек не найден
    inherited Create(AOwner); //вызываем стандартный конструктор
end;

procedure TFrmIerarh.FormCreate(Sender: TObject);
begin
    if inSpr = '149' then
      begin
        GvDbTreeGrid1.ColWidths[0] := 40;
        GvDbTreeGrid1.ColWidths[1] := 300;
        GvDbTreeGrid1.ColWidths[2] := 130;
      end
    else
      begin
        GvDbTreeGrid1.ColWidths[0] := 40;
        GvDbTreeGrid1.ColWidths[1] := 200;
        GvDbTreeGrid1.ColWidths[2] := 200 ;
      end;
  //GvDbTreeGrid1.ColWidths[3] := 206;
end;

procedure TFrmIerarh.sSpeedButton3Click(Sender: TObject);
begin
  IF not ToolButton3.Down THEN GvDbTreeGrid1.FullCollapse
  else GvDbTreeGrid1.FullExpand;
end;

procedure TFrmIerarh.sSpeedButton2Click(Sender: TObject);
begin
  GvDbTreeGrid1.Row := GvDbTreeGrid1.FixedRows;
end;

procedure TFrmIerarh.sSpeedButton7Click(Sender: TObject);
begin
  GvDbTreeGrid1.Row := GvDbTreeGrid1.RowCount-1;
end;

procedure TFrmIerarh.GvDbTreeGrid1TitleClick(FieldInd: Integer);
begin
  GvDbTreeGrid1.fields.Sort(FieldInd);
end;

procedure TFrmIerarh.sSpeedButton4Click(Sender: TObject);
begin
  if GvDbTreeGrid1.Row > GvDbTreeGrid1.FixedRows then
  GvDbTreeGrid1.Row := GvDbTreeGrid1.Row - 1;
end;

procedure TFrmIerarh.sSpeedButton6Click(Sender: TObject);
begin
  if GvDbTreeGrid1.Row < GvDbTreeGrid1.RowCount-1 then
  GvDbTreeGrid1.Row := GvDbTreeGrid1.Row + 1;
end;

procedure TFrmIerarh.FormShow(Sender: TObject);
begin
  StatusBar1.Panels[0].Text :=
    'Всего запрошено с сервера записей: ' + IntToStr(GvDbTreeGrid1.Items.Root.Count);
end;

end.
