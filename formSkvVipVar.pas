unit formSkvVipVar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, StdCtrls, DBCtrls, Mask, Provider, DBClient,
  SqlExpr, Grids, DBGrids, Buttons, Ora, MemDS, DBAccess,
  ComCtrls, ToolWin, ExtCtrls, PgAccess;

type
  TfrmSkvVipVar = class(TForm)
    DBGrid1: TDBGrid;
    qrParAndZnFact: TPgQuery;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    DataSource1: TDataSource;
    SQLQuery2: TPgQuery;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    DataSource2: TDataSource;
    SVIPOLNENIE_SET_DATE: TPgStoredProc;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    EditFind: TEdit;
    ToolButton6: TToolButton;
    Panel2: TPanel;
    DBChFactCLOSED: TDBCheckBox;
    DBEdFACTBEGDATE: TDBEdit;
    Label2: TLabel;
    DBEdFactCLOSEDDATE: TDBEdit;
    DBEdVIPENDDATE: TDBEdit;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    ToolBar2: TToolBar;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    qrParAndZnFactdefnar: TIntegerField;
    qrParAndZnFactprnum: TFloatField;
    qrParAndZnFactparcode: TFloatField;
    qrParAndZnFactnm: TStringField;
    qrParAndZnFactznval: TFloatField;
    qrParAndZnFactznnm: TStringField;
    qrParAndZnFactval: TFloatField;
    qrParAndZnFactvalstr: TStringField;
    ClientDataSet1defnar: TIntegerField;
    ClientDataSet1prnum: TFloatField;
    ClientDataSet1parcode: TFloatField;
    ClientDataSet1nm: TStringField;
    ClientDataSet1znval: TFloatField;
    ClientDataSet1znnm: TStringField;
    ClientDataSet1val: TFloatField;
    ClientDataSet1valstr: TStringField;
    SQLQuery2narkey: TIntegerField;
    SQLQuery2begdate: TDateTimeField;
    SQLQuery2enddate: TDateTimeField;
    SQLQuery2closed: TFloatField;
    SQLQuery2closeddate: TDateTimeField;
    ClientDataSet2narkey: TIntegerField;
    ClientDataSet2begdate: TDateTimeField;
    ClientDataSet2enddate: TDateTimeField;
    ClientDataSet2closed: TFloatField;
    ClientDataSet2closeddate: TDateTimeField;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure sSpeedButton9Click(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure ClientDataSet1ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataSetProvider1BeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure sSpeedButton13Click(Sender: TObject);
    procedure sSpeedButton14Click(Sender: TObject);
    procedure sSpeedButton15Click(Sender: TObject);
    //function SelectParamFromCommon_Spr(curID, parID : Integer; const aCaption: String) : Integer;
    procedure ClientDataSet2BEGDATEChange(Sender: TField);
    procedure ClientDataSet2CLOSEDChange(Sender: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ClientDataSet1AfterOpen(DataSet: TDataSet);
    procedure sSpeedButton5Click(Sender: TObject);
    procedure sSpeedButton6Click(Sender: TObject);
    procedure sSpeedButton7Click(Sender: TObject);
    procedure sSpeedButton8Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure DBEdFACTBEGDATEEnter(Sender: TObject);
  private
    procedure ResetFactFieldFont;
  public
    constructor CreateEx(aOwner: TComponent; akeynar: integer);
  end;

//var frmSkvVipVar: TfrmSkvVipVar;

implementation

uses MainUnit,OVNIGrids,CommSprUnit,HIERARCHY1,formReconcileError
  ,CommonNarVipUnit;

{$R *.dfm}

constructor TfrmSkvVipVar.CreateEx(aOwner: TComponent; akeynar: integer);
var fname: string;
begin
  inherited Create(AOwner);
  //fkeynar := akeynar;
  //если есть файл с конфигурацией, читаем все настройки объектов оттуда
  fname := ExtractFilePath(PathAndCfgFileName)+ClassName+FrmExtUserRes;
  if FileExists( fname ) then //файл настроек найден
  begin
    DestroyComponents;
//    LoadComponentFromTextFile(self, fname);
  end;
  Caption := 'Сквозные параметры выполнения (факт): '+IntToStr(akeynar);

  qrParAndZnFact.ParamByName('nar').Value := akeynar;
  SQLQuery2.parambyname('nar').Value := akeynar;
  ClientDataSet1.Open;
  ClientDataSet2.Open;
  MaskEdit1.Text:=DBEdfactBEGDATE.Text;
end;

procedure TfrmSkvVipVar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  //Измененные записи ЖИРНЫЕ
  if ClientDataSet1.UpdateStatus = usModified then
      TDbGrid(Sender).Canvas.Font.Style := TDbGrid(Sender).Canvas.Font.Style+[fsBold];
  //Новые записи КРАСНЫЕ
  if ClientDataSet1.UpdateStatus = usInserted then
      TDbGrid(Sender).Canvas.Font.Color := clRed;
  TDbGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmSkvVipVar.DBGrid1EditButtonClick(Sender: TObject);
var
  params: TStringList;
begin
  Params := TStringList.create;
  try
    if GetSprHierarchyItem(ClientDataSet1ZNVAL.AsString, ClientDataSet1NM.Value
      ,ClientDataSet1PARCODE.AsString,Params) = mrOk then
    begin
      ClientDataSet1.Edit;
      ClientDataSet1.FieldByName('ZNVAL').Value := Params.Values['KeyVal'];
      ClientDataSet1.FieldByName('ZNNM').Value := Params.Values['Znach'];
    end;
  finally
    Params.Destroy;
  end
end;

procedure TfrmSkvVipVar.DBGrid1TitleClick(Column: TColumn);
var
    i : integer;
begin
    ClientDataSet1.IndexFieldNames := Column.FieldName;
    for i := 0 to DBGrid1.Columns.Count - 1 do      //+-цвет
        if DBGrid1.Columns.Items[i] <> Column then
            DBGrid1.Columns.Items[i].Title.Font.Style := DBGrid1.Columns.Items[i].Title.Font.Style - [fsBold];
    Column.Title.Font.Style := Column.Title.Font.Style + [fsBold];
end;

procedure TfrmSkvVipVar.sSpeedButton9Click(Sender: TObject);
begin
  if ClientDataSet1.State = dsEdit then ClientDataSet1.Post;
end;

procedure TfrmSkvVipVar.sSpeedButton4Click(Sender: TObject);
begin
  ClientDataSet1.RevertRecord;
end;

procedure TfrmSkvVipVar.sSpeedButton3Click(Sender: TObject);
begin
  ClientDataSet1.CancelUpdates;
end;

procedure TfrmSkvVipVar.sSpeedButton2Click(Sender: TObject);
begin
  ClientDataSet1.UndoLastChange(True);
end;

procedure TfrmSkvVipVar.sSpeedButton1Click(Sender: TObject);
begin
  if MessageDlg('Внимание! Вы изменили сквозные параметры наряда.'+
     #13+'Расчетные работы, в которых сквозные параметры являются нормообразующими, будут обнулены.'+
    #13+'Вы уверены, что хотите изменить сквозные параметры?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  {сохраняем специфичный для типа нарядов набор}
  if ClientDataSet1.ChangeCount > 0 then //если изменения вообще были
  begin
    {запускаем процесс сохранения кэша на сервере}
    if ClientDataSet1.ApplyUpdates(0) = 0 then //если без единой ошибки
      Application.MessageBox(Pchar(MsgChangeSavedRu),pchar(MsgAttentionRu),
        MB_OK+MB_ICONEXCLAMATION); //сигналим об успешном сохранении
   ClientDataSet1.Refresh;
   TfrmComNarVip(Owner).qrNarvip.Open;
   TfrmComNarVip(Owner).trGrdNar.UpdateTree(TfrmComNarVip(Owner).qrNarvip,'key',['istnorm','n1','n2']);
   TfrmComNarVip(Owner).trGrdNar.Invalidate;
   TfrmComNarVip(Owner).qrNarvip.Close;
  end;
end;

procedure TfrmSkvVipVar.ClientDataSet1ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  //обработка ошибок при сохранении данных на серваке
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TfrmSkvVipVar.DataSetProvider1BeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
//  stmtParams: TParams;
  sql: string;
  aVal, aValcont, aValstr, aKeynar, aNumpar : variant;
begin
//  stmtParams := TParams.Create;
  try
//    stmtParams.CreateParam(ftBCD, 'val', ptInput);
    //поле изменилось
    if (DeltaDs.FieldByName('znval').NewValue <> DeltaDs.FieldByName('znval').OldValue) and
       (DeltaDs.FieldByName('znval').OldValue <> Unassigned)
    then
//      stmtParams.ParamByName('val').Value := DeltaDs.FieldByName('znval').NewValue
      aVal := DeltaDs.FieldByName('znval').NewValue
    else
      //поле не изменилось
      if DeltaDs.FieldByName('znval').OldValue <> Unassigned then //а было ли там вообще что-то?
//        stmtParams.ParamByName('val').Value := DeltaDs.FieldByName('znval').OldValue
        aVal := DeltaDs.FieldByName('znval').OldValue
      else
//        stmtParams.ParamByName('val').Value := 'null';
        aVal := 'null';

//    stmtParams.CreateParam(ftBCD, 'valcont', ptInput);
    if DeltaDs.FieldByName('val').NewValue <> DeltaDs.FieldByName('val').oldvalue then
//      stmtParams.ParamByName('valcont').Value := DeltaDs.FieldByName('val').NewValue
      aValcont := DeltaDs.FieldByName('val').NewValue
    else //поле не изменилось
//      stmtParams.ParamByName('valcont').Value := DeltaDs.FieldByName('val').OldValue;
      aValcont := DeltaDs.FieldByName('val').OldValue;

    //работаем со строковым полем
    if DeltaDs.FieldByName('valstr').NewValue <> DeltaDs.FieldByName('valstr').OldValue then
//      sql := format('update burnar.zndefnarvipatrib set znval=:val,val=:valcont,valstr=%s where defnar=:narkey and parcode=:numpar'
//        ,[quotedstr(DeltaDs.FieldByName('valstr').NewValue)])

       aValstr := DeltaDs.FieldByName('valstr').NewValue

    else
//      sql := format('update burnar.zndefnarvipatrib set znval=:val,val=:valcont,valstr=%s where defnar=:narkey and parcode=:numpar'
//        ,[{'null'}quotedstr(DeltaDs.FieldByName('valstr').OldValue)]);
       aValstr := DeltaDs.FieldByName('valstr').OldValue;

//    stmtParams.CreateParam(ftBCD, 'narkey', ptInput);
//    stmtParams.ParamByName('narkey').AsBCD := DeltaDs.FieldByName('defnar').OldValue;
    aKeynar := DeltaDs.FieldByName('defnar').OldValue;
//    stmtParams.CreateParam(ftBCD, 'numpar', ptInput);
//    stmtParams.ParamByName('numpar').AsBCD := DeltaDs.FieldByName('parcode').OldValue;
    aNumpar := DeltaDs.FieldByName('parcode').OldValue;

   // sql := 'update burnar.zndefnarvipatrib set znval=:val,val=:valcont,valstr=:valstr where defnar=:narkey and parcode=:numpar';

    sql :=  Format('update burnar.zndefnarvipatrib set znval=%s,val=%s,valstr=%s where defnar=%s and parcode=%s',
                       [isZero(aVal), isZero(aValcont), isZero(aValstr, true), isZero(aKeynar), isZero(aNumpar)]
                   );

   // frmMain.mConnection.ExecSQL(SQL, [aVal, aValcont, aValstr, aKeynar, aNumpar]);
   frmMain.mConnection.ExecSQL(sql)
  finally
//    stmtParams.Free;
  end;

  Applied := True; //уведомляем провайдер, что изменения выполняем вручную

end;

procedure TfrmSkvVipVar.sSpeedButton13Click(Sender: TObject);
begin
  if ClientDataSet2.State = dsEdit then ClientDataSet2.Post;
end;

procedure TfrmSkvVipVar.sSpeedButton14Click(Sender: TObject);
begin
  ClientDataSet2.RevertRecord;
  ResetFactFieldFont;
end;

procedure TfrmSkvVipVar.sSpeedButton15Click(Sender: TObject);
begin
MaskEdit1.OnExit(sender);
  if ClientDataSet2.State = dsEdit then ClientDataSet2.Post;
  if ClientDataSet2.ChangeCount > 0 then //если изменения вообще были
    if ClientDataSet2.ApplyUpdates(0) = 0 then //если без единой ошибки
    begin
      Application.MessageBox(Pchar(MsgChangeSavedRu),pchar(MsgAttentionRu),
        MB_OK+MB_ICONEXCLAMATION); //сигналим об успешном сохранении
      ResetFactFieldFont;
      ClientDataSet2.Refresh;
    end;
    SVIPOLNENIE_SET_DATE.ParamByName('nkey').Value:=qrParAndZnFact.ParamByName('nar').Value;
    SVIPOLNENIE_SET_DATE.ExecProc;
    TfrmComNarVip(Owner).tbReloadNarClick(self)
end;

procedure TfrmSkvVipVar.ResetFactFieldFont;
begin
  DBEdFACTBEGDATE.Font.Style := DBEdFACTBEGDATE.Font.Style-[fsBold];
  DBChFactCLOSED.Font.Style := DBChFactCLOSED.Font.Style-[fsBold];
end;

procedure TfrmSkvVipVar.ClientDataSet2BEGDATEChange(Sender: TField);
begin
  DBEdFACTBEGDATE.Font.Style := DBEdFACTBEGDATE.Font.Style+[fsBold];
end;

procedure TfrmSkvVipVar.ClientDataSet2CLOSEDChange(Sender: TField);
begin
  DBChFactCLOSED.Font.Style := DBChFactCLOSED.Font.Style+[fsBold];
end;

procedure TfrmSkvVipVar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SQLQuery2.Close;
  qrParAndZnFact.close;
  //frmSkvVipVar := nil;
  Action := caFree;
end;

procedure TfrmSkvVipVar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If ((GetKeyState(VK_CONTROL) AND 128)=128) and
     ((GetKeyState(VK_SHIFT) AND 128)=128) and
     ((GetKeyState(ord('K')) AND 128)=128) then
    DBChFactCLOSED.ReadOnly := not DBChFactCLOSED.ReadOnly;
end;

procedure TfrmSkvVipVar.ClientDataSet1AfterOpen(DataSet: TDataSet);
begin
  StatusBar1.Panels[0].Text :=
    'Всего запрошено с сервера записей: ' + IntToStr(DataSet.RecordCount);
end;

procedure TfrmSkvVipVar.sSpeedButton5Click(Sender: TObject);
begin
  ClientDataSet1.First;
end;

procedure TfrmSkvVipVar.sSpeedButton6Click(Sender: TObject);
begin
  ClientDataSet1.prior;
end;

procedure TfrmSkvVipVar.sSpeedButton7Click(Sender: TObject);
begin
  ClientDataSet1.next;
end;

procedure TfrmSkvVipVar.sSpeedButton8Click(Sender: TObject);
begin
  ClientDataSet1.Last;
end;

procedure TfrmSkvVipVar.SpeedButton8Click(Sender: TObject);
begin
  ClientDataSet1.Locate(
    DBGrid1.SelectedField.FieldName, EditFind.Text, [loPartialKey,loCaseInsensitive]);
end;

procedure TfrmSkvVipVar.FormShow(Sender: TObject);
var
  i: integer;
begin
  //если Выполнение закрыто от изменений, disable-им элементы   ****11.07.2011 Frolov_AA
  if DBChFactCLOSED.Checked or TfrmComNarVip(Owner).lLocked then
    begin
      for i:=0 to ControlCount - 1 do
        if (Controls[i].Name <> 'EditFind') and (Controls[i].Name <> 'SpeedButton8') then
          begin
           if Controls[i] is TSpeedButton then
             Controls[i].Enabled:=false;
           if Controls[i] is TDBGrid then
             with (Controls[i] as TDBGrid) do
               begin
                 ReadOnly:=True;
                 Options:=Options-[dgEditing]+[dgrowselect];
               end;
           if Controls[i] is TDBEdit then
             (Controls[i] as TDBEdit).ReadOnly:=True;
          end;
      DBGrid1.OnEditButtonClick:=nil;
    end;
end;

procedure TfrmSkvVipVar.MaskEdit1Exit(Sender: TObject);
begin
 ClientDataSet2.Edit;
 DBEdfactBEGDATE.Text:= MaskEdit1.Text;
 ClientDataSet2BEGDATEChange(ClientDataSet2BEGDATE);
 ClientDataSet2.Post;
 //DBEdPLANBEGDATE.Text:=MaskEdit1.Text;
 MaskEdit1.Visible:=false;
end;

procedure TfrmSkvVipVar.DBEdFACTBEGDATEEnter(Sender: TObject);
begin
if ToolButton7.Enabled then
begin
 MaskEdit1.Left:= DBEdfactBEGDATE.Left;
 MaskEdit1.top:= DBEdfactBEGDATE.top;
 MaskEdit1.Width:= DBEdfactBEGDATE.Width;
 MaskEdit1.Height:= DBEdfactBEGDATE.Height;
 MaskEdit1.Visible:=true;
 MaskEdit1.SetFocus;
end;
end;

end.
