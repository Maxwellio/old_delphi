unit formPeopleAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask,
  FMTBcd, DB, SqlExpr, ComCtrls, ToolWin;

type
  TfrmPeopleAdd = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    gbUser: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    osnovanie: TMemo;
    cbActive: TCheckBox;
    gbPeople: TGroupBox;
    Label11: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    ER3: TEdit;
    ETAB: TEdit;
    EROD: TEdit;
    EREP: TEdit;
    EFIO: TEdit;
    DatePicker1: TDateTimePicker;
    EnterDate: TDateTimePicker;
    OutDate: TDateTimePicker;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label21: TLabel;
    edOraName: TEdit;
    procedure sBitBtn1Click(Sender: TObject);
    procedure ETABKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPeopleAdd: TfrmPeopleAdd;

implementation

{$R *.dfm}

procedure TfrmPeopleAdd.sBitBtn1Click(Sender: TObject);
begin
if frmPeopleAdd.Tag = 1 then ModalResult := mrOK else
if gbUser.Visible = true then ModalResult := mrOK else
///нужно проверить заполненость всех полей
if (efio.Text='')
   or (erep.Text='')
   or  (etab.Text='')
   or (erod.Text='')
   or  (ComboBox1.ItemIndex=-1)
   or  (ComboBox2.ItemIndex=-1)
 then
        Application.MessageBox('Заполнены не все необходимые данные!','Внимание!',
        MB_OK+MB_ICONEXCLAMATION)
 else ModalResult:=mrOK;

end;

procedure TfrmPeopleAdd.ETABKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9',#8: {Key := Key}; //в данном случае, тоже самое если бы просто был пустой оператор :;
    else
      Key := #0;
  end;
end;

end.
