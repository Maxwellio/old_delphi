unit GlobalVarUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask,
  DBXpress, {FMTBcd,} SqlExpr, DB, DBClient, Provider, 
  MainUnit, ComCtrls,
  FMTBcd, Ora, MemDS, DBAccess, OraProvider, ToolWin, CheckLst, PgAccess;

type
  TfrmGlobalVar = class(TForm)
    SQLQueryKOD: TPgQuery;
    DataSetProviderOper: TDataSetProvider;
    cdsOper: TClientDataSet;
    DataSourceOper: TDataSource;
    Label3: TLabel;
    dbedOWNERNARNM: TDBEdit;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdCREATEDATE: TDBEdit;
    Label5: TLabel;
    DBEdBRIGADIRNM: TDBEdit;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdNARAUTHORNM: TDBEdit;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdSHIFR: TDBEdit;
    Label10: TLabel;
    DBEdNARTYPENM: TDBEdit;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdNarNM: TDBEdit;
    qrParamAndZn: TPgQuery;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    DataSource1: TDataSource;
    OraDataSource1: TPgDataSource;
    StatusBar1: TStatusBar;
    ToolBar2: TToolBar;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    gbProhodka: TGroupBox;
    Panel2: TPanel;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    EditFind: TEdit;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    btnFindSKV: TButton;
    DBGrid1: TDBGrid;
    ClbxType: TCheckListBox;
    ClbxPar: TCheckListBox;
    qryEdit: TPgQuery;
    ToolBar3: TToolBar;
    ToolButton12: TToolButton;
    SQLQueryKODkey: TIntegerField;
    SQLQueryKODownernar: TIntegerField;
    SQLQueryKODownernarnm: TStringField;
    SQLQueryKODcreatedate: TDateTimeField;
    SQLQueryKODbrigadir: TIntegerField;
    SQLQueryKODbrigadirnm: TStringField;
    SQLQueryKODnarauthor: TIntegerField;
    SQLQueryKODnarauthornm: TStringField;
    SQLQueryKODnartype: TIntegerField;
    SQLQueryKODnartypenm: TStringField;
    SQLQueryKODshifr: TStringField;
    SQLQueryKODnm: TStringField;
    SQLQueryKODboss: TIntegerField;
    SQLQueryKODisclosed: TIntegerField;
    cdsOperkey: TIntegerField;
    cdsOperownernar: TIntegerField;
    cdsOperownernarnm: TStringField;
    cdsOpercreatedate: TDateTimeField;
    cdsOperbrigadir: TIntegerField;
    cdsOperbrigadirnm: TStringField;
    cdsOpernarauthor: TIntegerField;
    cdsOpernarauthornm: TStringField;
    cdsOpernartype: TIntegerField;
    cdsOpernartypenm: TStringField;
    cdsOpershifr: TStringField;
    cdsOpernm: TStringField;
    cdsOperboss: TIntegerField;
    cdsOperisclosed: TIntegerField;
    qrParamAndZndefnar: TIntegerField;
    qrParamAndZnprnum: TFloatField;
    qrParamAndZnparcode: TFloatField;
    qrParamAndZnnm: TStringField;
    qrParamAndZnznval: TFloatField;
    qrParamAndZnznnm: TStringField;
    qrParamAndZnval: TFloatField;
    qrParamAndZnvalstr: TStringField;
    ClientDataSet1defnar: TIntegerField;
    ClientDataSet1prnum: TFloatField;
    ClientDataSet1parcode: TFloatField;
    ClientDataSet1nm: TStringField;
    ClientDataSet1znval: TFloatField;
    ClientDataSet1znnm: TStringField;
    ClientDataSet1val: TFloatField;
    ClientDataSet1valstr: TStringField;
    SQLQueryKODnamemaster: TStringField;
    cdsOpernamemaster: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ClientDataSet1ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataSetProvider1BeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure sSpeedButton10Click(Sender: TObject);
    procedure sSpeedButton11Click(Sender: TObject);
    procedure cdsOperOWNERNARNMChange(Sender: TField);
    procedure cdsOperCREATEDATEChange(Sender: TField);
    procedure cdsOperBRIGADIRNMChange(Sender: TField);
    procedure cdsOperNARAUTHORNMChange(Sender: TField);
    procedure cdsOperSHIFRChange(Sender: TField);
    procedure cdsOperNARTYPENMChange(Sender: TField);
    procedure cdsOperNMChange(Sender: TField);
    procedure sSpeedButton12Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton8Click(Sender: TObject);
    procedure sSpeedButton13Click(Sender: TObject);
    procedure sSpeedButton14Click(Sender: TObject);
    procedure sSpeedButton15Click(Sender: TObject);
    procedure sSpeedButton16Click(Sender: TObject);
    procedure sSpeedButton9Click(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure ClientDataSet1AfterOpen(DataSet: TDataSet);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnFindSKVClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ClbxTypeClickCheck(Sender: TObject);
  private
    fkeynar: integer;
    {сбрасывает постоянные поля в начальное визуальное состояние}
    procedure ResetFieldFont;
    {вызывается, когда дезигнер переводит форму в режим дизайна}
    procedure WMOnDsgnMode(var Message:TMessage); message WM_OnDsgnMode;
    {вызывается при выходе из режима дизайна}
    procedure WMOffDsgnMode(var Message:TMessage); message WM_OffDsgnMode;
  public
    constructor CreateEx(aOwner: TComponent; akeynar: integer);
  end;

var
  frmGlobalVar: TfrmGlobalVar;
  Podr_id : integer;
  SkvId,  
  SkvStr,
  MestStr,
  KustStr : string;
  isclosed : integer;

implementation

uses CommSprUnit,OVNIGrids,HIERARCHY1,formReconcileError, NarListUnit, SkvFind;

{$R *.dfm}

procedure TfrmGlobalVar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmGlobalVar := nil;
  Action := caFree;
end;

procedure TfrmGlobalVar.Button1Click(Sender: TObject);
var
  ResVal: TResVal;
begin
  if GetSprVal(DBEdit2.field.AsInteger, 'Владелец наряда',spworkers,[],ResVal) = mrOk then
  begin
    cdsOper.Edit;
    cdsOper.FieldByName('OWNERNAR').asInteger := ResVal.key;
    cdsOper.FieldByName('OWNERNARNM').AsString := ResVal.Value;
  end;
end;

procedure TfrmGlobalVar.Button4Click(Sender: TObject);
var
  ResVal: TResVal;
begin
  if GetSprVal(DBEdit5.field.AsInteger, Label5.Caption, spChief,
    [cdsOperBOSS.AsInteger],ResVal) = mrOk then
  begin
    cdsOper.Edit;
    cdsOper.FieldByName('BRIGADIR').asInteger := ResVal.Key;
    cdsOper.FieldByName('BRIGADIRNM').AsString := ResVal.Value;
  end;
end;

{сбрасываем постоянные поля в начальное визуальное состояние}
procedure TfrmGlobalVar.ResetFieldFont;
begin
  dbedOWNERNARNM.Font.Style := dbedOWNERNARNM.Font.Style-[fsBold];
  DBEdCREATEDATE.Font.Style := DBEdCREATEDATE.Font.Style-[fsBold];
  DBEdNARAUTHORNM.Font.Style := DBEdNARAUTHORNM.Font.Style-[fsBold];
  DBEdBRIGADIRNM.Font.Style := DBEdBRIGADIRNM.Font.Style-[fsBold];
  DBEdNARTYPENM.Font.Style := DBEdNARTYPENM.Font.Style-[fsBold];
  DBEdNarNM.Font.Style := DBEdNarNM.Font.Style-[fsBold];
  DBEdSHIFR.Font.Style := DBEdSHIFR.Font.Style-[fsBold];
end;

procedure TfrmGlobalVar.ClientDataSet1ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  //обработка ошибок при сохранении данных на серваке
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

//для апдейта каждой строки будет срабатывать эта процедура
procedure TfrmGlobalVar.DataSetProvider1BeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
//  stmtParams: TParams;
  sql: string;

  aValcont, aZnVal, aVal, aValstr, akeynar, aNumpar : string;
//  aValcont : integer;

begin
//  stmtParams := TParams.Create;
  try
//      if (ClientDataSet1PARCODE.AsInteger = 149)
      if (DeltaDs.FieldByName('parcode').OldValue = 149)
         and (DeltaDs.FieldByName('znval').OldValue <> Unassigned)
         and (DeltaDs.FieldByName('znval').NewValue = Unassigned)
      then
      begin
//        stmtParams.CreateParam(ftBCD, 'narkey', ptInput);
//        stmtParams.ParamByName('narkey').AsBCD := DeltaDs.FieldByName('defnar').OldValue;

        aKeynar := DeltaDs.FieldByName('defnar').OldValue;

        sql := 'update burnar.znparams set znval='''',val=null,valstr='''' where defnar=:narkey and parcode=149';

        frmMain.mConnection.ExecSQL(SQL, [aKeynar]);

//        frmMain.mConnection.ExecSQL(SQL, stmtParams);

        sql := 'update burnar.znparams set znval='''',val=null,valstr='''' where defnar=:narkey and parcode=470';
        frmMain.mConnection.ExecSQL(SQL, [aKeynar]);

        sql := 'update burnar.znparams set znval='''',val=null,valstr='''' where defnar=:narkey and parcode=5';
        frmMain.mConnection.ExecSQL(SQL, [aKeynar]);

    //    if not(ClientDataSet1.State in [dsInsert, dsEdit]) then
    //    begin
          ClientDataSet1.Edit;
   //     end;

          ClientDataSet1.FieldByName('VALSTR').Value := null;
          ClientDataSet1.Locate('NM', 'Куст', [loPartialKey]);


//        if not(ClientDataSet1.State in [dsInsert, dsEdit]) then
//        begin
//          ClientDataSet1.Edit;
//        end;
          ClientDataSet1.FieldByName('ZNVAL').Value := null;
          ClientDataSet1.FieldByName('VALSTR').Value := null;
          ClientDataSet1.FieldByName('ZNNM').Value := null;
          ClientDataSet1.post;

          ClientDataSet1.Edit;
          ClientDataSet1.Locate('NM', 'Месторождение', [loPartialKey]);
        //if not(ClientDataSet1.State in [dsInsert, dsEdit]) then
        //begin
       //
        //end;
          ClientDataSet1.FieldByName('ZNVAL').Value := null;
          ClientDataSet1.FieldByName('VALSTR').Value := null;
          ClientDataSet1.FieldByName('ZNNM').Value := null;
          ClientDataSet1.post;

          ClientDataSet1.Locate('NM', 'Скважина', [loPartialKey]);

      end
      else
      begin
//          stmtParams.CreateParam(ftBCD, 'val', ptInput);
          //поле изменилось
          if (DeltaDs.FieldByName('znval').NewValue <> DeltaDs.FieldByName('znval').OldValue) and
             (DeltaDs.FieldByName('znval').OldValue <> Unassigned) and ((DeltaDs.FieldByName('znval').NewValue <> Unassigned))
          then
//            stmtParams.ParamByName('val').Value := DeltaDs.FieldByName('znval').NewValue
              aVal := DeltaDs.FieldByName('znval').NewValue
          else
            //поле не изменилось
            if (DeltaDs.FieldByName('znval').OldValue <> Unassigned) and (DeltaDs.FieldByName('znval').OldValue <> null) then //а было ли там вообще что-то?
//              stmtParams.ParamByName('val').Value := DeltaDs.FieldByName('znval').OldValue
              aVal := DeltaDs.FieldByName('znval').OldValue
            else
//              stmtParams.ParamByName('val').Value := 'null';
              aVal := 'null';

//          stmtParams.CreateParam(ftBCD, 'valcont', ptInput);
          if DeltaDs.FieldByName('val').NewValue <> DeltaDs.FieldByName('val').oldvalue then
//            stmtParams.ParamByName('valcont').Value := DeltaDs.FieldByName('val').NewValue
            aValcont := DeltaDs.FieldByName('val').NewValue
          else //поле не изменилось
//            stmtParams.ParamByName('valcont').Value := DeltaDs.FieldByName('val').OldValue;
            aValcont := DeltaDs.FieldByName('val').OldValue;

          //работаем со строковым полем
          if DeltaDs.FieldByName('valstr').NewValue <> DeltaDs.FieldByName('valstr').OldValue then
//            sql := format('update burnar.znparams set znval=:val,val=:valcont,valstr=%s where defnar=:narkey and parcode=:numpar'
//              ,[quotedstr(DeltaDs.FieldByName('valstr').NewValue)])

              aValstr := DeltaDs.FieldByName('valstr').NewValue

          else
//            sql := format('update burnar.znparams set znval=:val,val=:valcont,valstr=%s where defnar=:narkey and parcode=:numpar'
//              ,[quotedstr(DeltaDs.FieldByName('valstr').OldValue)]);

              aValstr := DeltaDs.FieldByName('valstr').OldValue;

//      sql := 'update burnar.znparams set znval=:val,val=:valcont,valstr=:valstr where defnar=:narkey and parcode=:numpar';


//      stmtParams.CreateParam(ftBCD, 'narkey', ptInput);
//      stmtParams.ParamByName('narkey').AsBCD := DeltaDs.FieldByName('defnar').OldValue;
      akeynar := DeltaDs.FieldByName('defnar').OldValue;

//      stmtParams.CreateParam(ftBCD, 'numpar', ptInput);
//      stmtParams.ParamByName('numpar').AsBCD := DeltaDs.FieldByName('parcode').OldValue;
      aNumpar := DeltaDs.FieldByName('parcode').OldValue;

//      frmMain.mConnection.Execute(SQL, stmtParams, nil);

      if (aValcont = '') or (aValcont = '0') then aValcont := 'null';

      sql := 'update burnar.znparams ' +
             ' set znval= ' + aVal +
             ', val= ' + aValcont +
             ', valstr= ''' + aValstr + '''' +
             ' where defnar = ' + aKeynar +
             ' and parcode = ' + aNumpar;

//      frmMain.mConnection.ExecSQL(SQL, [aVal, aValcont, aValstr, aKeynar, aNumpar]);

      frmMain.mConnection.ExecSQL(SQL);

      end;

  finally
//    stmtParams.Free;
  end;

  Applied := True; //уведомляем провайдер, что изменения выполняем вручную

end;

procedure TfrmGlobalVar.sSpeedButton10Click(Sender: TObject);
begin
  if cdsOper.State = dsEdit then cdsOper.Post;
end;

procedure TfrmGlobalVar.sSpeedButton11Click(Sender: TObject);
begin
  cdsOper.RevertRecord;
  ResetFieldFont;
end;

procedure TfrmGlobalVar.cdsOperOWNERNARNMChange(Sender: TField);
begin
  dbedOWNERNARNM.Font.Style := dbedOWNERNARNM.Font.Style+[fsBold];
end;

procedure TfrmGlobalVar.cdsOperCREATEDATEChange(Sender: TField);
begin
  DBEdCREATEDATE.Font.Style := DBEdCREATEDATE.Font.Style+[fsBold];
end;

procedure TfrmGlobalVar.cdsOperBRIGADIRNMChange(Sender: TField);
begin
  DBEdBRIGADIRNM.Font.Style := DBEdBRIGADIRNM.Font.Style+[fsBold];
end;

procedure TfrmGlobalVar.cdsOperNARAUTHORNMChange(Sender: TField);
begin
  DBEdNARAUTHORNM.Font.Style := DBEdNARAUTHORNM.Font.Style+[fsBold];
end;

procedure TfrmGlobalVar.cdsOperSHIFRChange(Sender: TField);
begin
  DBEdSHIFR.Font.Style := DBEdSHIFR.Font.Style+[fsBold];
end;

procedure TfrmGlobalVar.cdsOperNARTYPENMChange(Sender: TField);
begin
  DBEdNARTYPENM.Font.Style := DBEdNARTYPENM.Font.Style+[fsBold];
end;

procedure TfrmGlobalVar.cdsOperNMChange(Sender: TField);
begin
  DBEdNarNM.Font.Style := DBEdNarNM.Font.Style+[fsBold];
end;

procedure TfrmGlobalVar.sSpeedButton12Click(Sender: TObject);
var
//  stmtParams: TParams;
  sql: string;
  aOwnernar, aCreatedate, aBrigadir, aNarauthor, aNartype, aShifr, aNm, aKey : variant;
begin
  {сохраняем постоянный набор полей для всех видов нарядов}
  if cdsOper.State = dsEdit then cdsOper.Post;
//  stmtParams := TParams.Create;
  try
    aOwnernar := cdsOperOWNERNAR.Value;
    aCreatedate := cdsOperCREATEDATE.Value;
    aBrigadir := cdsOperBRIGADIR.AsVariant;
    aNarauthor := cdsOperNARAUTHOR.value;
    aNartype := cdsOperNARTYPE.Value;
    aShifr := cdsOperSHIFR.Value;
    aNm := cdsopernm.Value;
    aKey := cdsOperKEY.Value;


    sql := 'update burnar.defnar set ownernar=:ownernar,createdate=:createdate'
    +',brigadir=:brigadir,narauthor=:narauthor'
    +',nartype=:nartype,shifr=:shifr,nm=:nm where key=:key';

    frmMain.mConnection.ExecSQL(SQL, [aOwnernar, aCreatedate, aBrigadir, aNarauthor, aNartype, aShifr, aNm, aKey]);
    
    Application.MessageBox(Pchar(MsgChangeSavedRu),pchar(MsgAttentionRu),
      MB_OK+MB_ICONEXCLAMATION); //сигналим об успешном сохранении
    ResetFieldFont; //убираем выделение, если было
  finally
    cdsOper.Close;
    cdsOper.Open;
   // DBEdBRIGADIRNM.Refresh;
//    stmtParams.Free;

//    frmNarList.sSpeedButton5Click(sender); //пока убрал, не понятно для чего это здесь. стреляет, если окно списка нарядов не открыто

  end;
end;

constructor TfrmGlobalVar.CreateEx(aOwner: TComponent; akeynar: integer);
var str_, fname: string;
i :integer;
begin
  inherited Create(AOwner);
  fkeynar := akeynar;
  //если есть файл с конфигурацией, читаем все настройки объектов оттуда
  fname := ExtractFilePath(PathAndCfgFileName)+ClassName+FrmExtUserRes;
  if FileExists( fname ) then //файл настроек найден
  begin
    DestroyComponents;
//    LoadComponentFromTextFile(self, fname);
  end;
  Caption := 'Общая информация по наряду: '+IntToStr(fkeynar);

  SQLQueryKOD.parambyname('nar').Value := akeynar;
  cdsOper.open;
  IsClosed := cdsOper.FieldByName('IsClosed').AsInteger;

{
  if cdsOper.FieldByName('IsClosed').AsInteger=1  then  //12.07.2011 Frolov_AA

  //если стоим на строчке с параметром КУСТ или МЕСТОРОЖДЕНИЕ, то дизэблим грид на редактирование
  if (ClientDataSet1PARCODE.AsInteger = 5) or (ClientDataSet1PARCODE.AsInteger = 470) or (ClientDataSet1PARCODE.AsInteger = 4624) or (ClientDataSet1PARCODE.AsInteger = 4627)  then
  begin
    DBGrid1.Options := DBGrid1.Options - [dgEditing];
  end
  else if (ClientDataSet1PARCODE.AsInteger = 149) then//and (TDBGrid(Sender).DataSource.DataSet.FieldAddress('NM').Focused = true) then
  begin

      DBGrid1.Options := DBGrid1.Options + [dgEditing];
      DBGrid1.Columns.Items[6].ReadOnly := true;
      DBGrid1.Columns.Items[7].ReadOnly := true;
  end;
}
{    begin
      DBGrid1.ReadOnly:=True;
      DBGrid1.Options:=DBGrid1.Options-[dgEditing]+[dgrowselect];
    end;
}
  qrParamAndZn.ParamByName('nar').Value := akeynar;
  ClientDataSet1.Open;



////////////////////////////////////////////////////////////////////////////////////////////////////
//загрузка типов скважин
   try
      str_ := 'select id, sname from pr.pr_type_skv order by ord';
      qryEdit.Close;
      qryEdit.SQL.Text := str_;
      qryEdit.Open;
      qryEdit.first;
    if qryEdit.recordcount > 0
    then begin
       clbxType.Clear;
       while not qryEdit.Eof
       do begin
          ClbxType.Items.AddObject(qryEdit.fields[1].asstring,TObject(qryEdit.fields[0].asinteger));
          qryEdit.Next;
       end;
    end;


  //загрузка типа скважины
    qryEdit.Close;
    qryEdit.SQL.Text := 'select PARKEY from burnar.NARPARANPR  where PARTYPE = 1 and narkey = ' + IntToStr(fkeynar);
    qryEdit.open;
    qryEdit.first;

    while not qryEdit.Eof do
    begin

    for i := 0 to ClbxType.Items.Count-1 do
    begin
      if  integer(ClbxType.items.Objects[i]) = qryEdit.fieldbyname('PARKEY' ).AsInteger then
       begin
           ClbxType.Checked[i] := true;
       end;
//      else  ClbxType.Checked[i] := false;
    end;
    qryEdit.Next;
    end;

   except on e:exception
     do begin
      ShowMessage(e.message);
    end; //инфа о пользователе
  end;
////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////
//загрузка параметров
   try
      str_ := 'select id, sname from pr.pr_identifikator where type in (3, 4) order by ORD';
      qryEdit.Close;
      qryEdit.SQL.Text := str_;
      qryEdit.Open;
      qryEdit.first;
    if qryEdit.recordcount > 0
    then begin
       clbxPar.Clear;
       while not qryEdit.Eof
       do begin
          clbxPar.Items.AddObject(qryEdit.fields[1].asstring,TObject(qryEdit.fields[0].asinteger));
          qryEdit.Next;
       end;
    end;

  ////////////подгружаем список выбранных параметров////////////////////////
    qryEdit.close;
    qryEdit.SQL.Text := 'select PARKEY from burnar.NARPARANPR  where PARTYPE = 2 and narkey = ' + IntToStr(fkeynar);;
    qryEdit.open;
    qryEdit.first;


  ////////ПРОБЕГАЕМСЯ ПО ВСЕМ ПАРАМЕТРАМ и чекаем в листбоксе/////////////////////////////
    while not qryEdit.Eof do
    begin

    for i := 0 to ClbxPar.Items.Count-1 do
    begin
       if integer(ClbxPar.items.Objects[i])= qryEdit.fieldbyname('PARKEY').AsInteger then
       begin
          ClbxPar.Checked[i] := true;
       end;
    end;
    qryEdit.Next;
    end;

    qryEdit.close;


   except on e:exception
     do begin
      ShowMessage(e.message);
    end; //инфа о пользователе
  end;
////////////////////////////////////////////////////////////////////////////////////////////////////

end;

procedure TfrmGlobalVar.WMOffDsgnMode(var Message: TMessage);
begin
  Caption := 'Общая информация по наряду: '+IntToStr(fkeynar);
  SQLQueryKOD.parambyname('nar').Value := frmMain.keynar;
  cdsOper.open;

  qrParamAndZn.parambyname('nar').Value := frmMain.keynar;
  ClientDataSet1.Open;
end;

procedure TfrmGlobalVar.WMOnDsgnMode(var Message: TMessage);
begin
  Caption := '';
  cdsOper.Close;
  ClientDataSet1.Close;
end;

procedure TfrmGlobalVar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  //Измененные записи ЖИРНЫЕ
  if ClientDataSet1.UpdateStatus = usModified then
      TDbGrid(Sender).Canvas.Font.Style := TDbGrid(Sender).Canvas.Font.Style+[fsBold];
  //Новые записи КРАСНЫЕ
  if ClientDataSet1.UpdateStatus = usInserted then
      TDbGrid(Sender).Canvas.Font.Color := clRed;

	if (ClientDataSet1PARCODE.AsInteger = 5) or (ClientDataSet1PARCODE.AsInteger = 470) then
	with  DBGrid1.Canvas do
	begin
//		Brush.Color:=clGreen;
		Font.Color:=clGray;
//		FillRect(Rect);
//		TextOut(Rect.Left+2,Rect.Top+2,Column.Field.Text);
	end;

  TDbGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmGlobalVar.DBGrid1TitleClick(Column: TColumn);
var i: integer;
begin
  ClientDataSet1.IndexFieldNames := Column.FieldName; //клиентская сорировка
  for i := 0 to DBGrid1.Columns.Count - 1 do      //+-цвет
    if DBGrid1.Columns.Items[i] <> Column then
      DBGrid1.Columns.Items[i].Title.Font.Style := DBGrid1.Columns.Items[i].Title.Font.Style - [fsBold];
  Column.Title.Font.Style := Column.Title.Font.Style + [fsBold];
end;

procedure TfrmGlobalVar.SpeedButton8Click(Sender: TObject);
begin
  ClientDataSet1.Locate(
    DBGrid1.SelectedField.FieldName, EditFind.Text, [loPartialKey,loCaseInsensitive]
    );
end;

procedure TfrmGlobalVar.sSpeedButton13Click(Sender: TObject);
begin
  ClientDataSet1.First;
end;

procedure TfrmGlobalVar.sSpeedButton14Click(Sender: TObject);
begin
  ClientDataSet1.Prior;
end;

procedure TfrmGlobalVar.sSpeedButton15Click(Sender: TObject);
begin
  ClientDataSet1.Next;
end;

procedure TfrmGlobalVar.sSpeedButton16Click(Sender: TObject);
begin
  ClientDataSet1.Last;
end;

procedure TfrmGlobalVar.sSpeedButton9Click(Sender: TObject);
begin
  if ClientDataSet1.State = dsEdit then ClientDataSet1.Post;
end;

procedure TfrmGlobalVar.sSpeedButton4Click(Sender: TObject);
begin
  ClientDataSet1.RevertRecord;
end;

procedure TfrmGlobalVar.sSpeedButton3Click(Sender: TObject);
begin
  ClientDataSet1.CancelUpdates;
end;

procedure TfrmGlobalVar.sSpeedButton2Click(Sender: TObject);
begin
  ClientDataSet1.UndoLastChange(True);
end;

procedure TfrmGlobalVar.sSpeedButton1Click(Sender: TObject);
begin
  {сохраняем специфичный для типа нарядов набор}
  if ClientDataSet1.ChangeCount > 0 then //если изменения вообще были
  begin
    {запускаем процесс сохранения кэша на сервере}
    if ClientDataSet1.ApplyUpdates(0) = 0 then //если без единой ошибки
      Application.MessageBox(Pchar(MsgChangeSavedRu),pchar(MsgAttentionRu),
        MB_OK+MB_ICONEXCLAMATION); //сигналим об успешном сохранении
  end;
end;

procedure TfrmGlobalVar.DBGrid1EditButtonClick(Sender: TObject);
var
  params: TStringList;
  parcode_ : integer;
begin
  Params := TStringList.create;
  try
  parcode_ :=  ClientDataSet1PARCODE.AsInteger;
  if (parcode_ = 149) or (parcode_ = 5) or (parcode_ = 470) then
     btnFindSKV.Click
  else
  begin
    if GetSprHierarchyItem(ClientDataSet1ZNVAL.AsString, ClientDataSet1NM.Value
           ,ClientDataSet1PARCODE.AsString,Params) = mrOk then
    begin
      ClientDataSet1.Edit;
      ClientDataSet1.FieldByName('ZNVAL').Value := Params.Values['KeyVal'];
      ClientDataSet1.FieldByName('ZNNM').Value := Params.Values['Znach'];
      if (parcode_ = 149) then
         ClientDataSet1.FieldByName('VALSTR').Value := Params.Values['Znach'];

      ClientDataSet1.post;
    end;
  end;

  finally
    Params.Destroy;
  end
end;

procedure TfrmGlobalVar.ClientDataSet1AfterOpen(DataSet: TDataSet);
begin
  StatusBar1.Panels[0].Text :=
    'Всего запрошено с сервера записей: ' + IntToStr(DataSet.RecordCount);
end;

procedure TfrmGlobalVar.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  If TDBGrid(Sender).SelectedField.FieldName = 'ZNNM' then
     key:= #0;
end;

procedure TfrmGlobalVar.DBGrid1CellClick(Column: TColumn);
begin
//  ShowMessage(ClientDataSet1PARCODE.AsString);


  //Можем редактировать только поле скважина в ЗАКРЫТЫХ НАРЯДАХ (из-за дубляжей скважин в справочнике, сделали возможность изменять скважину без перерасчета наряда! 30.11.2016 Шестаков Д.А.)
  if Isclosed = 0 then
    if (ClientDataSet1PARCODE.AsInteger = 5) or (ClientDataSet1PARCODE.AsInteger = 470) then//если стоим на строчке с параметром КУСТ или МЕСТОРОЖДЕНИЕ, то дизэблимгрид на редактирование
    begin
      DBGrid1.Options := DBGrid1.Options - [dgEditing];
    end
    else if (ClientDataSet1PARCODE.AsInteger = 149) then//and (TDBGrid(Sender).DataSource.DataSet.FieldAddress('NM').Focused = true) then
    begin
        DBGrid1.Options := DBGrid1.Options + [dgEditing];
        DBGrid1.Columns.Items[6].ReadOnly := true;
        DBGrid1.Columns.Items[7].ReadOnly := true;
    end
    else
    begin
        DBGrid1.Options := DBGrid1.Options + [dgEditing];
        DBGrid1.Columns.Items[6].ReadOnly := false;
        DBGrid1.Columns.Items[7].ReadOnly := false;
    end
  else
    //если стоим на строчке с параметром КУСТ или МЕСТОРОЖДЕНИЕ, то дизэблимгрид на редактирование, можем редактировать только поле скважина в ЗАКРЫТЫХ НАРЯДАХ
    if (ClientDataSet1PARCODE.AsInteger = 5) or (ClientDataSet1PARCODE.AsInteger = 470) or (ClientDataSet1PARCODE.AsInteger = 4624) or (ClientDataSet1PARCODE.AsInteger = 4627) then
    begin
      DBGrid1.Options := DBGrid1.Options - [dgEditing];
    end
    else if (ClientDataSet1PARCODE.AsInteger = 149) then//and (TDBGrid(Sender).DataSource.DataSet.FieldAddress('NM').Focused = true) then
    begin
        DBGrid1.Options := DBGrid1.Options + [dgEditing];
        DBGrid1.Columns.Items[6].ReadOnly := true;
        DBGrid1.Columns.Items[7].ReadOnly := true;
    end;


end;

procedure TfrmGlobalVar.btnFindSKVClick(Sender: TObject);
var
  SgrdRow : integer;
begin

    // if GeneralParam.MainPodrID in [1,167]
    //         then podr_id := 0
    //         else podr_id := GeneralParam.MainPodrID;
         ClientDataSet1.Locate('PARCODE','149',[]);
         SkvStr := ClientDataSet1.FieldByName('ZNNM').asstring;
         SkvId  := ClientDataSet1.FieldByName('ZNVAL').asstring;

         ClientDataSet1.Locate('PARCODE','5',[]);
         MestStr := ClientDataSet1.FieldByName('ZNNM').asstring;
         ClientDataSet1.Locate('PARCODE','470',[]);
         KustStr := ClientDataSet1.FieldByName('ZNNM').asstring;

        // SkvStr := UpperCase(SkvStr);
         SkvStr  := StringReplace(SkvStr ,'СКВ.','',[rfIgnoreCase]);
         KustStr := StringReplace(KustStr,'К.'  ,'',[rfIgnoreCase]);

    with TfrmSkvFind.Create(Application)
    do begin



        if ShowModal = mrOk
        then begin
          if strgrdSkv.Cells[1,1] <> ''
          then begin


              SgrdRow := strgrdSkv.Row;

            //Скважины
              ClientDataSet1.Locate('PARCODE','149',[]);
              if ClientDataSet1.FieldByName('ZNVAL').asstring <> strgrdSkv.Cells[5,SgrdRow]
              then begin
                 ClientDataSet1.Edit;
                 ClientDataSet1.FieldByName('ZNNM').asstring   := strgrdSkv.Cells[11,SgrdRow];
                 ClientDataSet1.FieldByName('ZNVAL').asstring  := strgrdSkv.Cells[5,SgrdRow];
                 ClientDataSet1.FieldByName('VALSTR').asstring := strgrdSkv.Cells[11,SgrdRow];
                 ClientDataSet1.post;
              end;
            //Кусты
              ClientDataSet1.Locate('PARCODE','470',[]);
              if ClientDataSet1.FieldByName('ZNVAL').asstring <> strgrdSkv.Cells[6,SgrdRow]
              then begin
                 ClientDataSet1.Edit;
                 ClientDataSet1.FieldByName('ZNNM').asstring     := strgrdSkv.Cells[12,SgrdRow];
                 ClientDataSet1.FieldByName('ZNVAL').asstring    := strgrdSkv.Cells[6,SgrdRow];
                 ClientDataSet1.FieldByName('ValStr').asstring   := strgrdSkv.Cells[12,SgrdRow];
                 ClientDataSet1.post;
              end;

            //Месторождения
            ClientDataSet1.Locate('PARCODE','5',[]);
            if ClientDataSet1.FieldByName('ZNVAL').asstring <> strgrdSkv.Cells[7,SgrdRow]
            then begin
              ClientDataSet1.Edit;
              ClientDataSet1.FieldByName('ZNNM').asstring     := strgrdSkv.Cells[3,SgrdRow];
              ClientDataSet1.FieldByName('ZNVAL').asstring    := strgrdSkv.Cells[7,SgrdRow];
              ClientDataSet1.FieldByName('ValStr').asstring   := strgrdSkv.Cells[3,SgrdRow];
              ClientDataSet1.post;
            end;

          end;
      end;
       Close;
   end;
end;
procedure TfrmGlobalVar.FormShow(Sender: TObject);
begin
 {   if cdsOper.FieldByName('IsClosed').AsInteger <> 0  then  //12.07.2011 Frolov_AA
    begin
      DBGrid1.ReadOnly:=True;
      btnFindSKV.Enabled := false;
      DBGrid1.Options:=DBGrid1.Options-[dgEditing]+[dgrowselect];
    end;}
end;

procedure TfrmGlobalVar.ToolButton12Click(Sender: TObject);
var
   Str_ : string;
   i, j : integer;
begin
    try
      /////////////////////////////////////////////////////////////////////////////
      //запись доп параметров из грида

        Str_ := '';
        Str_ := 'delete from burnar.NARPARANPR where PARTYPE = 2 and narkey = '  + inttostr(fkeynar);
        qryEdit.Close;
        qryEdit.SQL.Text := Str_;
        qryEdit.ExecSQL;
        qryEdit.Close;


        //запись доп параметров
        /////////////////////////////////////////////////////////
        for i := 0 to ClbxPar.Items.Count - 1
        do begin
           if ClbxPar.Checked[i] = true
           then begin
           str_ := ' insert into burnar.NARPARANPR(narkey, PARTYPE, PARKEY) values ( ' + IntToStr(fkeynar) + ', 2,' + '' + inttostr(integer(ClbxPar.items.Objects[i])) + ' ) ';

           qryEdit.Close;
           qryEdit.SQL.Text := Str_;
           qryEdit.ExecSQL;
           end;
        end;


        /////////////////////////////////////////////////////////////////////////////////
        // Тип скважины
        Str_ := '';
        Str_ := 'delete from burnar.NARPARANPR where PARTYPE = 1 and narkey = '  + inttostr(fkeynar);
        qryEdit.Close;
        qryEdit.SQL.Text := Str_;
        qryEdit.ExecSQL;
        qryEdit.Close;

      ////////////////////////////////////////////////////////////////////////
      //пробежимся по выбранным параметрам, заинсертим все в табл. NARPARANPR
         for i := 0 to ClbxType.items.count - 1
         do begin
                if ClbxType.Checked[i] = true then
                begin
                  Str_ := '';
                  str_ := ' insert into burnar.NARPARANPR(narkey, PARTYPE, PARKEY) values ( ' + IntToStr(fkeynar) + ', 1,' + '' + inttostr(integer(ClbxType.items.Objects[i])) + ' ) ';
                  qryEdit.Close;
                  qryEdit.SQL.Text := Str_;
                  qryEdit.ExecSQL;
                  qryEdit.Close;
                end;
         end;

    except on e:exception
    do begin
        showmessage('Ошибка записи'+#10#13+e.Message);
    end;
    end;
end;

procedure TfrmGlobalVar.ClbxTypeClickCheck(Sender: TObject);
var
i,J : integer;
bkf,kondkf : real;

begin

  with Sender as TCheckListBox
  do for i := 0  to Items.Count - 1
     do begin
        if Checked[i] and not Selected[i]
        then Checked[i] := false;
        if not Checked[i] and  Selected[i]
        then Checked[i] := true;
     end;



end;

end.
