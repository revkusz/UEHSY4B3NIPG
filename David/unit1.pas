unit unit1;

interface

procedure bejmenu;
procedure fomenu;
procedure bejelentkezes;
procedure regisztracio;
procedure keret;
procedure beallitasok;

implementation
uses crt;

procedure keret;

var i:byte;

begin
	for i:= 1 to 15 do begin
		gotoxy(20,i);
		write(chr(186));
	end;
	gotoxy(20,16); write(chr(200));
	
	for i:= 21 to 54 do begin
		gotoxy(i,16);
		write(chr(205));
	end;
	gotoxy(55,16); write(chr(188));
	
	for i:= 15 downto 1 do begin
		gotoxy(55,i);
		write(chr(186));
	end;
end;

procedure bejmenu;

var i:byte;
	ch:char;
	tovabb:boolean;

begin
i:=8;
tovabb:=false;
clrscr;
	gotoxy(25,1); textcolor(yellow); writeln('Bejelentkezes/Regisztracio');
	gotoxy(31,5); textcolor(white); writeln('Bejelentkezes');
	gotoxy(31,6); textcolor(white); writeln('Regisztracio');
	gotoxy(34,7); textcolor(white); writeln('Kilepes');
	keret;
repeat

ch:=ReadKey;
    case ch of
     #0 : begin
            ch:=ReadKey; {Read ScanCode}
            case ch of
             #72 : begin
				i:=i-1;
				//writeln('asd');
				if i < 5 then i:=7;
				end;
             #80 : begin
						i:=i+1;
						//writeln('asd');
						if i > 7 then i:=5
					end;
            end;
          end;
    end;
	{ch:=ReadKey;
	case ch of
		#0 : begin
			ch:=ReadKey;
			case ch of
			#72 : begin
						i:=i-1;
						//writeln('asd');
						if i < 5 then i:=7;
				   end;
             #80 : begin
						i:=i+1;
						//writeln('asd');
						if i > 7 then i:=5;
				   end;
            end;
       end;
    end;}
    
    tovabb:=false;
    
    repeat
    
    if i = 5 then begin
			gotoxy(31,5); textcolor(white); textbackground(white); writeln('Bejelentkezes');
			delay(150);
			gotoxy(31,5); textcolor(white); textbackground(black); writeln('Bejelentkezes');
			delay(150);
		end;
		
	if i = 6 then begin
			gotoxy(31,6); textcolor(white); textbackground(white); writeln('Regisztracio');
			delay(150);
			gotoxy(31,6); textcolor(white); textbackground(black); writeln('Regisztracio');
			delay(150);
		end;
		
	if i = 7 then begin
			gotoxy(34,7); textcolor(white); textbackground(white); writeln('Kilepes');
			delay(150);
			gotoxy(34,7); textcolor(white); textbackground(black); writeln('Kilepes');
			delay(150);
		end;
		
	until keypressed;
	
	//ch:=Readkey;
    
until (ch=#13) or (tovabb = true); 

if i=5 then bejelentkezes;
if i=6 then regisztracio;
if i=7 then halt;
end;

procedure beallitasok;

var a:byte;
	ch:char;
	tovabb:boolean;

begin
a:=5;
tovabb:=false;
clrscr;
	gotoxy(35,1); textcolor(yellow); writeln('Beallitasok');
	gotoxy(30,5); textcolor(white); writeln('Hang ki/be kapcsolasa');
	gotoxy(30,6); textcolor(white); writeln('MLG mod ki/be pakcsolasa');
	gotoxy(33,7); textcolor(white); writeln('Kepernyo meretezese');
	gotoxy(35,8); textcolor(white); writeln('Fomenu');
	keret;
repeat

ch:=ReadKey;
    case ch of
     #0 : begin
            ch:=ReadKey; {Read ScanCode}
            case ch of
             #72 : begin
				a:=a-1;
				//writeln('asd');
				if a < 5 then a:=8;
				end;
             #80 : begin
						a:=a+1;
						//writeln('asd');
						if a > 8 then a:=5
					end;
            end;
          end;
    end;
	{ch:=ReadKey;
	case ch of
		#0 : begin
			ch:=ReadKey;
			case ch of
			#72 : begin
						i:=i-1;
						//writeln('asd');
						if i < 5 then i:=7;
				   end;
             #80 : begin
						i:=i+1;
						//writeln('asd');
						if i > 7 then i:=5;
				   end;
            end;
       end;
    end;}
    
    tovabb:=false;
    
    repeat
    
    if a = 5 then begin
			gotoxy(30,5); textcolor(white); textbackground(white); writeln('Hang ki/be kapcsolasa');
			delay(150);
			gotoxy(30,5); textcolor(white); textbackground(black); writeln('Hang ki/be kapcsolasa');
			delay(150);
		end;
		
	if a = 6 then begin
			gotoxy(30,6); textcolor(white); textbackground(white); writeln('MLG mod ki/be pakcsolasa');
			delay(150);
			gotoxy(30,6); textcolor(white); textbackground(black); writeln('MLG mod ki/be pakcsolasa');
			delay(150);
		end;
		
	if a = 7 then begin
			gotoxy(33,7); textcolor(white); textbackground(white); writeln('Kepernyo meretezese');
			delay(150);
			gotoxy(33,7); textcolor(white); textbackground(black); writeln('Kepernyo meretezese');
			delay(150);
		end;
		
	if a = 8 then begin
			gotoxy(35,8); textcolor(white); textbackground(white); writeln('Fomenu');
			delay(150);
			gotoxy(35,8); textcolor(white); textbackground(black); writeln('Fomenu');
			delay(150);
		end;
		
	until keypressed;
	
	//ch:=Readkey;
    
until (ch=#13) or (tovabb = true); 

//if i=5 then jatek;
//if a=6 then beallitasok;
//if i=7 then statisztika;
//if a=8 then halt;
end;

procedure fomenu;

var i:byte;
	ch:char;
	tovabb:boolean;

begin
i:=8;
tovabb:=false;
clrscr;
	gotoxy(35,1); textcolor(yellow); writeln('Fomenu');
	gotoxy(32,5); textcolor(white); writeln('Jatek kezdese');
	gotoxy(33,6); textcolor(white); writeln('Beallitasok');
	gotoxy(33,7); textcolor(white); writeln('Statisztika');
	gotoxy(35,8); textcolor(white); writeln('Kilepes');
	keret;
repeat

ch:=ReadKey;
    case ch of
     #0 : begin
            ch:=ReadKey; {Read ScanCode}
            case ch of
             #72 : begin
				i:=i-1;
				//writeln('asd');
				if i < 5 then i:=8;
				end;
             #80 : begin
						i:=i+1;
						//writeln('asd');
						if i > 8 then i:=5
					end;
            end;
          end;
    end;
	{ch:=ReadKey;
	case ch of
		#0 : begin
			ch:=ReadKey;
			case ch of
			#72 : begin
						i:=i-1;
						//writeln('asd');
						if i < 5 then i:=7;
				   end;
             #80 : begin
						i:=i+1;
						//writeln('asd');
						if i > 7 then i:=5;
				   end;
            end;
       end;
    end;}
    
    tovabb:=false;
    
    repeat
    
    if i = 5 then begin
			gotoxy(32,5); textcolor(white); textbackground(white); writeln('Jatek kezdese');
			delay(150);
			gotoxy(32,5); textcolor(white); textbackground(black); writeln('Jatek kezdese');
			delay(150);
		end;
		
	if i = 6 then begin
			gotoxy(33,6); textcolor(white); textbackground(white); writeln('Beallitasok');
			delay(150);
			gotoxy(33,6); textcolor(white); textbackground(black); writeln('Beallitasok');
			delay(150);
		end;
		
	if i = 7 then begin
			gotoxy(33,7); textcolor(white); textbackground(white); writeln('Statisztika');
			delay(150);
			gotoxy(33,7); textcolor(white); textbackground(black); writeln('Statisztika');
			delay(150);
		end;
		
	if i = 8 then begin
			gotoxy(35,8); textcolor(white); textbackground(white); writeln('Kilepes');
			delay(150);
			gotoxy(35,8); textcolor(white); textbackground(black); writeln('Kilepes');
			delay(150);
		end;
		
	until keypressed;
	
	//ch:=Readkey;
    
until (ch=#13) or (tovabb = true); 

//if i=5 then jatek;
if i=6 then beallitasok;
//if i=7 then statisztika;
if i=8 then halt;
end;

procedure bejelentkezes;

var nevek,jelszavak:text;
	felhnev,keresf,felhasznalo,keresp,pass,jelszo:string;
	i,sor:longint;

begin
clrscr;
i:=0; sor:=0;
	keret;
	readkey;
	gotoxy(29,1); textcolor(yellow); writeln('Bejelentkezo panel:');
	gotoxy(22,5); textcolor(white); writeln('Felhasznalonev:'); gotoxy(37,5); readln(felhnev);
	gotoxy(25,6); textcolor(white); writeln('Jelszo:'); gotoxy(32,6); readln(pass);
	
	assign(nevek,'nevek.txt');
	assign(jelszavak,'jelszavak.txt');
	{$I-}
	reset(nevek);
	reset(jelszavak);
	{$I+}
	
	if IOResult<>0 then begin
		textcolor(red);
		gotoxy(27,10);
		writeln('Hiba: Nem talalom a fajlokat.');
		delay(3000);
		halt;
	end;
	
	while not eof(nevek) do begin
		readln(nevek,keresf);
		i:=i+1;
		if felhnev = keresf then
		begin
			felhasznalo:=keresf;
			sor:=i;
		end;
	end;
	
	if felhnev <> felhasznalo then
	begin
		textcolor(red);
		gotoxy(23,10);
		writeln('Ilyen felhasznalo nem letezik.');
		delay(3000);
		close(nevek);
		close(jelszavak);
		bejmenu;
	end;
	
	i:=0;
	
	while not eof(jelszavak) do begin
		readln(jelszavak,keresp);
		i:=i+1;
		if i = sor then jelszo:=keresp;
	end;
	
	if pass <> jelszo then
	begin
		textcolor(red);
		gotoxy(28,10);
		writeln('A jelszo nem egyezik!');
		delay(3000);
		close(nevek);
		close(jelszavak);
		bejmenu;
	end;
	
	if (pass = jelszo) and (felhnev = felhasznalo) then
	begin
		textcolor(green);
		gotoxy(27,10);
		writeln('Sikeres bejelentkezes!');
		delay(3000);
		fomenu;
	end;
	
	
end;

procedure regisztracio;

var felhnev,keresf,pass,keresp:string;
	nevek,jelszavak:text;
	elfogadva:boolean;
	tarolas,tarolasp:array[1..10000] of string;
	i,sor:longint;
	

begin
elfogadva:=true;
clrscr;
i:=0; sor:=0;
	keret;
	readkey;
	gotoxy(30,1); textcolor(yellow); writeln('Regisztracios panel:');
	gotoxy(22,5); textcolor(white); writeln('Felhasznalonev:'); gotoxy(37,5); readln(felhnev);
	gotoxy(25,6); textcolor(white); writeln('Jelszo:'); gotoxy(32,6); readln(pass);
	
	assign(nevek,'nevek.txt');
	assign(jelszavak,'jelszavak.txt');
	{$I-}
	reset(nevek);
	reset(jelszavak);
	{$I+}
	if IOResult<>0 then begin
		textcolor(red);
		gotoxy(27,10);
		writeln('Hiba: nincs meg a file.');
		gotoxy(27,11);
		writeln('Uj fajlok letrehozasa...');
		gotoxy(23,12);
		writeln('A rendszer kilep, inditsa ujra!');
		delay(7000);
		rewrite(nevek);
		rewrite(jelszavak);
		halt;
	end;
	close(nevek); close(jelszavak);
	
	reset(nevek); reset(jelszavak);
	
	while not eof(nevek) do begin
		i:=i+1;
		readln(nevek,keresf);
		tarolas[i]:=keresf;
		if keresf = felhnev then sor:=i;
	end;
	
	if sor > 0 then begin
		gotoxy(23,10);
		textcolor(red);
		writeln('Ilyen felhasznalo mar letezik!');
		delay(5000);
		elfogadva:=false;
		bejmenu;
	end;
	
	close(nevek);
	rewrite(nevek);
	for i:= 1 to i do
	begin
		writeln(nevek,tarolas[i]);
	end;
	if elfogadva = true then writeln(nevek,felhnev);
	
	
	
	i:=0;	
	while not eof(jelszavak) do begin
		i:=i+1;
		readln(jelszavak,keresp);
		tarolasp[i]:=keresp;
	end;
	close(jelszavak);
	rewrite(jelszavak);
	for i:= 1 to i do
	begin
		writeln(jelszavak,tarolasp[i]);
	end;
	writeln(jelszavak,pass);
	gotoxy(25,10);
	textcolor(red);
	writeln('Felhasznalo letrehozasa...');
	delay(2000);
	gotoxy(25,10);
	textcolor(green);
	writeln('Felhasznalo letrehozva!!!!');
	delay(2000);
	close(jelszavak);
	close(nevek);
	bejmenu;
	
	
end;

end.
