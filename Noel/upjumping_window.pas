program felugroablaaaak;

uses crt;
var i,x,y,s,s2:byte;
    key:char;
    d:boolean;

BEGIN
d:=false;
clrscr;
x:=2;
y:=1;

gotoxy(2,2);
write('-------------');
gotoxy(x,y);
write('O');
repeat
begin
{
if x=3 then d:=true;
if keypressed then
if d=true then
     begin
   window(25,5,60,20);
   textbackground(brown);
   clrscr;
   gotoxy(1,1);
   write(chr(201));
   for i:=1 to 33 do
   begin
    gotoxy(i+1,1);
    write(chr(205));
   end;
   
   for i:=1 to 14 do
   begin
    gotoxy(1,i+1);
    write(chr(186));
   end;
   
   gotoxy(1,16);
   write(chr(200));
  for i:=1 to 33 do
   begin
    gotoxy(i+1,16);
    write(chr(205));
   end;
   gotoxy(35,16);
   write(chr(188));
   
    for i:=1 to 14 do
   begin
    gotoxy(35,i+1);
    write(chr(186));
   end;
   
   gotoxy(35,1);
   write(chr(187));
   
   gotoxy(15,2);
   writeln('MEGHALTAL ');
   gotoxy(3,10);
   writeln(' ENTER=Kilepes   SPACE=Folytat');
   end;
}
case readkey of 
'd': begin
      x:=x+1;
      clrscr;
      gotoxy(2,2);
      write('-------------');
      gotoxy(x,y);
      write('O');
     end;
'a': begin
  x:=x-1;
  clrscr;
  gotoxy(2,2);
  write('-------------');
  gotoxy(x,y);
  write('O');
 end;
#27: begin
   textcolor(white);
   window(25,5,60,20);
   textbackground(brown);
   clrscr;
   gotoxy(1,1);
   write(chr(201));
   for i:=1 to 33 do
   begin
    gotoxy(i+1,1);
    write(chr(205));
   end;
   
   for i:=1 to 14 do
   begin
    gotoxy(1,i+1);
    write(chr(186));
   end;
   
   gotoxy(1,16);
   write(chr(200));
  for i:=1 to 33 do
   begin
    gotoxy(i+1,16);
    write(chr(205));
   end;
   gotoxy(35,16);
   write(chr(188));
   
    for i:=1 to 14 do
   begin
    gotoxy(35,i+1);
    write(chr(186));
   end;
   
   gotoxy(35,1);
   write(chr(187));
   
   gotoxy(15,2);
   writeln('!!PAUSE!! ');
   gotoxy(3,10);
   writeln(' ENTER=Kilepes   SPACE=Folytat');
   end;
#13: begin
    window(1,1,80,25);
    textbackground(black);
    clrscr;
    gotoxy(2,2);
   write('-------------');
   gotoxy(x,y);
   write('O');
  end;
end;
end;
until key = #13;
{
fomenu;
}
END.

