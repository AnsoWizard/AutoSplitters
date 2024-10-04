state("I Wanna Be The Boshy")
{
	int frameGame : 0x59A94, 0x268, 0xA8;
}

start
{
	if (current.frameGame == 36) {
		return true;
	}
}

split
{
	var index = timer.CurrentSplitIndex; 

	if ((index == 0 && current.frameGame == 4) ||	//World 1
	(index == 1 && current.frameGame == 5) ||		//Hello Kitty
	(index == 2 && current.frameGame == 6) ||		//World 2
	(index == 3 && current.frameGame == 8) ||		//Ryu
	(index == 4 && current.frameGame == 10) ||		//World 3
	(index == 5 && current.frameGame == 11) ||		//Mario
	(index == 6 && current.frameGame == 12) ||		//World 4
	(index == 7 && current.frameGame == 13) ||		//Biollante
	(index == 8 && current.frameGame == 14) ||		//World 5
	(index == 9 && current.frameGame == 15) ||		//Sonic
	(index == 10 && current.frameGame == 17) ||		//World 6
	(index == 11 && current.frameGame == 22) ||		//Skeleton King
	(index == 12 && current.frameGame == 24) ||		//World 7
	(index == 13 && current.frameGame == 25) ||		//Megaman
	(index == 14 && current.frameGame == 26) ||		//World 8
	(index == 15 && current.frameGame == 27) ||		//Shang Tsung
	(index == 16 && current.frameGame == 59) ||		//World 9
	(index == 17 && current.frameGame == 31) ||		//Ganon
	(index == 18 && current.frameGame == 32) ||		//World 10
	(index == 19 && current.frameGame == 35) ||		//Missingno
	(index == 20 && current.frameGame == 38) ||		//World 11
	(index == 21 && current.frameGame == 47)) {		//Solgryn
		return true;
	}
}

reset
{
	if (current.frameGame == 1) {
		return true;
	}
}