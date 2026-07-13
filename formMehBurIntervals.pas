unit formMehBurIntervals;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ToolWin, Grids, 
  OVNIDbControls, Buttons, FMTBcd, DB, SqlExpr, ExtCtrls,
  OvniGrids, MemDS, DBAccess, Ora, PgAccess;

type
  TfrmMehBurIntervals = class(TForm)
    qrMehBurInt: TPgQuery;
    PageControl1: TPageControl;
    TabMB: TTabSheet;
    Panel2: TPanel;
    Tabnar: TTabSheet;
    GrNarInt: TOVNIDbGrid;
    Panel1: TPanel;
    GrMehInt: TOVNIDbGrid;
    qrNarInt: TPgQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
    narkey :integer;
    procedure loadlistIntervals (anarkey :integer);

  end;

var
  frmMehBurIntervals: TfrmMehBurIntervals;

implementation

uses MainUnit;

{$R *.dfm}

procedure TfrmMehBurIntervals.loadlistIntervals (anarkey :integer);
begin
  narkey:= anarkey;
  qrMehBurInt.close;
  qrMehBurInt.ParamByName('keynar').Value:= anarkey;
  qrMehBurInt.Open;
  GrMehInt.LoadDataset(qrMehBurInt,['narkey', 'colorsel']);
  qrMehBurInt.close;
      GrMehInt.ColorValueField:='colorsel';
      GrMehInt.ColWidths[0] := 45;
      GrMehInt.ColWidths[1] := 60;
      GrMehInt.ColWidths[2] := 30;
      GrMehInt.ColWidths[3] := 300;
      GrMehInt.ColWidths[4] := 150;
      GrMehInt.ColWidths[5] := 150;
  GrMehInt.Fields.SetTitles1(['key', 'prnum', 'nm', 'ot', 'do'],
      ['Код', '№ п/п', 'Название','Интервал от', 'Интервал до']);

      qrNarint.close;
  qrNarint.ParamByName('keynar').Value:= anarkey;
  qrNarint.Open;
  GrNarInt.LoadDataset(qrNarint,['narkey', 'colorsel']);
  qrNarint.close;
      GrNarInt.ColorValueField:='colorsel';
      GrNarInt.ColWidths[0] := 45;
      GrNarInt.ColWidths[1] := 60;
      GrNarInt.ColWidths[2] := 30;
      GrNarInt.ColWidths[3] := 300;
      GrNarInt.ColWidths[4] := 150;
      GrNarInt.ColWidths[5] := 150;
  GrNarInt.Fields.SetTitles1(['key', 'prnum', 'nm', 'ot', 'do'],
      ['Код', '№ п/п', 'Название','Интервал от', 'Интервал до']);

end;
end.
