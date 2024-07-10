state("HelloNeighbor-Win64-Shipping")
{
	int missionNumber: 0x02D7DB58, 0xF8, 0x70, 0x260;
	int newGame: 0x02C1B640, 0x900, 0x7D8;
	bool IsPlaying: 0x02D98D30, 0x20, 0x3C8;
}

init
{
	vars.split = 0;
}

start
{
    if(current.missionNumber == 22){
		vars.split = 0;
	    return true;
	}
}

split
{
     if((current.missionNumber == 37 && old.missionNumber != 37 && vars.split == 0) || 
	 (current.missionNumber == 94 && old.missionNumber != 94 && vars.split == 1) || 
	 (current.missionNumber == 436 && old.missionNumber != 436 && vars.split == 2) || 
	 (current.missionNumber == 911 && old.missionNumber != 911 && vars.split == 3) || 
	 (current.missionNumber == 5553 && old.missionNumber != 5553 && vars.split == 4) || 
	 (current.missionNumber == 747 && old.missionNumber != 747 && vars.split == 5)){
		vars.split++;
	    return true;
     }
}

reset
{
     if(current.newGame == 3){
	    return true;
	 }	 
}

isLoading
{
	return !current.IsPlaying;
}

