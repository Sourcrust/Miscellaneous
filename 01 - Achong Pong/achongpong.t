setscreen ("graphics:1346;625")
View.Set ("nocursor")
View.Set ("offscreenonly")
var pong : int
var achong : int
%pong:=Pic.FileNew("achongpong.jpg")
achong := Pic.FileNew ("christopherachong2.jpg")
var l : int %:=37
var h : int %:=49
var l2 : int := 37
var h2 : int := 49
var pong2 := Pic.FileNew ("achongpong.jpg")

var a := Rand.Int (0, 1)
a := a * 40 - 20
var b := Rand.Int (-10, 10)
b *= 2
if b = 0 then
    b := 10
end if
var x : int
var y : int

var lengthc1, lengthc2, lengthc3, lengthc4 : int
var c, c2, c3, c4 : int
var r1,r2,r3,r4:boolean
var id1:string:=""
var id2:string:=""
var id3:string:=""
var id4:string:=""

var Delay : int := 80
var colorbox : int := 7
var font1 : int := Font.New ("TimesNewRoman:70:bold")
var font2 : int := Font.New ("TimesNewRoman:20:bold")
var font3 : int := Font.New ("TimesNewRoman:20:italic")
var font4 : int := Font.New ("TimesNewRoman:20:bold,underline")
var font5: int := Font.New ("TimesNewRoman:50")
var fonttitle : int := Font.New ("ArialBalck:100")
var fontsub : int := Font.New ("TimesNewRoman:20")
var font:int:=Font.New ("TimesNewRoman:16")
var fontstitle : int := Font.New ("TimesNewRoman:70")
var fontb:int:=Font.New ("TimesNewRoman:16:underline")
var fontsmall:int:=Font.New("TimesNewRoman:14")

var ticker : string := "test message"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
process music
    loop
	Music.PlayFile ("Tetris.mp3")
    end loop
end music

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc Intro
    Draw.FillBox (0, 0, maxx, maxy, black)
    View.Update
    var ch : string (1)
    var ax := Rand.Int (40, maxx - l2 - 40)
    var ay := Rand.Int (40, maxy - h2 - 40)
    var axr := Rand.Int (-5, 5)
    if axr = 0 then
	axr := 1
    end if
    axr *= 6
    var ayr := Rand.Int (-5, 5)
    if ayr = 0 then
	ayr := 1
    end if
    ayr *= 6

    var count : int := 10
    var change : int := 0

    loop
	Pic.Draw (pong2, ax, ay, picCopy)
	Font.Draw ("ACHONG PONG", round (maxx / 2) - 520, round (maxy / 2) + 100, fonttitle, change)
	Font.Draw ("The classic arcade game... with a twist!", round (maxx / 2) - 270, round (maxy / 2) + 62, fontsub, white)
	Font.Draw ("Press any key to continue.", round (maxx / 2) - 200, round (maxy / 2) - 60, fontsub, white)
	View.Update
	delay (50)
	count += 1
	if (count div 6) mod 2 = 1 then
	    change := 0
	else
	    change := 44
	end if

	Draw.FillBox (ax, ay, ax + l2 - 1, ay + h2 - 1, black)

	ax += axr
	ay += ayr
	if ax <= 0 then
	    ax := 0
	    axr *= -1
	end if
	if ax >= maxx - l2 + 1 then
	    ax := maxx - l2 + 1
	    axr *= -1
	end if
	if ay <= 0 then
	    ay := 0
	    ayr *= -1
	end if
	if ay >= maxy - h2 + 1 then
	    ay := maxy - h2 + 1
	    ayr *= -1
	end if

	if hasch then
	    exit
	end if
    end loop

    cls
    View.Update
end Intro

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc pinfo
var ppp:string(1)
Draw.FillBox(0,0,maxx,maxy,black)

Draw.FillOval (125, 480, 40, 40, 40)
Draw.FillBox (125 - 32, 480 - 10,125 + 30, 480 + 10, 68)

Draw.FillOval (125, 380, 40, 40, 55)
Draw.FillBox (125 - 32, 380 - 10, 125 + 30, 380 + 10, 68)
Draw.FillBox (125 - 10, 380 - 30, 125 + 10, 380 + 30, 68)

Draw.FillOval (125, 280, 40, 40, 106)
Draw.FillBox (125-28,280+4,125+16,280+12,68)
Draw.FillBox (125-16,280-9,125+28,280-17,68)
Draw.Line(125+28,280+8,125+16,280+18,68)
Draw.Line(125+28,280+8,125+16,280-2,68)
Draw.Line(125+16,280+18,125+16,280-2,68)
Draw.Fill(125+18,280+8,68,68)
Draw.Line(125-28,280-13,125-16,280-23,68)
Draw.Line(125-28,280-13,125-16,280-3,68)
Draw.Line(125-16,280-23,125-16,280-3,68)
Draw.Fill(125-18,280-13,68,68)

Draw.FillOval (125, 180, 40, 40,41)
Draw.FillArc(125,180,30,30,50,180,68)    
Draw.FillArc(125,180,30,30,230,360,68)
Draw.FillOval(125, 180, 18, 18,41)
Draw.Line(125-24,180-12,125-34,180,68)
Draw.Line(125-24,180-12,125-14,180,68)
Draw.Line(125-34,180,125-14,180,68)
Draw.Fill(125-24,180-2,68,68)
Draw.Line(125+24,180+12,125+34,180,68)
Draw.Line(125+24,180+12,125+14,180,68)
Draw.Line(125+34,180,125+14,180,68)
Draw.Fill(125+24,180+4,68,68) 

Draw.FillOval (125, 80, 40, 40,48)
Draw.FillBox(125+26,80+6,125-26,80+18,68)
Draw.FillBox(125+26,80-6,125-26,80-18,68)

Font.Draw("POWERUP LIST",85,maxy-60,font5,white)
	    
Font.Draw("Name",210,525,font4,white)
Font.Draw("Spawn Chance",380,525,font4,white)
Font.Draw("Description",670,525,font4,white)
Font.Draw("Minus",210,480,font,white)
Font.Draw("High",380,480,font,white)
Font.Draw("Opponent loses 50 pixels of their panel.",670,480,font,white)
Font.Draw("Plus",210,380,font,white)
Font.Draw("High",380,380,font,white)
Font.Draw("Player's panel increases by 50 pixels.",670,380,font,white)
Font.Draw("Swap",210,280,font,white)
Font.Draw("Medium",380,280,font,43)
Font.Draw("All power up effects of the players are swapped.",670,280,font,white)
Font.Draw("Reverse",210,180,font,white)
Font.Draw("Medium",380,180,font,43)
Font.Draw("Opponent's controls are reversed.",670,180,font,white)
Font.Draw("Balance",210,80,font,white)
Font.Draw("Low",380,80,font,40)
Font.Draw("All power up effects are nullified",670,80,font,white)

Draw.FillBox(maxx-15,0,maxx-10,maxy,white)
Draw.FillBox(15,0,30,maxy,white)

Font.Draw("Press any key to continue.",maxx-20-Font.Width("Press any key to continue.",fontsub),10,fontsub,yellow)
View.Update
getch(ppp)
Draw.FillBox(0,0,maxx,maxy,black)
View.Update
end pinfo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc gametype (var gtype : int)
Draw.FillBox(0,0,maxx,maxy,black)
var cg1,cg2,cg3,cg4:int:=0
var kg:string(1)
gtype:=1
var pong2 := Pic.FileNew ("achongpong.jpg")
var l2:int:=37
var h2:int:=49
var x:int:=250-l2
var y:int:=maxy-h2
var d:int:=-5
var d2:int:=-10
var panel:int:=maxy-150
loop
Font.Draw("CHOOSE YOUR GAME MODE!",250,maxy-60,font5,white)

if gtype=1 then cg1:=0 cg2:=16 cg3:=16 cg4:=16
elsif gtype=2 then cg1:=16 cg2:=0 cg3:=16 cg4:=16
elsif gtype=3 then cg1:=16 cg2:=16 cg3:=0 cg4:=16
else cg1:=16 cg2:=16 cg3:=16 cg4:=0
end if

Draw.FillBox(5,0,10,maxy,white)

Draw.FillBox(250,25,1000,150,blue)
Draw.FillBox(250,165,1000,290,green)
Draw.FillBox(250,305,1000,420,yellow)
Draw.FillBox(250,435,1000,550,12)
Draw.FillBox(255,30,995,145,black)
Draw.FillBox(255,170,995,285,black)
Draw.FillBox(255,310,995,415,black)
Draw.FillBox(255,440,995,545,black)
Draw.FillBox(260,35,990,140,cg4)
Draw.FillBox(260,175,990,280,cg3)
Draw.FillBox(260,315,990,410,cg2)
Draw.FillBox(260,445,990,540,cg1)
Draw.FillBox(265,40,985,135,black)
Draw.FillBox(265,180,985,275,black)
Draw.FillBox(265,320,985,405,black)
Draw.FillBox(265,450,985,535,black)
Draw.FillBox(270,45,980,130,blue)
Draw.FillBox(270,185,980,270,green)
Draw.FillBox(270,325,980,400,yellow)
Draw.FillBox(270,455,980,530,12)
Draw.FillBox(1020,165,maxx-5,550,white)
Draw.FillBox(1025,170,maxx-10,545,black)
Font.Draw("Classic Achong Pong",280,475,font5,black)
Font.Draw("2 vs. 2 Achong Pong",290,342,font5,black)

Draw.FillBox(1020,20,maxx-165,150,white)
Draw.FillBox(1025,25,maxx-170,145,black)
Font.Draw("Press \"1\" to see",1030,125,fontsmall,white)
Font.Draw("the powerup list.",1035,105,fontsmall,white)

Draw.FillOval (1055, 80, 20, 20, 40)
Draw.FillBox (1055 - 16, 80 - 5, 1055 + 15, 80 + 5, 68)

Draw.FillOval (maxx-200, 80, 20, 20, 55)
Draw.FillBox (maxx-200 - 16, 80 - 5, maxx-200 + 15, 80 + 5, 68)
Draw.FillBox (maxx-200 - 5, 80 - 15, maxx-200 + 5, 80 + 15, 68)

Draw.FillOval (1075, 60, 20, 20, 106)
Draw.FillBox (1075-14,60+7,1075+8,60+11,68)
Draw.FillBox (1075-8,60-7,1075+14,60-11,68)
Draw.Line(1075+14,60+9,1075+8,60+14,68)
Draw.Line(1075+14,60+9,1075+8,60+4,68)
Draw.Line(1075+8,60+14,1075+8,60+4,68)
Draw.Fill(1075+9,60+9,68,68)
Draw.Line(1075-14,60-9,1075-8,60-14,68)
Draw.Line(1075-14,60-9,1075-8,60-4,68)
Draw.Line(1075-8,60-14,1075-8,60-4,68)
Draw.Fill(1075-9,60-9,68,68)

Draw.FillOval (maxx-220, 60, 20, 20,41)
Draw.FillArc(maxx-220,60,15,15,50,180,68)    
Draw.FillArc(maxx-220,60,15,15,230,360,68)
Draw.FillOval(maxx-220, 60, 9, 9,41)
Draw.Line(maxx-220-12,60-6,maxx-220-17,60,68)
Draw.Line(maxx-220-12,60-6,maxx-220-7,60,68)
Draw.Line(maxx-220-17,60,maxx-220-7,60,68)
Draw.Fill(maxx-220-12,60-2,68,68)
Draw.Line(maxx-220+12,60+6,maxx-220+17,60,68)
Draw.Line(maxx-220+12,60+6,maxx-220+7,60,68)
Draw.Line(maxx-220+17,60,maxx-220+7,60,68)
Draw.Fill(maxx-220+12,60+2,68,68) 

Draw.FillOval (1100, 50, 20, 20,48)
Draw.FillBox(1100+13,50+3,1100-13,50+9,68)
Draw.FillBox(1100+13,50-3,1100-13,50-9,68)

if gtype=1 then
Font.Draw("Classic Achong Pong",1040,510,font2,white)
Font.Draw("---",1170,480,font2,white)
Font.Draw("This gamemode features the " ,1030,435,font,white)
Font.Draw("normal competitive 1v1 format ",1030,410,font,white)
Font.Draw("as the original PONG, this game ",1030,385,font,white)
Font.Draw("features the usage of powerups ",1030,360,font,white)
Font.Draw("and the addition of most beloved  ",1030,335,font,white)
Font.Draw("math teacher to make this game ",1030,310,font,white)
Font.Draw("much more interesting. :D",1030,285,font,white)
Pic.Draw(pong2,1030,255-h2,picCopy)
Font.Draw("Mr Achong Approved!",1070,225,fontsub,white)
end if

if gtype=2 then
Font.Draw("2 vs. 2 Achong Pong",1045,510,font2,white)
Font.Draw("---",1170,480,font2,white)
Font.Draw("This gamemode features allows " ,1030,445,font,white)
Font.Draw("4 people to play the addicting ",1030,420,font,white)
Font.Draw("Achong Pong game at once!  ",1030,395,font,white)
Font.Draw("Work with your partner and ",1030,370,font,white)
Font.Draw("realize that you hate your friend's",1026,345,font,white)
Font.Draw("guts! Chaos is bound to happen ",1030,320,font,white)
Font.Draw("when you start playing this ",1030,295,font,white)
Font.Draw("gamemode. >:D",1030,270,font,white)
Pic.Draw(pong2,1030,255-h2,picCopy)
Font.Draw("Also Mr Achong Approved!",1070,225,font,white)
end if

Pic.Draw(pong2,x,y,picCopy)
Draw.FillBox(30,panel,60,panel+150,white)
View.Update
delay(50)
Draw.FillBox(x,y,x+l2,y+h2,black)
Draw.FillBox(30,panel,60,panel+150,black)
x+=d
y+=d2
if x<=60 then x:=60 d*=-1 end if
if x>=250-l2 then x:=250-l2 d*=-1 end if
if y<=0 then y:=0 d2*=-1 end if
if y+h2>maxy then y:=maxy-h2 d2*=-1 end if
if y+h2/2>maxy-75 then panel:=maxy-150 
elsif y+h2/2<75 then panel:=0
else panel:=y+round(h2/2)-75 end if

if hasch then
getch(kg)
if kg=KEY_DOWN_ARROW
then if gtype~=2 then gtype+=1 end if
end if
if kg=KEY_UP_ARROW
then if gtype~=1 then gtype-=1 end if
end if
if kg=KEY_ENTER
then exit end if
if kg='1'
then pinfo
end if
end if

end loop

end gametype

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc Rules (var wincondition : int, var name1, name2 : string, var l, h, pong : int)
    var k : string (1)
    var inputwin:string
    var isint:boolean:=true
    Draw.FillBox (0, 0, maxx, maxy, black)
    Font.Draw ("Welcome to Achong Pong!", round (maxx / 2) - 560, maxy - 80, fontstitle, white)
    Font.Draw ("Keep the Achong alive!", round (maxx / 2) - 180, maxy - 110, font4, white)
    Font.Draw ("Control your panel by using the keys.", round (maxx / 2) - 270, maxy - 140, font2, white)
    Draw.FillBox (100, round (maxy / 2) - 40, 120, round (maxy / 2) + 150, white)
    Draw.FillBox (180, round (maxy / 2) - 40, 270, round (maxy / 2) + 50, grey)
    Draw.FillBox (180, round (maxy / 2) + 60, 270, round (maxy / 2) + 150, grey)
    Font.Draw ("S", 195, round (maxy / 2) - 30, font1, black)
    Font.Draw ("W", 182, round (maxy / 2) + 70, font1, black)
    Draw.Line (150, round (maxy / 2) + 150, 130, round (maxy / 2) + 150 - 30, white)
    Draw.Line (150, round (maxy / 2) + 150, 170, round (maxy / 2) + 150 - 30, white)
    Draw.Line (130, round (maxy / 2) + 150 - 30, 170, round (maxy / 2) + 150 - 30, white)
    drawfill (140, round (maxy / 2) + 150 - 28, white, white)
    Draw.FillBox (140, round (maxy / 2) + 150 - 30, 160, round (maxy / 2) + 60, white)

    Draw.Line (maxx - 150, round (maxy / 2) + 150, maxx - 130, round (maxy / 2) + 150 - 30, white)
    Draw.Line (maxx - 150, round (maxy / 2) + 150, maxx - 170, round (maxy / 2) + 150 - 30, white)
    Draw.Line (maxx - 130, round (maxy / 2) + 150 - 30, maxx - 170, round (maxy / 2) + 150 - 30, white)
    drawfill (maxx - 140, round (maxy / 2) + 150 - 28, white, white)
    Draw.FillBox (maxx - 140, round (maxy / 2) + 150 - 30, maxx - 160, round (maxy / 2) + 60, white)

    Draw.Line (150, round (maxy / 2) - 40, 130, round (maxy / 2) - 40 + 30, white)
    Draw.Line (150, round (maxy / 2) - 40, 170, round (maxy / 2) - 40 + 30, white)
    Draw.Line (130, round (maxy / 2) - 40 + 30, 170, round (maxy / 2) - 40 + 30, white)
    drawfill (140, round (maxy / 2) - 40 + 30 - 2, white, white)
    Draw.FillBox (140, round (maxy / 2) - 40 + 30, 160, round (maxy / 2) + 50, white)

    Draw.Line (maxx - 150, round (maxy / 2) - 40, maxx - 130, round (maxy / 2) - 40 + 30, white)
    Draw.Line (maxx - 150, round (maxy / 2) - 40, maxx - 170, round (maxy / 2) - 40 + 30, white)
    Draw.Line (maxx - 130, round (maxy / 2) - 40 + 30, maxx - 170, round (maxy / 2) - 40 + 30, white)
    drawfill (maxx - 140, round (maxy / 2) - 40 + 30 - 2, white, white)
    Draw.FillBox (maxx - 140, round (maxy / 2) - 40 + 30, maxx - 160, round (maxy / 2) + 50, white)

    Draw.FillBox (maxx - 100, round (maxy / 2) - 40, maxx - 120, round (maxy / 2) + 150, white)
    Draw.FillBox (maxx - 180, round (maxy / 2) - 40, maxx - 270, round (maxy / 2) + 50, grey)
    Draw.FillBox (maxx - 180, round (maxy / 2) + 60, maxx - 270, round (maxy / 2) + 150, grey)
    Font.Draw ("Up", maxx - 245, round (maxy / 2) + 105, fontsub, black)
    Font.Draw ("Arrow", maxx - 260, round (maxy / 2) + 80, fontsub, black)
    Font.Draw ("Down", maxx - 260, round (maxy / 2) + 5, fontsub, black)
    Font.Draw ("Arrow", maxx - 260, round (maxy / 2) - 20, fontsub, black)
    Font.Draw ("Player 1:", 100, round (maxy / 2) + 170, font2, white)
    Font.Draw ("Player 2:", maxx - 215, round (maxy / 2) + 170, font2, white)

    Font.Draw ("Player 1. Type in your name.", round (maxx / 2) - 205, maxy - 190, font2, white)
    View.Update
    View.Set ("cursor")
    View.Set ("nooffscreenonly")
    colour (white)
    colourback (black)
    locatexy (round (maxx / 2) - 205, maxy - 210)
    get name1 : *
    Font.Draw ("Player 2. Type in your name.", round (maxx / 2) - 205, maxy - 250, font2, white)
    locatexy (round (maxx / 2) - 205, maxy - 270)
    get name2 : *
    Font.Draw ("Choose the targeted amount of points", round (maxx / 2) - 230, maxy - 300, font2, white)
    locatexy (round (maxx / 2) - 235, maxy - 320)
    
    loop
    get inputwin:*
    for i:1..length(inputwin)
    if index("0123456789",inputwin(i))=0
    then isint:=false
    end if
    end for
    if isint then exit end if
    Draw.FillBox(round(maxx/2)-240,maxy-335,round(maxx/2)+235,maxy-305,black)
    Font.Draw("Type in a POSITIVE INTEGER... Mr. Achong would be dissapointed.",round (maxx / 2) - 440, maxy - 375, font2, 12) 
    locatexy (round (maxx / 2) - 235, maxy - 320)
    isint:=true
    end loop
   wincondition:=strint(inputwin)
    
    View.Set ("nocursor")
    View.Set ("offscreenonly")
    colour (black)
    colourback (white)

    Font.Draw ("Choose your Achong!!!", round (maxx / 2) - 190, maxy - 420, font2, white)
    var pic : int := Pic.FileNew ("achongpongsmall1.jpg")
    Pic.Draw (pic, 400, 30, picCopy)
    var pic2 : int := Pic.FileNew ("achongpongsmall2.jpg")
    Pic.Draw (pic2, 600, 30, picCopy)
    var pic3 : int := Pic.FileNew ("achongpongsmall3.jpg")
    Pic.Draw (pic3, 800, 30, picCopy)
    Font.Draw ("1", 440, 150, font2, white)
    Font.Draw ("2", 640, 150, font2, white)
    Font.Draw ("3", 840, 150, font2, white)
    View.Update

    var ch : string (1)

    loop
	getch (ch)

	case (ch) of
	    label "1" :
		pong := Pic.FileNew ("achongpong2.jpg")
		l := 39
		h := 41
		exit

	    label "2" :
		pong := Pic.FileNew ("achongpong.jpg")
		l := 37
		h := 49
		exit

	    label "3" :
		pong := Pic.FileNew ("achongpong3.jpg")
		l := 35
		h := 41
		exit

	    label :
	end case
    end loop

end Rules

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

proc Rules2(var wincondition : int, var name1, name2,id1,id2,id3,id4 : string, var l, h, pong : int)
    var k : string (1)
    var inputwin:string
    var isint:boolean:=true

    Draw.FillBox (0, 0, maxx, maxy, black)
    Font.Draw ("Welcome to 4v4 Achong Pong", round ((maxx - Font.Width ("Welcome to 4v4 Achong Pong", fontstitle))/2), maxy - 72, fontstitle, white)
    Font.Draw ("It's your typical fun pong game, without the fun...", round ((maxx - Font.Width ("It's your typical fun pong game, without the fun...", font4))/2), maxy - 110, font4, white)
    %round ((maxx - Font.Width ("\"Did you remember to do your Homefun?\"", font3))/2)
    Font.Draw ("Control your panel by using the keys.", round (maxx / 2) - 270, maxy - 140, font2, white)
    
    Draw.Box(15,10,220,530,white)
    Draw.Box(maxx-15,10,maxx-220,530,white)
    Font.Draw("TEAM 1",25,500,font4,white)
    Font.Draw("TEAM 2",maxx-130,500,font4,white)
    
    Draw.FillBox (30, round (maxy / 2) - 60, 50, round (maxy / 2) + 130, white)
    Draw.FillBox (110, round (maxy / 2) - 60, 200, round (maxy / 2) + 30, grey)
    Draw.FillBox (110, round (maxy / 2) + 40, 200, round (maxy / 2) + 130, grey)
    Font.Draw ("S", 125, round (maxy / 2) - 50, font1, black)
    Font.Draw ("W", 112, round (maxy / 2) + 50, font1, black)
    Draw.Line (80, round (maxy / 2) + 130, 60, round (maxy / 2) + 150 - 50, white)
    Draw.Line (80, round (maxy / 2) + 130, 100, round (maxy / 2) + 150 - 50, white)
    Draw.Line (60, round (maxy / 2) + 150 - 50, 100, round (maxy / 2) + 150 - 50, white)
    drawfill (70, round (maxy / 2) + 150 - 48, white, white)
    Draw.FillBox (70, round (maxy / 2) + 150 - 50, 90, round (maxy / 2) + 40, white)

    Draw.Line (maxx - 80, round (maxy / 2) + 130, maxx - 60, round (maxy / 2) + 150 - 50, white)
    Draw.Line (maxx - 80, round (maxy / 2) + 130, maxx - 100, round (maxy / 2) + 150 - 50, white)
    Draw.Line (maxx - 60, round (maxy / 2) + 150 - 50, maxx - 100, round (maxy / 2) + 150 - 50, white)
    drawfill (maxx - 70, round (maxy / 2) + 150 - 48, white, white)
    Draw.FillBox (maxx - 70, round (maxy / 2) + 150 - 50, maxx - 90, round (maxy / 2) + 40, white)

    Draw.Line (80, round (maxy / 2) - 60, 60, round (maxy / 2) - 40 + 10, white)
    Draw.Line (80, round (maxy / 2) - 60, 100, round (maxy / 2) - 40 + 10, white)
    Draw.Line (60, round (maxy / 2) - 40 + 10, 100, round (maxy / 2) - 40 + 10, white)
    drawfill (70, round (maxy / 2) - 40 + 10 - 2, white, white)
    Draw.FillBox (70, round (maxy / 2) - 40 + 10, 90, round (maxy / 2) + 30, white)

    Draw.Line (maxx - 80, round (maxy / 2) - 60, maxx - 60, round (maxy / 2) - 40 + 10, white)
    Draw.Line (maxx - 80, round (maxy / 2) - 60, maxx - 100, round (maxy / 2) - 40 + 10, white)
    Draw.Line (maxx - 60, round (maxy / 2) - 40 + 10, maxx - 100, round (maxy / 2) - 40 + 10, white)
    drawfill (maxx - 70, round (maxy / 2) - 40 + 10 - 2, white, white)
    Draw.FillBox (maxx - 70, round (maxy / 2) - 40 + 10, maxx - 90, round (maxy / 2) + 30, white)


    Draw.FillBox (maxx - 30, round (maxy / 2) - 60, maxx - 50, round (maxy / 2) + 130, white)
    Draw.FillBox (maxx - 110, round (maxy / 2) - 60, maxx - 200, round (maxy / 2) + 30, grey)
    Draw.FillBox (maxx - 110, round (maxy / 2) + 40, maxx - 200, round (maxy / 2) + 130, grey)
    Font.Draw ("Up", maxx - 175, round (maxy / 2) + 85, fontsub, black)
    Font.Draw ("Arrow", maxx - 190, round (maxy / 2) + 60, fontsub, black)
    Font.Draw ("Down", maxx - 190, round (maxy / 2) -15, fontsub, black)
    Font.Draw ("Arrow", maxx - 190, round (maxy / 2) - 40, fontsub, black)
    Font.Draw ("Player 1", 30, round (maxy / 2) + 150-8, font2, white)
    Font.Draw ("Player 2", maxx - 135, round (maxy / 2) + 150-8, font2, white)

    %%
    Draw.FillBox (30, round (maxy / 2) - 60-230, 50, round (maxy / 2) + 130-230, white)
    Draw.FillBox (110, round (maxy / 2) - 60-230, 200, round (maxy / 2) + 30-230, grey)
    Draw.FillBox (110, round (maxy / 2) + 40-230, 200, round (maxy / 2) + 130-230, grey)
    Font.Draw ("V", 155-round(Font.Width ("V", font1)/2), round (maxy / 2) - 50-230, font1, black)
    Font.Draw ("F", 155-round(Font.Width ("F", font1)/2), round (maxy / 2) + 50-230, font1, black)
    %round ((maxx - Font.Width ("\"Did you remember to do your Homefun?\"", font3))/2)
    Draw.Line (80, round (maxy / 2) + 130-230, 60, round (maxy / 2) + 150 - 50-230, white)
    Draw.Line (80, round (maxy / 2) + 130-230, 100, round (maxy / 2) + 150 - 50-230, white)
    Draw.Line (60, round (maxy / 2) + 150 - 50-230, 100, round (maxy / 2) + 150 - 50-230, white)
    drawfill (70, round (maxy / 2) + 150 - 48-230, white, white)
    Draw.FillBox (70, round (maxy / 2) + 150 - 50-230, 90, round (maxy / 2) + 40-230, white)

    Draw.Line (maxx - 80, round (maxy / 2) + 130-230, maxx - 60, round (maxy / 2) + 150 - 50-230, white)
    Draw.Line (maxx - 80, round (maxy / 2) + 130-230, maxx - 100, round (maxy / 2) + 150 - 50-230, white)
    Draw.Line (maxx - 60, round (maxy / 2) + 150 - 50-230, maxx - 100, round (maxy / 2) + 150 - 50-230, white)
    drawfill (maxx - 70, round (maxy / 2) + 150 - 48-230, white, white)
    Draw.FillBox (maxx - 70, round (maxy / 2) + 150 - 50-230, maxx - 90, round (maxy / 2) + 40-230, white)

    Draw.Line (80, round (maxy / 2) - 60-230, 60, round (maxy / 2) - 40 + 10-230, white)
    Draw.Line (80, round (maxy / 2) - 60-230, 100, round (maxy / 2) - 40 + 10-230, white)
    Draw.Line (60, round (maxy / 2) - 40 + 10-230, 100, round (maxy / 2) - 40 + 10-230, white)
    drawfill (70, round (maxy / 2) - 40 + 10 - 2-230, white, white)
    Draw.FillBox (70, round (maxy / 2) - 40 + 10-230, 90, round (maxy / 2) + 30-230, white)

    Draw.Line (maxx - 80, round (maxy / 2) - 60-230, maxx - 60, round (maxy / 2) - 40 + 10-230, white)
    Draw.Line (maxx - 80, round (maxy / 2) - 60-230, maxx - 100, round (maxy / 2) - 40 + 10-230, white)
    Draw.Line (maxx - 60, round (maxy / 2) - 40 + 10-230, maxx - 100, round (maxy / 2) - 40 + 10-230, white)
    drawfill (maxx - 70, round (maxy / 2) - 40 + 10 - 2-230, white, white)
    Draw.FillBox (maxx - 70, round (maxy / 2) - 40 + 10-230, maxx - 90, round (maxy / 2) + 30-230, white)

    Draw.FillBox (maxx - 30, round (maxy / 2) - 60-230, maxx - 50, round (maxy / 2) + 130-230, white)
    Draw.FillBox (maxx - 110, round (maxy / 2) - 60-230, maxx - 200, round (maxy / 2) + 30-230, grey)
    Draw.FillBox (maxx - 110, round (maxy / 2) + 40-230, maxx - 200, round (maxy / 2) + 130-230, grey)
    Font.Draw ("M", maxx-155-round(Font.Width ("M", font1)/2), round (maxy / 2) - 50-230, font1, black)
    Font.Draw ("J", maxx-155-round(Font.Width ("J", font1)/2), round (maxy / 2) + 50-230, font1, black)
    Font.Draw ("Player 3", 30, round (maxy / 2) + 150-238, font2, white)
    Font.Draw ("Player 4", maxx - 135, round (maxy / 2) + 150-238, font2, white)
    
    Font.Draw("Team 1. Please enter your team name.",240,maxy-180,fontb,white)
    View.Update
    View.Set ("cursor")
    View.Set ("nooffscreenonly")
    colour (white)
    colourback (black)
    locatexy (240, maxy - 200)
    get name1:*
    Font.Draw("Player 1. Type in your name",240,maxy-230,font,white)
    locatexy (240, maxy - 241)
    get id1:*
    Font.Draw("Player 3. Type in your name",240,maxy-275,font,white)
    locatexy (240, maxy - 290)
    get id3:*
    
    Draw.Line(round(maxx/2),maxy-160,round(maxx/2),maxy-300,white)
    
    Font.Draw("Team 2. Please enter your team name.",round(maxx/2)+25,maxy-182,fontb,white)
    locatexy (round(maxx/2)+25, maxy - 202)
    get name2:*
    Font.Draw("Player 2. Type in your name",round(maxx/2)+25,maxy-232,font,white)
    locatexy (round(maxx/2)+25, maxy - 243)
    get id2:*
    Font.Draw("Player 4. Type in your name",round(maxx/2)+25,maxy-277,font,white)
    locatexy (round(maxx/2)+25, maxy - 292)
    get id4:*
    Font.Draw ("Choose the targeted amount of points", 240, maxy - 340, font2, white)
    loop
    locatexy (240, maxy - 365)
    get inputwin:*
    for i:1..length(inputwin)
    if index("0123456789",inputwin(i))=0
    then isint:=false
    end if
    end for
    if isint then exit end if
    Draw.FillBox(240,maxy-365,600,maxy-348,black)
    Font.Draw("Type in a POSITIVE INTEGER... Mr. Achong would be dissapointed.",240, maxy - 395, font, 12) 
    isint:=true
    end loop 
    wincondition:=strint(inputwin)
    
    View.Set ("nocursor")
    View.Set ("offscreenonly")
    colour (black)
    colourback (white)

    Font.Draw ("Choose your Achong!!!", round (maxx / 2) - 190, maxy - 435, font2, white)
    var pic : int := Pic.FileNew ("achongpongsmall1.jpg")
    Pic.Draw (pic, 400, 30, picCopy)
    var pic2 : int := Pic.FileNew ("achongpongsmall2.jpg")
    Pic.Draw (pic2, 600, 30, picCopy)
    var pic3 : int := Pic.FileNew ("achongpongsmall3.jpg")
    Pic.Draw (pic3, 800, 30, picCopy)
    Font.Draw ("1", 440, 150, font2, white)
    Font.Draw ("2", 640, 150, font2, white)
    Font.Draw ("3", 840, 150, font2, white)
    View.Update

    var ch : string (1)

    loop
	getch (ch)

	case (ch) of
	    label "1" :
		pong := Pic.FileNew ("achongpong2.jpg")
		l := 39
		h := 41
		exit

	    label "2" :
		pong := Pic.FileNew ("achongpong.jpg")
		l := 37
		h := 49
		exit

	    label "3" :
		pong := Pic.FileNew ("achongpong3.jpg")
		l := 35
		h := 41
		exit

	    label :
	end case
    end loop    
    
end Rules2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
process soundfx
    play (">16a<")
end soundfx

process soundfx2
    play ("16a")
end soundfx2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc Circles (lengthc1, lengthc2,score1,score2 : int)
    Draw.FillBox (Font.Width(intstr(score1),font1)+15 , maxy - 74, Font.Width(intstr(score1),font1)+15 + 250, maxy - 75 + 45, white)
    Draw.FillBox (maxx - Font.Width(intstr(score2),font1)-15, maxy - 74, maxx - Font.Width(intstr(score2),font1)-15 - 250, maxy - 75 + 45, white)

    if lengthc1 > 150 then
	for i : 1 .. (lengthc1 - 150) div 50
	    Draw.FillOval (Font.Width(intstr(score1),font1)+5 + 50 * i, maxy - 75 + 24, 20, 20, 55)
	    Draw.FillBox (Font.Width(intstr(score1),font1)+5 + 50 * i - 16, maxy - 75 + 24 - 5, Font.Width(intstr(score1),font1)+5 + 50 * i + 15, maxy - 75 + 24 + 5, 68)
	    Draw.FillBox (Font.Width(intstr(score1),font1)+5 + 50 * i - 5, maxy - 75 + 24 - 15, Font.Width(intstr(score1),font1)+5 + 50 * i + 5, maxy - 75 + 24 + 15, 68)
	end for
    end if
    %40
    if lengthc1 < 150 then
	for i : 1 .. 2 - (lengthc1 - 50) div 50
	    Draw.FillOval (Font.Width(intstr(score1),font1)+5 + 50 * i, maxy - 75 + 24, 20, 20, 40)
	    Draw.FillBox (Font.Width(intstr(score1),font1)+5 + 50 * i - 16, maxy - 75 + 24 - 5, Font.Width(intstr(score1),font1)+5 + 50 * i + 15, maxy - 75 + 24 + 5, 68)
	end for
    end if

    if lengthc2 > 150 then
	for i : 1 .. (lengthc2 - 150) div 50
	    Draw.FillOval (maxx - Font.Width(intstr(score2),font1)-5 - 50 * i, maxy - 75 + 24, 20, 20, 55)
	    Draw.FillBox (maxx - Font.Width(intstr(score2),font1)-5 - 50 * i - 16, maxy - 75 + 24 - 5, maxx - Font.Width(intstr(score2),font1)-5 - 50 * i + 15, maxy - 75 + 24 + 5, 68)
	    Draw.FillBox (maxx - Font.Width(intstr(score2),font1)-5 - 50 * i - 5, maxy - 75 + 24 - 15, maxx - Font.Width(intstr(score2),font1)-5 - 50 * i + 5, maxy - 75 + 24 + 15, 68)
	end for
    end if

    if lengthc2 < 150 then
	for i : 1 .. abs ((lengthc2 - 150) div 50)
	    Draw.FillOval (maxx - Font.Width(intstr(score2),font1)-5 - 50 * i, maxy - 75 + 24, 20, 20, 40)
	    Draw.FillBox (maxx - Font.Width(intstr(score2),font1)-5 - 50 * i - 16, maxy - 75 + 24 - 5, maxx - Font.Width(intstr(score2),font1)-5 - 50 * i + 15, maxy - 75 + 24 + 5, 68)
	end for
    end if

    View.Update

end Circles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc getQuote
    var n := Rand.Int (1, 8)

    case (n) of
	label 1 :
	    Font.Draw ("\"y=mx+b\"", round ((maxx - Font.Width ("\"y=mx+b\"", font3))/2), maxy - 75 + 10, font3, black)

	label 2 :
	    Font.Draw ("\"Did you remember to do your Homefun?\"", round ((maxx - Font.Width ("\"Did you remember to do your Homefun?\"", font3))/2), maxy - 75 + 10, font3, black)

	label 3 :
	    Font.Draw ("\"Plaid is love. Plaid is life!\"", round ((maxx - Font.Width ("\"Plaid is love. Plaid is life!\"", font3))/2), maxy - 75 + 10, font3, black)

	label 4 :
	    Font.Draw ("\"Do you know your Angle Theorems?\"", round ((maxx - Font.Width ("\"Do you know your Angle Theorems?\"", font3))/2), maxy - 75 + 10, font3, black)

	label 5 :
	    Font.Draw ("\"Eghhhhhhh... Half-mark off\"", round ((maxx - Font.Width ("\"Eghhhhhhh... Half-mark off\"", font3))/2), maxy - 75 + 10, font3, black)

	label 6 :
	    Font.Draw ("\"But did you reject the negative root?\"", round ((maxx - Font.Width ("\"But did you reject the negative root?\"", font3))/2), maxy - 75 + 10, font3, black)

	label 7 :
	    Font.Draw ("\"Thilash, Kamil, and Teg. Stay in for lunch again.\"", round ((maxx - Font.Width ("\"Thilash, Kamil, and Teg. Stay in for lunch again.\"", font3))/2), maxy - 75 + 10, font3, black)
	label 8 :
	    Font.Draw ("\"Did you get your quiz signed?\"", round ((maxx - Font.Width ("\"Did you get your quiz signed?\"", font3))/2), maxy - 75 + 10, font3, black)
	label 9 :
	    Font.Draw ("\"Ron, do you need help?\"", round ((maxx - Font.Width ("\"Ron, do you need help?\"", font3))/2), maxy - 75 + 10, font3, black)
	label :

    end case
    View.Update
end getQuote
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc preroundscreen (score1, score2, wincondition, gtype : int, name1, name2,id1,id2,id3,id4 : string)
    var quote : string := ""
    a := Rand.Int (0, 1)
    a := a * 40 - 20
    b := Rand.Int (-10, 10)
    b *= 2
    if b = 0 then
	b := 10
    end if
    x := round ((maxx - 75 - l) / 2)
    y := round ((maxy - h - 75) / 2)

    lengthc1 := 150
    lengthc2 := 150
    lengthc3 := 150
    lengthc4 := 150
    c := round ((maxy - 75 - lengthc1) / 2)
    c2 := round ((maxy - 75 - lengthc2) / 2)
    c3 := round ((maxy - 75 - lengthc3) / 2)
    c4 := round ((maxy - 75 - lengthc4) / 2)
    r1:=false
    r2:=false
    r3:=false
    r4:=false
    Delay := 70
    %
    Draw.FillBox (0, 0, maxx, maxy - 75 - 1, colorbox)
    Draw.FillBox (1, maxy - 75, maxx, maxy, white)
    if gtype = 2 then
	Draw.FillBox (200, c3, 230, c3 + lengthc3, white)
	Draw.FillBox (maxx - 30 - 200, c4, maxx - 200, c4 + lengthc4, white)
	Font.Draw(id1,10,c +lengthc1+60,fontsmall,white)
	Draw.Line(20,c+lengthc1+50,50,c+lengthc1+50,12)
	Draw.Line(20,c+lengthc1+50,35,c+lengthc1+20,12)
	Draw.Line(35,c+lengthc1+20,50,c+lengthc1+50,12)
	Draw.Fill(35,c+lengthc1+30,12,12)
	Font.Draw(id2,maxx-Font.Width(id2,fontsmall)-10,c2 +lengthc2+60,fontsmall,white)
	Draw.Line(maxx-20,c2+lengthc2+50,maxx-50,c2+lengthc2+50,9)
	Draw.Line(maxx-20,c2+lengthc2+50,maxx-35,c2+lengthc2+20,9)
	Draw.Line(maxx-35,c2+lengthc2+20,maxx-50,c2+lengthc2+50,9)
	Draw.Fill(maxx-35,c2+lengthc2+30,9,9)
	Font.Draw(id3, 215-round(Font.Width(id3,fontsmall)/2),c3-76,fontsmall,white)
	Draw.Line(200,c3-50,230,c3-50,44)
	Draw.Line(200,c3-50,215,c3-20,44)
	Draw.Line(215,c3-20,230,c3-50,44)
	Draw.Fill(215,c3-30,44,44)
	Font.Draw(id4, maxx-215-round(Font.Width(id4,fontsmall)/2),c4-76,fontsmall,white)
	Draw.Line(maxx-200,c4-50,maxx-230,c4-50,121)
	Draw.Line(maxx-200,c4-50,maxx-215,c4-20,121)
	Draw.Line(maxx-215,c4-20,maxx-230,c4-50,121)
	Draw.Fill(maxx-215,c4-30,121,121)        
    end if
    Font.Draw (intstr (score1), 10, maxy - 75 + 5, font1, black)
    Font.Draw (intstr (score2), maxx - 10 - Font.Width(intstr(score2),font1), maxy - 75 + 5, font1, black)
    Draw.FillBox (20, c, 50, c + lengthc1, white)
    Draw.FillBox (maxx - 30 - 20 + 1, c2, maxx - 20, c2 + lengthc2, white)
    Font.Draw (name1, Font.Width(intstr(score1),font1)+25, maxy - 25, font2, black)
    var width := Font.Width (name2, font2)
    Font.Draw (name2, maxx - 25 - Font.Width(intstr(score2),font1) - Font.Width(name2,font2), maxy - 25, font2, black)
    View.Update
    getQuote
    for decreasing i : 3 .. 1
	Font.Draw (intstr (i), round (maxx / 2) - 20, round ((maxy - 75) / 2) - 20, font1, white)
	Font.Draw ("First to " + intstr (wincondition) + ".", round (maxx / 2) - 55, round ((maxy - 75) / 2) - 50, font2, white)
	View.Update
	delay (1000)
	Draw.FillBox (300, 0, maxx - 300, maxy - 75 - 1, colorbox)
    end for
    
    Draw.FillBox(1,c+lengthc1+1,maxx,c+lengthc1+120,colorbox)
    Draw.FillBox(1,c-1,maxx,c-120,colorbox)
end preroundscreen

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc pdraw (var ptype, typecolor, z : int, var spawned : boolean)

    if spawned
	    then
	case (ptype) of
	    label 0 :
		typecolor := 40
		Draw.FillOval (round (maxx / 2), z, 20, 20, typecolor)
		Draw.FillBox (round (maxx / 2) - 16, z - 5, round (maxx / 2) + 15, z + 5, 68)
	    label 1 :
		typecolor := 55
		Draw.FillOval (round (maxx / 2), z, 20, 20, typecolor)
		Draw.FillBox (round (maxx / 2) - 16, z - 5, round (maxx / 2) + 15, z + 5, 68)
		Draw.FillBox (round (maxx / 2) - 5, z - 15, round (maxx / 2) + 5, z + 15, 68)
	    label 2 :
		typecolor :=106
		Draw.FillOval (round (maxx / 2), z, 20, 20, typecolor)
		Draw.FillBox (round(maxx/2)-14,z+7,round(maxx/2)+8,z+11,68)
		Draw.FillBox (round(maxx/2)-8,z-7,round(maxx/2)+14,z-11,68)
		Draw.Line(round(maxx/2)+14,z+9,round(maxx/2)+8,z+14,68)
		Draw.Line(round(maxx/2)+14,z+9,round(maxx/2)+8,z+4,68)
		Draw.Line(round(maxx/2)+8,z+14,round(maxx/2)+8,z+4,68)
		Draw.Fill(round(maxx/2)+9,z+9,68,68)
		Draw.Line(round(maxx/2)-14,z-9,round(maxx/2)-8,z-14,68)
		Draw.Line(round(maxx/2)-14,z-9,round(maxx/2)-8,z-4,68)
		Draw.Line(round(maxx/2)-8,z-14,round(maxx/2)-8,z-4,68)
		Draw.Fill(round(maxx/2)-9,z-9,68,68)
	       
	    label 3:
		typecolor:=41
		Draw.FillOval (round (maxx / 2), z, 20, 20,typecolor)
		Draw.FillArc(round (maxx / 2),z,15,15,50,180,68)    
		Draw.FillArc(round (maxx / 2),z,15,15,230,360,68)
		Draw.FillOval(round (maxx / 2), z, 9, 9,typecolor)
		Draw.Line(round (maxx / 2)-12,z-6,round(maxx/2)-17,z,68)
		Draw.Line(round (maxx / 2)-12,z-6,round(maxx/2)-7,z,68)
		Draw.Line(round(maxx/2)-17,z,round(maxx/2)-7,z,68)
		Draw.Fill(round(maxx/2)-12,z-2,68,68)
		Draw.Line(round (maxx / 2)+12,z+6,round(maxx/2)+17,z,68)
		Draw.Line(round (maxx / 2)+12,z+6,round(maxx/2)+7,z,68)
		Draw.Line(round(maxx/2)+17,z,round(maxx/2)+7,z,68)
		Draw.Fill(round(maxx/2)+12,z+2,68,68) 
		
	    label 4:
		typecolor:=48
		Draw.FillOval (round (maxx / 2), z, 20, 20,48)
		Draw.FillBox(round (maxx / 2)+13,z+3,round (maxx / 2)-13,z+9,68)
		Draw.FillBox(round (maxx / 2)+13,z-3,round (maxx / 2)-13,z-9,68)
	    
	    label :

	end case
    end if

end pdraw
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc peffect (ptype, a : int, var lengthc1, lengthc2, lengthc3, lengthc4:int,var r1,r2,r3,r4:boolean)
    case (ptype) of
	label 0 :
	    if a < 0 and lengthc1 ~= 50 then
		lengthc1 -= 50
		lengthc3 -= 50
	    elsif a > 0 and lengthc2 ~= 50 then
		lengthc2 -= 50
		lengthc4 -= 50
	    end if
	label 1 :
	    if a < 0 and lengthc2 ~= 400 then
		lengthc2 += 50
		lengthc4 += 50
	    elsif a > 0 and lengthc1 ~= 400 then
		lengthc1 += 50
		lengthc3 += 50
	    end if
	label 2 :
	    var thilash:int:=lengthc1
	    lengthc1:=lengthc2
	    lengthc3:=lengthc2
	    lengthc2:=thilash
	    lengthc4:=thilash
	    var thilash2:boolean:=r1
	    r1:=r2
	    r2:=thilash2
	    thilash2:=r3
	    r3:=r4
	    r4:=thilash2            
	label 3:
	    if a<0 then
		if r1 then r1:=false r3:=false else r1:=true r3:=true end if
	    else
		if r2 then r2:=false r4:=false else r2:=true r4:=true end if
	    end if
	    
	label 4:
	lengthc1:=150
	lengthc2:=150
	lengthc3:=150
	lengthc4:=150
	r1:=false
	r2:=false
	r3:=false
	r4:=false
 
	label :
    end case
end peffect

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc basicinput (var c, c2, lengthc1, lengthc2, Delay : int)
    var keys : array char of boolean
    Input.KeyDown (keys)
    
    if keys (KEY_UP_ARROW) then
	if r2 
	then c2 -= round (Delay * 0.2) + 1
	else c2 += round (Delay * 0.2) + 1
	end if
    end if

    if keys (KEY_DOWN_ARROW) then    
	if r2
	then c2 += round (Delay * 0.2) + 1
	else c2 -= round (Delay * 0.2) + 1
	end if
    end if

    if keys ('w') or keys('W') then
	if r1 
	then c -= round (Delay * 0.2) + 1
	else c += round (Delay * 0.2) + 1
	end if
    end if

    if keys ('s') or keys('S') then
	if r1
	then c += round (Delay * 0.2) + 1
	else c -= round (Delay * 0.2) + 1
	end if
    end if

    if c2 < 1 then
    c2 := 1
    end if
    if c < 1 then
    c := 1
    end if
    if c > maxy - 75 - lengthc1 then
	c := maxy - 75 - lengthc1 - 1
    end if
    if c2 > maxy - 75 - lengthc2 then
	c2 := maxy - 75 - lengthc2 - 1
    end if

end basicinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc vs4 (var c3, c4, lengthc3, lengthc4, Delay : int)
    var keys : array char of boolean
    Input.KeyDown (keys)
    if keys ('f') or keys ('F') then
	if r3
	then c3 -= round (Delay * 0.2) + 1
	else c3 += round (Delay * 0.2) + 1
	end if
    end if

    if keys ('v') or keys ('V') then
	if r3
	then c3 += round (Delay * 0.2) + 1
	else c3 -= round (Delay * 0.2) + 1
	end if
    end if

    if keys ('j') or keys ('J') then
	if r4
	then c4 -= round (Delay * 0.2) + 1
	else c4 += round (Delay * 0.2) + 1
	end if
    end if

    if keys ('m') or keys ('M') then
	if r4
	then c4 += round (Delay * 0.2) + 1
	else c4 -= round (Delay * 0.2) + 1
	end if
    end if
    
    if c4 < 1 then
	c4 := 1
    end if    
    if c3 < 1 then
	c3 := 1
    end if
    if c3 > maxy - 75 - lengthc3 then
	c3 := maxy - 75 - lengthc3 - 1
    end if
    if c4 > maxy - 75 - lengthc4 then
	c4 := maxy - 75 - lengthc4 - 1
    end if

end vs4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc bounce (gtype : int, var x, y, c, c2, c3, c4, l, h, lengthc1, lengthc2, lengthc3, lengthc4, a, b, Delay, count : int)
    if y = 1 or y = maxy - h - 75
	    then
	b *= -1
	%fork soundfx2
	%View.Update
    end if
    if x >= 20 and x <= 50 and ((y > c and y < c + lengthc1) or (y + h > c and y + h < c + lengthc1)) then
	x := 50
	a := 20
	Delay := round (Delay * 0.95)
	b := round ((c + round (lengthc1 / 2) - (y + round (h / 2))) * -0.6)
	count += 1
	%fork soundfx
	%View.Update
    end if

    if x + l > maxx - 30 - 20 + 1 and x + l < maxx - 20 + 1 and ((y > c2 and y < c2 + lengthc2) or (y + h > c2 and y + h < c2 + lengthc2)) then
	x := maxx - 30 - 20 + 1 - l
	a := -20
	Delay := round (Delay * 0.95)
	b := round ((c2 + round (lengthc2 / 2) - (y + round (h / 2))) * -0.6)
	count += 1
	%fork soundfx
	%View.Update
    end if

    if gtype = 2 then
	if x >= 200 and x <= 230 and ((y > c3 and y < c3 + lengthc3) or (y + h > c3 and y + h < c3 + lengthc3)) then
	    x := 230
	    a := 20
	    Delay := round (Delay * 0.95)
	    b := round ((c3 + round (lengthc3 / 2) - (y + round (h / 2))) * -0.6)
	    count += 1
	    %fork soundfx
	    %View.Update
	end if

	if x + l >= 200 and x + l <= 230 and ((y > c3 and y < c3 + lengthc3) or (y + h > c3 and y + h < c3 + lengthc3)) then
	    x := 200 - l
	    a := -20
	    b := round ((c3 + round (lengthc3 / 2) - (y + round (h / 2))) * -0.6)
	    %fork soundfx
	    %View.Update
	end if

	if x + l > maxx - 30 - 200 + 1 and x + l < maxx - 200 + 1 and ((y > c4 and y < c4 + lengthc4) or (y + h > c4 and y + h < c4 + lengthc4)) then
	    x := maxx - 30 - 200 + 1 - l
	    a:=-20
	    Delay := round (Delay * 0.95)
	    b := round ((c4 + round (lengthc4 / 2) - (y + round (h / 2))) * -0.6)
	    count += 1
	    %fork soundfx
	    %View.Update
	end if
	if x > maxx - 30 - 200 + 1 and x < maxx - 200 + 1 and ((y > c4 and y < c4 + lengthc4) or (y + h > c4 and y + h < c4 + lengthc4)) then
	    x := maxx - 200 + 1
	    a := 20
	    b := round ((c4 + round (lengthc4 / 2) - (y + round (h / 2))) * -0.6)
	    %fork soundfx
	    %View.Update
	end if
    end if

end bounce
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc main (s1, s2 : int, var p1, p2 : int, gtype : int,score1,score2:int)
    var spawned : boolean := false
    var count : int := 0
    var spawn := Rand.Int (1, 3)
    var z : int := round ((maxy - 75) / 2)
    var zrate : int := (Rand.Int (0, 1) * 20) - 10
    var pchance:int:=Rand.Int (1,13)
    var ptype : int  
    var typecolor : int
    var panelcolor1,panelcolor2,panelcolor3,panelcolor4:int
    
    loop
	
	if pchance<=4 
	then ptype:=0 %minus
	elsif pchance<=8
	then ptype:=1 %plus
	elsif pchance<=10
	then ptype:=2%swap
	elsif pchance<=12
	then ptype:=3%reverse
	else ptype:=4%reset
	end if
	
	if r1 then panelcolor1:=12 else panelcolor1:=0 end if
	if r2 then panelcolor2:=12 else panelcolor2:=0 end if
	if r3 then panelcolor3:=12 else panelcolor3:=0 end if
	if r4 then panelcolor4:=12 else panelcolor4:=0 end if
	
	Pic.Draw (pong, x, y, picCopy)
	Draw.FillBox (20, c, 50, c + lengthc1, panelcolor1)
	Draw.FillBox (maxx - 30 - 20 + 1, c2, maxx - 20, c2 + lengthc2, panelcolor2)

	if gtype = 2 then
	    Draw.FillBox (200, c3, 230, c3 + lengthc3, panelcolor3)
	    Draw.FillBox (maxx - 30 - 200, c4, maxx - 200, c4 + lengthc4, panelcolor4)
	end if

	%%ticker tape?
	% ticker := ticker(2..*)+ticker(1)
	%
	%     Font.Draw (ticker, round (maxx / 2) - 130, maxy - 20, font2, black)

	pdraw (ptype, typecolor, z, spawned)


	View.Update
	delay (Delay)
	Draw.FillBox (20, c, 50, c + lengthc1, colorbox)
	%Draw.Fill(21,c+1,colorbg,colorbg)
	Draw.FillBox (maxx - 30 - 20 + 1, c2, maxx - 20, c2 + lengthc2, colorbox)
	%Draw.Fill(maxx-30-20+2,c2+1,colorbg,colorbg)
	Draw.FillBox (x, y, x + l - 1, y + h - 1, colorbox)
	%Draw.Fill(x+1,y+1,colorbg,colorbg)
	Draw.FillBox (200, c3, 230, c3 + lengthc3, colorbox)
	Draw.FillBox (maxx - 30 - 200, c4, maxx - 200, c4 + lengthc4, colorbox)
	if spawned
		then
	    Draw.FillOval (round (maxx / 2), z, 20, 20, black)
	    z += zrate
	end if
	View.Update

	%achong movements
	x += a
	y += b

	if y < 1
		then
	    y := 1
	end if
	if y > maxy - h - 75 + 1
		then
	    y := maxy - h - 75
	end if

	%powerup
	if z < 20
		then
	    z := 20
	    zrate *= -1
	end if
	if z > maxy - 75 - 20
		then
	    z := maxy - 75 - 20 - 1
	    zrate *= -1
	end if

	if ((round (maxx / 2) - 20 < x and round (maxx / 2) + 20 > x) or (round (maxx / 2) - 20 < x + l and round (maxx / 2) + 20 > x + l)) and ((y > z - 20 and y < z + 20) or (y + h < z + 20 and y + 
	    h > z - 20)) and spawned
		then
	    spawned := false
	    peffect (ptype, a, lengthc1, lengthc2, lengthc3, lengthc4,r1,r2,r3,r4)
	    pchance:=Rand.Int(1,13)
	    count := 0
	    spawn := Rand.Int (1, 2)
	    Circles (lengthc1, lengthc2,score1,score2)
	end if

	basicinput (c, c2, lengthc1, lengthc2, Delay)

	if gtype = 2
		then
	    vs4 (c3, c4, lengthc3, lengthc4, Delay)
	end if

	if count >= spawn
		then
	    spawned := true
	end if

	bounce (gtype, x, y, c, c2, c3, c4, l, h, lengthc1, lengthc2, lengthc3, lengthc4, a, b, Delay, count)

	%exit when someone loses the ball
	if x < 1 - l then
	    p2 += 1
	    exit
	end if

	if x > maxx then
	    p1 += 1
	    exit
	end if

    end loop
end main

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

proc go (score1, score2 : int, name1, name2 : string, var back : boolean,gtype:int,var dback:boolean)
    var ch : string (1)

    Draw.FillBox (0, 0, maxx, maxy - 75 - 1, colorbox)
    Draw.FillBox (1, maxy - 75, maxx, maxy, white)
    Font.Draw (intstr (score1), 10, maxy - 75 + 5, font1, black)
    Font.Draw (intstr (score2), maxx - 10 - Font.Width(intstr(score2),font1)-15, maxy - 75 + 5, font1, black)
    Draw.FillBox (20, c, 50, c + lengthc1, white)
    Draw.FillBox (maxx - 30 - 20 + 1, c2, maxx - 20, c2 + lengthc2, white)
    if gtype=2 then
    Draw.FillBox (200, c3, 230, c3 + lengthc3, white)
    Draw.FillBox (maxx - 30 - 200 + 1, c4, maxx - 200, c4 + lengthc4, white) 
    end if

    Pic.Draw (achong, round ((maxx - 242) / 2), 50, picCopy)
    Draw.Line (round ((maxx - 242) / 2) - 5, 50 + 285, round ((maxx - 242) / 2) - 5 - 30, 50 + 285 + 30, white)
    Draw.Line (round ((maxx - 242) / 2) - 5, 50 + 285, round ((maxx - 242) / 2) - 5 - 20, 50 + 285 + 50, white)
    Draw.Line (round ((maxx - 242) / 2) - 5 - 30, 50 + 285 + 30, round ((maxx - 242) / 2) - 5 - 20, 50 + 285 + 50, white)
    Draw.Fill (round ((maxx - 242) / 2) - 5 - 26, 50 + 285 + 37, white, white)
    Draw.FillOval (round ((maxx - 242) / 2) - 5 - 26 - 80, 50 + 285 + 60, 200, 50, white)
    Font.Draw ("It looks like someone needs", round ((maxx - 242) / 2) - 5 - 26 - 80 - 180, 50 + 285 + 60, font2, black)
    Font.Draw ("more HOMEFUN!", round ((maxx - 242) / 2) - 5 - 26 - 80 - 120, 50 + 285 + 35, font2, black)
    Font.Draw ("GAME OVER",  round ((maxx - Font.Width ("GAMEOVER", font2))/2), maxy - 75 - 40, font2, white)
    

    var winner : string
    if score1 > score2 then
	winner := name1
    else
	winner := name2
    end if
    Font.Draw (winner + " won the game.", round ((maxx - Font.Width (winner + " won the game.", font2))/2), maxy - 75 - 75, font2, white)
    Font.Draw ("Press any key for a rematch. Press \"1\" to adjust rules or press \"2\" to choose gamemode.", round (maxx / 2 - Font.Width("Press any key for a rematch. Press \"1\" to adjust rules or press \"2\" to choose gamemode.",font2)/2), 15, font2, white)
    View.Update
    delay (4500)
    getch (ch)
    if ch = "1" then
	back := true
    elsif ch ="2" then
	dback:=true
    else
	back := false
    end if

end go
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc game (gtype : int)
    loop
	var wincondition : int
	var name1, name2 : string
	var back : boolean := false
	var dback:boolean:=false
	if gtype=1 then
	Rules (wincondition, name1, name2, l, h, pong)
	else Rules2(wincondition, name1, name2,id1,id2,id3,id4, l, h, pong)
	end if
	loop
	    var score1, score2, new1, new2 : int := 0
	    loop
		preroundscreen (score1, score2, wincondition, gtype, name1, name2,id1,id2,id3,id4)
		main (score1, score2, new1, new2, gtype,score1,score2)
		score1 := new1
		score2 := new2

		if score1 = wincondition or score2 = wincondition
			then
		    exit
		end if

	    end loop
	    go (score1, score2, name1, name2, back,gtype,dback)
	    if back or dback then
		exit
	    end if
	end loop
	if dback then exit end if
    end loop
end game

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%main
fork music
var gtype : int
Intro
loop
gametype (gtype)
game (gtype)
end loop
%This is officially the 1300th line!!!!
