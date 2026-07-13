unit formAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  {Dialogs,} ExtCtrls, StdCtrls, Buttons;

type
  TfrmAbout = class(TForm)
    Image1: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    lbHeaderRegKey: TLabel;
    lbRegKey: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ProductNameMouseEnter(Sender: TObject); 
    procedure ProductNameMouseLeave(Sender: TObject);

  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

uses shellapi;

{$R *.dfm}

procedure TfrmAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree; //разрушаем объект
end;

procedure TfrmAbout.ProductNameMouseEnter(Sender: TObject);
begin
  with Sender as TLabel do
    Font.Style := Font.Style + [fsBold];
end;

procedure TfrmAbout.ProductNameMouseLeave(Sender: TObject);
begin
  with Sender as TLabel do
    Font.Style := Font.Style - [fsBold];
end;


end.
