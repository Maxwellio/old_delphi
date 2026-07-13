unit formSetDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  {Dialogs,} StdCtrls, Buttons,
  ToolEdit, ComCtrls;

type
  TfrmSetBegDateOp = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DatePicker1: TDateTimePicker;
    TimePicker1: TDateTimePicker;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetBegDateOp: TfrmSetBegDateOp;

implementation

{$R *.dfm}

end.
