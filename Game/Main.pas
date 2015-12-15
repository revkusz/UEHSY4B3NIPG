program Game;

uses crt,SDL2,SDL2_Image,MMSystem,forisek,petrik,norbi;

const mlgmode = true ; 


var
//VAR SDL 
sdlwindow1:PSDL_Window; sdlRenderer:PSDL_Renderer; event:PSDL_Event; textsurf:PSDL_Surface; pos:PSDL_rect;

//VAR SDL_TEXTURE
fal,tuske,player

:PSDL_Texture;


//VAR
palya:map; i,j,frame : byte; running:boolean; sajt:PUInt8;



procedure init(); //Initialization

begin
	if SDL_Init( SDL_INIT_VIDEO ) < 0 then HALT;

	sdlWindow1 := SDL_CreateWindow( 'Ultra Extra Hardcore SWAG YOLO 420 BlazeIt 360 NoScope Illuminati Platformer Game', 100,100, 1200, 375, SDL_Window_Shown );
	if sdlWindow1 = nil then HALT;

	sdlRenderer := SDL_CreateRenderer( sdlWindow1, -1, SDL_RENDERER_PRESENTVSYNC );
	if sdlRenderer = nil then HALT;
	{texture init begin}
	textsurf:=IMG_Load('res\textures\fal.tga');
	fal:=SDL_CreateTextureFromSurface(sdlRenderer,textsurf);
	textsurf:=IMG_Load('res\textures\spike.tga');
	tuske:=SDL_CreateTextureFromSurface(sdlRenderer,textsurf);
	textsurf:=IMG_Load('res\textures\player.tga');
	player:=SDL_CreateTextureFromSurface(sdlRenderer,textsurf);
	
	{texture init end}
	palya:=loadMap('res\maps\map001.txt');
	
	new(event); new(pos);
	pos^.w:=15;
	pos^.h:=15;
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
	if sajt[SDL_SCANCODE_W]=1 then palya:=jumpol;
	if sajt[SDL_SCANCODE_A]=1 then palya:=balra;
	if sajt[SDL_SCANCODE_D]=1 then palya:=jobra;
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
					SDL_RenderCopy(sdlRenderer,player,nil,pos);
					end;
					if palya[i+1,j+1]=3 then SDL_RenderCopy(sdlRenderer,fal,nil,pos);
					if palya[i+1,j+1]=4 then SDL_RenderCopy(sdlRenderer,tuske,nil,pos);
					
				end;
			end;
			if frame mod 2 = 0 then begin
				if isfall then begin 
					palya:=esik(palya);
				end;
				if isjump then begin
					palya:=ugrik(palya);
				end;
			end;
		end;
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
		loop();
		render();
	end;
	cleanup;
	
	
END.

