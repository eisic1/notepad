unit zad1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtDlgs, PrintersDlgs, Printers;

type

  { TForm1 }

  TForm1 = class(TForm)
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageSetupDialog1: TPageSetupDialog;
    PrintDialog1: TPrintDialog;
    ReplaceDialog1: TReplaceDialog;
    SaveDialog1: TSaveDialog;
    Separator6: TMenuItem;
    Separator5: TMenuItem;
    Separator4: TMenuItem;
    Separator3: TMenuItem;
    Separator2: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Separator1: TMenuItem;
    procedure FindDialog1Find(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure ReplaceDialog1Replace(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
    if OpenDialog1.Execute then
       begin
         Caption:=OpenDialog1.FileName;
         Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
       end
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  if Caption = '' then
     begin
       if SaveDialog1.Execute then
          begin
               Memo1.Lines.SaveToFile( SaveDialog1.Filename );
               Caption:=SaveDialog1.Filename;
          end
     end
  else
      Memo1.Lines.SaveToFile( SaveDialog1.Filename );
end;

procedure TForm1.MenuItem10Click(Sender: TObject);
var
  rectPage: TRect;
  sText: string;
begin
    if PrintDialog1.Execute then
       begin
         rectPage := Rect(0, 0, Printer.PageWidth, Printer.PageHeight);
         with Printer do
         begin
           BeginDoc;
           sText:=Memo1.Text;

           Canvas.Font.Name := 'Verdana';
           Canvas.Font.Size := 11;
           Canvas.Font.Color := clRed;

          // Canvas.TextRect(rectPage, sText, 10);

           EndDoc;
         end;
         ShowMessage('Print is done.');
       end;
end;

procedure TForm1.FindDialog1Find(Sender: TObject);
var
  k : integer;
begin
  with Sender as TFindDialog do begin
    k := Pos(FindText, Memo1.Lines.Text);
    if k > 0 then begin
      Memo1.SelStart := k - 1;
      Memo1.SelLength := Length(FindText);
      Memo1.SetFocus;
    end else
      Beep();
  end;
end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  Memo1.Undo;
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
  Memo1.CutToClipboard;
end;

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
    Memo1.CopyToClipboard;
end;

procedure TForm1.MenuItem15Click(Sender: TObject);
begin
    Memo1.PasteFromClipboard;
end;

procedure TForm1.MenuItem16Click(Sender: TObject);
begin
  Memo1.ClearSelection;
end;

procedure TForm1.MenuItem17Click(Sender: TObject);
begin
  Memo1.SelectAll;
end;

procedure TForm1.MenuItem18Click(Sender: TObject);
begin
   Memo1.SelText:=DateTimeToStr(Now);
end;

procedure TForm1.MenuItem19Click(Sender: TObject);
begin
  if Memo1.WordWrap then
     Memo1.WordWrap:=false
  else
     Memo1.WordWrap:=true;
end;

procedure TForm1.MenuItem20Click(Sender: TObject);
begin
    if FontDialog1.Execute then
       Memo1.Font:=FontDialog1.Font;
end;

procedure TForm1.MenuItem21Click(Sender: TObject);
begin
  FindDialog1.Execute;
end;

procedure TForm1.MenuItem22Click(Sender: TObject);
begin
  FindDialog1.Execute;
end;

procedure TForm1.MenuItem23Click(Sender: TObject);
begin
  ReplaceDialog1.Execute;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  Memo1.Clear;
end;


procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    Memo1.Lines.SaveToFile( SaveDialog1.Filename );
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
    PageSetupDialog1.Execute;
end;

procedure TForm1.ReplaceDialog1Replace(Sender: TObject);
var
  k : integer;
begin
 // with Sender as TReplaceDialog do begin
 //   opt := [];
 //   if frReplace in Options then
 //     opt := [ssoReplace];
  //  if frReplaceAll in Options then
 //     opt := [ssoReplaceAll];
 //   k := TSynEdit1.SearchReplaceEx( FindText, ReplaceText, opt, Position );
    if k>=0 then
  //    TSynEdit1.SetFocus()
    else
      Beep();
  end;
end;

end.

