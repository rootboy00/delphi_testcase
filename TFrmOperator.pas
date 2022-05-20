unit TFrmOperator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FrmFind, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm3 = class(TForm4)
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    OperatorQuery: TFDQuery;
    PageControl1: TPageControl;
    Человек: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    FirstNameEdit: TEdit;
    SurnameEdit: TEdit;
    PatronymicEdit: TEdit;
    BirthDateTimePicker: TDateTimePicker;
    Добавить: TButton;
    RegisterDateTimePicker: TDateTimePicker;
    CheckBoxNeedRegisterDate: TCheckBox;
    Справка: TTabSheet;
    Label7: TLabel;
    Button1: TButton;
    NameEdit: TEdit;
    Label6: TLabel;
    CodeEdit: TEdit;
    CertificatesSource: TDataSource;
    CertificatesQuery: TFDQuery;
    LastNameDBGrid: TDBGrid;
    lastpeople: TLabel;
    LastPeopleDataSource: TDataSource;
    LastPeopleFDQuery: TFDQuery;
    Label8: TLabel;
    procedure CheckBoxNeedRegisterDateClick(Sender: TObject);
    procedure AddPeopleButton(Sender: TObject);
    procedure refreshing;
    procedure Button1Click(Sender: TObject);
    procedure OnCellClickSearchGrid(Column: TColumn); override;
    procedure ShowCertificate(Query:TFDQuery);
    procedure LastNameDBGridCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  PeopleId:Integer;

implementation

Uses Main;

{$R *.dfm}

procedure TForm3.OnCellClickSearchGrid(Column: TColumn);
begin
  Label8.Caption:= FdQuery1.Fields[1].AsString + ' ' + FdQuery1.Fields[2].AsString + ' ' + FdQuery1.Fields[3].AsString;
  ShowCertificate(FdQuery1);
end;
procedure TForm3.LastNameDBGridCellClick(Column: TColumn);
begin
  ShowCertificate(LastPeopleFDQuery);
end;

procedure TForm3.ShowCertificate(Query:TFDQuery);
begin
  try
    PeopleId:= Query.Fields[0].Asinteger;
    CertificatesQuery.sql.Clear;
    CertificatesQuery.sql.Add('select people_id, name,code,date_issue');
    CertificatesQuery.sql.Add('from certificates c');
    CertificatesQuery.sql.Add('inner join certificate_db cdb on (cdb.id = c.certificate_id)');
    CertificatesQuery.sql.Add('where people_id = :peopleid');
    CertificatesQuery.ParamByName('peopleid').AsInteger:= Peopleid;
    Main.Form1.RunSql(CertificatesQuery,'');
  except
    PeopleId:= -1;
  end;
end;




procedure TForm3.refreshing;
begin
  //При рефреше выдаются ошибки, если staticset Active = false;
  FDQuery1.Active:= False;
  FDQuery1.Active:= True;

  CertificatesQuery.Active:= False;
  CertificatesQuery.Active:= True;

  LastPeopleFDQuery.Active:= False;
  LastPeopleFDQuery.Active:= True;
end;


procedure TForm3.Button1Click(Sender: TObject);
var name, code:string;
    id:integer;
begin
  name:= NameEdit.Text;
  code:= CodeEdit.Text;

  OperatorQuery.sql.Clear;
  OperatorQuery.sql.Add('select count(*) from certificate_db where name = :name and code = :code');
  OperatorQuery.ParamByName('name').AsString:= name;
  OperatorQuery.ParamByName('code').AsString:= code;
  Main.Form1.RunSql(OperatorQuery,'');
  if( OperatorQuery.fields[0].AsInteger = 0) then
  begin
    //Добавление справки
    OperatorQuery.sql.Clear;
    OperatorQuery.sql.Add('Insert Into certificate_db(name,code) values (:name,:code)');
    OperatorQuery.ParamByName('name').AsString:= name;
    OperatorQuery.ParamByName('code').AsString:= code;
    Main.Form1.RunSql(OperatorQuery,'');
  end;

  //Запрос для получения id справки
  OperatorQuery.sql.Clear;
  OperatorQuery.sql.Add('select id from certificate_db where name = :name and code = :code');
  OperatorQuery.ParamByName('name').AsString:= name;
  OperatorQuery.ParamByName('code').AsString:= code;
  Main.Form1.RunSql(OperatorQuery,'');
  id:= OperatorQuery.fields[0].AsInteger;

  //id - generator
  //date_issue - now()
  OperatorQuery.sql.Clear;
  OperatorQuery.sql.Add('insert into certificates(people_id,certificate_id) values ');
  OperatorQuery.sql.Add('(:people_id,:certificate_id)');
  OperatorQuery.ParamByName('people_id').AsInteger:= PeopleId;
  OperatorQuery.ParamByName('certificate_id').AsInteger:= id;
  Main.Form1.RunSql(OperatorQuery,'Справка успешно выдана!');
  refreshing;
end;

//Если не используем из DataTimePicker - это значение по дефолту now()
procedure TForm3.CheckBoxNeedRegisterDateClick(Sender: TObject);
begin
  RegisterDateTimePicker.Enabled:= CheckBoxNeedRegisterDate.Checked;
end;



procedure TForm3.AddPeopleButton(Sender: TObject);
var tablelist,paramlist:string;
begin
  //Проверка на валидность информации
  if ( (length(FirstNameEdit.Text) = 0) or (length(SurnameEdit.Text) = 0) or (length(PatronymicEdit.Text) = 0) or ( BirthDateTimePicker.Date > Now) ) then
  begin
    showmessage('Ошибка ввода информации.');
    exit;
  end;

  OperatorQuery.sql.Clear;
  tablelist:= 'first_name,surname,patronymic,birthday';
  paramlist:= ':firstname,:surname,:patronymic,:birthday';

  if(CheckBoxNeedRegisterDate.Checked = True) then
  begin
    tablelist:= tablelist + ',register_date';
    paramlist:= paramlist + ',:registerdate';
  end;
  OperatorQuery.sql.Add('INSERT INTO Peoples('+tablelist+') values ('+paramlist+')');

  if(CheckBoxNeedRegisterDate.Checked = True) then
    OperatorQuery.ParamByName('registerdate').AsDate:= RegisterDateTimePicker.Date;

  OperatorQuery.ParamByName('firstname').AsString := FirstNameEdit.Text;
  OperatorQuery.ParamByName('surname').AsString:= SurnameEdit.Text;
  OperatorQuery.ParamByName('patronymic').AsString:= PatronymicEdit.Text;
  OperatorQuery.ParamByName('birthday').AsDate:= BirthDateTimePicker.Date;

  Main.Form1.RunSql(OperatorQuery,'Человек ('+FirstNameEdit.Text+') успешно добавлен!');
  FirstNameEdit.Text:= '';
  SurnameEdit.Text:= '';
  PatronymicEdit.Text:= '';
  BirthDateTimePicker.Date:= Now;
  RegisterDateTimePicker.Date:= Now;
  refreshing;
end;

end.
