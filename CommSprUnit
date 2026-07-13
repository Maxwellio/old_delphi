unit CommSprUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  {Dialogs,} FMTBcd, DB, DBClient, Provider, SqlExpr, ExtCtrls, Grids,
  DBGrids, StdCtrls, Buttons, ComCtrls,
  MemDS, DBAccess, Ora, ToolWin, PgAccess;

type

  TResVal = record
    key: integer; //код
    value: string; //значение
  end;

  TSprId = (spWorkers,spChief);

  TSprSelect = class(TForm)
    qrWorkers: TPgQuery;
    DataSetProvider1: TDataSetProvider;
    cdsWorkers: TClientDataSet;
    dsWorkers: TDataSource;
    DBGrid1: TDBGrid;
    qrPeople: TPgQuery;
    DataSetProvider4: TDataSetProvider;
    cdsPeople: TClientDataSet;
    ToolBar1: TToolBar;
    EditFind: TEdit;
    ToolButton1: TToolButton;
    dsPeople: TDataSource;
    qrPeopleKEY: TIntegerField;
    qrPeopleNM: TStringField;
    cdsPeopleKEY: TIntegerField;
    cdsPeopleNM: TStringField;
    qrWorkersKEY: TIntegerField;
    qrWorkersNM: TStringField;
    cdsWorkersKEY: TIntegerField;
    cdsWorkersNM: TStringField;
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton8Click(Sender: TObject);
    procedure cdsPeopleAfterOpen(DataSet: TDataSet);
    procedure sSpeedButton5Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
  private
  public
    {получить значение(запись) справочника}
    class function GetVal(
      inKeyVal: integer; //значение ключевого поля для локации(выделения) редактируемого значения
      const inCaption: string; //заголовок или другая доп. инфа
      SprId: TSprId; //необходимый для загрузки справочник
      qrParams: array of integer; //набор входных параметров для запросов
      out outVal: TResVal //возвращаемый результат
      ): word;
  end;

  {получить значение(запись) справочника}
  function GetSprVal(
    inKeyVal: integer; //значение ключевого поля для локации(выделения) редактируемого значения
    const inCaption: string; //заголовок или другая доп. инфа
    SprId: TSprId; //необходимый для загрузки справочник
    qrParams: array of integer; //набор входных параметров для запросов
    out outVal: TResVal //возвращаемый результат
  ): word;

//var Form1: TForm1;

implementation

uses MainUnit;

{$R *.dfm}

function GetSprVal(
  inKeyVal: integer; //значение ключевого поля для локации(выделения) редактируемого значения
  const inCaption: string; //заголовок или другая доп. инфа
  SprId: TSprId; //необходимый для загрузки справочник
  qrParams: array of integer;
  out outVal: TResVal //возвращаемые результаты
): word;
begin
  Result := mrCancel;

  with TSprSelect.Create(Application) do
  try
    Caption := inCaption;
    case SprId of
      spWorkers:
        begin
          DBGrid1.DataSource := dsWorkers;
          qrWorkers.ParamByName('usr').AsString := oraUser;
          cdsWorkers.Open;
          cdsWorkers.Locate('KEY', IntToStr(inKeyVal), [loPartialKey, loCaseInsensitive]);
        end;
      spChief:
        begin
          DBGrid1.DataSource := dsPeople;
          qrPeople.ParamByName('usr').AsString := oraUser;
          qrPeople.ParamByName('chief').Value := qrparams[0];
          cdsPeople.Open;
          cdsPeople.Locate('KEY', IntToStr(inKeyVal), [loPartialKey, loCaseInsensitive]);
        end;
    end;
    
    Result := ShowModal;
    if Result = mrOk then
    begin
      outVal.key := DBGrid1.DataSource.DataSet.FieldByName('KEY').AsInteger;
      outVal.value := DBGrid1.DataSource.DataSet.FieldByName('NM').AsString;
    end;
  finally
    destroy;
  end;
end;

class function TSprSelect.GetVal(
      inKeyVal: integer; //значение ключевого поля для локации(выделения) редактируемого значения
      const inCaption: string; //заголовок или другая доп. инфа
      SprId: TSprId; //необходимый для загрузки справочник
      qrParams: array of integer; //набор входных параметров для запросов
      out outVal: TResVal //возвращаемый результат
      ): word;
begin
  result := GetSprVal(inKeyVal,inCaption,SprId,qrParams,outVal);
end;

procedure TSprSelect.DBGrid1TitleClick(Column: TColumn);
begin
  {сортировка на клиенте}
  //cdsPeople.IndexFieldNames := Column.FieldName;
  TClientDataSet(DBGrid1.DataSource.DataSet).IndexFieldNames := Column.FieldName;
end;

procedure TSprSelect.SpeedButton8Click(Sender: TObject);
begin
  TClientDataSet(DBGrid1.DataSource.DataSet).Locate(
    'NM', EditFind.Text, [loPartialKey,loCaseInsensitive]
    );
  DBGrid1.SetFocus;
end;

procedure TSprSelect.cdsPeopleAfterOpen(DataSet: TDataSet);
begin
  StatusBar1.Panels[0].Text :=
    'Всего запрошено с сервера записей: ' + IntToStr(DataSet.RecordCount);
end;

procedure TSprSelect.sSpeedButton5Click(Sender: TObject);
begin
  TClientDataSet(DBGrid1.DataSource.DataSet).First;
end;

procedure TSprSelect.sSpeedButton3Click(Sender: TObject);
begin
  TClientDataSet(DBGrid1.DataSource.DataSet).Last;
end;

procedure TSprSelect.sSpeedButton1Click(Sender: TObject);
begin
  TClientDataSet(DBGrid1.DataSource.DataSet).Prior;
end;

procedure TSprSelect.sSpeedButton2Click(Sender: TObject);
begin
  TClientDataSet(DBGrid1.DataSource.DataSet).Next;
end;

end.

