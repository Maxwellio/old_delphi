unit formSetWorker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SqlExpr, StdCtrls, Buttons, 
  MemDS, DBAccess, Ora, MainUnit, PgAccess;

type
  TfrmSetWorker = class(TForm)
    qrWorkers: TPgQuery;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetWorker: TfrmSetWorker;

implementation

{$R *.dfm}

procedure TfrmSetWorker.FormCreate(Sender: TObject);
begin
  qrWorkers.Open;
  while not qrWorkers.eof do
  begin
    ComboBox1.Items.AddObject( qrWorkers.FieldByName('Ресурс').AsString,
                                TObject(qrWorkers.FieldByName('KEY').AsInteger)
                               );
    qrWorkers.Next;
  end;
  qrWorkers.close;
end;

end.
