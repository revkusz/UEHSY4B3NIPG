program SDLGame;

uses crt,SDL2,SDL2_image;

var 
sdlWindow1 : PSDL_Window;
sdlRenderer : PSDL_Renderer;
sdlTexture1: PSDL_Texture;
sdlSurface,screen :PSDL_Surface;
srcR,destR: PSDL_Rect;
i,j:integer;

begin
	
  //initilization of video subsystem
  if SDL_Init( SDL_INIT_VIDEO ) < 0 then HALT;

  sdlWindow1 := SDL_CreateWindow( 'Window1', 100,100, 800, 250, SDL_WINDOW_SHOWN );
  if sdlWindow1 = nil then HALT;

  sdlRenderer := SDL_CreateRenderer( sdlWindow1, -1, 0 );
  if sdlRenderer = nil then HALT;
  new(srcR); new(destR);
	destR^.x:=0;
	destR^.y:=0;
	destR^.w:=10;
	destR^.h:=10;
  SDL_SetRenderDrawColor(sdlRenderer,0,0,0,0);
  SDL_RenderClear(sdlRenderer);
  SDL_RenderPresent(sdlRenderer);
  SDL_SetRenderDrawColor(sdlRenderer,255,255,255,0);
  sdlTexture1 := IMG_LoadTexture(sdlRenderer,'fal.bmp');
  for i:=0 to 80 do begin
		for j:=0 to 25 do begin
			 // SDL_RenderDrawLine(sdlRenderer,i*10,0,i*10,250);
			  //SDL_RenderDrawLine(sdlRenderer,0,j*10,800,j*10);
			  SDL_RenderCopy(sdlRenderer,sdlTexture1,nil,destR);
			  destR^.x:=i*10;
			  destR^.y:=j*15;
		end;
  end;
  SDL_RenderPresent(sdlRenderer);
  //screen:=SDL_GetWindowSurface(sdlWindow1);
  //sdlSurface := SDL_LoadBMP('fal.bmp');
  //SDL_RenderCopy(sdlRenderer,sdlTexture1,nil,destR);
  //SDL_BlitSurface(sdlSurface,nil,screen,destR);
  //SDL_UpdateWindowSurface(sdlWindow1);
  SDL_RenderPresent(sdlRenderer);
  
	delay(20000);
	
	SDL_RenderClear(sdlRenderer);
	SDL_RenderPresent(sdlRenderer);
				  destR^.y:=30;
				  destR^.x:=0;
	repeat 
		 SDL_RenderCopy(sdlRenderer,sdlTexture1,nil,destR);
			inc(destR^.x);
			if (destR^.x=790) then destR^.x:=0;
			SDL_RenderPresent(sdlRenderer);
			delay(7);
	until keypressed;
  //shutting down video subsystem
  SDL_Quit;

end.
