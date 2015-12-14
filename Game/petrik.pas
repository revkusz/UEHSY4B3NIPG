unit petrik;

interface
type gomb = record 
	cim:string;
	x,y:byte;
	selected:boolean;
	pos:byte;
end;
var gombok:array[1..5] of gomb;
gombi,cursor:byte;
fut:boolean;

procedure keret;
procedure drawmenu;
procedure drawgomb(btn:gomb);
procedure destorymenu;
procedure select(pos:byte);
procedure align(hova:string; pos:byte);
function CreateGomb(cim:string; x:byte; y:byte; pos:byte) :gomb;


     
implementation

uses crt;


procedure align(hova:string; pos:byte);
var hossz:byte;
begin
	hossz:= length(gombok[pos].cim);
	case hova of 
		'kozep':begin
			gombok[pos].x:=gombok[pos].x-(hossz div 2);
		end;
		'jobbra':begin
			gombok[pos].x:=gombok[pos].x-hossz;
		end;
		'balra':begin
			
		end;
	end;
		
end;

function CreateGomb(cim:string; x:byte; y:byte; pos:byte) :gomb;

begin
	inc(gombi);
	gombok[gombi].cim:=cim;
	gombok[gombi].x:=x;
	gombok[gombi].y:=y;
	gombok[gombi].pos:=pos;
	CreateGomb:=gombok[gombi];
end;

procedure drawmenu;

var i:byte;

begin

	for i:=1 to gombi do begin
		gotoxy(gombok[i].x,gombok[i].y);
		if gombok[i].selected then begin
			textbackground(white);
			textcolor(black);
			write(gombok[i].cim);
			textcolor(white);
			textbackground(black);
		end else write(gombok[i].cim);
	end;

end;

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

procedure destorymenu;

begin

end;

procedure drawgomb(btn:gomb);

begin
	gotoxy(btn.x,btn.y);
	write(btn.cim);
end;


procedure select(pos:byte);
begin
	if gombok[pos].selected=false then 
	gombok[pos].selected:=true else 
	gombok[pos].selected:=false;
end;

initialization
	begin
	fut:=true;
	writeln('asd');
		gombi:=0;
		
	end;
END.

