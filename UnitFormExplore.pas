unit UnitFormExplore;

interface

uses
  Windows,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  OleCtrls, SHDocVw;

type
  TFormExplore = class(TForm)
    WebBrowser: TWebBrowser;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFormExplore.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
