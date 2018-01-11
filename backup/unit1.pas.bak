unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    customersLabel: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
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

type
  items=record
    code: integer;
    quantity: integer;
    price: real;
  end;

  ln=record
    norp: char;
    id: integer;
    transaction: array [1..90] of items;
    //cena za nakup? real
  end;


var
  Form1: TForm1;
  revenue, expanses: real;
  stats: textfile;
  db: array of ln;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
var avarage, revenue, expanses, result: real;
  lines, i, customers, idaside, basket: integer;
  ch: char;
  chfield: string;
begin
   customers:=0;
   revenue:=0;
   expanses:=0;
   avarage:=0;
   result:=0;
   idaside:=0;
   basket:=0;

   assignfile(stats, 'STATISTIKY.txt');     //TODO if file exists
   reset(stats);                            // path \\comenius\public\market\tima\
   readln(stats, lines);                   //ziskaj kolko ma subor riadkov
   for i:=1 to lines do begin              //while not eof?
       read(stats, db[i].norp);
       read(stats,ch);                     //je ;
       read(stats, ch);
       while ch<>';' do begin              //id
           chfield:=chfield+ch;
           read(stats, ch);
       end;
       db[i].id:=strtoint(chfield);
       read(stats,ch);
       chfield:='';
       //read(stats, ch);

       while ch<>';' do begin              //code
           chfield:=chfield+ch;
           read(stats, ch);

       end;
       db[i].transaction[i].code:=strtoint(chfield);
       read(stats,ch);
       chfield:='';
       //read(stats, ch);

       while ch<>';' do begin              //quantity
           chfield:=chfield+ch;
           read(stats, ch);

       end;
       db[i].transaction[i].quantity:=strtoint(chfield);
       //read(stats,ch);
       chfield:='';
       readln(stats, db[i].transaction[i].price);
       //until eoln;
       chfield:='';
   end;

   for i:=1 to lines do begin
       memo2.append(db[i].norp+' '+inttostr(db[i].id)+' '+inttostr(db[i].transaction[i].code)+' '+inttostr(db[i].transaction[i].quantity)+' '+floattostr(db[i].transaction[i].price));
   end;

  for i:=1 to lines do begin
      if db[i].norp = 'P' then begin
          inc(customers);
          //aktualne id rovnake ako minule
          db[1].id:=idaside;
          if idaside<>db[i].id then
            idaside:=db[i].id
          else
            inc(basket);
          revenue:=revenue+(db[i].transaction[i].quantity*db[i].transaction[i].price);
      end
      else begin
          expanses:=expanses+(db[i].transaction[i].quantity*db[i].transaction[i].price);
      end;
  end;
  avarage:=revenue / basket; //delene pocet rovnakych id
  result:=revenue-expanses;
  if result < 0 then resultLabel.font.color:=clRed
  else resultLabel.font.color:=clGreen;
   resultlabel.alignment:=tacenter;
  //output
  customersLabel.caption:=inttostr(customers);
  avarageLabel.caption:=floattostr(avarage);
  revenueLabel.caption:=floattostr(revenue)+'€';
  expansesLabel.caption:=floattostr(expanses)+'€';
  resultLabel.caption:=floattostr(result)+'€';



  memo1.clear;
  //loop po vsetkych P, pri kazdom P skontrolovat vsetky P, if P ma rovnaky kod
  //ako aktualne P, zvysit premennu. potom sort
  Memo1.append(inttostr(0)+'. '+'Example polozka');

  closefile(stats); //treba zavriet co najskor
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   setlength(db,90);
   //setlength(db.transaction,90);
end;

end.

