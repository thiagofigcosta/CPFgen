unit UnitCPF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Timer: TTimer;
    Button1: TButton;
    memo1: TMemo;
    edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  d10, d11 : integer;
  quantidade : integer=01;

implementation

{$R *.dfm}

function cpf(num : string):boolean;
var d : array[1..9] of integer;
begin
  d[1] := StrToInt(num[1]);
  d[2] := StrToInt(num[2]);
  d[3] := StrToInt(num[3]);
  d[4] := StrToInt(num[4]);
  d[5] := StrToInt(num[5]);
  d[6] := StrToInt(num[6]);
  d[7] := StrToInt(num[7]);
  d[8] := StrToInt(num[8]);
  d[9] := StrToInt(num[9]);

  d10 := d[1]*10 + d[2]*9 + d[3]*8 + d[4]*7 + d[5]*6 + d[6]*5 +
         d[7]*4 + d[8]*3 + d[9]*2;
  d10 := 11-(d10 mod 11);
  if d10 >= 10 then
    d10 := 0;

  d11 :=d[1]*11 + d[2]*10 + d[3]*9 + d[4]*8 + d[5]*7 + d[6]*6 +
         d[7]*5 + d[8]*4 + d[9]*3 + d10*2;
  d11 := 11-(d11 mod 11);
  if d11 >= 10 then
    d11 := 0;
end;


procedure TForm1.Button1Click(Sender: TObject);
var r : array[1..9] of integer;
begin
  if not timer.Enabled then
  timer.Enabled := true;
  randomize;
  r[1] := random(9);
  r[2] := random(9);
  r[3] := random(9);
  r[4] := random(9);
  r[5] := random(9);
  r[6] := random(9);
  r[7] := random(9);
  r[8] := random(9);
  r[9] := random(9);

  edit1.Text := IntToStr(r[1]) + IntToStr(r[2]) + IntToStr(r[3]) + IntToStr(r[4]) +
                IntToStr(r[5]) + IntToStr(r[6]) + IntToStr(r[7]) + IntToStr(r[8]) + IntToStr(r[9]);

  cpf(edit1.Text);

  edit1.Text := edit1.Text + IntToStr(d10) + IntToStr(d11);

  memo1.Lines.Add(edit1.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
timer.Enabled := false;
end;

procedure TForm1.Button3Click(Sender: TObject);
var r : array[1..9] of integer;
begin

  randomize;
  r[1] := random(9);
  r[2] := random(9);
  r[3] := random(9);
  r[4] := random(9);
  r[5] := random(9);
  r[6] := random(9);
  r[7] := random(9);
  r[8] := random(9);
  r[9] := random(9);

  edit1.Text := IntToStr(r[1]) + IntToStr(r[2]) + IntToStr(r[3]) + IntToStr(r[4]) +
                IntToStr(r[5]) + IntToStr(r[6]) + IntToStr(r[7]) + IntToStr(r[8]) + IntToStr(r[9]);


end;

procedure TForm1.TimerTimer(Sender: TObject);
begin
  button1.Click;
  inc(quantidade);
  label1.Caption := 'Quantidade de CPF(s): ' + IntToStr(quantidade);
end;

end.
