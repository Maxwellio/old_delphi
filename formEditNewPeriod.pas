unit formEditNewPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask,
  Buttons, ComCtrls;

type
  TfrmEditNewPeriod = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    TimePicker1: TDateTimePicker;
    Label4: TLabel;
    TimePicker2: TDateTimePicker;
    Label5: TLabel;
    DatePicker1: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    DatePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditNewPeriod: TfrmEditNewPeriod;

implementation

{$R *.dfm}

end.
