program tuko;
 var v : array[1..80,1..25] of byte;
	 f:text;
     s:string;
     i,j:integer;
 begin
 assign(f,'palya.txt');
 {$I-}
 reset(f);
 {$I+}
 if IOResult<>0 then begin
                     writeln('Hiba: nincs meg a file.');
                     halt;
                     end;
for i:=1 to 24 do begin
                     readln(f,s);
                     //writeln(s);
for j:=1 to 80 do begin

                     if s[j]='3' then write(chr(178));
                     if s[j]='4' then write(chr(18));
                     if s[j]=' ' then write(' ');
                     end;
                     writeln;
                     end;
 close(f);
 readln;
 end.
