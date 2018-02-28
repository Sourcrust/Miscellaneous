setscreen("nobuttonbar")
setscreen("offscreenonly")
var bestfont:int:=Font.New("TimesNewRoman:30:bold")
var smallf:int:=Font.New("TimeNewRoman:18")
var x3font:int:=Font.New("TimeNewRoman:14")
var timefont:int:=Font.New("TimesNewRoman:20")
var tinyfont:int:=Font.New("TimesNewRoman:8")
var subfont:int:=Font.New("TimesNewRoman:10")


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc findml(mx,my:int,var mlocate:array 1..2 of int,s:int)
mlocate(1):=(maxy-my) div 50
mlocate(2):=(mx+30) div 50
if mlocate(2)>s or mlocate(2)<1 then mlocate(2):=-5 end if
if mlocate(1)>s or mlocate(1)<1 then mlocate(1):=-5 end if
end findml

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc scramble(var tiles:array 1..*,1..*,1..* of int,var blank:array 1..2 of int,s:int)

var directionh,directionv:int

for i:1..(s**3)*4
if blank(1)=s
    then if blank(2)=s
	then directionh:=Rand.Int(-1,0)
	elsif blank(2)=1
	    then directionh:=Rand.Int(0,1)
	else directionh:=Rand.Int(-1,1)
    end if
    if directionh=0
	then directionv:=1
	else directionv:=0
    end if
elsif blank(1)=1
    then if blank(2)=s
	then directionh:=Rand.Int(-1,0)
	elsif blank(2)=1
	    then directionh:=Rand.Int(0,1)
	else directionh:=Rand.Int(-1,1)
    end if
    if directionh=0
	then directionv:=-1
	else directionv:=0
    end if
elsif blank(2)=1
    then directionv:=Rand.Int(-1,1)
    if directionv=0
	then directionh:=1
	else directionh:=0
    end if
elsif blank(2)=s
    then directionv:=Rand.Int(-1,1)
    if directionv=0
	then directionh:=-1
	else directionh:=0
    end if    
else
    directionh:=Rand.Int(0,1)
    if directionh=0
	then directionv:=(Rand.Int(0,1)*2)-1
	else directionv:=0 directionh:=(Rand.Int(0,1)*2)-1
    end if
end if

tiles(blank(1),blank(2),1):=tiles(blank(1)-directionv,blank(2)+directionh,1) 
tiles(blank(1)-directionv,blank(2)+directionh,1):=0
blank(1)-=directionv
blank(2)+=directionh
end for

end scramble


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc pointything(var pointx:array 1..3 of int, var pointy:array 1..3 of int, s:int)
pointx(1):=maxx-135+(s-3)*15
pointx(2):=maxx-135+(s-3)*15+4
pointx(3):=maxx-135+(s-3)*15-4
pointy(1):=maxy-65
pointy(2):=maxy-50
pointy(3):=maxy-50
end pointything

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

proc displaycolors(colorno:int)

Draw.FillBox(maxx-159,maxy-80-25*colorno,maxx-11,maxy-100-25*colorno,30)

var circles:int
var cc:string
open:circles,"tilescolor.txt",get
for i:1..3
    for j:1..5
	get:circles,cc
	Draw.FillOval(maxx-160+25*j,maxy-90-25*i,10,10,strint(cc))
	Draw.Oval(maxx-160+25*j,maxy-90-25*i,10,10,black)
    end for
    get:circles,cc
end for
close:circles
end displaycolors

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

proc setcolors(var tilecolors:array 1..5 of int,var colorno:int, var tiles:array 1..*,1..*,1..* of int,s:int,checkered:boolean)

var file:int
var word:string
var tc,tc2:int

open:file,"tilescolor.txt",get

for i:1..3
    if i=colorno 
	then 
	get:file,word
	tc:=strint(word)
	for j:2..4
	get:file,word
	tilecolors(j):=strint(word)
	end for
	get:file,word
	tc2:=strint(word)
	get:file,word
	tilecolors(5):=strint(word)
	else 
	get:file,word:*
    end if
end for
 
for i:1..s
    for j:1..s
	if i mod 2=1
	    then if j mod 2 = 0 and checkered
		then tiles(i,j,2):=tc2
		else tiles(i,j,2):=tc
	    end if
	    else if j mod 2 = 1 and checkered
		then tiles(i,j,2):=tc2
		else tiles(i,j,2):=tc
	    end if
	end if
    end for
end for

close:file

end setcolors

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

proc settings(var s:int,var change:boolean,var colorno:int,var tilecolors:array 1..5 of int, var checkered:boolean, var tiles:array 1..*,1..*,1..* of int)
var held:boolean:=false
var mx,my,b:int
var release:boolean:=true

loop

Draw.FillBox(maxx-10,maxy-10,maxx-160,maxy-200,grey)
Draw.Box(maxx-10,maxy-10,maxx-160,maxy-200,black)
Draw.FillBox(maxx-30,maxy-60,maxx-135,maxy-65,black)
Mouse.Where(mx,my,b)
Font.Draw("Settings",maxx-130,maxy-30,smallf,black)
Font.Draw("Size: "+intstr(s),maxx-150,maxy-45,subfont,black)
Font.Draw("Color:    Checkered",maxx-150,maxy-95,subfont,black)

var pointx:array 1..3 of int
var pointy:array 1..3 of int
pointything(pointx,pointy,s)

Draw.FillPolygon(pointx,pointy,3,12)
Draw.Polygon(pointx,pointy,3,black)

for i:3..10
    Font.Draw(intstr(i),maxx-137+(i-3)*15,maxy-75,tinyfont,black)
end for

Draw.Box(maxx-20,maxy-98,maxx-35,maxy-83,black)
if checkered then
    Draw.FillBox(maxx-20,maxy-98,maxx-35,maxy-83,black)
end if
    
displaycolors(colorno)

if b=1 and mx<pointx(3)+5 and mx>pointx(2)-5 and my>maxy-65-15 and my<maxy-10+15
then held:=true
end if
if b=1 and mx<maxx-20 and mx>maxx-35 and my<maxy-83 and my>maxy-98 then
release:=false
end if

View.Update

if held then 
    if b=1 then
	if mx>maxx-139 and mx<maxx-26 and my>maxy-65 and my<maxy-10
	then s:=s+round((mx-pointx(1))/15)
	change:=true
	end if
    else held:=false 
    end if
end if 

if release=false and b=0 and mx<maxx-20 and mx>maxx-35 and my<maxy-83 and my>maxy-98 then
release:=true
checkered:=~checkered
end if

if b=1 and mx>maxx-160 and mx<maxx-10 and my>maxy-100-25*3 and my<maxy-80-25
then colorno:=abs(round((my-maxy+90)/25))
end if
%Draw.FillBox(maxx-159,maxy-80-25*colorno,maxx-11,maxy-100-25*colorno,30)


%Draw.FillBox(maxx-10,maxy-10,maxx-160,maxy-160,grey)
if b=1 and (mx<maxx-160 or mx>maxx-10 or my<maxy-200 or my>maxy-10)
then exit
end if

end loop

end settings

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc solve(var tiles:array 1..*, 1..*,1..* of int,var blank:array 1..2 of int,s:int)
var thilash:int:=1
for i:1..s
    for j:1..s
	tiles(i,j,1):=thilash
	thilash+=1
    end for
end for
tiles(s,s,1):=0
blank(1):=s
blank(2):=s
end solve
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

var s:int:=4

var tilecolors:array 1..5 of int %tile,border,text,background
var colorno:int:=1
var checkered:boolean:=false

var tiled:int 
var cool:string
open:tiled,"tilescolor.txt",get

for i:1..4
    get:tiled,cool
    tilecolors(i):=strint(cool)
end for
tilecolors(5):=tilecolors(3)
close:tiled

loop
var race:boolean:=false
var chris:int
var minute,second,msec:int:=0
var mint,sect:string
var release:boolean:=false
var countr:int:=1
var moves:int:=0
var go,winp:boolean:=false
var blank:array 1..2 of int
var my, mx, b : int
var mlocate:array 1..2 of int
var change:boolean:=false
var ptime,time2:int:=0

setscreen("graphics:"+intstr(50*s+40)+";"+intstr(50*s+100))
var tiles:array 1..s, 1..s,1..2 of int %row num, colomn no
for i:1..s
    for j:1..s
	tiles(i,j,1):=countr
	tiles(i,j,2):=tilecolors(1)
	countr+=1
    end for
end for
tiles(s,s,1):=0

loop
setcolors(tilecolors,colorno,tiles,s,checkered)
Mouse.Where(mx,my,b)
findml(mx,my,mlocate,s)

Draw.FillBox(0,0,maxx,maxy,tilecolors(4))
Draw.Box(10,maxy-40,maxx-10,maxy-50*s-60,black)
Draw.FillBox(10,maxy-40,maxx-10,maxy-50*s-60,tilecolors(2))
Draw.FillBox(20,maxy-50,maxx-19,maxy-50*s-50,tilecolors(4))
Draw.Box(19,maxy-49,maxx-18,maxy-50*s-51,black)

Draw.FillBox(10,maxy-50*s-65,round(maxx/2)-2,maxy-50*s-95,tilecolors(1))
Draw.Box(10,maxy-50*s-65,round(maxx/2)-2,maxy-50*s-95,black)

if s=3 then
    Font.Draw("Scramble",round(((maxx/2+10)-Font.Width("Scramble",x3font))/2),maxy-50*s-88,x3font,tilecolors(3))
else
    Font.Draw("Scramble",round(((maxx/2+10)-Font.Width("Scramble",smallf))/2),maxy-50*s-90,smallf,tilecolors(3))    
end if

Draw.FillBox(maxx-10,maxy-50*s-65,round(maxx/2)+2,maxy-50*s-95,tilecolors(1))
Draw.Box(maxx-10,maxy-50*s-65,round(maxx/2)+2,maxy-50*s-95,black)
Font.Draw("Reset",round((((maxx-10)+(maxx/2))-Font.Width("Reset",smallf))/2),maxy-50*s-90,smallf,tilecolors(3))

%settings button
Draw.FillBox(maxx-10,maxy-5,maxx-40,maxy-35,tilecolors(1))
Draw.Box(maxx-10,maxy-5,maxx-40,maxy-35,black)
Draw.FillOval(maxx-25,maxy-20,10,10,black)
Draw.FillOval(maxx-25,maxy-20,5,5,grey)
Draw.FillOval(maxx-25,maxy-20,3,3,black)

%highscore button
Draw.FillBox(maxx-42,maxy-5,maxx-72,maxy-35,tilecolors(1))
Draw.Box(maxx-42,maxy-5,maxx-72,maxy-35,black)
Draw.FillBox(maxx-48,maxy-10,maxx-54,maxy-30,black)
Draw.FillBox(maxx-66,maxy-10,maxx-60,maxy-30,black)
Draw.FillBox(maxx-66,maxy-17,maxx-48,maxy-22,black)

%Pause button
Draw.FillBox(maxx-74,maxy-5,maxx-104,maxy-35,tilecolors(1))
Draw.Box(maxx-74,maxy-5,maxx-104,maxy-35,black)


if minute<10 
then mint:="0"+intstr(minute) 
else mint:=intstr(minute)
end if

if second<10
then sect:="0"+intstr(second)
else sect:=intstr(second)
end if

if s=4 then
    Font.Draw("Time",30,maxy-9,tinyfont,tilecolors(5))
    Font.Draw(mint+":"+sect,10,maxy-35,timefont,tilecolors(5))
    Font.Draw("Moves",90,maxy-9,tinyfont,tilecolors(5))
    Font.Draw(intstr(moves),105-Font.Width(intstr(moves),timefont)div 2,maxy-35,timefont,tilecolors(5))
elsif s=3 then
    Font.Draw("Time",7,maxy-12,tinyfont,tilecolors(5))
    Font.Draw(mint+":"+sect,33,maxy-15,x3font,tilecolors(5))
    Font.Draw("Moves",7,maxy-30,tinyfont,tilecolors(5))
    Font.Draw(intstr(moves),45,maxy-34,x3font,tilecolors(5))
else
    Font.Draw("Time",56,maxy-9,tinyfont,tilecolors(5))
    Font.Draw(mint+":"+sect,35,maxy-35,timefont,tilecolors(5))
    Font.Draw("Moves",133,maxy-9,tinyfont,tilecolors(5))
    Font.Draw(intstr(moves),150-Font.Width(intstr(moves),timefont)div 2,maxy-35,timefont,tilecolors(5))
end if


for i:1..s
    for j:1..s
	if tiles(i,j,1)~=0
	then
	    Draw.FillBox(-30+50*j+1,maxy-50*i-1,-30+50*j+50-1,maxy-50*i-50+1,tiles(i,j,2))
	    Draw.Box(-30+50*j+1,maxy-50*i-1,-30+50*j+50-1,maxy-50*i-50+1,black)
	    Font.Draw(intstr(tiles(i,j,1)),20+50*j-25-round(Font.Width(intstr(tiles(i,j,1)),bestfont)/2),maxy-50*i-50+10,bestfont,tilecolors(3))
	else
	    blank(1):=i
	    blank(2):=j
	end if
    end for    
end for

if go then

Draw.FillBox(-30+50*blank(2)+1,maxy-50*blank(1)-1,-30+50*blank(2)+50-1,maxy-50*blank(1)-50+1,tiles(s,s,2))
Draw.Box(-30+50*blank(2)+1,maxy-50*blank(1)-1,-30+50*blank(2)+50-1,maxy-50*blank(1)-50+1,black)
Font.Draw(intstr(blank(1)*blank(2)),20+50*blank(2)-25-round(Font.Width(intstr(blank(1)*blank(2)),bestfont)/2),maxy-50*blank(1)-50+10,bestfont,tilecolors(3))

end if

if race then
	var complete:int:=-1
	var criteria:int:=1
	for i:1..s
	    for j:1..s
		if tiles(i,j,1)~=criteria
		    then complete+=1
		end if
	    criteria+=1
	    end for
	end for
	if complete =0 or go=true
	    then go:=true
		race:=false
		winp:=true
	    else  
	    msec:=(Time.Elapsed-chris-ptime) mod 1000
	    second:=(Time.Elapsed-chris-ptime) div 1000 mod 60
	    minute:=(Time.Elapsed-chris-ptime) div 60000 
	end if
end if

View.Update
delay(50)

if b=1 
    then if release=true 
	then if (((mlocate(1)=blank(1)+1 or mlocate(1)=blank(1)-1) and mlocate(2)=blank(2)) or ((mlocate(2)=blank(2)+1 or mlocate(2)=blank(2)-1) and mlocate(1)=blank(1))) 
	    then 
	    var value:=tiles(blank(1),blank(2),1)
	    tiles(blank(1),blank(2),1):=tiles(mlocate(1),mlocate(2),1)
	    tiles(mlocate(1),mlocate(2),1):=value
	    winp:=false
	    release:=false
	    moves+=1
	    elsif mx<round(maxx/2)-2 and mx>10 and my<maxy-50*s-65 and my>maxy-50*s-95
	    then scramble(tiles,blank,s)
	    chris:=Time.Elapsed
	    race:=true
	    moves:=0
	    second:=0
	    minute:=0
	    ptime:=0
	    winp:=false
	    elsif mx>round(maxx/2)+2 and mx<maxx-10 and my<maxy-50*s-65 and my> maxy-50*s-95
	    then solve (tiles,blank,s) go:=false
	    elsif mx<maxx-10 and my<maxy-5 and mx>maxx-40 and my>maxy-35
	    then time2:=Time.Elapsed 
	    settings(s,change,colorno,tilecolors,checkered,tiles)
	    ptime+=Time.Elapsed-time2
	    if change
		then change:=false
		exit
	    end if
	end if
	go:=false
    end if    
    else release:=true
end if

end loop
end loop
