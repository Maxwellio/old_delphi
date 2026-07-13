unit formNewEditCareer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, FMTBcd,
  DBClient, Provider, DB, SqlExpr, ComCtrls, Ora, MemDS, DBAccess, PgAccess;

type
  TfrmNewEditCareer = class(TForm)
    sBitBtn1: TBitBtn;
    sLabel2: TLabel;
    sLabel4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    DBLookupComboBoxDolj: TDBLookupComboBox;
    DBLookupComboBoxPodr: TDBLookupComboBox;
    Label6: TLabel;
    sBitBtn2: TBitBtn;
    qrOrgNM: TPgQuery;
    qrDoljSpr: TPgQuery;
    DataSourceDoljSPR: TDataSource;
    ClientDataSetDoljSPR: TClientDataSet;
    DataSetProvideDoljSPR: TDataSetProvider;
    DataSetProviderOrgNM: TDataSetProvider;
    ClientDataSetOrgNM: TClientDataSet;
    DataSourceOrgNM: TDataSource;
    DatePicker1: TDateTimePicker;
    DatePicker2: TDateTimePicker;
    TimePicker1: TDateTimePicker;
    TimePicker2: TDateTimePicker;

    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditNewPeriod: TfrmNewEditCareer;
  updBrigKey_array : array of String; //Массив для дальнейшег ообновления списка бригадиров по наряду
  isUpdBrigadir : Boolean;
implementation

uses CommSprUnit, MainUnit, formListPeriod;

{$R *.dfm}        


//выбор должности
procedure TfrmNewEditCareer.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then
  begin
     if DBLookupComboBoxDolj.Text = '' then
      begin
        Application.MessageBox('Выберите Должность!','Информация');
        DBLookupComboBoxDolj.SetFocus;
        CanClose := false;
      end;

     if DBLookupComboBoxPodr.Text = '' then
     begin
        Application.MessageBox('Выберите Подразделение/отдел!','Информация');
        DBLookupComboBoxPodr.SetFocus;
        CanClose := false;
     end;

  end;

end;

end.
