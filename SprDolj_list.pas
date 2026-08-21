unit Sprdolj_list;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,  StdCtrls, Grids, DBGrids, DBCtrls, Buttons, ActnList,
  Menus, ExtCtrls, ToolWin, ComCtrls, ImgList, PGAccess,
  MemDS, DBAccess;

type
  TfrmSprdolj_list = class(TForm)
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    qrySpr_typ: TPgQuery;
    dsSpr_Typ: TDataSource;
    ToolButton7: TToolButton;
    BitBtn2: TBitBtn;
    ToolButton8: TToolButton;
    StatusBar1: TStatusBar;
    ToolButton3: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure dsSpr_TypDataChange(Sender: TObject; Field: TField);
    procedure BitBtn2Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ToolButton3Click(Sender: TObject);

  private

  public

  end;


var
  frmSprdolj_list: TfrmSprdolj_list;


implementation


uses  Sprdolj_IUD, MainUnit;

{$R *.dfm}



/////////////////////////////////////////////////////////////////////////
//                                            
procedure TfrmSprdolj_list.FormShow(Sender: TObject);
var i : integer;
begin


  DBGrid1.Columns[0].Width :=  Round(DBGrid1.ClientWidth * 0.1);
  DBGrid1.Columns[1].Width :=  Round((DBGrid1.ClientWidth - DBGrid1.Columns[0].Width) / 3) - 7;
  DBGrid1.Columns[2].Width :=  Round(2 * (DBGrid1.ClientWidth - DBGrid1.Columns[0].Width) / 3) - 7;

   qrySpr_typ.Open;

end;


//                        StatusBar
procedure TfrmSprdolj_list.dsSpr_TypDataChange(Sender: TObject; Field: TField);
begin
  StatusBar1.Panels[0].Text := Format('       %d    %d',[qrySpr_typ.RecNo, qrySpr_typ.RecordCount]);
  StatusBar1.Panels[1].Text := qrySpr_typ.FieldByName('nm').AsString;
end;


procedure TfrmSprdolj_list.BitBtn2Click(Sender: TObject);
begin
  Close;
end;


{Update}
procedure TfrmSprdolj_list.ToolButton2Click(Sender: TObject);
begin
    frmSprdolj_IUD := TfrmSprdolj_IUD.Create(Application);
    frmSprdolj_IUD.Tag := 1;
    frmSprdolj_IUD.ShowModal;

end;

{Insert}
procedure TfrmSprdolj_list.ToolButton1Click(Sender: TObject);
begin

   frmSprdolj_IUD := TfrmSprdolj_IUD.Create(Application);
   frmSprdolj_IUD.Tag := 0;
   frmSprdolj_IUD.ShowModal;

end;

procedure TfrmSprdolj_list.DBGrid1TitleClick(Column: TColumn);
var i : integer;
begin
  for i:= 0 to DBGrid1.Columns.Count-1 do
     DBGrid1.Columns[i].Title.Font.Style := [];
  Column.Title.Font.Style :=  [fsBold, fsUnderline];

  if Pos(' ASC', UpperCase(qrySpr_typ.IndexFieldNames))> 0 then
    qrySpr_typ.IndexFieldNames:= Column.FieldName + ' DESC'
  else qrySpr_typ.IndexFieldNames:= Column.FieldName+' ASC';
end;


procedure TfrmSprdolj_list.ToolButton3Click(Sender: TObject);
var str : string;
begin

   if Application.MessageBox('              ?',
                            '        ', MB_OKCANCEL + MB_ICONQUESTION) <> mrOK then Exit;

   str := Format('delete from burnar.sprdoljnost where key = %s ', [ qrySpr_typ.fieldByName('key').asString ]);
   frmMain.MConnection.ExecSQL(str);
   qrySpr_typ.Refresh;
end;

end.
