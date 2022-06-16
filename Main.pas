unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TFrmOperator, TFrmStatist,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Vcl.Menus,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    FDConnection1: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDTransaction1: TFDTransaction;
    Memo1: TMemo;
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RunSql(Query: TFdQuery; SuccStr: String);
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}


//Процедура для контроля и выполнения всех запросов в проекте
procedure TForm1.RunSql(Query: TFDQuery; SuccStr: String);
var Command:string;
    i:integer;
begin
  //Проверка на подключение базы данных
  if Form1.FdConnection1.Connected = False then
  begin
    showmessage('Связь с базой данных прервана. Ошибка выполнения запроса!');
  end;
  //проверка на sql запрос
  if( Query.sql.Text = '') then
  begin
    showmessage('Не корректный запрос. Ошибка выполнения!');
  end;
  try
    //для селекта - open, для всех остальных - execute
    Command := LowerCase(Copy(Trim(Query.Sql.Text), 1, 6));
    if Command = 'select' then
    begin
      Query.Open;
    end
    else
    begin
      Query.ExecSQL;
    end;
    Query.Transaction.Commit;
    if(SuccStr <> '') then showmessage(SuccStr);

    for I := 0 to Query.sql.Count-1 do
    begin
      Memo1.Lines.Add(Query.sql[i]);
    end;
  except on E: Exception do
    showmessage(E.ClassName +'Ошибка с сообщением ' + E.Message);
  end;
end;

//Статист
procedure TForm1.N2Click(Sender: TObject);
var
ChildForm: TForm;
begin
  ChildForm:= TForm2.Create(nil);
  ChildForm.Parent:= Form1;
  ChildForm.Show;
end;

//Оператор
procedure TForm1.N3Click(Sender: TObject);
var
ChildForm: TForm;
begin
  ChildForm:= TForm3.Create(nil);
  ChildForm.Parent:= Form1;
  ChildForm.Show;
end;

end.
