{*******************************************************}
{File:      LoginFrm.pas                                }
{Revision:  03.08.2002                                  }
{Comment:   Форма регистрации пользователя Oracle8      }
{Copyright: (c) 1999-2000, Владимир Гирявый             }
{Author:    Владимир Гирявый, gvv@admsurgut.ru          }
{*******************************************************}

unit LoginFrm;

interface

uses
  Windows,  SysUtils, Classes, Graphics, Controls, Forms, 
  StdCtrls, Buttons, ExtCtrls, ComCtrls, jpeg, sLabel;

type
  TLoginForm = class(TForm)
    edtUserName: TEdit;
    edtPassWord: TEdit;
    lblUserName: TLabel;
    lblPassword: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtDbAlias: TEdit;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Timer2: TTimer;
    Image1: TImage;
    Label2: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MakeSplash;    
  end;

function GetLoginParams(ALoginParams: TStrings): word;

var
  LoginForm: TLoginForm;

implementation

{$R *.DFM}

var
  Fj1: integer {= 5};

function GetLoginParams(ALoginParams: TStrings): word;
var
  LoginForm: TLoginForm;
begin
  Result := mrCancel;
  LoginForm := TLoginForm.Create(Application);
  try
    Result := LoginForm.ShowModal;
    if Result = mrOK then
    begin
      ALoginParams.Values['USER NAME'] := LoginForm.edtUserName.Text;
      ALoginParams.Values['PASSWORD'] := LoginForm.edtPassWord.Text;
    end;
  finally
    LoginForm.Free;
  end;
end;

procedure TLoginForm.MakeSplash;
begin
  //BorderStyle := bsNone;
  Show;
  Update;
end;

procedure TLoginForm.Timer1Timer(Sender: TObject);
begin
  if ProgressBar1.Position <= ProgressBar1.Min then Fj1 := {5}1;
  if ProgressBar1.Position >= ProgressBar1.Max then Fj1 := {-5}-1;
  ProgressBar1.Position := ProgressBar1.Position + Fj1; //показываем что процесс идет
end;

procedure TLoginForm.Timer2Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  Timer2.Enabled := false;
end;

procedure TLoginForm.FormCreate(Sender: TObject);
begin
  {перекрашиваем прогрессбары}
  //ProgressBar1.Brush.Color := clRed; //общий цвет фона
  SendMessage(ProgressBar1.Handle, $0409, 0, clRed); //цвет индикации  
end;

procedure TLoginForm.FormDestroy(Sender: TObject);
begin
  LoginForm := nil;
end;

end.
