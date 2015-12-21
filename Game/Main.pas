program Game;

uses crt,SDL2,SDL2_Image,SDL2_TTF,MMSystem,forisek,petrik,norbi,sysutils;

const mlgmode = true ; 

type PSDL_Szoveg = record
		texture:PSDL_Texture;
		ps:PSDL_Rect;
	end;


var
//VAR SDL 
sdlwindow1:PSDL_Window; sdlRenderer:PSDL_Renderer; event:PSDL_Event; textsurf:PSDL_Surface; pos,asd:PSDL_rect; font:PTTF_Font; color:PSDL_Color;

//VAR SDL_TEXTURE
fal,tuske,player,halal,penz,portalA,portalB

:PSDL_Texture;

mlg:array[0..8] of PSDL_Texture; noscope:array[0..27] of PSDL_Texture;

//VAR
palya:map; i,j,frame,kaki,noscopei : byte; running:boolean; sajt:PUInt8; deaths,cash:integer;

procedure writetosdl(szvg:String; x:integer;y:integer);
var asd:PSDL_Szoveg;
begin
	new(asd.ps);
	textsurf:=TTF_RenderText_Solid(font,PAnsiChar(AnsiString(szvg)),color^);
	asd.texture:=SDL_CreateTextureFromSurface(sdlRenderer,textsurf);
	asd.ps^.x:=x;
	asd.ps^.y:=y;
	asd.ps^.h:=15;
	asd.ps^.w:=length(szvg)*15;
	SDL_RenderCopy(sdlRenderer,asd.texture,nil,asd.ps);
end;

procedure init(); //Initialization
var s:string;
begin
	TTF_Init;
	if SDL_Init( SDL_INIT_VIDEO ) < 0 then HALT;

	sdlWindow1 := SDL_CreateWindow( 'Ultra Extra Hardcore SWAG YOLO 420 BlazeIt 360 NoScope Illuminati Platformer Game', 100,100, 1200, 375, SDL_Window_Shown );
	if sdlWindow1 = nil then HALT;

	sdlRenderer := SDL_CreateRenderer( sdlWindow1, -1, SDL_RENDERER_PRESENTVSYNC );
	if sdlRenderer = nil then HALT;
	{texture init begin}
	textsurf:=IMG_Load('res\textures\icon.tga');
	SDL_SetWindowIcon(sdlWindow1,textsurf);
	textsurf:=IMG_Load('res\textures\fal.tga');
	fal:=SDL_CreateTextureFromSurface(sdlRenderer,textsurf);
	textsurf:=IMG_Load('res\textures\spike.tga');
	tuske:=SDL_CreateTextureFromSurface(sdlRenderer,textsurf);
	textsurf:=IMG_Load('res\textures\player.tga');
	player:=SDL_CreateTextureFromSurface(sdlRenderer,textsurf);
	textsurf:=IMG_Load('res\textures\death.tga');
	halal:=SDL_CreateTextureFromSurface(sdlRenderer,textsurf);
	textsurf:=IMG_Load('res\textures\cash.tga');
	penz:=SDL_CreateTextureFromSurface(sdlRenderer,textsurf);
	textsurf:=IMG_Load('res\textures\portalA.tga');
	portalA:=SDL_CreateTextureFromSurface(sdlRenderer,textsurf);
	textsurf:=IMG_Load('res\textures\portalB.tga');
	portalB:=SDL_CreateTextureFromSurface(sdlRenderer,textsurf);
	
{
	for i:=0 to 8 do begin
		s:='res\textures\mlg\IMG0000' + inttostr(i)+'.tga';
		textsurf:=IMG_Load(PAnsiChar(AnsiString(s)));
		mlg[i]:=SDL_CreateTextureFromSurface(sdlRenderer,textsurf);
	end;
}
	for i:=0 to 27 do begin
		if i < 10 then s:='res\textures\noscope\IMG0000' + inttostr(i)+'.tga' else
			s:='res\textures\noscope\IMG000' + inttostr(i)+'.tga';
			//writeln(s);
		textsurf:=IMG_Load(PAnsiChar(AnsiString(s)));
		noscope[i]:=SDL_CreateTextureFromSurface(sdlRenderer,textsurf);
		//SDL_SetTextureBlendMode(noscope[i],SDL_BLENDMODE_MOD);
	end;
	noscopei:=0;
	{texture init end}
	palya:=loadMap('res\maps\map001.txt');
	
	new(event); new(pos); new(color); new(asd); new(font);
	color^.r:=255;
	color^.g:=255;
	color^.b:=255;
	pos^.w:=15;
	pos^.h:=15;
	asd^.x:=75;
	asd^.y:=45;
	asd^.h:=360;
	asd^.w:=640;
	deaths:=0;
	font:=TTF_OpenFont('infierno.ttf',24);
end;

procedure onEvent(event:PSDL_Event); //event handling

begin
	{Case event^.type_ of 
		SDL_KEYDOWN: begin
			if event^.key.keysym.sym=SDLK_ESCAPE then running:=false;
			if event^.key.keysym.sym=SDLK_a  then palya:=balra;
			if event^.key.keysym.sym=SDLK_d  then palya:=jobra;
			if event^.key.keysym.sym=SDLK_w  then palya:=jumpol;
		end;
	end;}
	sajt := SDL_GetKeyboardState(nil);
	//writeln(sajt[SDL_SCANCODE_W]);
	if not isdead then begin
	if sajt[SDL_SCANCODE_W]=1 then if frame mod 1 = 0 then begin if  not isfall and not  ugrike then  palya:=jumpol; end;	 
	if sajt[SDL_SCANCODE_A]=1 then if frame mod 2 = 0 then begin palya:=balra; end;
	if sajt[SDL_SCANCODE_D]=1 then if frame mod 2 = 0 then begin palya:=jobra; end;
	end;
	if sajt[SDL_SCANCODE_R]=1 then begin if isdead then inc(deaths); palya:=loadMap('res\maps\map001.txt'); mapinit(palya);  end;
	if sajt[SDL_SCANCODE_ESCAPE] =1 then running:=false;
	
	
end;

procedure loop(); //main loop

begin
	
end;

procedure render(); //rendering process
begin
		SDL_SetRenderDrawColor(sdlRenderer,0,0,0,0);
		SDL_RenderClear(sdlRenderer);
		if frame=60 then frame:=1;
		begin
			for i:=0 to 23 do begin
				for j:=0 to 79 do begin
					pos^.x:=j*15;
					pos^.y:=i*15;
					if palya[i+1,j+1]=9 then begin 
					if not isdead then SDL_RenderCopy(sdlRenderer,player,nil,pos) else
						SDL_RenderCopy(sdlRenderer,halal,nil,pos)
					end;
					if palya[i+1,j+1]=3 then SDL_RenderCopy(sdlRenderer,fal,nil,pos);
					if palya[i+1,j+1]=5 then SDL_RenderCopy(sdlRenderer,penz,nil,pos);
					if palya[i+1,j+1]=4 then SDL_RenderCopy(sdlRenderer,tuske,nil,pos);
					if palya[i+1,j+1]=7 then SDL_RenderCopy(sdlRenderer,portalA,nil,pos); //kijárat
					if palya[i+1,j+1]=8 then SDL_RenderCopy(sdlRenderer,portalB,nil,pos); //bejárat
					
				end;
			end;
			if frame mod 7 = 0 then begin
				if isfall then begin 
					palya:=esik(palya);
				end;
				if isjump then begin
					palya:=ugrik(palya);
				end;
			end;
			
{
				SDL_RenderCopy(sdlRenderer,noscope[noscopei],nil,asd);
				if frame mod 3 = 0 then inc(noscopei);
				if noscopei>=27 then noscopei:=0;
}
				{SDL_RenderCopy(sdlRenderer,mlg[kaki],nil,asd);
				if frame mod 2 = 0 then inc(kaki);
				if kaki>=9 then kaki:=0;}
		end;
		writetosdl('Cash',400,375-15);
		writetosdl('Deaths',0,375-15);
		writetosdl(inttostr(deaths),7*15,375-15);
		writetosdl(inttostr(getcash),400+5*15,375-15);
		inc(frame);
		SDL_RenderPresent(sdlRenderer);
end;

procedure cleanup(); //cleanup process

begin
	SDL_Quit();
end;

procedure menu();

begin
	keret;
	CreateGomb('bejelentkezes',30,4,1);
	align('kozep',1);
	CreateGomb('regisztracio',30,5,2);
	CreateGomb('kilepes',30,6,3);
	align('jobbra',3);
	drawmenu;
	readkey;
	select(1);
	drawmenu;
	readkey;
	select(1);
	drawmenu;
	readkey;
	destorymenu;
end;


BEGIN
textcolor(white);
	cursoroff;
	//menu();
	running:=true;
	init();
	mapinit(palya);
	while (running) do begin
		if SDL_POLLEVENT(event)=1 then begin
			onEvent(event);
		end;
		//delay(100);
		loop();
		render();
	end;
	cleanup;
	
	
END.

