unit FrmFind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;
type
  TForm4 = class(TForm)
    SearchGroupBox: TGroupBox;
    SearchEdit: TEdit;
    SearchDBGrid1: TDBGrid;
    SearchButton: TButton;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    procedure SearchButtonClick(Sender: TObject);
    procedure OnCellClickSearchGrid(Column: TColumn); Virtual; abstract;
    procedure Searching; virtual;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  Filter: String;
implementation

Uses Main;

{$R *.dfm}

procedure TForm4.SearchButtonClick(Sender: TObject);
begin
Searching;
Main.Form1.RunSql(FDQuery1,'');
end;

procedure TForm4.Searching;
begin
  FDQuery1.sql.Clear;
  FDQuery1.SQL.Add('select * from peoples ');
  FDQuery1.Sql.Add('where 1=1');

  if not(self.SearchEdit.Text = '') then
  begin
    FDQuery1.Sql.Add(' and (first_name like :SearchName or surname like :SearchName or Patronymic like :SearchName) ');
    FDQuery1.ParamByName('SearchName').AsString:= '%' + SearchEdit.text + '%';
  end;
end;




end.
