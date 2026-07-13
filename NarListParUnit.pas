unit NarListParUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  {Dialogs,} StdCtrls, Buttons, ComCtrls, Mask,
  FMTBcd, DB, SqlExpr, MemDS, DBAccess, Ora, PgAccess;

type
  TfrmNarListPar = class(TForm)
    Label2: TLabel;
    lbCodeSpr1: TLabel;
    CheckBox1: TCheckBox;
    qrNarTypes: TPgQuery;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    DateEdit1: TDateTimePicker;
    DateEdit2: TDateTimePicker;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    procedure sSpeedButton1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
  public
  end;

//var frmNarListPar: TfrmNarListPar;

implementation

uses MainUnit;

{$R *.dfm}

procedure TfrmNarListPar.sSpeedButton1Click(Sender: TObject);
begin
  DateEdit2.Date := DateEdit1.Date;
end;

procedure TfrmNarListPar.CheckBox1Click(Sender: TObject);
begin
 if (sender as TCheckBox).Checked then
   begin
     DateEdit1.Enabled := false;
     DateEdit2.Enabled := false;
     DateEdit1.Date := StrToDate('01.01.1800');
     DateEdit2.Date := StrToDate('01.01.4000');
   end
 else
   begin
     DateEdit1.Enabled := true;
     DateEdit2.Enabled := true;
     DateEdit1.Date := date;
     DateEdit2.Date := date;
   end;
end;

end.
