unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    customersLabel: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
  {items=record
    code: integer;
    quantity: integer;
    price: real;
  end;}

  ln=record
    norp: char;
    id: integer;
    //transaction: array [1..90] of items;
    code: integer;
    quantity: integer;
    price: real;
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
   try
      assignfile(stats, 'STATISTIKY.txt');
      reset(stats);                            // path \\comenius\public\market\tima\
   except on E: EInOutError do begin
       label3.caption:=('Pri načítavaní súboru došlo k chybe: '+ E.ClassName+ '/'+ E.Message);
       exit;
   end;
   end;
      readln(stats, lines);                   //ziskaj kolko ma subor riadkov
      label3.caption:='';
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
       while ch<>';' do begin              //code
           chfield:=chfield+ch;
           read(stats, ch);
       end;
       db[i].code:=strtoint(chfield);
       read(stats,ch);
       chfield:='';
       while ch<>';' do begin              //quantity
           chfield:=chfield+ch;
           read(stats, ch);
       end;
       db[i].quantity:=strtoint(chfield);
       chfield:='';
       readln(stats, db[i].price);
       chfield:='';
   end;

   closefile(stats);
   //finally
   for i:=1 to lines do begin
       memo2.append(db[i].norp+' '+inttostr(db[i].id)+' '+inttostr(db[i].code)+' '+inttostr(db[i].quantity)+' '+floattostr(db[i].price));
   end;

  for i:=1 to lines do begin
      if db[i].norp = 'P' then begin
          //aktualne id rovnake ako minule
          db[1].id:=idaside;
          if idaside<>db[i].id then begin
            idaside:=db[i].id;
            inc(customers);
          end;

          revenue:=revenue+(db[i].quantity*db[i].price);
      end
      else begin
          expanses:=expanses+(db[i].quantity*db[i].price);
      end;
  end;
  avarage:=revenue / customers; //delene pocet rovnakych id
  avarage:=roundto(avarage, -2);
  result:=revenue-expanses;
  if result < 0 then resultLabel.font.color:=clRed
  else resultLabel.font.color:=clGreen;
  //output
  customersLabel.caption:=inttostr(customers);
  avarageLabel.caption:=floattostr(avarage);
  revenueLabel.caption:=floattostr(revenue)+'€';
  expansesLabel.caption:=floattostr(expanses)+'€';
  resultLabel.caption:=floattostr(result)+'€';

  memo1.clear;
  //loop po vsetkych P, pri kazdom P skontrolovat vsetky P, if P ma rovnaky kod
  //ako aktualne P, zvysit premennu. potom sort

  for i:=1 to 10 do
      Memo1.append(inttostr(i)+'. '+'Example polozka');

   //treba zavriet co najskor
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   setlength(db,90);
   //setlength(db.transaction,90);
end;

end.

