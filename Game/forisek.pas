unit forisek;

interface
type map = array[1..24,1..80] of byte; 
var f:text;
     s:string;
     i,j:integer;
     
function loadMap(utvonal:string ) : map;
procedure drawmap(palya:map);

implementation

uses crt;

function loadMap(utvonal:string) : map;
	var
	asd:map;
	i,j:byte;
	s:string;
begin
	assign(f,utvonal);
	{$I-}
		reset(f);
	{$I+}
	if IOResult<>0 then begin
		writeln('Hiba: nincs meg a file.');
		halt;
	end;
	j:=1;
	while not eof(f) do begin
		readln(f,s);
		for i:=1 to 80 do begin
			case s[i] of 
				'3':asd[j,i]:=3;
				'4':asd[j,i]:=4;
				' ':asd[j,i]:=0;
				'9':asd[j,i]:=9;
				'5':asd[j,i]:=5;
				'7':asd[j,i]:=7;
				'8':asd[j,i]:=8;
			end;
		end;
		inc(j);
	end;
	close(f);
	loadMap:=asd;
end;

procedure drawmap(palya:map);
var i,j:byte;
begin
	clrscr;
	for i:=1 to 24 do begin 
		for j:=1 to 80 do begin 
			case palya[i,j] of 
				3:write(chr(178));
				4:write(chr(18));
				0:write(' ');
			end;
		end;
	end;
end;

initialization
	begin

	end;
END.

