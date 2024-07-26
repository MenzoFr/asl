state("HelloNeighbor-Win64-Shipping")
{
	int missionNumber: 0x02D7DB58, 0xF8, 0x70, 0x260;
	int menuStatus: 0x02C1B640, 0x900, 0x7D8;
	int loadStatus: 0x02D98D30, 0x20, 0x3C8;
	int startStatus: 0x02D5D618, 0xF8, 0x2C0, 0x630, 0x8E8;
	bool IsLoading: 0x02D98D30, 0x20, 0x3C8;
}

init
{
	vars.split = 0;
}

startup
{
	if (timer.CurrentTimingMethod == TimingMethod.RealTime)
	{
		var mbox = MessageBox.Show(
			"In order to remove the loads, you need to switch to Game Time as a timing method.\nWould you like to switch?",
			"LiveSplit | Hello Neighbor",
			MessageBoxButtons.YesNo);

		if (mbox == DialogResult.Yes)
			timer.CurrentTimingMethod = TimingMethod.GameTime;
	}
}

start
{
    if(current.startStatus == 1071877691 && current.menuStatus != 3 && current.loadStatus == 1){
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
	 (current.missionNumber == 747 && old.missionNumber != 747 && vars.split == 5) ||
	 (current.missionNumber == 3 && old.missionNumber != 3 &&
	 vars.split == 6)){
		vars.split++;
	    return true;
     }
}

reset
{
     if(current.menuStatus == 3 && old.menuStatus != 3){
	    return true;
	}	 
}

isLoading
{
	return !current.IsLoading;
}

