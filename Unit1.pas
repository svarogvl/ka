unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    TabSheet2: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    ADODataSet2: TADODataSet;
    DataSource2: TDataSource;
    DBNavigator2: TDBNavigator;
    TabSheet3: TTabSheet;
    ADODataSet3: TADODataSet;
    DBNavigator3: TDBNavigator;
    DataSource3: TDataSource;
    LabelFamily: TLabel;
    LabelName: TLabel;
    LabelMiddlename: TLabel;
    LabelSubject: TLabel;
    LabelMark: TLabel;
    LabelSemestr: TLabel;
    LabelPropusk: TLabel;
    LabelDate: TLabel;
    sessionResultTab: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    search: TRadioButton;
    showall: TRadioButton;
    searchButton: TButton;
    resultSessionSearchGrid: TDBGrid;
    lastname: TCheckBox;
    subject: TCheckBox;
    grade: TCheckBox;
    lastNameEdit: TEdit;
    subjectEdit: TEdit;
    GradeEdit: TEdit;
    resultSessionDataSet: TADODataSet;
    resultSessionDataSource: TDataSource;
    DBNavigator4: TDBNavigator;
    DBGrid1: TDBGrid;
    DBNavigator5: TDBNavigator;
    DBNavigator6: TDBNavigator;
    DataSource5: TDataSource;
    ADODataSet5: TADODataSet;
    DataSource4: TDataSource;
    ADODataSet4: TADODataSet;
    DBGrid2: TDBGrid;
    DBText2: TDBText;
    Label18: TLabel;
    Edit1: TEdit;
    Label19: TLabel;
    Edit2: TEdit;
    procedure lastnameClick(Sender: TObject);
    procedure subjectClick(Sender: TObject);
    procedure gradeClick(Sender: TObject);
    procedure searchButtonClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Edit1Change(Sender: TObject);
begin
Edit1.Text:='4-1';
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
Edit1.Text:='����� ����� �������';
end;

procedure TForm1.gradeClick(Sender: TObject);
begin
  if grade.Checked then
  begin
    GradeEdit.Visible := true;
  end
  else
  begin
    GradeEdit.Visible := false;
  end;
end;

procedure TForm1.lastnameClick(Sender: TObject);
begin
  if lastname.Checked then
  begin
    lastNameEdit.Visible := true;
  end
  else
  begin
    lastNameEdit.Visible := false;
  end;

end;

procedure TForm1.searchButtonClick(Sender: TObject);
var
    sqlBase:String;
begin
  resultSessionDataSet.Active := false;
  sqlBase := 'select [��������].[�������], ' +
    ' [��������].[���], [��������].[��������], [������].[������], ' +
    ' [������].[���������], [����������].[�������������������������], ' +
    ' [������].[����], [�����������].[�����������], [������].[������], '+
    ' [������].[�������], [����������].[���������]' +
    'from ������, ��������, ����������, �����������, ���������� '+
    ' where [������].[�������]=[��������].[����] ' +
    ' and [������].[����������]=[����������].[�������������]' +
    ' and [������].[�����������]=[�����������].[��������������]' +
    ' and [������].[���������]=[����������].[�������������]';
  if showall.Checked then
  begin
    resultSessionDataSet.CommandText := sqlBase;
  end
  else
  begin
    if lastname.Checked and (lastNameEdit.Text <> '') then
      sqlBase := sqlBase + ' and [��������].[�������] = ''' + lastNameEdit.Text + '''';

    if subject.Checked and (subjectEdit.Text <> '') then
      sqlBase := sqlBase + ' and ([����������].[������������������������] = ''' +
      subjectEdit.Text + ''' or [����������].[�������������������������] = ''' + subjectEdit.Text +''')';

    if grade.Checked and (GradeEdit.Text <> '') then
      sqlBase := sqlBase + ' and [������].[������] = ' + GradeEdit.Text;

    resultSessionDataSet.CommandText := sqlBase;
  end;
  resultSessionDataSet.Active := true;
end;


procedure TForm1.subjectClick(Sender: TObject);
begin
  if subject.Checked then
  begin
    subjectEdit.Visible := true;
  end
  else
  begin
    subjectEdit.Visible := false;
  end;
end;

end.
