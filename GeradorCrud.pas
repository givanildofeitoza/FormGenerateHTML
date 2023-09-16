unit GeradorCrud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,System.Generics.Collections, clipbrd;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    MemoClasse: TMemo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    CboField: TComboBox;
    CboTipo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    pnlChildField: TPanel;
    txtChildField: TEdit;
    memoItensChild: TMemo;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    txtClassName: TEdit;
    Label4: TLabel;
    MemoForm: TMemo;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure CboTipoSelect(Sender: TObject);
    procedure CboFieldSelect(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  i : integer;
  Field : TArray<string>;
begin
  CboField.Items.Clear;
  i := 0;
  while i < MemoClasse.Lines.Count do
  begin
      Field := MemoClasse.Lines[i].Replace(' ','|').Split(['|']);
      if(Field[2] <> string.empty)then
         CboField.Items.Add(Field[2]);
      i := i+1;
  end;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
  FieldHTML : string;
  i : integer;
begin
   if(CboTipo.Text = 'TEXT')then
   begin
      MemoForm.Lines.Add('');
      MemoForm.Lines.Add('<label for="formGroupExampleInput" class="control-label col-md-3 col-sm-3 col-xs-12">'+CboField.Text+'</label>');
     MemoForm.Lines.Add('<div class="col-md-9 col-sm-9 col-xs-12">');
      MemoForm.Lines.Add('<InputText class="form-control" @bind-Value="'+txtClassName.Text+'.'+CboField.Text+'"></InputText>');
      MemoForm.Lines.Add('<ValidationMessage For="@(()=>'+txtClassName.Text+'.'+CboField.Text+')" />');
      MemoForm.Lines.Add('</div>');

   end;
   if(CboTipo.Text = 'SELECT')then
   begin
      MemoForm.Lines.Add('');
      MemoForm.Lines.Add('<label for="formGroupExampleInput" class="control-label col-md-3 col-sm-3 col-xs-12">'+CboField.Text+'</label>');
     MemoForm.Lines.Add('<div class="col-md-9 col-sm-9 col-xs-12">');
      MemoForm.Lines.Add('<InputSelect class="form-control" @bind-Value="'+txtClassName.Text+'.'+CboField.Text+'">');
      MemoForm.Lines.Add('<option value=""></option>');
        i := 0;
        while( i  <= memoItensChild.Lines.Count - 1)do
        begin
           MemoForm.Lines.Add('<option value="'+memoItensChild.Lines[i]+'">'+memoItensChild.Lines[i]+'</option>');
           inc(i);
        end;
        MemoForm.Lines.Add('</InputSelect>');
        MemoForm.Lines.Add('<ValidationMessage For="@(()=>'+txtClassName.Text+'.'+CboField.Text+')" />');
        MemoForm.Lines.Add('</div>');
   end;

   if(CboTipo.Text = 'CHECK')then
   begin
      MemoForm.Lines.Add('');
      MemoForm.Lines.Add('<p><InputCheckbox @bind-Value="'+txtClassName.Text+'.'+CboField.Text+'" /><small class="text-muted">'+CboField.Text+'</small></p>');
      MemoForm.Lines.Add('<ValidationMessage For="@(()=>'+txtClassName.Text+'.'+CboField.Text+')" />');
   end;

   if(CboTipo.Text = 'NUMBER')then
   begin
      MemoForm.Lines.Add('');
      MemoForm.Lines.Add('<label for="formGroupExampleInput" class="control-label col-md-3 col-sm-3 col-xs-12">'+CboField.Text+'</label>');
      MemoForm.Lines.Add('<div class="col-md-9 col-sm-9 col-xs-12">');
      MemoForm.Lines.Add('<InputNumber class="form-control" @bind-Value="'+txtClassName.Text+'.'+CboField.Text+'"></InputNumber>');
      MemoForm.Lines.Add('<ValidationMessage For="@(()=>'+txtClassName.Text+'.'+CboField.Text+')" />');
      MemoForm.Lines.Add('</div>');
   end;

   if(CboTipo.Text = 'DATE')then
   begin
      MemoForm.Lines.Add('');
      MemoForm.Lines.Add('<label for="formGroupExampleInput" class="control-label col-md-3 col-sm-3 col-xs-12">'+CboField.Text+'</label>');
     MemoForm.Lines.Add('<div class="col-md-9 col-sm-9 col-xs-12">');
      MemoForm.Lines.Add('<InputDate class="form-control" @bind-Value="'+txtClassName.Text+'.'+CboField.Text+'"></InputDate>');
      MemoForm.Lines.Add('<ValidationMessage For="@(()=>'+txtClassName.Text+'.'+CboField.Text+')" />');
      MemoForm.Lines.Add('</div>');
   end;

   if(CboTipo.Text = 'RADIO')then
   begin
      MemoForm.Lines.Add('');
      i := 0;
        while( i  <= memoItensChild.Lines.Count - 1)do
        begin
          MemoForm.Lines.Add('<input type="radio"');
          MemoForm.Lines.Add('name="Gender" @bind-Value="'+txtClassName.Text+'.'+CboField.Text+'" /> ');
          MemoForm.Lines.Add('<label for="formGroupExampleInput" class="control-label col-md-3 col-sm-3 col-xs-12">'+memoItensChild.Lines[i]+'</label>');
          inc(i);
        end;
   end;

end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
   if txtChildField.Text <> string.empty then
      memoItensChild.Lines.Add(txtChildField.Text);

   txtChildField.Text := '';
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
 clipboard.AsText :=
 '<div class="row">'+#13+
 '    <div class="col">'+#13+
 '        <EditForm Model="@'+txtClassName.Text+'" OnValidSubmit="@METODO_PARA_SUBIMIT">'+#13+
 '            <DataAnnotationsValidator />'+#13+
 '                <div class="form-group">'+#13+
                  MemoForm.Text+#13+
 '                </div>'+#13+
 '        </EditForm>'+#13+
 '    </div>'+#13+
 '</div>';
end;

procedure TForm1.CboFieldSelect(Sender: TObject);
begin
 memoItensChild.Lines.Clear;
end;

procedure TForm1.CboTipoSelect(Sender: TObject);
begin
    if(CboTipo.Text <> 'TEXT') and (CboTipo.Text <> 'NUMBER') and (CboTipo.Text <> 'DATE')then
        pnlChildField.Visible := True
    else
        pnlChildField.Visible := False;
end;

end.
