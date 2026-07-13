unit UnitChangePass;

interface

uses
  Windows, Graphics, Forms, StdCtrls, Buttons, Controls, Classes;

type
  TFormChangePass = class(TForm)
    PoleOld: TEdit;
    PoleNew1: TEdit;
    PoleNew2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormChangePass: TFormChangePass;

implementation

{$R *.dfm}

end.
