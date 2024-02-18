state("I Wanna Be The Boshy")
{
    //The variable responsible for the World (ingame frame) number
    int frameGame: 0x59A94, 0x268, 0xA8;

    //Coordinates for World 1 and 9
    int y0  : "Lacewing.mfx", 0x2D680, 0x208, 0x1C, 0x88, 0x54;
    int x0  : "Lacewing.mfx", 0x2D680, 0x234, 0x208, 0x1C, 0x68, 0x4C;

    //Coordinates for World 2
    int y1  :  0x59A9C, 0xA4, 0x7C0, 0xD0, 0x234, 0x54;
    int x1  : "Lacewing.mfx", 0x2D680, 0x208, 0x1C, 0x388, 0x4C;

    //Coordinates for World 3
    int y2  : "Lacewing.mfx", 0x2D680, 0x208, 0x1C, 0x88, 0x54;
    int x2  : "Lacewing.mfx", 0x2D680, 0x208, 0x1C, 0x48, 0xC, 0x4C;

    //Coordinates for Tutorial, Worlds 4-8 and World 11
    int y3  : "Lacewing.mfx", 0x2D680, 0x208, 0x1C, 0x38, 0xC, 0x54;
    int x3  : "Lacewing.mfx", 0x2D680, 0x208, 0x1C, 0x40, 0xC, 0x4C; 

    //Coordinates for World 10
    int x4  : "Lacewing.mfx", 0x2D680, 0x234, 0x208, 0x1C, 0x68, 0x4C;
    int y4  : "Lacewing.mfx", 0x2D680, 0x208, 0x1C, 0x58, 0xC, 0x54;

    //Coordinates for Cobrat (Snake from World 11)
    int cobrat_x : "Lacewing.mfx", 0x2D680, 0x208, 0x1C, 0x480, 0xC, 0x4C;
}

startup
{

    settings.Add("option1", true, "World 1 - \"Prehistoric II\"");
    settings.Add("option2", false, "World 1 - \"Prehistoric II\" - With single screens (19 splits)");
    settings.Add("option3", true, "Boss 1 - \"Hello Kitty\"");

    settings.Add("option4", true, "World 2 - \"Kirby's Adventure\"");
    settings.Add("option5", false, "World 2 - \"Kirby's Adventure\" (Kracko Skip required) - With single screens (21 splits)");
    settings.Add("option6", true, "Miniboss - \"King Dedede\" and Boss 2 - \"Ryu\"");

    settings.Add("option7", true, "World 3 - \"Cheetahmen World\"");
    settings.Add("option8", false, "World 3 - \"Cheetahmen World\" - With single screens (14 splits)");
    settings.Add("option9", true, "Boss 3 - \"Mario\"");

    settings.Add("option10", true, "World 4 - \"VVVVVV\"");
    settings.Add("option11", false, "World 4 - \"VVVVVV\" (Skip required) - With single screens (3 splits)");
    settings.Add("option12", true, "Boss 4 - \"Biollante\""); 

    settings.Add("option13", true, "World 5 - \"Wario Land\"");
    settings.Add("option14", false, "World 5 - \"Wario Land\" - With single screens (11 splits)");
    settings.Add("option15", true, "Boss 5 - \"Sonic\"");

    settings.Add("option16", true, "World 6 - \"Castlevania\"");
    settings.Add("option17", false, "World 6 - \"Castlevania\" (Gradius Skip required) - With single screens (15 splits)");
    settings.Add("option18", true, "Boss 6 - \"Skeleton King\"");

    settings.Add("option19", true, "World 7 - \"Random World\"");
    settings.Add("option20", false, "World 7 - \"Random World\" - With single screens (24 splits)");
    settings.Add("option21", true, "Boss 7 - \"Megaman\"");

    settings.Add("option22", true, "World 8 - \"Megaman Stage\"");
    settings.Add("option23", false, "World 8 - \"Megaman Stage\" - With single screens (17 splits)");
    settings.Add("option24", true, "Boss 8 - \"Shang Tsung\""); 

    settings.Add("option25", true, "World 9 - \"Kid Icarus\"");
    settings.Add("option26", false, "World 9 - \"Kid Icarus\" - With single screens (11 splits)");
    settings.Add("option27", true, "Boss 9 - \"Ganon\"");

    settings.Add("option28", true, "World 10 - \"Ninja Gaiden\"");
    settings.Add("option29", false, "World 10 - \"Ninja Gaiden\" (Fisrt skip required) - With single screens (17 splits)");
    settings.Add("option30", true, "Boss 10 - \"Missingno\"");

    settings.Add("option31", true, "World 11 - \"Mario Desert\"");
    settings.Add("option32", false, "World 11 - \"Mario Desert\" (Save Hovering required) - With single screens (15 splits)");
    settings.Add("option33", true, "Final Path and Boss - \"Solgryn\"");

    settings.Add("option34", false, "Reset timer when you pressed ESC");
    settings.Add("option35", false, "Reset timer when you pressed F2");
    settings.Add("option36", false, "Turn on timer when you are in any world except Tutorial");
    settings.Add("option37", false, "Boss Rush mode (Beta)");

}

reset
{
    if (settings["option34"])  //Reset when pause
        return (current.frameGame==20);

    if (settings["option35"]) //Reset when pressed F2
        return (current.frameGame==1);
}

start
{
    current.index = 0;

    //Bool variables for Worlds
    current.completionWorld1 = false;
    current.completionWorld2 = false;
    current.completionWorld3 = false;
    current.completionWorld4 = false;
    current.completionWorld5 = false;
    current.completionWorld6 = false;
    current.completionWorld7 = false;
    current.completionWorld8 = false;
    current.completionWorld9 = false;
    current.completionWorld10 = false;
    current.completionWorld11 = false;
    
    //Bool variables for Bosses
    current.completionBoss1 = false;
    current.completionBoss2 = false;
    current.completionBoss3 = false;
    current.completionBoss4 = false;
    current.completionBoss5 = false;
    current.completionBoss6 = false;
    current.completionBoss7 = false;
    current.completionBoss8 = false;
    current.completionBoss9 = false;
    current.completionBoss10 = false;
    current.completionBoss11 = false;


    if ((settings["option1"] || settings["option2"]) && current.frameGame==36) //Start timer when launched Tutorial 
        return true;


    if (settings["option36"]) //Start timer everywhere
    {
        if ( settings["option3"] && current.frameGame==4 ) //Start timer when launched Hello Kitty
            return true;

        if ( (settings["option4"] || settings["option5"]) && current.frameGame==5 ) //Start timer when launched World 2 
            return true;
    
        if ( settings["option6"] && (current.frameGame==6||current.frameGame==7) ) //Start timer when launched King DeDeDe or Ryu
            return true;

        if ( (settings["option7"] || settings["option8"]) && current.frameGame==8 ) //Start timer when launched World 3 
            return true;
    
        if ( settings["option9"] && current.frameGame==10 ) //Start timer when launched Mario
            return true;    

        if ( (settings["option10"] || settings["option11"]) && current.frameGame==11 ) //Start timer when launched World 4 
            return true;
    
        if ( settings["option12"] && current.frameGame==12 ) //Start timer when launched Biollante
            return true;   

        if ( (settings["option13"] || settings["option14"]) && current.frameGame==13 ) //Start timer when launched World 5 
            return true;
    
        if ( settings["option15"] && current.frameGame==14 ) //Start timer when launched Sonic
            return true;    

        if ( (settings["option16"] || settings["option17"]) && current.frameGame==15 ) //Start timer when launched World 6 
            return true;
    
        if ( settings["option18"] && current.frameGame==17 ) //Start timer when launched Skeleton King
            return true;

        if ( (settings["option19"] || settings["option20"]) && current.frameGame==22 ) //Start timer when launched World 7 
            return true;
    
        if ( settings["option21"] && current.frameGame==24 ) //Start timer when launched Megaman
            return true;

        if ( (settings["option22"] || settings["option23"]) && current.frameGame==25 ) //Start timer when launched World 8 
            return true;
    
        if ( settings["option24"] && current.frameGame==26 ) //Start timer when launched Shang Tsung
            return true;

        if ( (settings["option25"] || settings["option26"]) && current.frameGame==27 ) //Start timer when launched World 9 
            return true;
    
        if ( settings["option27"] && current.frameGame==59 ) //Start timer when launched Ganon
            return true;

        if ( (settings["option28"] || settings["option29"]) && current.frameGame==31 ) //Start timer when launched World 10 
            return true;
    
        if ( settings["option30"] && current.frameGame==32 ) //Start timer when launched Missingno
            return true;

        if ( (settings["option31"] || settings["option32"]) && current.frameGame==35 ) //Start timer when launched World 11 
            return true;
    
        if ( settings["option33"] && (current.frameGame==38||current.frameGame==46) ) //Start timer when launched Final Path or Solgryn
            return true;

    }    
}

split
{
    if (!(current.completionWorld1)&&settings["option2"]&&(current.frameGame==36||current.frameGame==3)) //World 1 with single screens
    {
        
        //Tutorial
        if ((current.index==0)&&(current.x3>650)&&(current.x3<660)) {
            current.index++;
            return true;
        }
        if ((current.index==1)&&(current.x3>1290)&&(current.x3<1300)) {
            current.index++;
            return true;
        }
        if ((current.index==2)&&(current.x3>1910)&&(current.x3<1940)) {
            current.index++;
            return true;
        }
        if ((current.index==3)&&(current.x3>2570)&&(current.x3<2580)) {
            current.index++;
            return true;
        }
        if ((current.index==4)&&(current.x3>3210)&&(current.x3<3220)) {
            current.index++;
            return true;
        }
        if ((current.index==5)&&(current.frameGame==3)) {
            current.index++;
            return true;
        }

        //World 1
        if ((current.index==6)&&(current.x0>650)&&(current.x0<660)) {
            current.index++;
            return true;
        }
        if ((current.index==7)&&(current.x0>1290)&&(current.x0<1300)) {
            current.index++;
            return true;
        }
        if ((current.index==8)&&(current.x0>1930)&&(current.x0<1940)) {
            current.index++;
            return true;
        }
        if ((current.index==9)&&(current.x0>2570)&&(current.x0<2580)&&(current.y0<325)&&(current.y0>200)) {
            current.index++;
            return true;
        }
        if ((current.index==10)&&(current.x0>1260)&&(current.x0<1270)) {
            current.index++;
            return true;
        }
        if ((current.index==11)&&(current.x0>620)&&(current.x0<630)&&(current.y0<125)&&(current.y0>0)) {
            current.index++;
            return true;
        }
        if ((current.index==12)&&(current.x0>445)&&(current.x0<650)&&(current.y0<500)&&(current.y0>490)) {
            current.index++;
            return true;
        }
        if ((current.index==13)&&(current.x0>655)&&(current.x0<670)&&(current.y0<1350)&&(current.y0>950)) {
            current.index++;
            return true;
        }
        if ((current.index==14)&&(current.x0>1290)&&(current.x0<1300)) {
            current.index++;
            return true;
        }
        if ((current.index==15)&&(current.x0>1930)&&(current.x0<1940)) {
            current.index++;
            return true;
        }
        if ((current.index==16)&&(current.x0>2570)&&(current.x0<2580)) {
            current.index++;
            return true;
        }
        if ((current.index==17)&&(current.x0>3210)&&(current.x0<3220)) {
            current.index=0;
            return true;
        }
    }


    if (!(current.completionWorld1) && current.frameGame==4 && (settings["option1"] || settings["option2"])) { //World 1 split
        current.completionWorld1 = true;
        return true;
    }

    if (!(current.completionBoss1) && (current.frameGame==5||(current.frameGame==29&&current.x3>1960&&current.x3<2000&&current.y3>330&&current.y3<400&&settings["option37"])) && settings["option3"]) { //Hello Kitty split
        current.completionBoss1 = true;
        return true;
    }


    if (!(current.completionWorld2)&&settings["option5"]&&current.frameGame==5) //World 2 with single splits
    {

        if ((current.index==0)&&(current.x1>650)&&(current.x1<660)) {
            current.index++;
            return true;
        }
        if ((current.index==1)&&(current.x1>1290)&&(current.x1<1300)) {
            current.index++;
            return true;
        }
        if ((current.index==2)&&(current.x1>1930)&&(current.x1<1940)) {
            current.index++;
            return true;
        }
        if ((current.index==3)&&(current.x1>2065)&&(current.x1<2125)&&(current.y1<1440)&&(current.y1>1430)) {
            current.index++;
            return true;
        }
        if ((current.index==4)&&(current.x1>2125)&&(current.x1<2300)&&(current.y1<1470)&&(current.y1>1450)) {
            current.index++;
            return true;
        }
        if ((current.index==5)&&(current.x1>2570)&&(current.x1<2580)) {
            current.index++;
            return true;
        }
        if ((current.index==6)&&(current.x1>2570)&&(current.x1<2640)&&(current.y1<950)&&(current.y1>930)) {
            current.index++;
            return true;
        }
        if ((current.index==7)&&(current.x1>2575)&&(current.x1<2730)&&(current.y1<470)&&(current.y1>450)) {
            current.index++;
            return true;
        }
        if ((current.index==8)&&(current.x1>3210)&&(current.x1<3220)&&(current.y1>370)) {
            current.index++;
            return true;
        }
        if ((current.index==9)&&(current.x1>3180)&&(current.x1<3190)&&(current.y1<1265)&&(current.y1>1200)) {
            current.index++;
            return true;
        }
        if ((current.index==10)&&(current.x1>3210)&&(current.x1<3230)&&(current.y1<1380)&&(current.y1>1265)) {
            current.index++;
            return true;
        }
        if ((current.index==11)&&(current.x1>3850)&&(current.x1<3860)) {
            current.index++;
            return true;
        }
        if ((current.index==12)&&(current.x1>4490)&&(current.x1<4500)) {
            current.index++;
            return true;
        }
        if ((current.index==13)&&(current.x1>5130)&&(current.x1<5140)) {
            current.index++;
            return true;
        }
        if ((current.index==14)&&(current.x1>5770)&&(current.x1<5780)) {
            current.index++;
            return true;
        }
        if ((current.index==15)&&(current.x1>6410)&&(current.x1<6420)) {
            current.index++;
            return true;
        }
        if ((current.index==16)&&(current.x1>6515)&&(current.x1<6605)&&(current.y1<1460)&&(current.y1>1450)) {
            current.index++;
            return true;
        }
        if ((current.index==17)&&(current.x1>7050)&&(current.x1<7060)) {
            current.index++;
            return true;
        }
        if ((current.index==18)&&(current.x1>7020)&&(current.x1<7030)&&(current.y1<1520)&&(current.y1>1450)) {
            current.index++;
            return true;
        }
        if ((current.index==19)&&(current.x1>6930)&&(current.x1<6990)&&(current.y1<1430)&&(current.y1>1420)) {
            current.index=0;
            return true;
        }
    }


    if (!(current.completionWorld2) && current.frameGame==6 && (settings["option4"] || settings["option5"])) { //World 2 split
        current.completionWorld2 = true;
        return true;
    }

    if (!(current.completionBoss2) && (current.frameGame==8||(current.frameGame==29&&current.x3>2000&&current.x3<2070&&current.y3>330&&current.y3<400&&settings["option37"])) && settings["option6"]) { //Ryu split
        current.completionBoss2 = true;
        return true;
    } 


    if (!(current.completionWorld3)&&settings["option8"]&&current.frameGame==8) //World 3 with single screens
    {

        if ((current.index==0)&&(current.x2>650)&&(current.x2<660)) {
            current.index++;
            return true;
        }
        if ((current.index==1)&&(current.x2>1290)&&(current.x2<1300)&&(current.y2<480)&&(current.y2>385)) {
            current.index++;
            return true;
        }
        if ((current.index==2)&&(current.x2>1260)&&(current.x2<1270)&&(current.y2<310)&&(current.y2>175)) {
            current.index++;
            return true;
        }
        if ((current.index==3)&&(current.x2>1290)&&(current.x2<1300)&&(current.y2<170)&&(current.y2>0)) {
            current.index++;
            return true;
        }
        if ((current.index==4)&&(current.x2>1930)&&(current.x2<1940)) {
            current.index++;
            return true;
        }
        if ((current.index==5)&&(current.x2>2570)&&(current.x2<2580)) {
            current.index++;
            return true;
        }
        if ((current.index==6)&&(current.x2>3210)&&(current.x2<3220)) {
            current.index++;
            return true;
        }
        if ((current.index==7)&&(current.x2>3850)&&(current.x2<3860)) {
            current.index++;
            return true;
        }
        if ((current.index==8)&&(current.x2>4490)&&(current.x2<4500)) {
            current.index++;
            return true;
        }
        if ((current.index==9)&&(current.x2>4490)&&(current.x2<4650)&&(current.y2<500)&&(current.y2>490)) {
            current.index++;
            return true;
        }
        if ((current.index==10)&&(current.x2>5130)&&(current.x2<5140)&&(current.y2<660)&&(current.y2>570)) {
            current.index++;
            return true;
        }
        if ((current.index==11)&&(current.x2>5140)&&(current.x2<5250)&&(current.y2<470)&&(current.y2>460)) {
            current.index++;
            return true;
        }
        if ((current.index==12)&&(current.x2>5100)&&(current.x2<5110)) {
            current.index=0;
            return true;
        }
    }

    if (!(current.completionWorld3) && current.frameGame==10 && (settings["option7"] || settings["option8"])) { //World 3 split
        current.completionWorld3 = true;
        return true;
    }

    if (!(current.completionBoss3) && (current.frameGame==11||(current.frameGame==29&&current.x3>2070&&current.x3<2110&&current.y3>330&&current.y3<400&&settings["option37"])) && settings["option9"]) { //Mario split
        current.completionBoss3 = true;
        return true;
    } 


    if (!(current.completionWorld4)&&settings["option11"]&&current.frameGame==11) //World 4 with single screens
    {
        current.index = 0;

        if ((current.index==0)&&(current.y3<500)&&(current.y3>485)&&(current.x>635)) {
            current.index++;
            return true;
        }
        if ((current.index==1)&&(current.y3<500)&&(current.y3>485)&&(current.x<460)) {
            current.index=0;
            return true;
        }
    }


    if (!(current.completionWorld4) && current.frameGame==12 && (settings["option10"] || settings["option11"])) { //World 4 split
        current.completionWorld4 = true;
        return true;
    }

    if (!(current.completionBoss4) && (current.frameGame==13||(current.frameGame==29&&current.x3>2370&&current.x3<2420&&current.y3>330&&current.y3<400&&settings["option37"])) && settings["option12"]) { //Biollante split
        current.completionBoss4 = true;
        return true;
    } 


    if (!(current.completionWorld5)&&settings["option14"]&&current.frameGame==13) //World 5 with single screens
    {

        if ((current.index==0)&&(current.x3>560)&&(current.x3<620)&&(current.y3<950)&&(current.y3>920)) {
            current.index++;
            return true;
        }
        if ((current.index==1)&&(current.x3>447)&&(current.x3<645)&&(current.y3<450)&&(current.y3>440)) {
            current.index++;
            return true;
        }
        if ((current.index==2)&&(current.x3>650)&&(current.x3<660)&&(current.y3<210)) {
            current.index++;
            return true;
        }
        if ((current.index==3)&&(current.x3>1290)&&(current.x3<1300)) {
            current.index++;
            return true;
        }
        if ((current.index==4)&&(current.x3>1930)&&(current.x3<1940)) {
            current.index++;
            return true;
        }
        if ((current.index==5)&&(current.x3>2570)&&(current.x3<2580)) {
            current.index++;
            return true;
        }
        if ((current.index==6)&&(current.x3>3110)&&(current.x3<3200)&&(current.y3<510)&&(current.y3>490)) {
            current.index++;
            return true;
        }
        if ((current.index==7)&&(current.x3>2520)&&(current.x3<2550)&&(current.y3<640)&&(current.y3>490)) {
            current.index++;
            return true;
        }
        if ((current.index==8)&&(current.x3>2330)&&(current.x3<2365)&&(current.y3<970)&&(current.y3>960)) {
            current.index++;
            return true;
        }
        if ((current.index==9)&&(current.x3>1890)&&(current.x3<1900)&&(current.y3>1070)) {
            current.index=0;
            return true;
        }
    }


    if (!(current.completionWorld5) && current.frameGame==14 && (settings["option13"] || settings["option14"])) { //World 5 split
        current.completionWorld5 = true;
        return true;
    }

    if (!(current.completionBoss5) && (current.frameGame==15||(current.frameGame==29&&current.x3>2420&&current.x3<2470&&current.y3>330&&current.y3<400&&settings["option37"])) && settings["option15"]) { //Sonic split
        current.completionBoss5 = true;
        return true;
    } 


    if (!(current.completionWorld6)&&settings["option17"]&&current.frameGame==15) //World 6 with single screens
    {

        if ((current.index==0)&&(current.x3>640)&&(current.x3<650)) {
            current.index++;
            return true;
        }
        if ((current.index==1)&&(current.x3>1290)&&(current.x3<1300)) {
            current.index++;
            return true;
        }
        if ((current.index==2)&&(current.x3>1920)&&(current.x3<1930)) {
            current.index++;
            return true;
        }
        if ((current.index==3)&&(current.x3>2560)&&(current.x3<2570)) {
            current.index++;
            return true;
        }
        if ((current.index==4)&&(current.x3>2890)&&(current.x3<2970)&&(current.y3<960)&&(current.y3>950)) {
            current.index++;
            return true;
        }
        if ((current.index==5)&&(current.x3>2985)&&(current.x3<3020)&&(current.y3<965)&&(current.y3>950)) {
            current.index++;
            return true;
        }
        if ((current.index==6)&&(current.x3>3200)&&(current.x3<3210)) {
            current.index++;
            return true;
        }
        if ((current.index==7)&&(current.x3>3840)&&(current.x3<3850)) {
            current.index++;
            return true;
        }
        if ((current.index==8)&&(current.x3>4480)&&(current.x3<4490)) {
            current.index++;
            return true;
        }
        if ((current.index==9)&&(current.x3>4470)&&(current.x3<4480)&&(current.y3<1030)&&(current.y3>960)) {
            current.index++;
            return true;
        }
        if ((current.index==10)&&(current.x3>4030)&&(current.x3<4300)&&(current.y3<950)&&(current.y3>930)) {
            current.index++;
            return true;
        }
        if ((current.index==11)&&(current.x3>4275)&&(current.x3<4370)&&(current.y3<460)&&(current.y3>375)) {
            current.index++;
            return true;
        }
        if ((current.index==12)&&(current.x3>4480)&&(current.x3<4490)&&(current.y3<100)) {
            current.index++;
            return true;
        }
        if ((current.index==13)&&(current.x3>5120)&&(current.x3<5130)) {
            current.index=0;
            return true;
        }
    }


    if (!(current.completionWorld6) && current.frameGame==17 && (settings["option16"] || settings["option17"])) { //World 6 split
        current.completionWorld6 = true;
        return true;
    }

    if (!(current.completionBoss6) && (current.frameGame==22||(current.frameGame==29&&current.x3>2470&&current.x3<2530&&current.y3>330&&current.y3<400&&settings["option37"])) && settings["option18"]) { //Skeleton King split
        current.completionBoss6 = true;
        return true;
    }


    if (!(current.completionWorld7)&&settings["option20"]&&(current.frameGame==22||current.frameGame==23)) //World 7 with single screens
    {

        //World 7-1

        if ((current.index==0)&&(current.x3>266)&&(current.x3<650)&&(current.y3<961)&&(current.y3>910)) {
            current.index++;
            return true;
        }
        if ((current.index==1)&&(current.x3>10)&&(current.x3<301)&&(current.y3<482)&&(current.y3>432)) {
            current.index++;
            return true;
        }
        if ((current.index==2)&&(current.x3>422)&&(current.x3<525)&&(current.y3<505)&&(current.y3>480)) {
            current.index++;
            return true;
        }
        if ((current.index==3)&&(current.x3>635)&&(current.x3<660)&&(current.y3<872)&&(current.y3>524)) {
            current.index++;
            return true;
        }
        if ((current.index==4)&&(current.x3>4490)&&(current.x3<4500)) {
            current.index++;
            return true;
        }
        if ((current.index==5)&&(current.x3>5090)&&(current.x3<5100)) {
            current.index++;
            return true;
        }
        if ((current.index==6)&&(current.x3>5770)&&(current.x3<5780)) {
            current.index++;
            return true;
        }
        if ((current.index==7)&&(current.x3>6410)&&(current.x3<6420)) {
            current.index++;
            return true;
        }
        if ((current.index==8)&&(current.x3>7040)&&(current.x3<7050)) {
            current.index++;
            return true;
        }
        if ((current.index==9)&&(current.x3>7650)&&(current.x3<7660)) {
            current.index++;
            return true;
        }
        if ((current.index==10)&&(current.x3>8310)&&(current.x3<8320)) {
            current.index++;
            return true;
        }
        if ((current.index==11)&&(current.frameGame==23)) {
            current.index++;
            return true;
        }

        //World 7-2

        if ((current.index==12)&&(current.x3>499)&&(current.x3<642)&&(current.y3<1941)&&(current.y3>1921)) {
            current.index++;
            return true;
        }
        if ((current.index==13)&&(current.x3>579)&&(current.x3<642)&&(current.y3<2426)&&(current.y3>2406)) {
            current.index++;
            return true;
        }
        if ((current.index==14)&&(current.x3>335)&&(current.x3<640)&&(current.y3<2905)&&(current.y3>2885)) {
            current.index++;
            return true;
        }
        if ((current.index==15)&&(current.x3>650)&&(current.x3<670)&&(current.y3<3225)&&(current.y3>2950)) {
            current.index++;
            return true;
        }
        if ((current.index==16)&&(current.x3>721)&&(current.x3<821)&&(current.y3<2875)&&(current.y3>2850)) {
            current.index++;
            return true;
        }
        if ((current.index==17)&&(current.x3>870)&&(current.x3<930)&&(current.y3<2900)&&(current.y3>2882)) {
            current.index++;
            return true;
        }
        if ((current.index==18)&&(current.x3>1280)&&(current.x3<1300)&&(current.y3<3035)&&(current.y3>2960)) {
            current.index++;
            return true;
        }
        if ((current.index==19)&&(current.x3>1400)&&(current.x3<1520)&&(current.y3<3375)&&(current.y3>3362)) {
            current.index++;
            return true;
        }
        if ((current.index==20)&&(current.x3>1600)&&(current.x3<1710)&&(current.y3<3350)&&(current.y3>3320)) {
            current.index++;
            return true;
        }
        if ((current.index==21)&&(current.x3>1920)&&(current.x3<1930)) {
            current.index++;
            return true;
        }
        if ((current.index==22)&&(current.x3>2560)&&(current.x3<2580)) {
            current.index=0;
            return true;
        }
    }


    if (!(current.completionWorld7) && current.frameGame==24 && (settings["option19"] || settings["option20"])) { //World 7 split
        current.completionWorld7 = true;
        return true;
    }

    if (!(current.completionBoss7) && (current.frameGame==25||(current.frameGame==29&&current.x3>1960&&current.x3<2030&&current.y3>130&&current.y3<270&&settings["option37"])) && settings["option21"]) { //Megaman split
        current.completionBoss7 = true;
        return true;
    }


    if (!(current.completionWorld8)&&settings["option23"]&&current.frameGame==25) //World 8 with single screens
    {

        if ((current.index==0)&&(current.x3>610)&&(current.x3<640)&&(current.y3<220)) {
            current.index++;
            return true;
        }
        if ((current.index==1)&&(current.x3>640)&&(current.x3<650)&&(current.y3>290)) {
            current.index++;
            return true;
        }
        if ((current.index==2)&&(current.x3>1110)&&(current.x3<1280)&&(current.y3<520)&&(current.y3>480)) {
            current.index++;
            return true;
        }
        if ((current.index==3)&&(current.x3>10)&&(current.x3<110)&&(current.y3<980)&&(current.y3>960)) {
            current.index++;
            return true;
        }
        if ((current.index==4)&&(current.x3>2060)&&(current.x3<2070)) {
            current.index++;
            return true;
        }
        if ((current.index==5)&&(current.x3>2270)&&(current.x3<2380)&&(current.y3<960)&&(current.y3>950)) {
            current.index++;
            return true;
        }
        if ((current.index==6)&&(current.x3>2560)&&(current.x3<2650)&&(current.y3<570)&&(current.y3>488)) {
            current.index++;
            return true;
        }
        if ((current.index==7)&&(current.x3>2570)&&(current.x3<2680)&&(current.y3<470)&&(current.y3>380)) {
            current.index++;
            return true;
        }
        if ((current.index==8)&&(current.x3>3200)&&(current.x3<3210)) {
            current.index++;
            return true;
        }
        if ((current.index==9)&&(current.x3>3285)&&(current.x3<3340)&&(current.y3<510)&&(current.y3>490)) {
            current.index++;
            return true;
        }
        if ((current.index==10)&&(current.x3>3180)&&(current.x3<3200)) {
            current.index++;
            return true;
        }
        if ((current.index==11)&&(current.x3>2530)&&(current.x3<2550)) {
            current.index++;
            return true;
        }
        if ((current.index==12)&&(current.x3>2410)&&(current.x3<2600)&&(current.y3<980)&&(current.y3>960)) {
            current.index++;
            return true;
        }
        if ((current.index==13)&&(current.x3>2560)&&(current.x3<2570)&&(current.y3<1250)&&(current.y3>1150)) {
            current.index++;
            return true;
        }
        if ((current.index==14)&&(current.x3>3210)&&(current.x3<3220)) {
            current.index++;
            return true;
        }
        if ((current.index==15)&&(current.x3>3860)&&(current.x3<3870)) {
            current.index=0;
            return true;
        }
    }


    if (!(current.completionWorld8) && current.frameGame==26 && (settings["option22"] || settings["option23"])) { //World 8 split
        current.completionWorld8 = true;
        return true;
    }

    if (!(current.completionBoss8) && (current.frameGame==27||(current.frameGame==29&&current.x3>2030&&current.x3<2100&&current.y3>130&&current.y3<270&&settings["option37"])) && settings["option24"]) { //Shang Tsung split
        current.completionBoss8 = true;
        return true;
    }


    if (!(current.completionWorld9)&&settings["option26"]&&current.frameGame==27) //World 9 with single screens
    {

        if ((current.index==0)&&(current.y0<8170)&&(current.y0>8160)) {
            current.index++;
            return true;
        }
        if ((current.index==1)&&(current.y0<7690)&&(current.y0>7680)) {
            current.index++;
            return true;
        }
        if ((current.index==2)&&(current.y0<7210)&&(current.y0>7200)) {
            current.index++;
            return true;
        }
        if ((current.index==3)&&(current.y0<6710)&&(current.y0>6700)) {
            current.index++;
            return true;
        }
        if ((current.index==4)&&(current.x0>1290)&&(current.x0<1300)) {
            current.index++;
            return true;
        }
        if ((current.index==5)&&(current.x0>1930)&&(current.x0<1940)) {
            current.index++;
            return true;
        }
        if ((current.index==6)&&(current.x0>2570)&&(current.x0<2580)) {
            current.index++;
            return true;
        }
        if ((current.index==7)&&(current.x0>3210)&&(current.x0<3220)) {
            current.index++;
            return true;
        }
        if ((current.index==8)&&(current.x0>3230)&&(current.x0<3365)&&(current.y0<6740)&&(current.y0>6730)) {
            current.index++;
            return true;
        }
        if ((current.index==9)&&(current.x0>3580)&&(current.x0<3670)&&(current.y0<6710)&&(current.y0>6700)) {
            current.index=0;
            return true;
        }
    }


    if (!(current.completionWorld9) && current.frameGame==59 && (settings["option25"] || settings["option26"])) { //World 9 split 
        current.completionWorld9 = true;
        return true;
    }

    if (!(current.completionBoss9) && (current.frameGame==31||(current.frameGame==29&&current.x3>2390&&current.x3<2450&&current.y3>130&&current.y3<270&&settings["option37"])) && settings["option27"]) { //Ganon split
        current.completionBoss9 = true;
        return true;
    }


    if (!(current.completionWorld10)&&settings["option29"]&&current.frameGame==31) //World 10 with single screens
    {

        if ((current.index==0)&&(current.x4>650)&&(current.x4<670)) {
            current.index++;
            return true; 
        }
        if ((current.index==1)&&(current.x4>1290)&&(current.x4<1306)) {
            current.index++;
            return true; 
        }
        if ((current.index==2)&&(current.x4>1930)&&(current.x4<1940)) {
            current.index++;
            return true; 
        }
        if ((current.index==3)&&(current.x4>2570)&&(current.x4<2580)) {
            current.index++;
            return true; 
        }
        if ((current.index==4)&&(current.x4>3210)&&(current.x4<3220)) {
            current.index++;
            return true; 
        }
        if ((current.index==5)&&(current.x4>3850)&&(current.x4<3860)) {
            current.index++;
            return true; 
        }
        if ((current.index==6)&&(current.x4>4490)&&(current.x4<4500)) {
            current.index++;
            return true; 
        }
        if ((current.index==7)&&(current.x4>5130)&&(current.x4<5140)) {
            current.index++;
            return true; 
        }
        if ((current.index==8)&&(current.x4>5770)&&(current.x4<5786)) {
            current.index++;
            return true; 
        }
        if ((current.index==9)&&(current.x4>6410)&&(current.x4<6426)) {
            current.index++;
            return true; 
        }
        if ((current.index==10)&&(current.x4>7050)&&(current.x4<7066)) {
            current.index++;
            return true; 
        }
        if ((current.index==11)&&(current.x4>7690)&&(current.x4<7706)) {
            current.index++;
            return true; 
        }
        if ((current.index==12)&&(current.x4>8330)&&(current.x4<8340)) {
            current.index++;
            return true; 
        }
        if ((current.index==13)&&(current.x4>8970)&&(current.x4<8986)) {
            current.index++;
            return true; 
        }
        if ((current.index==14)&&(current.x4>9564)&&(current.x4<9580)&&(current.y4<1230)&&(current.y4>1010)) {
            current.index++;
            return true; 
        }
        if ((current.index==15)&&(current.x4>8940)&&(current.x4<8950)) {
            current.index=0;
            return true; 
        }
    }


    if (!(current.completionWorld10) && current.frameGame==32 && (settings["option28"] || settings["option29"])) { //World 10 split 
        current.completionWorld10 = true;
        return true;
    }

    if (!(current.completionBoss10) && (current.frameGame==35||(current.frameGame==29&&current.x3>2450&&current.x3<2530&&current.y3>130&&current.y3<270&&settings["option37"])) && settings["option30"]) { //Missingno split
        current.completionBoss10 = true;
        return true;
    }


    if (!(current.completionWorld11)&&settings["option32"]&&current.frameGame==35) //World 11 with single screens
    {

        if ((current.index==0)&&(current.x3>650)&&(current.x3<660)) {
            current.index++;
            return true;
        }
        if ((current.index==1)&&(current.cobrat_x>1290)&&(current.cobrat_x<1300)) {
            current.index++;
            return true;
        }
        if ((current.index==2)&&(current.cobrat_x>1930)&&(current.cobrat_x<1950)) {
            current.index++;
            return true;
        }
        if ((current.index==3)&&(current.cobrat_x>2570)&&(current.cobrat_x<2590)) {
            current.index++;
            return true;
        }
        if ((current.index==4)&&(current.cobrat_x>3210)&&(current.cobrat_x<3230)) {
            current.index++;
            return true;
        }
        if ((current.index==5)&&(current.x3>3850)&&(current.x3<3870)) {
            current.index++;
            return true;
        }
        if ((current.index==6)&&(current.x3>4500)&&(current.x3<4520)) {
            current.index++;
            return true;
        }
        if ((current.index==7)&&(current.x3>5130)&&(current.x3<5150)) {
            current.index++;
            return true;
        }
        if ((current.index==8)&&(current.x3>5770)&&(current.x3<5790)) {
            current.index++;
            return true;
        }
        if ((current.index==9)&&(current.x3>6410)&&(current.x3<6430)) {
            current.index++;
            return true;
        }
        if ((current.index==10)&&(current.x3>6420)&&(current.x3<6765)&&(current.y3<470)&&(current.y3>450)) {
            current.index++;
            return true;
        }
        if ((current.index==11)&&(current.x3>6960)&&(current.x3<7030)&&(current.y3<510)&&(current.y3>495)) {
            current.index++;
            return true;
        }
        if ((current.index==12)&&(current.x3>7055)&&(current.x3<7075)&&(current.y3<650)&&(current.y3>520)) {
            current.index++;
            return true;
        }
        if ((current.index==13)&&(current.x3>7760)&&(current.x3<7770)) {
            current.index=0;
            return true;
        }
    }


    if (!(current.completionWorld11) && current.frameGame==38 && (settings["option31"] || settings["option32"])) { //World 11 split 
        current.completionWorld11 = true;
        return true;
    }

    if (!(current.completionBoss11) && (current.frameGame==47||(current.frameGame==29&&current.x3>2200&&current.x3<2270&&current.y3>0&&current.y3<190&&settings["option37"])) && settings["option33"]) { //Solgryn split
        current.completionBoss11 = true;
        return true;
    }

}
