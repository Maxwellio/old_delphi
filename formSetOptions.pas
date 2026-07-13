
unit formSetOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls, 
  ExtCtrls, Buttons, Mask, FileCtrl, ComCtrls, TypInfo, IniFiles, Menus,
  ValEdit, Grids, Dialogs, MainUnit;

type

  TfrmSetOptions = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    MainPanel: TPanel;
    OptionsTreeView: TTreeView;
    OpenDialog1: TOpenDialog;
    EdizmPanel: TPanel;
    Label1: TLabel;
    scbEdIzm: TComboBox;
    GlobalSettingPanel: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    Splitter2: TSplitter;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    Label4: TLabel;
    sEdHtmlPath: TEdit;
    sCheckBox4: TCheckBox;
    BitBtn1: TBitBtn;
    lstboxPath: TListBox;
    Label5: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    sCheckBox3: TCheckBox;
    sCheckBox1: TCheckBox;
    chBAutoCalcBegOperDate: TCheckBox;
    Bevel1: TBevel;
    Label6: TLabel;
    edNewPath: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Splitter1: TSplitter;
    Panel2: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    btnApply: TBitBtn;
    procedure SpeedButton3Click(Sender: TObject);
    procedure OptionsTreeViewChange(Sender: TObject; Node: TTreeNode);
    {!записываем (новые) значения во все связанные переменные и где необходимо,
    вызывает изменения "налету"}
    procedure ApplyChanges(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    {добавляем горизонтальный скроллер в ListBox}
    //procedure CreateScroll(ListBoxN: TCustomListBox);
    {!вызывается, когда дезигнер переводит форму в режим дизайна}
    procedure WMOnDsgnMode(var Message:TMessage); message WM_OnDsgnMode;
    {!вызывается при выходе из режима дизайна}
    procedure WMOffDsgnMode(var Message:TMessage); message WM_OffDsgnMode;
  public
    {установка визуального состояния контролов, соответствующих переменных}
    procedure LoadLinkControls;
    constructor Create(AOwner: TComponent); override;
  end;

var
  frmSetOptions: TfrmSetOptions;

implementation

{$R *.dfm}

uses ImgList;

procedure TfrmSetOptions.SpeedButton3Click(Sender: TObject);
const
  SELDIRHELP = 1000;
var
  outdir: string;
begin
  //вызываем диалог выбора директории, на выходе outdir=полный путь к файлу шаблона
  if {1вар} SelectDirectory('Выберите папку с системой отчетности', '', outdir) then
  //{2вар} outdir := EdRepShPath.Text;
  //if SelectDirectory(outdir, [sdAllowCreate{, sdPerformCreate, sdPrompt}], SELDIRHELP ) then
  edNewPath.Text := outdir;
end;

{добавляем горизонтальный скроллер в ListBox}
(*procedure TfrmSetOptions.CreateScroll(ListBoxN: TCustomListBox);
var i, MaxWidth: integer;
begin
  MaxWidth := 0;
  for i := 0 to ListBoxN.Items.Count - 1 do
    if MaxWidth < ListBoxN.Canvas.TextWidth(ListBoxN.Items.Strings[i]) then
      MaxWidth := ListBoxN.Canvas.TextWidth(ListBoxN.Items.Strings[i]);
  //SendMessage(ListBoxN.Handle, LB_SETHORIZONTALEXTENT, MaxWidth+5, 0); //решение через сообщение
  ListBoxN.ScrollWidth := MaxWidth+5; //решение через стандартное св-во
end;*)

{срабатывает при переходе с одного узла дерева на другое}
procedure TfrmSetOptions.OptionsTreeViewChange(Sender: TObject; Node: TTreeNode);
var i: integer;
begin
  if Node.Text='Опции' then
  begin
    GlobalSettingPanel.BringToFront;
    GlobalSettingPanel.Align := alClient;
    GlobalSettingPanel.Show;
  end
  else
  if Node.Text='Единицы измерений' then
  begin
    EdizmPanel.BringToFront;
    EdizmPanel.Align := alClient;
    EdizmPanel.Show;
  end
  else //встали на необрабатываемую ветку
    begin
      for i := 0 to MainPanel.ControlCount-1 do MainPanel.Controls[i].Hide;
    end
end;

procedure TfrmSetOptions.LoadLinkControls;
var
  i: integer;
  str,StrList,tv : TStrings;
  //files: TSearchRec;
begin
   //********************загрузка строк поискa;
   str:= TStringList.Create();
   str.Clear;
   str.Delimiter:=';';
   str.DelimitedText:= StringReplace(path,' ','', [rfReplaceAll ]);
   lstboxPath.Clear;
   for i:=0 to (str.Count-1) do
   lstboxPath.Items.Add(str.Strings[i]);
   sCheckBox3.Checked := OsAuthent;//OsAuthent
   sCheckBox4.Checked := AutoScale;//автомасштабирование под любое разрешение экрана
   sCheckBox1.checked := AutoSaveCalcNorms;//автосохранение норм
   //chBAutoCalcBegOperDate.checked := AutoCalcBegOperDate;
   //*********************загружаем скины
//   edSkinDirectory.Text := frmMain.sSkinManager1.SkinDirectory{SkinDirectory};
//   frmMain.sSkinManager1.GetSkinNames( sComboBox1.Items );
//   sComboBox1.ItemIndex := sComboBox1.Items.IndexOf( frmMain.sSkinManager1.SkinName{SkinName} );
   //*******************загружаем имя пользователя, пароль , БД   из ини файла
   LabeledEdit3.Text:= oraPwd;
   LabeledEdit2.Text := oraUser;
   LabeledEdit1.Text := DataBase;
   //******************загрузка внешних плиложений
   StringGrid1.RowCount:=1;
   StringGrid1.Cells[0,0]:='Название пункта меню';
   StringGrid1.Cells[1,0]:='Команда запуска приложения';
   //StringGrid1.Cells[0,1]:=Vars.Values['AppItems'];
   StrList := TStringList.Create;
   tv := TStringList.Create;
   //StrList.Delimiter := ';';
   //tv.Delimiter := ',';
   //StrList.DelimitedText := AppItems;
   StrToArrays(AppItems, ';', 1, StrList);
   {собираем имена файлов плугинов расширения}
   for i := 0 to StrList.Count-1 do
   begin
     StringGrid1.RowCount:=StringGrid1.RowCount+1;
     //tv.DelimitedText := StrList[i];
     StrToArrays(StrList[i], ',', 1, tv);
     StringGrid1.Cells[0,i+1]:= tv[0];
     StringGrid1.Cells[1,i+1]:= tv[1]
   end;
   if StrList.Count>0 then StringGrid1.FixedRows:=1;
   //end загрузка внешних приложений
   {единицы измерения}
   scbEdIzm.ItemIndex := scbEdIzm.Items.IndexOfObject( TObject( OutEdizm ) );
   sEdHtmlPath.Text := HtmlPath; //путь поиска оперкарт

   tv.Free;
   strlist.Free;
   str.Free;
end;

(*function FindInArr(aComp: TComponent): integer;
var k: integer;
begin
  result := -1;
  for k:=low(mVars) to high(mVars) do
    if mVars[k].ControlName=acomp.Name then begin result:=k; break; end;
end;*)

procedure TfrmSetOptions.ApplyChanges(Sender: TObject);
var i:integer;
begin
  //*******************сохраняем имя пользователя, пароль , БД
  DataBase := LabeledEdit1.Text;
  oraUser := LabeledEdit2.Text;
  oraPwd := LabeledEdit3.Text;
  OsAuthent := sCheckBox3.Checked;//OS аутентификация
  AutoSaveCalcNorms := sCheckBox1.checked; //автосохранение вычисленных норм
  AutoScale := sCheckBox4.Checked; //автомасштабирование под любое разрешение экрана
  //AutoCalcBegOperDate := chBAutoCalcBegOperDate.checked;
  //*******************сохраняем пути
  path := '';
  for i:=0 to (lstboxPath.Count-1) do
    path := path+lstboxPath.Items.Strings[i]+';';
  Delete(path, length(path), 1); //убираем последнюю точку с запятой
  //************************** скины
//  frmMain.sSkinManager1.SkinDirectory := edSkinDirectory.Text;
//  frmMain.sSkinManager1.SkinName := sComboBox1.Items[sComboBox1.ItemIndex];
//  {SkinName}frmMain.sSkinManager1.skinname := sComboBox1.Items[sComboBox1.ItemIndex];
//  {SkinDirectory}frmMain.sSkinManager1.skinDirectory := edSkinDirectory.Text;
  //*****************************загрузка внешних приложений
  AppItems := '';
  for i := 1 to StringGrid1.RowCount-1 do
    AppItems := AppItems+StringGrid1.Cells[0,i]+','+StringGrid1.Cells[1,i]+';';
  Delete(AppItems, length(AppItems), 1);//удаляем лишний разделитель записей справа
  {перезаписываем команды пунктов меню внешних приложений}
  frmMain.SetCallExpApp;

  {новый код единицы измерения}
  OutEdizm := LongInt( scbEdIzm.Items.Objects[scbEdIzm.Items.IndexOf(scbEdIzm.Text)] );
  HtmlPath := sEdHtmlPath.Text;
end;


procedure TfrmSetOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmSetOptions := nil;
  Action := caFree;
end;

procedure TfrmSetOptions.btnOkClick(Sender: TObject);
begin
  ApplyChanges(self); //пишем в простейшие переменные и связанные объекты
  {сохраняем настройки в файле конфигурации}
  frmMain.WriteToFile(PathAndCfgFileName);
  close;
end;

procedure TfrmSetOptions.sSpeedButton3Click(Sender: TObject);
begin
  if edNewPath.Text<>'' then
  lstboxPath.Items.Add(edNewPath.Text);
  edNewPath.Text:='';
end;

procedure TfrmSetOptions.sSpeedButton4Click(Sender: TObject);
begin
  lstboxPath.Items.Delete(lstboxPath.ItemIndex);
end;

procedure TfrmSetOptions.PopupMenu1Popup(Sender: TObject);
begin
  if StringGrid1.Col = 0 then
   begin
     //PopupMenu1.Items[3].Visible:=false  ;
     PopupMenu1.Items[2].Visible:=false;
   end;
  if StringGrid1.Col  = 1 then
   begin
    // PopupMenu1.Items[3].Visible:=true  ;
     PopupMenu1.Items[2].Visible:=true;
   end;
end;

procedure TfrmSetOptions.N4Click(Sender: TObject);
begin
  opendialog1.Execute;
  StringGrid1.Cells[1,StringGrid1.Row]:=OpenDialog1.FileName ;
end;

procedure TfrmSetOptions.N1Click(Sender: TObject);
begin
  StringGrid1.Enabled:=true;
  StringGrid1.RowCount:=StringGrid1.RowCount+1;
  StringGrid1.FixedRows:=1;
end;

procedure TfrmSetOptions.N2Click(Sender: TObject);
var
  i,j: Integer;
begin
  j:=StringGrid1.Row;
  StringGrid1.Rows[j].Clear;
  for i:=j to StringGrid1.RowCount-2 do
    StringGrid1.Rows[i].Assign(StringGrid1.Rows[i+1]);
  StringGrid1.RowCount:=StringGrid1.RowCount-1;
  StringGrid1.Refresh;
end;

procedure TfrmSetOptions.sCheckBox3Click(Sender: TObject);
begin
  if sCheckBox3.Checked=true then
  begin
    LabeledEdit2.Enabled:=false;
    LabeledEdit3.Enabled:=false;
  end;
  if sCheckBox3.Checked=false then
  begin
    LabeledEdit2.Enabled:=true;
    LabeledEdit3.Enabled:=true;
  end;
end;

procedure TfrmSetOptions.btnCancelClick(Sender: TObject);
begin
  close;
end;

constructor TfrmSetOptions.Create(AOwner: TComponent);
var fname: string;
begin
  //если есть файл с конфигурацией, читаем все настройки объектов оттуда
  fname := ExtractFilePath(PathAndCfgFileName)+ClassName+FrmExtUserRes;
  if FileExists( fname ) then //файл настроек найден
    begin
      CreateNew(AOwner);             //такой способ хорош
//      LoadComponentFromTextFile(self, fname); //только для не mdi-окон
      btnOk.Repaint;
      btnCancel.Repaint;
      btnApply.Repaint;
      Caption := 'Настройки программы';
    end
  else //файл настроек не найден
    inherited Create(AOwner); //вызываем стандартный конструктор

  scbEdIzm.AddItem('Секунды',TObject(217));
  scbEdIzm.AddItem('Минуты',TObject(218));
  scbEdIzm.AddItem('Часы',TObject(219));
  scbEdIzm.AddItem('Сутки',TObject(220));
end;

procedure TfrmSetOptions.WMOffDsgnMode(var Message: TMessage);
begin
  Caption := 'Настройки программы';
end;

procedure TfrmSetOptions.WMOnDsgnMode(var Message: TMessage);
//var i: integer;
begin
  (*for I := ComponentCount - 1 downto 0 do
  begin
    if (Components[I].ClassName='TacProvider')
      or (Components[I].ClassName='TsSkinProvider') then
      RemoveComponent(Components[I]);//так делать только если не MDI-child окно
  end;*)
  caption := '';
end;

end.
