unit formListPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ToolWin, Grids, OVNIGrids,
  OVNIDbControls, Buttons, FMTBcd, DB, SqlExpr,formEditNewPeriod,
  MemDS, DBAccess, Ora, PgAccess;

type
  TfrmListPeriod = class(TForm)
    grListPeriod: TOVNIDbGrid;
    qrPeriods: TPgQuery;
    BitBtn1: TBitBtn;
    ToolBar1: TToolBar;
    Edit1: TEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    narkey :integer;
    aorauser :string;
    closed : boolean;
    procedure loadlistperiod (anarkey :integer;aclosed:boolean);
   
  end;

var
  frmListPeriod: TfrmListPeriod;

implementation

uses MainUnit;

{$R *.dfm}

procedure TfrmListPeriod.ToolButton1Click(Sender: TObject);
begin
  with grListPeriod do
    Locate(GetField(Col,Row).Value, Edit1.Text, false, Row-FixedRows+1);
end;

procedure TfrmListPeriod.loadlistperiod (anarkey :integer; aclosed:boolean);
begin
  narkey:= anarkey;
  closed:= aclosed;
  qrPeriods.close;
  qrPeriods.ParamByName('keynar').Value:= anarkey;
  qrPeriods.Open;
  grListPeriod.LoadDataset(qrPeriods,['key']);
  qrPeriods.close;
      grListPeriod.ColWidths[0] := 30;
      grListPeriod.ColWidths[1] := 250;
      grListPeriod.ColWidths[2] := 150;
      grListPeriod.ColWidths[3] := 150;
  grListPeriod.Fields.SetTitles1(['nm', 'begoperdate', 'outoperdate', 'key'],
      ['Название','Дата начала работ', 'Дата окончания работ','Код']);
  if (grListPeriod.Recs.Count=0) then
  begin
    ToolButton3.Enabled:=false;
    ToolButton4.Enabled:=false;
  end
  else
  begin
    ToolButton3.Enabled:=true;
    ToolButton4.Enabled:=true;
  end ;
  if  aclosed then
  begin
    ToolButton2.Enabled:=false;
    ToolButton3.Enabled:=false;
    ToolButton4.Enabled:=false;
  end
  else
  begin
    ToolButton2.Enabled:=true;
    ToolButton3.Enabled:=true;
    ToolButton4.Enabled:=true;
  end


end;

procedure TfrmListPeriod.ToolButton2Click(Sender: TObject);
var newper: TfrmEditNewPeriod;
    sql : string;
begin
newper:= TfrmEditNewPeriod.Create(Owner);
newper.Caption:='Добавление нового периода';

newper.DatePicker1.DateTime := now();
newper.DatePicker2.DateTime := now();

if newper.ShowModal=mrOk then
  begin
    //инсертим на сервак
    sql:='insert into burnar.vipolnenie_period (USER_ID,NARKEY, nm,begoperdate,outoperdate) values('+
          '(select u.users_id from burnar.users u where upper(u.ora_name)=upper('''+aorauser+''')),'+
          inttostr(narkey)+','+
          ''''+newper.Edit1.Text+''','+
          'to_timestamp('''+datetostr(newper.DatePicker1.date) + ' ' + timetostr(newper.TimePicker1.time)+''',''dd.mm.yyyy hh24:mi:ss'')::timestamp without time zone,'+
          'to_timestamp('''+datetostr(newper.DatePicker2.date) + ' ' + timetostr(newper.TimePicker2.time)+''',''dd.mm.yyyy hh24:mi:ss'')::timestamp without time zone); ' ;
    frmMain.MConnection.ExecSQL(sql);
    loadlistperiod(narkey,closed);
  end;

newper.Destroy;
end;

procedure TfrmListPeriod.ToolButton3Click(Sender: TObject);
var newper: TfrmEditNewPeriod;
    sql,str : string;
begin
newper:= TfrmEditNewPeriod.Create(Owner);
newper.Caption:='Редактирование существующего периода';
newper.Edit1.Text:= grListPeriod.ByFieldName['nm'].Value ;
newper.DatePicker1.date:=strtodatetime(grListPeriod.ByFieldName['begoperdate'].Value);
newper.TimePicker1.time:=strtodatetime(grListPeriod.ByFieldName['begoperdate'].Value);
newper.DatePicker2.date:=strtodatetime(grListPeriod.ByFieldName['outoperdate'].Value);
newper.TimePicker2.time:=strtodatetime(grListPeriod.ByFieldName['outoperdate'].Value);
if newper.ShowModal=mrOk then
  begin
    //инсертим на сервак
    sql:='update  burnar.vipolnenie_period set nm='''+newper.Edit1.Text+''','+
         'begoperdate=' + 'to_timestamp(''' + datetostr(newper.DatePicker1.date) + ' ' + timetostr(newper.TimePicker1.time) + ''',''dd.mm.yyyy hh24:mi:ss'')::timestamp without time zone,'+
         'outoperdate=' + 'to_timestamp(''' + datetostr(newper.DatePicker2.date) + ' ' + timetostr(newper.TimePicker2.time) + ''',''dd.mm.yyyy hh24:mi:ss'')::timestamp without time zone'+
         ' where key='+ grListPeriod.ByFieldName['key'].Value+'; ' ;

    frmMain.MConnection.ExecSQL(sql);
    loadlistperiod(narkey,closed);
  end;

newper.Destroy;

end;

procedure TfrmListPeriod.ToolButton4Click(Sender: TObject);
var sql:string;
begin
sql:='delete from burnar.vipolnenie_period where key='+ grListPeriod.ByFieldName['key'].Value+'; ' ;
frmMain.MConnection.ExecSQL(sql);
loadlistperiod(narkey,closed);
end;
//end;

end.
