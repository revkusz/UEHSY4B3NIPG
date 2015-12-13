{
SEGÉDLET

Mátrixban
x := j;
y := i;

Felfele : y-1
Lefelé : y+1
Jobbra : x+1
Balra : x-1
}

Program alma;
uses crt;

Var Pehely : boolean; //Teszt
Var x : byte; //Karakter MINDÍG aktuális helyzete X Kordináta
Var y : byte; //Karakter MINDÍG aktuális helyzete Y Kordináta
Var celx : byte;
Var cely : byte;
Var i,j : byte; //Ciklusváltozók

//Pálya
map:array[1..10,1..10] of char
	=(
	('3','3','3','3','3','3','3','3','3','3'),
	('3','0','0','0','0','0','0','0','0','3'),
	('3','0','0','0','0','0','0','0','0','3'),
	('3','0','0','0','3','3','3','3','3','3'),
	('3','0','0','0','0','0','0','3','3','3'),
	('3','9','0','3','3','3','0','0','3','3'),
	('3','3','0','0','3','3','0','0','3','3'),
	('3','3','0','3','3','3','0','0','3','3'),
	('3','3','0','0','0','3','0','0','0','2'),
	('3','3','3','4','4','3','3','4','3','3')
	);
	
	
Begin
	textbackground(17);
	clrscr;
	textcolor(LightGreen);
	//Pálya beolvasása egy mátrixból ELEJE
	For i:=1 to 10 do begin
		For j:=1 to 10 do begin
		
			Case map[i,j] of
				'0':Write(' ');
				'2':Begin
						celx := j;
						cely := i;
					end;
				'3':Write(chr(219));
				'4':Write('w');
				'9':Begin
						x := j;
						y := i;
						write(' ');
					End;
			End;	
		End;
		Writeln();
	End;
//Tesztelés------------------------------------------------------------------	
	Gotoxy(1,12);
	For i:=1 to 10 do begin
		for j:=1 to 10 do begin
			Write(map[i,j]);
		
		End;
		Writeln();
	End;
//TEsztelés Vége-------------------------------------------------------------
	//Pálya beolvasása egy mátrixból VÉGE
	
	//Játékmenet
	Gotoxy(x,y); //Felveszi a karakter kezdőhelyét
	Write('Q'); //Kirajzolja a karaktert a kezőhejére

	Repeat
		begin
			If keypressed then
				begin
					Case readkey of
//Ugrás **
						' ' : begin
						If map[y-1,x] <> '3' Then 
							Begin					
							 i:=1;
								Repeat
									Begin
										gotoxy(x,y);
										map[y,x] := '0';
										Write(' ');
										y := y-1;
										gotoxy(x,y);
										map[y,x] := '9';
										Write('Q');
										i:=i+1;
										delay(40);
										If keypressed then
											begin
												Case readkey of
													'a' :  Begin
															If map[y,x-1] <> '3' then
																begin
																	gotoxy(x,y);
																	map[y,x] := '0';
																	Write(' ');
																	x := x-1;
																	gotoxy(x,y);
																	map[y,x] := '9';
																	Write('Q');
																end;
															End;
													'd' :  Begin
															If map[y,x+1] <> '3' then
																begin
																	gotoxy(x,y);
																	map[y,x] := '0';
																	Write(' ');
																	x := x+1;
																	gotoxy(x,y);
																	map[y,x] := '9';
																	Write('Q');
																End;
															end;
																		End;
																	End;
									end;
								Until (i = 5) or (map[y-1,x] = '3');
//Leesés **	
								If map[y+1,x] = '4' Then 
														begin
															Writeln('Tuskebe estel!');							
														end;
								If map[y+1,x] = '0' Then 
														begin
															Repeat 
																begin
																	gotoxy(x,y);
																	map[y,x] := '0';
																	Write(' ');
																	y:=y+1;
																	Gotoxy(x,y);
																	map[y,x] := '9';
																	Write('Q');
																	Delay(40);
																	If keypressed then
																	begin
																		Case readkey of
																			'a' :  Begin
																					If map[y,x-1] <> '3' then
																					begin
																					gotoxy(x,y);
																					map[y,x] := '0';
																					Write(' ');
																					x := x-1;
																					gotoxy(x,y);
																					map[y,x] := '9';
																					Write('Q');
																					end;
																				   End;
																			'd' :  Begin
																					If map[y,x+1] <> '3' then
																					begin
																					gotoxy(x,y);
																					map[y,x] := '0';
																					Write(' ');
																					x := x+1;
																					gotoxy(x,y);
																					map[y,x] := '9';
																					Write('Q');
																				   End;
																				   end;
																		End;
																	End;
{//Tesztelés------------------------------------------------------------------									
																	Gotoxy(1,12);
																	For i:=1 to 10 do begin
																		for j:=1 to 10 do begin
																			Write(map[i,j]);
																		End;
																		Writeln();
																	End;
//TEsztelés Vége-------------------------------------------------------------	
}
																end;
															Until (map[y+1,x] = '3') or (map[y+1,x] = '4') or (y = 11) {Pálya magasságával növekszik!(Jelen esetben 10es a magasság ha kiesik maprol...};					
														end;
								
{//Tesztelés------------------------------------------------------------------									
								Gotoxy(1,12);
								For i:=1 to 10 do begin
									for j:=1 to 10 do begin
										Write(map[i,j]);
									End;
									Writeln();
								End;
//TEsztelés Vége-------------------------------------------------------------	
}
							End;
						end;

//Leesés VÉGE **
//Ugrás vége **
// Jobbra menés **			
						'd' : begin
						If map[y,x+1] <> '3' Then 
							Begin					
								gotoxy(x,y);
								map[y,x] := '0';
								Write(' ');
								x := x+1;
								gotoxy(x,y);
								map[y,x] := '9';
								Write('Q');
{//Tesztelés------------------------------------------------------------------									
								Gotoxy(1,12);
								For i:=1 to 10 do begin
									for j:=1 to 10 do begin
										Write(map[i,j]);
									End;
									Writeln();
								End;
//TEsztelés Vége-------------------------------------------------------------	
}
								If map[y+1,x] = '4' then Writeln('Tuskebe estel!');								
								If map[y+1,x] = '0' Then	// Ha jobbra lép és alatta nem lesz platform
									Begin
										Repeat 
											begin
												gotoxy(x,y);
												map[y,x] := '0';
												Write(' ');
												y:=y+1;
												Gotoxy(x,y);
												map[y,x] := '9';
												Write('Q');
												Delay(40);
{//Tesztelés------------------------------------------------------------------									
								Gotoxy(1,12);
								For i:=1 to 10 do begin
									for j:=1 to 10 do begin
										Write(map[i,j]);
									End;
									Writeln();
								End;
//TEsztelés Vége-------------------------------------------------------------	
}
											end;
										Until (map[y+1,x] = '3') or (map[y+1,x] = '4') or (y = 11) {Pálya magasságával növekszik!(Jelen esetben 10es a magasság ha kiesik maprol...};
										If map[y+1,x] = '4' then Writeln('Tuskebe estel!');
									End;
								End;
							End;
							
							
// Jobbra menés VÉGE **
// Balra menés  **
						'a' : begin
						If map[y,x-1] <> '3' Then 
							Begin					
								gotoxy(x,y);
								map[y,x] := '0';
								Write(' ');
								x := x-1;
								gotoxy(x,y);
								map[y,x] := '9';
								Write('Q');
{//Tesztelés------------------------------------------------------------------									
								Gotoxy(1,12);
								For i:=1 to 10 do begin
									for j:=1 to 10 do begin
										Write(map[i,j]);
									End;
									Writeln();
								End;
//TEsztelés Vége-------------------------------------------------------------	
}
								If map[y+1,x] = '4' then Writeln('Tuskebe estel!');								
								If map[y+1,x] = '0' Then	// Ha jobbra lép és alatta nem lesz platform
									Begin
										Repeat 
											begin
												gotoxy(x,y);
												map[y,x] := '0';
												Write(' ');
												y:=y+1;
												Gotoxy(x,y);
												map[y,x] := '9';
												Write('Q');
												Delay(40);
{//Tesztelés------------------------------------------------------------------									
								Gotoxy(1,12);
								For i:=1 to 10 do begin
									for j:=1 to 10 do begin
										Write(map[i,j]);
									End;
									Writeln();
								End;
//TEsztelés Vége-------------------------------------------------------------	
}
											end;
										Until (map[y+1,x] = '3') or (map[y+1,x] = '4') or (y = 11) {Pálya magasságával növekszik!(Jelen esetben 10es a magasság ha kiesik maprol...};
										If map[y+1,x] = '4' then Writeln('Tuskebe estel!');
									End;
							End;
						
// Balra menés VÉGE **
{//Tesztelés------------------------------------------------------------------									
								Gotoxy(1,12);
								For i:=1 to 10 do begin
									for j:=1 to 10 do begin
										Write(map[i,j]);
									End;
									Writeln();
								End;
//TEsztelés Vége-------------------------------------------------------------								
}
								end;
					End;//Case endje
				End;// If keypress endje
		End;//repeat until endje
	Until (x = celx) and (y = cely);

Readkey;
End.
