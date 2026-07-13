unit formStructNur;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  {Dialogs,} Grids, FMTBcd, DB, SqlExpr, dialogs,
  Buttons, StdCtrls, MainUnit, ComCtrls,
  OVNIDbControls, Menus, ExtCtrls, OvniGrids, ToolWin, MemDS,
  DBAccess, Ora, PgAccess;

type
  {Каталог тематических разделов(структуры нарядов и т.д), работает в мадальном и немодальном режимах}
  TfrmStructNar = class(TForm)
    Catalog: TOVNIDbTreeGrid;
    qrStructNar: TPgQuery;
    qrGetStructNarRoot: TPgQuery;
    PMaddToZad: TPopupMenu;
    PMaddToVip: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Panel1: TPanel;
    N5: TMenuItem;
    N6: TMenuItem;
    ToolBar1: TToolBar;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Label1: TLabel;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    StatusBar1: TStatusBar;
    BitBtnResult: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure CatalogTitleClick(FieldInd: Integer);
    procedure CatalogMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    //procedure sbtnPutOpToNarZClick(Sender: TObject);
   // procedure sbtnPutOpToNarVClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    {!вызывается, когда дезигнер переводит форму в режим дизайна}
    procedure WMOnDsgnMode(var Message:TMessage); message WM_OnDsgnMode;
    {!вызывается при выходе из режима дизайна}
    procedure WMOffDsgnMode(var Message:TMessage); message WM_OffDsgnMode;
  public
    constructor Create(AOwner: TComponent); override;
    {конструктор для вызова формы в модальном режиме}
    constructor CreateEx(aOwner: TComponent);
    {получить значениe справочника}
    class function GetHierarchyItem(const
      inCaption, //заголовок
      inSprKey: string; //код необходимого для загрузки иерархического справочника
      outVals: TStrings //возвращаемые результаты
      ): word;
    procedure add_razdel_to_zad(Sender: TObject; state : boolean); // true перед текущей, false в конец наряда
    procedure add_razdel_to_Vip(Sender: TObject; state : boolean); // true перед текущей, false в конец наряда

  end;

var
  frmStructNar: TfrmStructNar;
  SrcNode: TGvTreeNode;

implementation

uses CommonNarZadUnit,CommonNarVipUnit;

{$R *.dfm}

class function TfrmStructNar.GetHierarchyItem(const
      inCaption, //заголовок
      inSprKey: string; //код необходимого для загрузки иерархического справочника
      outVals: TStrings //возвращаемые результаты
      ): word;
begin
  result := mrCancel;
  with TfrmStructNar.Create(Application) do
  try
    formStyle := fsNormal;
    Borderstyle := bsSizeToolWin;
    visible := false;
    BitBtnResult.Visible := true;

    qrStructNar.ParamByName('parId').asString := inSprKey; //'1'-все, '276'-только бурение
    qrStructNar.Open;
    Catalog.LoadTree(qrStructNar,'Код раздела','parent_id',2,['parent_id','ord','nartype']);
    qrStructNar.Close;
    StatusBar1.Panels[0].Text := //получаем кол-во всех элементов дерева
        'Всего запрошено с сервера записей: ' + IntToStr(Catalog.Items.AllNodeCount);

    Result := ShowModal;
    if Result = mrOk then
    begin
      outVals.Add('Код раздела=');
      outVals.Add('Наименование=');
      outVals.Add('nartype=');
      qrGetStructNarRoot.Params[0].Value := Catalog.ByFieldName['Код раздела'].Value;
      qrGetStructNarRoot.Open;
      if Catalog.ByFieldName['Код операции'].Value <> '' then //если это операция
        outVals.Values['Код раздела'] := '' //код раздела у операции "не может быть корректным"
      else
      outVals.Values['Код раздела'] := Catalog.ByFieldName['Код раздела'].Value;
      outVals.Values['Наименование'] := Catalog.ByFieldName['Наименование'].Value;
      outVals.Values['nartype'] := qrGetStructNarRoot.FieldByName('NARTYPE').Value{Catalog.ByFieldName['nartype'].Value};
      qrGetStructNarRoot.close;
    end;
  finally
    free;
  end;
end;

procedure TfrmStructNar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not (fsModal in FormState) then //если форма не в модальном режиме
  begin
    frmStructNar := nil;
    Action := caFree;
  end;
end;

procedure TfrmStructNar.sSpeedButton1Click(Sender: TObject);
begin
  IF not ToolButton2.Down THEN Catalog.FullCollapse
  else Catalog.FullExpand;
end;

procedure TfrmStructNar.sSpeedButton2Click(Sender: TObject);
begin
  Catalog.SetAutoWidthAllColumns;
end;

procedure TfrmStructNar.sSpeedButton3Click(Sender: TObject);
begin
  with Catalog do
    Locate(GetField(Col,Row).Value, Edit1.Text, false, Row-FixedRows+1);
end;

procedure TfrmStructNar.CatalogTitleClick(FieldInd: Integer);
begin
  Catalog.Fields.Sort(FieldInd);
end;

procedure TfrmStructNar.CatalogMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  acol,arow: integer;
begin
  if Button = mbRight then
  if TOVNITreeGrid(Sender).Items.Root.Count >= 0 then
  begin
    //запоминаем, какую видимую запись потащили
    TOVNITreeGrid(Sender).MouseToCell(X,Y, ACol,ARow); //получаем координаты ячейки, в которой нажали мышь
    SrcNode := TOVNITreeGrid(Sender).VisRecs[ARow-TOVNITreeGrid(Sender).fixedRows];

    TControl(Sender).BeginDrag(True); //начало перетаскивания
  end;
end;

constructor TfrmStructNar.Create(AOwner: TComponent);
var
  fname: string;
  //i: integer;
begin
  inherited Create(AOwner);
  Catalog.ColWidths[0] := 50;
  Catalog.ColWidths[1] := 350;
  Catalog.ColWidths[2] := 50;
  //если есть файл с конфигурацией, читаем все настройки объектов оттуда
  fname := ExtractFilePath(PathAndCfgFileName)+ClassName+FrmExtUserRes;
  if FileExists( fname ) then //файл настроек найден
  begin
    DestroyComponents;//for i:=componentcount-1 downto 0 do components[i].Destroy;
    Caption := 'Тематические разделы';
  end;
end;

constructor TfrmStructNar.CreateEx(aOwner: TComponent);
begin
  inherited Create(aOwner);
end;

procedure TfrmStructNar.WMOffDsgnMode(var Message: TMessage);
begin
  Caption := 'Тематические разделы';
end;

procedure TfrmStructNar.WMOnDsgnMode(var Message: TMessage);
begin
  Caption := '';
end;

procedure TfrmStructNar.add_razdel_to_zad(Sender: TObject; state : boolean) ;
var
  i: longint;
  operkey: string; //код операции
  loc,sql,aparent: string; //для локейта
  pol_vib,ff : boolean; //выбор пользователя
  fieldVal : string;
  kod : integer;
  emp : boolean;  
begin

  //формируем строку добавления
  kod := StrToInt(Catalog.ByFieldName['Код раздела'].Value);
  ff := true;
  loc := '';
  pol_vib := false;
  for I := 0 to frmMain.MDIChildCount - 1 do
  if (frmMain.MDIChildren[I] is TfrmComNarZad) then
  begin
     //WaitIndicator.Show;
     with TfrmComNarZad(frmMain.MDIChildren[I]) do
     try
        trGrdNar.SaveExpandNodes('key', fieldVal);  // запоминаем все раскрытые ноды и позицию на которой стоим

        if trGrdNar.Items.AllNodeCount > 0 then // если наряд пустой логика разная
        begin
          if state then
          begin
             if (trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['locked']].Value <> '1') then //вставлять перед заблокированной работой - зло!
             begin
                if (trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['operlifetype']].Value = '') and (trGrdNar.CurNode.Count = 0) then
                begin
                   if application.MessageBox('Данный блок пустой! Выберите действие:'+#13+'ОК - данные будут добавлены внутрь блока'+#13+'ОТМЕНА - данные  будут добавлены перед блоком',
                                            'Внимание!',  MB_OKCANCEL+MB_ICONQUESTION) = IDOK	 then
                      pol_vib := true // пользователь вставляет в пустой блок
                   else
                      pol_vib := false // пользователь вставляет пелед блоком
                end;

                loc := trGrdNar.byFieldName['key'].Value;

                if pol_vib then //добавляем в пустой блок
                begin
                   sql := 'call burnar.Zadanie_Add_Razdel('+inttostr(keynar)+',to_date('''+datetostr(DateTimePicker1.date)+''',''dd.mm.yyyy hh24.mi.ss''),'+trGrdNar.byFieldName['key'].Value+',1,'+Catalog.ByFieldName['Код раздела'].Value+',null,1); ';
                end
                else //добаляем перед блоком
                begin
                   if trGrdNar.byFieldName['parent'].Value = '' then
                   begin
                      aparent := 'null';
                      {Application.MessageBox( pchar('Операции необходимо добавлять в блоки!'), pchar('Внимание!'));}
                   end
                   else
                     aparent := trGrdNar.byFieldName['parent'].Value;

                   sql := 'call burnar.Zadanie_Add_Razdel('+inttostr(keynar)+',to_date('''+datetostr(DateTimePicker1.date)+''',''dd.mm.yyyy hh24.mi.ss''),'+aparent+','+trGrdNar.byFieldName['prnum'].Value+','+Catalog.ByFieldName['Код раздела'].Value+',null,1);';
                end;
                frmMain.MConnection.ExecSQL(sql);
             end
             else
             begin
                //пользователь пытается вставить перед заблокированной работой
                Application.MessageBox( pchar('Нельзя добавлять работы перед заблокированной!'), pchar('Внимание!'));
                ff := false;
             end
          end
          else
          //state - false;
          begin
             //sql:='begin burnar.Zadanie_Add_Razdel('+inttostr(keynar)+',to_date('''+datetostr(DateTimePicker1.date)+''',''dd.mm.yyyy hh24.mi.ss''),null ,null,'+Catalog.ByFieldName['Код раздела'].Value+',null,1);   end;';
             //добавляем в конец текущего блока
             sql := 'call burnar.Zadanie_Add_Razdel('+inttostr(keynar)+',to_date('''+datetostr(DateTimePicker1.date)+''',''dd.mm.yyyy hh24.mi.ss''),'+trGrdNar.byFieldName['key'].Value+',null,'+Catalog.ByFieldName['Код раздела'].Value+',null,1); ';
             frmMain.MConnection.ExecSQL(sql);
          end
        end
        else // всетаки наряд пустой
        begin
           sql := 'call burnar.Zadanie_Add_Razdel('+inttostr(keynar)+',to_date('''+datetostr(DateTimePicker1.date)+''',''dd.mm.yyyy hh24.mi.ss''),null ,1,'+Catalog.ByFieldName['Код раздела'].Value+',null,1); ';
           frmMain.MConnection.ExecSQL(sql);
        end;
     finally
        // frmMain.MConnection.ExecuteDirect('begin commit; end;');
       if ff then
       begin
          ReloadTekNar(keynar,minres,maxres,izmer);
          if loc <> '' then
             trGrdNar.LoadExpandNodes('key', fieldVal); // раскрываем запомненные ноды
       end;

       show;
       //WaitIndicator.Close;
     end;
     break;
  end;
end;

procedure TfrmStructNar.add_razdel_to_Vip(Sender: TObject; state : boolean);
//procedure TfrmStructNar.sbtnPutOpToNarVClick(Sender: TObject);
var
  i: longint;
  operkey: string; //код операции
  loc,sql,aparent: string; //для локейта
  pol_vib,ff : boolean; //выбор пользователя
  fieldVal : string;
begin

  ff := true;
  loc := '';

  for I := 0 to frmMain.MDIChildCount - 1 do
  if (frmMain.MDIChildren[I] is TfrmComNarvip) then
  begin
    //WaitIndicator.Show;
    with TfrmComNarVip(frmMain.MDIChildren[I]) do
    try
      trGrdNar.SaveExpandNodes('key', fieldVal);  // запоминаем все раскрытые ноды и позицию на которой стоим

      //если наряд пустой логика разная
      if trGrdNar.Items.AllNodeCount > 0 then
      begin
        if state then
        begin
           if (trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['locked']].Value <> '1') then //вставлять перед заблокированной работой - зло!
           begin
              if (trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['operlifetype']].Value = '') and  (trGrdNar.CurNode.Count = 0) then
              begin
                 if application.MessageBox('Данный блок пустой! Выберите действие:'+#13+'ОК - данные будут добавлены внутрь блока'+#13+'ОТМЕНА - данные  будут добавлены перед блоком',
                    'Внимание!',  MB_OKCANCEL+MB_ICONQUESTION) = IDOK	 then
                   pol_vib := true // пользователь вставляет в пустой блок
                 else
                   pol_vib := false // пользователь вставляет пелед блоком
              end;

              loc := trGrdNar.byFieldName['key'].Value;

              if pol_vib then //добавляем в пустой блок
              begin
                 sql := 'call burnar.vipolnenie_Add_Razdel('+inttostr(keynar)+',to_date('''+datetostr(DateTimePicker1.date)+''',''dd.mm.yyyy hh24.mi.ss''),'+trGrdNar.byFieldName['key'].Value+' ,1,'+Catalog.ByFieldName['Код раздела'].Value+',null,1);';
              end
              else //добаляем перед блоком
              begin
                 if trGrdNar.byFieldName['parent'].Value = '' then
                    aparent := 'null'
                 else
                    aparent := trGrdNar.byFieldName['parent'].Value;

                 sql:='call burnar.vipolnenie_Add_Razdel('+inttostr(keynar)+' ,to_date('''+trGrdNar.byFieldName['begoperdate'].Value+''',''dd.mm.yyyy hh24.mi.ss''),'+aparent+' ,'+trGrdNar.byFieldName['prnum'].Value+','+Catalog.ByFieldName['Код раздела'].Value+',null,1);';
              end;
              frmMain.MConnection.ExecSQL(sql);
           end
           else
           begin //  пользователь пытается вставить перед заблокированной работой
              Application.MessageBox( pchar('Нельзя добавлять работы перед заблокированной!'), pchar('Внимание!'));
              ff := false;
           end
        end
        else
        begin
           sql:='call burnar.vipolnenie_Add_Razdel('+inttostr(keynar)+',to_date('''+datetostr(DateTimePicker1.date)+''',''dd.mm.yyyy hh24.mi.ss''),'+trGrdNar.byFieldName['key'].Value+' ,null,'+Catalog.ByFieldName['Код раздела'].Value+',null,1);';

           frmMain.MConnection.ExecSQL(sql);
        end
      end // всетаки наряд пустой
      else
      begin
         sql := 'begin burnar.vipolnenie_Add_Razdel('+inttostr(keynar)+',to_date('''+datetostr(DateTimePicker1.date)+''',''dd.mm.yyyy hh24.mi.ss''),null ,1,'+Catalog.ByFieldName['Код раздела'].Value+',null,1);   end;';
         frmMain.MConnection.ExecSQL(sql);
      end;
    finally
       if ff then
       begin
          ReloadTekNar(keynar, minres, maxres, izmer);
          if loc <> '' then
             trGrdNar.LoadExpandNodes('key', fieldVal); // раскрываем запомненные ноды
       end;

       show;
    end;
    break;
  end;
end;

procedure TfrmStructNar.N1Click(Sender: TObject);
begin
add_razdel_to_zad(sender,true);
end;

procedure TfrmStructNar.N2Click(Sender: TObject);
begin
add_razdel_to_zad(sender,false);
end;

procedure TfrmStructNar.N3Click(Sender: TObject);
begin
 add_razdel_to_vip(sender,true);
end;

procedure TfrmStructNar.N4Click(Sender: TObject);
begin
 add_razdel_to_vip(sender,false);
end;

procedure TfrmStructNar.FormShow(Sender: TObject);
begin
DateTimePicker1.Date:=now;
end;

procedure TfrmStructNar.N5Click(Sender: TObject);
var
  i: longint;
  operkey: string; //код операции
  loc,sql,aparent: string; //для локейта
  pol_vib,ff : boolean; //выбор пользователя
  fieldVal : string;
begin
  pol_vib:=false;
  ff:=true;
  loc:='';

  for I := 0 to frmMain.MDIChildCount-1 do
  if (frmMain.MDIChildren[I] is TfrmComNarZad) then
  begin

   with TfrmComNarZad(frmMain.MDIChildren[I]) do
   try

   trGrdNar.SaveExpandNodes('key', fieldVal);  // запоминаем все раскрытые ноды и позицию на которой стоим

   // если наряд пустой логика разная
if trGrdNar.Items.AllNodeCount>0 then
    begin

  //    if state then
 //       begin
        //вставлять перед заблокированной работой - зло!
        if (trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['locked']].Value<>'1') then
        begin
          if (trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['operlifetype']].Value='') and  (trGrdNar.CurNode.Count=0) then
          begin
              if application.MessageBox('Данный блок пустой! Выберите действие:'+#13+'ОК - данные будут добавлены внутрь блока'+#13+'ОТМЕНА - данные  будут добавлены перед блоком',
                 'Внимание!',  MB_OKCANCEL+MB_ICONQUESTION) = IDOK	 then
                pol_vib:= true // пользователь вставляет в пустой блок
              else
                pol_vib:= false // пользователь вставляет пелед блоком
          end;

          loc:=trGrdNar.byFieldName['key'].Value ;

          if pol_vib then
            //добавляем в пустой блок
            begin
              sql:='call burnar.Zadanie_Add_Emp_Razdel('+inttostr(keynar)+',to_date('''+datetostr(DateTimePicker1.date)+''',''dd.mm.yyyy hh24.mi.ss''),'+trGrdNar.byFieldName['key'].Value+',1,'+Catalog.ByFieldName['Код раздела'].Value+',null,1);';
            end
          else
            //добаляем перед блоком
            begin
              if trGrdNar.byFieldName['parent'].Value='' then
              begin
                aparent:='null';

              end
              else
                aparent:= trGrdNar.byFieldName['parent'].Value;
                sql:='call burnar.Zadanie_Add_Emp_Razdel('+inttostr(keynar)+',to_date('''+datetostr(DateTimePicker1.date)+''',''dd.mm.yyyy hh24.mi.ss''),'+aparent+',null,'+Catalog.ByFieldName['Код раздела'].Value+',null,1);';
            end  ;
          frmMain.MConnection.ExecSQL(sql);
        end
         else
         begin
                  //  пользователь пытается вставить перед заблокированной работой
         Application.MessageBox( pchar('Нельзя добавлять работы перед заблокированной!'),
                                pchar('Внимание!'));
         ff:=false;
         end;
end
    // всетаки наряд пустой
else
begin
    sql:='call burnar.Zadanie_Add_Emp_Razdel('+inttostr(keynar)+',to_date('''+datetostr(DateTimePicker1.date)+''',''dd.mm.yyyy hh24.mi.ss''),null ,'+trGrdNar.byFieldName['prnum'].Value+','+Catalog.ByFieldName['Код раздела'].Value+',null,1);';
    frmMain.MConnection.ExecSQL(sql);
end;
finally

      if ff then begin
      ReloadTekNar(keynar,minres,maxres,izmer);
      if loc<>'' then
        trGrdNar.LoadExpandNodes('key', fieldVal); // раскрываем запомненные ноды
end;
show;

end;
break;
end;

end;

procedure TfrmStructNar.N6Click(Sender: TObject);
var
  i: longint;
  operkey: string; //код операции
  loc,sql,aparent: string; //для локейта
  pol_vib,ff : boolean; //выбор пользователя
  fieldVal : string;
begin
  pol_vib:=false;
  ff:=true;
  loc:='';

  for I := 0 to frmMain.MDIChildCount-1 do
  if (frmMain.MDIChildren[I] is TfrmComNarVip) then
  begin

   with TfrmComNarVip(frmMain.MDIChildren[I]) do
   try

   trGrdNar.SaveExpandNodes('key', fieldVal);  // запоминаем все раскрытые ноды и позицию на которой стоим

   // если наряд пустой логика разная
if trGrdNar.Items.AllNodeCount>0 then
    begin

  //    if state then
 //       begin
        //вставлять перед заблокированной работой - зло!
        if (trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['locked']].Value<>'1') then
        begin
          if (trGrdNar.CurNode.Cells[trGrdNar.Fields.IndexByName['operlifetype']].Value='') and  (trGrdNar.CurNode.Count=0) then
          begin
              if application.MessageBox('Данный блок пустой! Выберите действие:'+#13+'ОК - данные будут добавлены внутрь блока'+#13+'ОТМЕНА - данные  будут добавлены перед блоком',
                 'Внимание!',  MB_OKCANCEL+MB_ICONQUESTION) = IDOK	 then
                pol_vib:= true // пользователь вставляет в пустой блок
              else
                pol_vib:= false // пользователь вставляет пелед блоком
          end;

          loc:=trGrdNar.byFieldName['key'].Value ;

          if pol_vib then
            //добавляем в пустой блок
            begin
              sql:='call burnar.Vipolnenie_Add_Emp_Razdel('+inttostr(keynar)+',to_date('''+datetostr(DateTimePicker1.date)+''',''dd.mm.yyyy hh24.mi.ss''),'+trGrdNar.byFieldName['key'].Value+',1,'+Catalog.ByFieldName['Код раздела'].Value+',null,1);';
            end
          else
            //добаляем перед блоком
            begin
              if trGrdNar.byFieldName['parent'].Value='' then
              begin
                aparent:='null';
              end
              else
              aparent:= trGrdNar.byFieldName['parent'].Value;
              sql:='call burnar.Vipolnenie_Add_Emp_Razdel('+inttostr(keynar)+',to_date('''+datetostr(DateTimePicker1.date)+''',''dd.mm.yyyy hh24.mi.ss''),'+aparent+',null,'+Catalog.ByFieldName['Код раздела'].Value+',null,1);';
            end  ;
          frmMain.MConnection.ExecSQL(sql);
        end
         else
         begin
                  //  пользователь пытается вставить перед заблокированной работой
         Application.MessageBox( pchar('Нельзя добавлять работы перед заблокированной!'),
                                pchar('Внимание!'));
         ff:=false;
         end;
end

    // всетаки наряд пустой
else
begin
    sql:='call burnar.Vipolnenie_Add_Emp_Razdel('+inttostr(keynar)+',to_date('''+datetostr(DateTimePicker1.date)+''',''dd.mm.yyyy hh24.mi.ss''),null ,1,'+Catalog.ByFieldName['Код раздела'].Value+',null,1);';
    frmMain.MConnection.ExecSQL(sql);
end;
finally

      if ff then begin
      ReloadTekNar(keynar,minres,maxres,izmer);
      if loc<>'' then
        trGrdNar.LoadExpandNodes('key', fieldVal); // раскрываем запомненные ноды
end;
show;

end;
break;
end;

end;

procedure TfrmStructNar.SpeedButton1Click(Sender: TObject);
begin
ShowMessage('fff');
end;

end.
