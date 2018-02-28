setscreen("Graphics:900;625")
View.Set("offscreenonly")
var font60b:int:=Font.New ("TimesNewRoman:60:bold")

const marg:int:=maxx
var mx,my,mb:int:=0
var thilash:int:=Time.Elapsed
var mdelay:int:=0
var score:int:=0

proc conveyor1(var Delay:int,button:array 1..8,1..4 of int)
var asdf:int:=Time.Elapsed
Draw.FillBox(round(marg/2)+25,maxy-520,round(marg/2)-25,maxy-460,8)
for j:1..3
Draw.Line(round(marg/2)+25,maxy-460-round(j*20+Delay/24) mod 60,round(marg/2)-25,maxy-460-round(j*20+Delay/24) mod 60,7)
end for
Draw.FillBox(round(marg/2)+90,maxy-260,round(marg/2)-90,maxy-350,7)

for i:-1..1 by 2
Draw.FillBox(round(marg/2)+i*125,maxy-200,round(marg/2)+i*350,maxy-150,8)
Draw.Box(round(marg/2)+i*125,maxy-200,round(marg/2)+i*350,maxy-150,7)
Draw.FillBox(round(marg/2)+i*125,maxy-200,round(marg/2)+i*350,maxy-215,27)
Draw.Box(round(marg/2)+i*125,maxy-200,round(marg/2)+i*350,maxy-215,7)

Draw.FillBox(round(marg/2)+90*i,maxy-260,round(marg/2)+98*i,maxy-350,104)
for j:1..12
Draw.Line(round(marg/2)+i*125+i*(round(j*20+Delay/30) mod 225),maxy-200,round(marg/2)+i*125+i*(round(j*20+Delay/30) mod 225),maxy-150,7)
end for

Draw.FillBox(round(marg/2)+i*350,maxy-280,round(marg/2)+i*100,maxy-330,8)
Draw.Box(round(marg/2)+i*350,maxy-280,round(marg/2)+i*100,maxy-330,7)
Draw.FillBox(round(marg/2)+i*350,maxy-345,round(marg/2)+i*105,maxy-330,27)
Draw.Box(round(marg/2)+i*350,maxy-345,round(marg/2)+i*105,maxy-330,7)
Draw.FillBox(round(marg/2)+i*98,maxy-280,round(marg/2)+i*100,maxy-335,27)
Draw.Box(round(marg/2)+i*98,maxy-280,round(marg/2)+i*100,maxy-335,7)
Draw.FillOval(round(marg/2)+i*104,maxy-338,7,7,23)
Draw.Oval(round(marg/2)+i*104,maxy-338,7,7,7)
for j:1..13
Draw.Line(round(marg/2)+i*350-i*(round(j*20+Delay/40) mod 250),maxy-280,round(marg/2)+i*350-i*(round(j*20+Delay/40) mod 250),maxy-330,7)
end for

Draw.FillArc(round(marg/2)+i*350,maxy-200,50,50,45-i*45,135-i*45,29)
Draw.Arc(round(marg/2)+i*350,maxy-200,50,50,45-i*45,135-i*45,7)

%upper vertical conveyors
for l:0..130 by 130
Draw.FillBox(round(marg/2)+i*400,maxy-(200+l),round(marg/2)+i*350,maxy-(200+l+80),8)
Draw.Box(round(marg/2)+i*400,maxy-(200+l),round(marg/2)+i*350,maxy-(200+l+80),7)
for j:1..5
Draw.Line(round(marg/2)+i*400,maxy-(200+l)-round(j*20+Delay/20) mod 80,round(marg/2)+i*350,maxy-(200+l)-round(j*20+Delay/20) mod 80,7)
end for
end for

%horizonal + veritcal small conveyors
for l:25..275 by 125
Draw.FillBox(round(marg/2)+i*l,maxy-410,round(marg/2)+i*(l+75),maxy-460,8)
Draw.Box(round(marg/2)+i*l,maxy-410,round(marg/2)+i*(l+75),maxy-460,7)%%%
Draw.FillBox(round(marg/2)+i*l,maxy-475,round(marg/2)+i*(l+75),maxy-460,27)
Draw.Box(round(marg/2)+i*l,maxy-475,round(marg/2)+i*(l+75),maxy-460,7)
Draw.FillBox(round(marg/2)+i*(l+75),maxy-520,round(marg/2)+i*(l+75+50),maxy-460,8)
Draw.Box(round(marg/2)+i*(l+75),maxy-520,round(marg/2)+i*(l+75+50),maxy-460,7)
for j:1..4
Draw.Line(round(marg/2)+i*(l+75+50),maxy-460-round(j*20+Delay/24) mod 60,round(marg/2)+i*(l+75),maxy-460-round(j*20+Delay/24) mod 60,7)
end for
for j:1..4
Draw.Line(round(marg/2)+i*(l+75)-i*(round(j*20+Delay/24) mod 75),maxy-410,round(marg/2)+i*(l+75)-i*(round(j*20+Delay/24) mod 75),maxy-460,7)
end for
end for

%grey squares
Draw.FillBox(round(marg/2)+25,maxy-410,round(marg/2)-25,maxy-460,29)
Draw.Box(round(marg/2)+25,maxy-410,round(marg/2)-25,maxy-460,7)
Draw.FillBox(round(marg/2)+i*400,maxy-280,round(marg/2)+i*350,maxy-330,29)
Draw.Box(round(marg/2)+i*400,maxy-280,round(marg/2)+i*350,maxy-330,7)

for l:0..250 by 125
Draw.FillBox(round(marg/2)+i*(l+100),maxy-410,round(marg/2)+i*(l+100+50),maxy-460,29)
Draw.Box(round(marg/2)+i*(l+100),maxy-410,round(marg/2)+i*(l+100+50),maxy-460,7)
end for

end for

for k:1..8
if button(k,3)~=0 then
Draw.FillOval(button(k,1),button(k,2),30,30,32)
Draw.Oval(button(k,1),button(k,2),30,30,7)
if button(k,3)=1 then
Draw.Line(button(k,1)-20,button(k,2)+15,button(k,1)+20,button(k,2)+15,7)
Draw.Line(button(k,1)-20,button(k,2)+15,button(k,1),button(k,2)-18,7)
Draw.Line(button(k,1)+20,button(k,2)+15,button(k,1),button(k,2)-18,7)
Draw.Fill(button(k,1),button(k,2),67,7)
else
Draw.Line(button(k,1)+15*button(k,4),button(k,2)+20,button(k,1)-20*button(k,4),button(k,2),7)
Draw.Line(button(k,1)+15*button(k,4),button(k,2)-20,button(k,1)-20*button(k,4),button(k,2),7)
Draw.Line(button(k,1)+15*button(k,4),button(k,2)+20,button(k,1)+15*button(k,4),button(k,2)-20,7)
Draw.Fill(button(k,1),button(k,2),67,7)
end if
end if
end for

Delay+=15
Mouse.Where(mx,my,mb)

end conveyor1

proc drawb(var bomb: array 1..*,1..* of int,button:array 1..8,1..4 of int,var losingb:array 1..8 of int,count:int)
var colorb:int
var colorb2:int

for i:lower(bomb,1)..upper(bomb,1)

if bomb(i,1)>round(marg/2)-90 and bomb(i,1)<round(marg/2)+90 and bomb(i,2)>maxy-350 and bomb(i,2)<maxy-260 
then bomb(i,7)-=1
end if

if bomb(i,5)=1 then colorb:=54 colorb2:=53 
elsif bomb(i,5)=2 then colorb:=121 colorb2:=2
elsif bomb(i,5)=3 then colorb:=42 colorb2:=43
else colorb:=40 colorb2:=41 end if

Draw.Line(bomb(i,1)+18,bomb(i,2)+12,bomb(i,1)+25,bomb(i,2)+22,16)
Draw.Line(bomb(i,1)+9,bomb(i,2)+20,bomb(i,1)+16,bomb(i,2)+29,16)
Draw.Line(bomb(i,1)+18,bomb(i,2)+12,bomb(i,1)+9,bomb(i,2)+20,16)
Draw.Line(bomb(i,1)+16,bomb(i,2)+29,bomb(i,1)+25,bomb(i,2)+22,16)

if bomb(i,6)>=18 and (count div 10 =2 or count div 10=3) then
Draw.Fill(bomb(i,1)+20,bomb(i,2)+25,colorb2,16)
Draw.Fill(bomb(i,1)+14,bomb(i,2)+18,colorb2,16)
Draw.FillOval(bomb(i,1),bomb(i,2),bomb(i,7),bomb(i,7),colorb2)
else 
Draw.Fill(bomb(i,1)+20,bomb(i,2)+25,colorb,16)
Draw.Fill(bomb(i,1)+14,bomb(i,2)+18,colorb,16)
Draw.FillOval(bomb(i,1),bomb(i,2),bomb(i,7),bomb(i,7),colorb)
end if

Draw.Oval(bomb(i,1),bomb(i,2),bomb(i,7),bomb(i,7),16)
if bomb(i,6)>=18
then Draw.FillStar(bomb(i,1)+bomb(i,7)-7,bomb(i,2)+bomb(i,7)-5,bomb(i,1)+bomb(i,7)+round(bomb(i,7)/25*8)-2,bomb(i,2)+bomb(i,7)-5+round(bomb(i,7)/25*10)+2,yellow)
Draw.Star(bomb(i,1)+bomb(i,7)-7,bomb(i,2)+bomb(i,7)-5,bomb(i,1)+bomb(i,7)+round(bomb(i,7)/25*8)-2,bomb(i,2)+bomb(i,7)-5+round(bomb(i,7)/25*10)+2,black)
end if

%bomb movement
bomb(i,1)+=bomb(i,3)
bomb(i,2)+=bomb(i,4)

%bomb change direction
if bomb(i,1)>=round(marg/2)+375 and bomb(i,2)=maxy-165
then bomb(i,1):=round(marg/2)+375 bomb(i,4):=abs(bomb(i,3))*-1 bomb(i,3):=0
end if
if bomb(i,1)<=round(marg/2)-375 and bomb(i,2)=maxy-165
then bomb(i,1):=round(marg/2)-375 bomb(i,4):=abs(bomb(i,3))*-1 bomb(i,3):=0
end if

for m:1..8
if (bomb(i,1)<=button(m,1)+1 and bomb(i,1)>=button(m,1)-1) and (bomb(i,2)<=button(m,2)+1 and bomb(i,2)>=button(m,2)-1)
then bomb(i,1):=button(m,1) bomb(i,2):=button(m,2)
if button(m,3)=1 then bomb(i,3):=0 bomb(i,4):=-3
else bomb(i,3):=-3*button(m,4) bomb(i,4):=0 
end if
end if
end for

if (bomb(i,1)>=round(marg/2)-1 and bomb(i,1)<=round(marg/2)+1) and (bomb(i,2)>=maxy-435-1 and bomb(i,2)<=maxy-435+1) % makes bomb go down the middle
then bomb(i,1):=round(marg/2) bomb(i,3):=0 bomb(i,4):=-3
end if

%gameover check
if bomb(i,2)=maxy-480 and (bomb(i,5)~=4-round((abs(round(marg/2)-bomb(i,1))/125)) or bomb(i,6)>=18)
    then losingb(8):=1
    for lol:1..7
    losingb(lol):=bomb(i,lol)        
    end for
end if    
    
if bomb(i,2)=maxy-305 and abs(round(marg/2)-bomb(i,1))<250 and bomb(i,6)<18
    then losingb(8):=1
    for lol:1..7
    losingb(lol):=bomb(i,lol)        
    end for 
end if

end for

end drawb

proc conveyor2
%entry part of conveyor
Draw.FillBox(round(marg/2)-125,maxy-225,round(marg/2)+125,maxy-180,28)
Draw.Box(round(marg/2)-125,maxy-225,round(marg/2)+125,maxy-180,7)
Draw.FillBox(round(marg/2)-125,maxy-105,round(marg/2)+125,maxy-180,29)
Draw.Box(round(marg/2)-125,maxy-105,round(marg/2)+125,maxy-180,7)

%end part of conveyer
Draw.FillBox(round(marg/2)+60,maxy-520,round(marg/2)-60,0,40)
Draw.Box(round(marg/2)+60,maxy-520,round(marg/2)-60,0,7)
Draw.FillBox(round(marg/2)+60,maxy-520,round(marg/2)-60,maxy-550,39)
Draw.Box(round(marg/2)+60,maxy-520,round(marg/2)-60,maxy-550,7)

for i:-1..1 by 2
Draw.FillBox(round(marg/2)+i*435,maxy-520,round(marg/2)+i*315,0,54)
Draw.Box(round(marg/2)+i*435,maxy-520,round(marg/2)+i*315,0,7)
Draw.FillBox(round(marg/2)+i*435,maxy-520,round(marg/2)+i*315,maxy-550,53)
Draw.Box(round(marg/2)+i*435,maxy-520,round(marg/2)+i*315,maxy-550,7)

Draw.FillBox(round(marg/2)+i*190,maxy-520,round(marg/2)+i*310,0,121)
Draw.Box(round(marg/2)+i*190,maxy-520,round(marg/2)+i*310,0,7)
Draw.FillBox(round(marg/2)+i*190,maxy-520,round(marg/2)+i*310,maxy-550,2)
Draw.Box(round(marg/2)+i*190,maxy-520,round(marg/2)+i*310,maxy-550,7)

Draw.FillBox(round(marg/2)+i*65,maxy-520,round(marg/2)+i*185,0,42)
Draw.Box(round(marg/2)+i*65,maxy-520,round(marg/2)+i*185,0,7)
Draw.FillBox(round(marg/2)+i*65,maxy-520,round(marg/2)+i*185,maxy-550,43)
Draw.Box(round(marg/2)+i*65,maxy-520,round(marg/2)+i*185,maxy-550,7)
end for

% View.Update
end conveyor2

var Delay:int:=0
var button:array 1..8,1..4 of int %x,y,stance,left/right side

for i:1..2
var o:int:=i-2 var p:int:=(i-1)*2-1
for l:125..375 by 125
var m:int:=round((l/125))*2
button(m+o,1):=round(marg/2)+p*(l) button(m+o,2):=maxy-435
end for
button(6+i,1):=round(marg/2)+p*375 button(6+i,2):=maxy-305
end for


for i:lower(button,1)..upper(button,1)
button(i,3):=1
end for
for i:lower(button,1)..upper(button,1)-1 by 2
button(i,4):=-1
end for
for i:lower(button,1)+1..upper(button,1) by 2
button(i,4):=1
end for

var losingb:array 1..8 of int
for i:lower(losingb,1)..upper(losingb,1)
losingb(i):=0
end for

Draw.FillBox(0,0,maxx,maxy,30)
%View.Update

var bomb:flexible array 1..0,1..7 of int %x,y,x direction, y dirextion,type,defected?,radius 
var count:int:=0
Draw.FillBox(0,0,marg,maxy-95,104)

var roundstart:int:=Time.Elapsed

loop

if mdelay >5 then
if mb=1 then
for i:lower(button,1)..upper(button,1)
if mx<button(i,1)+30 and mx>button(i,1)-30 and my<button(i,2)+30 and my>button(i,2)-30 then
button(i,3)*=-1
mdelay:=0
end if
end for
end if
end if

if count=50 or upper(bomb,1)=0 then 
new bomb, upper(bomb,1)+1,7 
bomb(upper(bomb,1),1):=round(marg/2)
bomb(upper(bomb,1),2):=maxy-165
bomb(upper(bomb,1),3):=Rand.Int(0,1)*6-3
bomb(upper(bomb,1),4):=0
bomb(upper(bomb,1),5):=Rand.Int(1,4)
bomb(upper(bomb,1),6):=Rand.Int(1,20)
bomb(upper(bomb,1),7):=25
count:=0
end if

count+=1
mdelay+=1

thilash:=Time.Elapsed
Draw.FillBox(0,105,round(marg/2)-95,maxy-95,104)
Draw.FillBox(marg,105,round(marg/2)+95,maxy-95,104)
Draw.FillBox(round(marg/2)-95,maxy-409,round(marg/2)+95,maxy-390,104)
conveyor1(Delay,button)
drawb(bomb,button,losingb,count)
%
for i:lower(bomb,1)..upper(bomb,1)-1
if bomb(i,2)<20 or bomb(i,7)<1
then
for n:1..7
bomb(i,n):=bomb(upper(bomb,1),n)
end for
new bomb,upper(bomb)-1,7 
score+=1
end if
end for
%
conveyor2
Font.Draw(intstr(score),round((maxx-Font.Width(intstr(score),font60b))/2),maxy-90,font60b,41)

if losingb(8)=1
then exit
end if

View.Update
delay(round(35*0.9965**score-Time.Elapsed+thilash))
Draw.FillBox(round((maxx-Font.Width(intstr(score),font60b))/2),maxy-91,round((maxx+Font.Width(intstr(score),font60b))/2),maxy-30,30)
thilash:=Time.Elapsed

end loop

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var survivemin:int:=(Time.Elapsed-roundstart)div 60000
var survivesec:int:=(Time.Elapsed-roundstart)div 1000 mod 60

cls 
View.Update
delay(100)
    put score
%White screen, to black screen, showing conveyor and bomb

%colour of bottom box
var colorgo,colorgo2:int
if abs(losingb(1)-round(marg/2))/125=3
then colorgo:=53 colorgo2:=54
elsif abs(losingb(1)-round(marg/2))/125=2
then colorgo:=2 colorgo2:=121
elsif abs(losingb(1)-round(marg/2))/125=1
then colorgo:=43 colorgo2:=42
else colorgo:=40 colorgo2:=39
end if

%colour of bomb
var colorb,colorb2:int
if losingb(5)=1 then colorb:=54 colorb2:=53 
elsif losingb(5)=2 then colorb:=121 colorb2:=2
elsif losingb(5)=3 then colorb:=42 colorb2:=43
else colorb:=40 colorb2:=41 end if

var harguun:int:=Time.Elapsed

loop
    %draws conveyor of losing bomb
    Draw.FillBox(losingb(1)-25,maxy-520,losingb(1)+25,maxy-460,8)
    Draw.Box(losingb(1)-25,maxy-520,losingb(1)+25,maxy-460,7)
    for j:1..4
    Draw.Line(losingb(1)-25,maxy-460-round(j*20+Delay/24) mod 60,losingb(1)+25,maxy-460-round(j*20+Delay/24) mod 60,7)
    end for

    %draws bomb
    var losebx:array 1..4 of int
    losebx(1):=losingb(1)+18
    losebx(2):=losingb(1)+25
    losebx(3):=losingb(1)+16
    losebx(4):=losingb(1)+9
    var loseby:array 1..4 of int 
    loseby(1):=losingb(2)+12
    loseby(2):=losingb(2)+22
    loseby(3):=losingb(2)+29
    loseby(4):=losingb(2)+20

    if losingb(6)>=18 and (count div 10 =2 or count div 10=3) then
    Draw.FillPolygon(losebx,loseby,4,colorb2)
    Draw.Polygon(losebx,loseby,4,7)
    Draw.FillOval(losingb(1),losingb(2),losingb(7),losingb(7),colorb2)
    else 
    Draw.FillPolygon(losebx,loseby,4,colorb)
    Draw.Polygon(losebx,loseby,4,7)
    Draw.FillOval(losingb(1),losingb(2),losingb(7),losingb(7),colorb)
    end if

    Draw.Oval(losingb(1),losingb(2),losingb(7),losingb(7),7)

    if losingb(6)>=18
    then Draw.FillStar(losingb(1)+losingb(7)-7,losingb(2)+losingb(7)-5,losingb(1)+losingb(7)+round(losingb(7)/25*8)-2,losingb(2)+losingb(7)-5+round(losingb(7)/25*10)+2,yellow)
    Draw.Star(losingb(1)+losingb(7)-7,losingb(2)+losingb(7)-5,losingb(1)+losingb(7)+round(losingb(7)/25*8)-2,losingb(2)+losingb(7)-5+round(losingb(7)/25*10)+2,black)
    end if

    %Draws the lower box
    if(losingb(2)<10 and count mod 10<=5) then
	Draw.FillBox(losingb(1)-60,maxy-520,losingb(1)+60,0,0)
	Draw.Box(losingb(1)-60,maxy-520,losingb(1)+60,0,7)
	Draw.FillBox(losingb(1)-60,maxy-520,losingb(1)+60,maxy-550,0)
	Draw.Box(losingb(1)-60,maxy-520,losingb(1)+60,maxy-550,7)  
    else  
	Draw.FillBox(losingb(1)-60,maxy-520,losingb(1)+60,0,colorgo2)
	Draw.Box(losingb(1)-60,maxy-520,losingb(1)+60,0,7)
	Draw.FillBox(losingb(1)-60,maxy-520,losingb(1)+60,maxy-550,colorgo)
	Draw.Box(losingb(1)-60,maxy-520,losingb(1)+60,maxy-550,7)
    end if
    %bomb movement
    losingb(1)+=losingb(3)
    losingb(2)+=losingb(4)

    if losingb(1)>round(marg/2)-90 and losingb(1)<round(marg/2)+90 and losingb(2)>maxy-350 and losingb(2)<maxy-260 
	then losingb(7)-=1
    end if
    put score
    View.Update
    delay(75-Time.Elapsed+harguun)
    harguun:=Time.Elapsed
    Delay+=15
    if count=50 then count:=0 end if
    count+=1
    %if losing(2)<-10 then
    %exit
    %end if
    Draw.FillBox(0,0,marg,maxy-95,7)
end loop






put "gameover, you lost :p, your score was ",score,".\nGood job, you managed to get fired in a record time of "..
if survivemin~=0 then 
put survivemin," minutes and "..
end if
put survivesec," seconds!"
View.Update
