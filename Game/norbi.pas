unit norbi;

interface
type map = array[1..24,1..80] of byte; 
	jatekos = record
		x,y:byte;
	end;
var player:jatekos;
	palya:map;
	esike:boolean;
	ugrike:boolean;
	died:boolean;
	jump:byte;
	cash:integer;

procedure mapinit(mapp:map);
function jobra :map;
function balra :map;
function esik(mapp:map) :map ;
function jumpol  : map;
function ugrik(mapp:map) :map;
function isfall:boolean;
function isjump:boolean;
procedure resetjump;
function isdead :boolean;
function getcash :integer;

implementation

uses crt;

function getcash :integer;

begin
	getcash:=cash;
end;

function jumpol : map ;

begin
	ugrike:=true;
	jumpol := palya;
end;

function jobra : map;
 
begin
	If palya[player.x,player.y+1] <> 3 Then 
							Begin
								if palya[player.x,player.y+1] = 5 then inc(cash);
								palya[player.x,player.y] := 0;
								inc(player.y);
								palya[player.x,player.y] := 9;
								If palya[player.x+1,player.y] = 4 then begin {Writeln('Tuskebe estel!');} if not ugrike then esike:=true; end;		//writeparancs sdl-be						
								If palya[player.x+1,player.y] = 0 Then	// Ha jobbra lép és alatta nem lesz platform
									Begin
										if not ugrike then esike:=true;
									End;
								End;
		jobra:=palya;
end;

function balra :map;

begin
	If palya[player.x,player.y-1] <> 3 Then 
							Begin	
								if palya[player.x,player.y-1] = 5 then inc(cash);
								palya[player.x,player.y] := 0;
								dec(player.y);
								palya[player.x,player.y] := 9;
								If palya[player.x+1,player.y] = 4 then begin {Writeln('Tuskebe estel!');} if not ugrike then esike:=true; end;		//writeparancs sdl-be						
								If palya[player.x+1,player.y] = 0 Then	// Ha jobbra lép és alatta nem lesz platform
									Begin
										if not ugrike then esike:=true;
									End;
								End;
		balra:=palya
end;

function esik(mapp:map) :map;

begin
	palya:=mapp;
	if palya[player.x+1,player.y] <> 3 then begin
		if palya[player.x+1,player.y] = 5 then inc(cash);
		if palya[player.x+1,player.y] = 3 then esike:=false;
		if palya[player.x+1,player.y] = 4 then begin died:=true; end;
		palya[player.x,player.y] := 0;
		inc(player.x);
		palya[player.x,player.y] := 9;
	end else esike:=false;
	esik:=palya;
end;

function ugrik(mapp:map) : map;

begin
	palya:=mapp;
	if palya[player.x-1,player.y] <> 3 then begin
	if palya[player.x-1,player.y] = 5 then inc(cash);
		inc(jump);
		palya[player.x,player.y] := 0;
		dec(player.x);
		palya[player.x,player.y] := 9;
		if jump>=5 then begin ugrike:=false; esike:=true; jump:=0; end;
		if palya[player.x-1,player.y] = 3 then begin ugrike:=false; esike:=true; jump:=0 end;
		if palya[player.x-1,player.y] = 4 then begin ugrike:=false; esike:=true; jump:=0 end;
	end else begin ugrike:=false; esike:=true; end; 
	ugrik:=palya;

end;


function isfall :boolean;

begin
	isfall:=esike
end;

function isjump :boolean;

begin
	isjump:=ugrike;
end;

procedure resetjump;

begin 
	jump:=0;
end;

function isdead :boolean;

begin
	isdead:=died;
end;

procedure mapinit(mapp:map); 
var i,j:byte;
begin
	cash:=0;
	palya:=mapp;
	esike:=false;
	died:=false;
	for i:=1 to 24 do begin
		for j:=1 to 80 do begin
			if palya[i,j]=9 then begin 
				player.x:=i; player.y:=j;
			end;
		end;
	end;
end;
initialization
	begin
		
	end;
END.

