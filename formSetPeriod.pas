
unit formSetPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SqlExpr, StdCtrls, Buttons, 
  MemDS, DBAccess, MainUnit, PgAccess;

type
  TfrmSetPeriod = class(TForm)
    qrPeriods: TPgQuery;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    // anarkey:integer;
    procedure loadcombo (anarkey :integer);
    { Public declarations }
  end;

var
  frmSetPeriod: TfrmSetPeriod;

implementation

{$R *.dfm}

procedure TfrmSetPeriod.loadcombo(anarkey :integer);
begin
  qrPeriods.ParamByName('keynar').Value:= anarkey;
  qrPeriods.Open;
  while not qrPeriods.eof do
  begin
    ComboBox1.Items.AddObject( qrPeriods.FieldByName('NM').AsString+' ('+qrPeriods.FieldByName('begoperdate').AsString+' - '+qrPeriods.FieldByName('outoperdate').AsString+')',
                                TObject(qrPeriods.FieldByName('KEY').AsInteger)
                               );
    qrPeriods.Next;
  end;
  qrPeriods.close;
end;

end.
