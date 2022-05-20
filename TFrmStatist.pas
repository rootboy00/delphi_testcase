unit TFrmStatist;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FrmFind, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm2 = class(TForm4)
    GroupBox1: TGroupBox;
    BirthDateTimePicker1: TDateTimePicker;
    BirthDateTimePicker2: TDateTimePicker;
    RegisterDateTimePicker1: TDateTimePicker;
    RegisterDateTimePicker2: TDateTimePicker;
    BirthCheckBox1: TCheckBox;
    RegisterCheckBox2: TCheckBox;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    CertificatesSource: TDataSource;
    CertificatesQuery: TFDQuery;
    procedure BirthCheckBoxClick(Sender: TObject);
    procedure RegisterCheckBox2Click(Sender: TObject);
    procedure OnCellClickSearchGrid(Column: TColumn); Override;
    procedure Searching; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
 uses Main;
{$R *.dfm}

procedure TForm2.OnCellClickSearchGrid(Column: TColumn);
var PeopleId:integer;
begin
  try
  PeopleId:= FDQuery1.Fields[0].Asinteger;
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


procedure TForm2.RegisterCheckBox2Click(Sender: TObject);
begin
  RegisterDateTimePicker1.Enabled:= RegisterCheckbox2.Checked;
  RegisterDateTimePicker2.Enabled:= RegisterCheckbox2.Checked;
end;

procedure TForm2.BirthCheckBoxClick(Sender: TObject);
begin
  BirthDateTimePicker1.Enabled:= BirthCheckBox1.Checked;
  BirthDateTimePicker2.Enabled:= BirthCheckBox1.Checked;
end;


procedure TForm2.Searching;
begin
  //Наследование поведения с FrmFind
  inherited;
  if(BirthCheckbox1.Checked = True) then
  begin
    FDQuery1.SQL.Add(' and Birthday between :BirthFirst and :BirthSecond');
    FDQuery1.ParamByName('BirthFirst').AsDate:= BirthDateTimePicker1.Date;
    FDQuery1.ParamByName('BirthSecond').AsDate:= BirthDateTimePicker2.Date;
  end;

  if(RegisterCheckbox2.Checked = True) then
  begin
    FDQuery1.SQL.Add(' and Register_Date between :Register1 and :Register2');
    FDQuery1.ParamByName('Register1').AsDate:= RegisterDateTimePicker1.Date;
    FDQuery1.ParamByName('Register2').AsDate:= RegisterDateTimePicker2.Date;
  end;
end;



end.
