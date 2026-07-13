unit formSkvZadVar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, StdCtrls, DBCtrls, Mask, Provider, DBClient,
  SqlExpr, Grids, DBGrids, Buttons, ComCtrls,
  MemDS, DBAccess, ToolWin, ExtCtrls, PgAccess;

type
  TfrmSkvZadVar = class(TForm)
    DBGrid1: TDBGrid;
    qrParAndZnPlan: TPgQuery;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    DataSource1: TDataSource;
    SQLQuery2: TPgQuery;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    DataSource2: TDataSource;
    SZADANIE_SET_DATE: TPgStoredProc;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    EditFind: TEdit;
    ToolButton6: TToolButton;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    DBChBPLANCLOSED: TDBCheckBox;
    MaskEdit1: TMaskEdit;
    DBEdPLANCLOSEDDATE: TDBEdit;
    DBEdPLANBEGDATE: TDBEdit;
    ToolBar2: TToolBar;
    ToolButton15: TToolButton;
    ToolButton9: TToolButton;
    ToolButton14: TToolButton;
    ClientDataSet1defnar: TIntegerField;
    ClientDataSet1prnum: TFloatField;
    ClientDataSet1parcode: TFloatField;
    ClientDataSet1nm: TStringField;
    ClientDataSet1znval: TFloatField;
    ClientDataSet1znnm: TStringField;
    ClientDataSet1val: TFloatField;
    ClientDataSet1valstr: TStringField;
    qrParAndZnPlandefnar: TIntegerField;
    qrParAndZnPlanprnum: TFloatField;
    qrParAndZnPlanparcode: TFloatField;
    qrParAndZnPlannm: TStringField;
    qrParAndZnPlanznval: TFloatField;
    qrParAndZnPlanznnm: TStringField;
    qrParAndZnPlanval: TFloatField;
    qrParAndZnPlanvalstr: TStringField;
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
    procedure DBEdPLANBEGDATEEnter(Sender: TObject);
  private
    procedure ResetPLANFieldFont;
  public
    constructor CreateEx(aOwner: TComponent; akeynar: integer);
  end;

//var frmSkvZadVar: TfrmSkvZadVar;

implementation

uses MainUnit,OVNIGrids,CommSprUnit,HIERARCHY1,formReconcileError, CommonNarZadUnit;

{$R *.dfm}

constructor TfrmSkvZadVar.CreateEx(aOwner: TComponent; akeynar: integer);
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
  Caption := 'Сквозные параметры задания (план): '+IntToStr(akeynar);
  qrParAndZnPlan.ParamByName('nar').Value := akeynar;
  SQLQuery2.parambyname('nar').Value := akeynar;
  ClientDataSet1.Open;
  ClientDataSet2.Open;
  MaskEdit1.Text:=DBEdPLANBEGDATE.Text;
end;

procedure TfrmSkvZadVar.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmSkvZadVar.DBGrid1EditButtonClick(Sender: TObject);
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

procedure TfrmSkvZadVar.DBGrid1TitleClick(Column: TColumn);
var
    i : integer;
begin
  ClientDataSet1.IndexFieldNames := Column.FieldName;
  for i := 0 to DBGrid1.Columns.Count - 1 do      //+-цвет
    if DBGrid1.Columns.Items[i] <> Column then
      DBGrid1.Columns.Items[i].Title.Font.Style := DBGrid1.Columns.Items[i].Title.Font.Style - [fsBold];
  Column.Title.Font.Style := Column.Title.Font.Style + [fsBold];
end;

procedure TfrmSkvZadVar.sSpeedButton9Click(Sender: TObject);
begin
  if ClientDataSet1.State = dsEdit then ClientDataSet1.Post;
end;

procedure TfrmSkvZadVar.sSpeedButton4Click(Sender: TObject);
begin
  ClientDataSet1.RevertRecord;
end;

procedure TfrmSkvZadVar.sSpeedButton3Click(Sender: TObject);
begin
  ClientDataSet1.CancelUpdates;
end;

procedure TfrmSkvZadVar.sSpeedButton2Click(Sender: TObject);
begin
  ClientDataSet1.UndoLastChange(True);
end;

procedure TfrmSkvZadVar.sSpeedButton1Click(Sender: TObject);
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
   TfrmComNarzad(Owner).qrNarzad.Open;
   TfrmComNarzad(Owner).trGrdNar.UpdateTree(TfrmComNarzad(Owner).qrNarzad,'key',['istnorm','n1','n2']);
   TfrmComNarzad(Owner).trGrdNar.Invalidate;
   TfrmComNarzad(Owner).qrNarzad.Close;
  end;
end;

procedure TfrmSkvZadVar.ClientDataSet1ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  //обработка ошибок при сохранении данных на серваке
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TfrmSkvZadVar.DataSetProvider1BeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  sql: string;
  aVal, aValcont, aValstr, aKeynar, aNumpar : variant;
begin
  try
    //поле изменилось
    if (DeltaDs.FieldByName('znval').NewValue <> DeltaDs.FieldByName('znval').OldValue) and
       (DeltaDs.FieldByName('znval').OldValue <> Unassigned)
    then
      aVal := DeltaDs.FieldByName('znval').NewValue
    else
      //поле не изменилось
      if (DeltaDs.FieldByName('znval').OldValue <> Unassigned) and (DeltaDs.FieldByName('znval').OldValue <> null)then //а было ли там вообще что-то?
        aVal := DeltaDs.FieldByName('znval').OldValue
      else
        aVal := 'null';

    if DeltaDs.FieldByName('val').NewValue <> DeltaDs.FieldByName('val').oldvalue then
      aValcont := DeltaDs.FieldByName('val').NewValue
    else //поле не изменилось
      aValcont := DeltaDs.FieldByName('val').OldValue;

    //работаем со строковым полем
    if DeltaDs.FieldByName('valstr').NewValue <> DeltaDs.FieldByName('valstr').OldValue then
        aValstr := DeltaDs.FieldByName('valstr').NewValue
    else
        aValstr := DeltaDs.FieldByName('valstr').OldValue;

    sql := 'update burnar.zndefnarzadatrib set znval=:val,val=:valcont,valstr=:valstr where defnar=:narkey and parcode=:numpar';

    aKeynar := DeltaDs.FieldByName('defnar').OldValue;
    aNumpar := DeltaDs.FieldByName('parcode').OldValue;
{
    if (aValcont = '') or (aValcont = '0') then aValcont := 'null';

    sql := 'update burnar.zndefnarzadatrib ' +
           ' set znval= ' + aVal +
           ', val= ' + aValcont +
           ', valstr= ''' + aValstr + '''' +
           ' where defnar = ' + aKeynar +
           ' and parcode = ' + aNumpar;
}

    frmMain.mConnection.ExecSQL(SQL, [aVal, aValcont, aValstr, aKeynar, aNumpar]);
//    frmMain.mConnection.ExecSQL(SQL);
  finally
//    stmtParams.Free;
  end;

  Applied := True; //уведомляем провайдер, что изменения выполняем вручную

end;

procedure TfrmSkvZadVar.sSpeedButton13Click(Sender: TObject);
begin
  if ClientDataSet2.State = dsEdit then ClientDataSet2.Post;
end;

procedure TfrmSkvZadVar.sSpeedButton14Click(Sender: TObject);
begin
  ClientDataSet2.RevertRecord;
  ResetPLANFieldFont;
end;

procedure TfrmSkvZadVar.sSpeedButton15Click(Sender: TObject);
begin
  MaskEdit1.OnExit(sender);
  if ClientDataSet2.State = dsEdit then ClientDataSet2.Post;
  if ClientDataSet2.ChangeCount > 0 then //если изменения вообще были
    if ClientDataSet2.ApplyUpdates(0) = 0 then //если без единой ошибки
    begin
      Application.MessageBox(Pchar(MsgChangeSavedRu),pchar(MsgAttentionRu),
        MB_OK+MB_ICONEXCLAMATION); //сигналим об успешном сохранении
      ResetPLANFieldFont;
      ClientDataSet2.Refresh;
      TfrmComNarZad(Owner).tbReloadNarClick(self);                          // 14.07.2011 Frolov_AA автообновление наряда
    end;
    SZADANIE_SET_DATE.ParamByName('nkey').Value:=qrParAndZnPlan.ParamByName('nar').Value;
    SZADANIE_SET_DATE.ExecProc;
    TfrmComNarzad(Owner).tbReloadNarClick(self)
end;

procedure TfrmSkvZadVar.ResetPLANFieldFont;
begin
  DBEdPLANBEGDATE.Font.Style := DBEdPLANBEGDATE.Font.Style-[fsBold];
  DBChBPLANCLOSED.Font.Style := DBChBPLANCLOSED.Font.Style-[fsBold];
end;

procedure TfrmSkvZadVar.ClientDataSet2BEGDATEChange(Sender: TField);
begin
  DBEdPLANBEGDATE.Font.Style := DBEdPLANBEGDATE.Font.Style+[fsBold];
end;

procedure TfrmSkvZadVar.ClientDataSet2CLOSEDChange(Sender: TField);
begin
  DBChBPLANCLOSED.Font.Style := DBChBPLANCLOSED.Font.Style+[fsBold];
end;

procedure TfrmSkvZadVar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //frmSkvZadVar := nil;
  Action := caFree;
end;

procedure TfrmSkvZadVar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If ((GetKeyState(VK_CONTROL) AND 128)=128) and
     ((GetKeyState(VK_SHIFT) AND 128)=128) and
     ((GetKeyState(ord('K')) AND 128)=128) then
    DBChBPLANCLOSED.ReadOnly := not DBChBPLANCLOSED.ReadOnly;
end;

procedure TfrmSkvZadVar.ClientDataSet1AfterOpen(DataSet: TDataSet);
begin
  StatusBar1.Panels[0].Text :=
    'Всего запрошено с сервера записей: ' + IntToStr(DataSet.RecordCount);
end;

procedure TfrmSkvZadVar.sSpeedButton5Click(Sender: TObject);
begin
  ClientDataSet1.First;
end;

procedure TfrmSkvZadVar.sSpeedButton6Click(Sender: TObject);
begin
  ClientDataSet1.Prior;
end;

procedure TfrmSkvZadVar.sSpeedButton7Click(Sender: TObject);
begin
  ClientDataSet1.Next;
end;

procedure TfrmSkvZadVar.sSpeedButton8Click(Sender: TObject);
begin
  ClientDataSet1.Last;
end;

procedure TfrmSkvZadVar.SpeedButton8Click(Sender: TObject);
begin
  ClientDataSet1.Locate(
    DBGrid1.SelectedField.FieldName, EditFind.Text, [loPartialKey,loCaseInsensitive]
    );
  //DBGrid1.SetFocus;
end;

procedure TfrmSkvZadVar.FormShow(Sender: TObject);
var
  i: integer;
begin
  //если Задание закрыто от изменений, disable-им элементы   ****11.07.2011 Frolov_AA
  if DBChBPLANCLOSED.Checked then
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

procedure TfrmSkvZadVar.MaskEdit1Exit(Sender: TObject);
begin
 ClientDataSet2.Edit;
 DBEdPLANBEGDATE.Text:= MaskEdit1.Text;
 ClientDataSet2BEGDATEChange(ClientDataSet2BEGDATE);
 ClientDataSet2.Post;
 //DBEdPLANBEGDATE.Text:=MaskEdit1.Text;
 MaskEdit1.Visible:=false;
end;

procedure TfrmSkvZadVar.DBEdPLANBEGDATEEnter(Sender: TObject);
begin
if ToolButton15.Enabled then
begin
 MaskEdit1.Left:= DBEdPLANBEGDATE.Left;
 MaskEdit1.top:= DBEdPLANBEGDATE.top;
 MaskEdit1.Width:= DBEdPLANBEGDATE.Width;
 MaskEdit1.Height:= DBEdPLANBEGDATE.Height;
 MaskEdit1.Visible:=true;
 MaskEdit1.SetFocus;
end;
end;

end.
