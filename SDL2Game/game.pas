program Game;

uses crt,SDL2,SDL2_Image,MMSystem;

const mlgmode = true ; 


var i,j : byte;
running:boolean;
s,f:string;
sdlwindow1:PSDL_Window;
sdlRenderer:PSDL_Renderer;
sdlTexture1,spike,player,pottex,hit:PSDL_Texture;
mlg:array[1..9] of PSDL_texture;
snop:array[1..58] of PSDL_texture;
image,screen,potsurf:PSDL_Surface;
event:PSDL_Event;
destR,asd: PSDL_Rect;
//png texture
pot:PSDL_RWops;

map:array[1..10,1..10] of char
	=(('3','3','3','3','3','3','3','3','3','3'),
	('3','0','9','0','0','0','0','0','0','3'),
	('3','3','3','0','0','0','0','0','0','3'),
	('3','0','3','0','3','3','3','3','3','3'),
	('3','0','3','0','0','0','0','3','3','3'),
	('3','0','0','3','3','3','0','0','3','3'),
	('3','3','0','0','3','3','0','0','3','3'),
	('3','3','0','3','3','3','0','0','3','3'),
	('3','3','0','0','0','3','0','0','0','2'),
	('3','3','4','4','4','3','4','4','3','3'));

procedure init(); //Initialization

begin
	for i:=1 to 10 do begin 
		for j:=1 to 10 do begin 
			if map[i,j] <>'0' then write(map[i,j]) else write(' ');
		end;
		writeln();
	end;
		sndPlaySound('res\music\weed.wav', snd_Async or snd_NoDefault);
     if SDL_Init( SDL_INIT_VIDEO ) < 0 then HALT;

  sdlWindow1 := SDL_CreateWindow( 'MLG360NOSCOPE420BLAZEIT', 100,100, 1200, 625, SDL_Window_Shown );
  if sdlWindow1 = nil then HALT;

  sdlRenderer := SDL_CreateRenderer( sdlWindow1, -1, 0 );
  if sdlRenderer = nil then HALT;

    sdlTexture1 := IMG_LoadTexture(sdlRenderer,'fal.bmp');
   spike := IMG_LoadTexture(sdlRenderer,'spike.bmp');
   player := IMG_LoadTexture(sdlRenderer,'res\player.bmp');
   //pot := IMG_LoadTexture(sdlRenderer,'pot.png');
  // pot:=SDL_RWFromFile('pot.png','rb');
   potsurf:=IMG_Load('pot.tga');
   if (potsurf=nil) then begin writeln('fasz');writeln(IMG_GetError) end;
   pottex:=SDL_CreateTextureFromSurface(sdlRenderer,potsurf);
   potsurf:=img_Load('res\hit.tga');
   hit:=SDL_CreateTextureFromSurface(sdlRenderer,potsurf);
   
   if mlgmode then begin //mlg gif
	mlg[1]:=IMG_loadTexture(sdlRenderer,'res\mlg\IMG00000.bmp');
	mlg[2]:=IMG_loadTexture(sdlRenderer,'res\mlg\IMG00001.bmp');
	mlg[3]:=IMG_loadTexture(sdlRenderer,'res\mlg\IMG00002.bmp');
	mlg[4]:=IMG_loadTexture(sdlRenderer,'res\mlg\IMG00003.bmp');
	mlg[5]:=IMG_loadTexture(sdlRenderer,'res\mlg\IMG00004.bmp');
	mlg[6]:=IMG_loadTexture(sdlRenderer,'res\mlg\IMG00005.bmp');
	mlg[7]:=IMG_loadTexture(sdlRenderer,'res\mlg\IMG00006.bmp');
	mlg[8]:=IMG_loadTexture(sdlRenderer,'res\mlg\IMG00007.bmp');
	mlg[9]:=IMG_loadTexture(sdlRenderer,'res\mlg\IMG00008.bmp');
	end;
	
	if mlgmode then begin //snopp dog gif
		snop[1]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00000.bmp');
		snop[2]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00001.bmp');
		snop[3]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00002.bmp');
		snop[4]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00003.bmp');
		snop[5]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00004.bmp');
		snop[6]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00005.bmp');
		snop[7]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00006.bmp');
		snop[8]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00007.bmp');
		snop[9]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00008.bmp');
		snop[10]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00009.bmp');
		snop[11]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00010.bmp');
		snop[12]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00011.bmp');
		snop[13]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00012.bmp');
		snop[14]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00013.bmp');
		snop[15]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00014.bmp');
		snop[16]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00015.bmp');
		snop[17]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00016.bmp');
		snop[18]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00017.bmp');
		snop[19]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00018.bmp');
		snop[20]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00019.bmp');
		snop[21]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00020.bmp');
		snop[22]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00021.bmp');
		snop[23]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00022.bmp');
		snop[24]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00023.bmp');
		snop[25]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00024.bmp');
		snop[26]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00025.bmp');
		snop[27]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00026.bmp');
		snop[28]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00027.bmp');
		snop[29]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00028.bmp');
		snop[30]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00029.bmp');
		snop[31]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00030.bmp');
		snop[32]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00031.bmp');
		snop[33]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00032.bmp');
		snop[34]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00033.bmp');
		snop[35]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00034.bmp');
		snop[36]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00035.bmp');
		snop[37]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00036.bmp');
		snop[38]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00037.bmp');
		snop[39]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00038.bmp');
		snop[40]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00039.bmp');
		snop[41]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00040.bmp');
		snop[42]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00041.bmp');
		snop[43]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00042.bmp');
		snop[44]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00043.bmp');
		snop[45]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00044.bmp');
		snop[46]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00045.bmp');
		snop[47]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00046.bmp');
		snop[48]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00047.bmp');
		snop[49]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00048.bmp');
		snop[50]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00049.bmp');
		snop[51]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00050.bmp');
		snop[52]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00051.bmp');
		snop[53]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00052.bmp');
		snop[54]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00053.bmp');
		snop[55]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00054.bmp');
		snop[56]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00055.bmp');
		snop[57]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00056.bmp');
		snop[58]:=IMG_loadTexture(sdlRenderer,'res\snopp dog\IMG00057.bmp');
	end;
	
	if mlgmode then begin for i:=1 to 58 do begin
	SDL_setTextureBlendMode(snop[i],SDL_BLENDMODE_ADD);
	end;
	//SDL_setTextureBlendMode(pottex,SDL_BLENDMODE_MOD);}
	end;
  new(event); new(destR); new (asd);
	destR^.x:=0;
	destR^.y:=0;
	destR^.w:=200;
	destR^.h:=300;
	asd^.x:=400;
	asd^.y:=0;
	asd^.w:=300;
	asd^.h:=300;
	i:=1;
end;

procedure onEvent(event:PSDL_Event); //event handling

begin
	Case event^.type_ of 
		SDL_KEYDOWN: begin
			if event^.key.keysym.sym=27 then running:=false;
		end;
	end;
end;

procedure loop(); //main loop

begin
	if keypressed then running:=false;
	
end;

procedure render(); //rendering process

begin
		SDL_SetRenderDrawColor(sdlRenderer,0,0,0,0);
		SDL_RenderClear(sdlRenderer);
		if mlgmode then begin 
		SDL_RenderCopy(sdlRenderer,mlg[j],nil,nil);
		SDL_RenderCopy(sdlRenderer,snop[i],nil,destR);
		//SDL_RenderCopy(sdlRenderer,pot,nil,asd);
		SDL_RenderCopy(sdlRenderer,pottex,nil,asd);
		
		end;
		if not mlgmode then begin
			for i:=0 to 9 do begin
				for j:=0 to 9 do begin
					destR^.x:=j*15;
					destR^.y:=i*15;
					if map[i+1,j+1]='9' then begin 
					SDL_RenderCopy(sdlRenderer,player,nil,destR);
					//destR^.x:=30;
					//destR^.y:=30;
					SDL_RenderCopy(sdlRenderer,hit,nil,destR);
					end;
					if map[i+1,j+1]='3' then SDL_RenderCopy(sdlRenderer,sdlTexture1,nil,destR);
					if map[i+1,j+1]='4' then SDL_RenderCopy(sdlRenderer,spike,nil,destR);
				end;
			end;
		end;
		if mlgmode then begin
		if (destR^.x=790) then destR^.x:=0;
		delay(30);
		
		inc(i);
		inc(j);
		if j>8 then j:=1;
		if i>58 then i:=1;
		end;
		SDL_RenderPresent(sdlRenderer);
end;

procedure cleanup(); //cleanup process

begin
	SDL_Quit();
end;

BEGIN
	running:=true;
	init();
	while (running) do begin
		if SDL_POLLEVENT(event)=1 then begin
			onEvent(event);
		end;
		loop();
		render();
	end;
	cleanup;
	
	
END.

