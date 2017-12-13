unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    revenueLabel: TLabel;
    expansesLabel: TLabel;
    avarageLabel: TLabel;
    resultLabel: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  a, b: real;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
var avarage, revenue, expanses, result: real;
begin
  avarage:=random(80)+10;
  a:=a+25.4;
  b:=b+24.9;
  result:=a-b;
  //output
  avarageLabel.caption:=floattostr(avarage);
  revenueLabel.caption:=floattostr(a);
  expansesLabel.caption:=floattostr(b);
  resultLabel.caption:=floattostr(result);
  memo1.clear;
  Memo1.append(inttostr(0)+'. '+'Example polozka');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   a:=50.1;
   b:=45;
end;

end.

