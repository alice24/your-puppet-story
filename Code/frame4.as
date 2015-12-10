//THIS CODE IS INTENDED TO BE COPIED ONTO FRAME 4 OF THE FLA FILE
stop();

//the number from the previous frame is used to determine how many backgrounds need to be chosen
scenesToSelect = numScenes;

//like before, these three variables determine what the user can pick
//I have 3 backgrounds, increase the max number if more/less exist
currScene = 1;
minScene = 1;
maxScene = 3;

//this counter keeps track of how many backdrops the user has chosen
currSel = 1;


//as before we first hide everything
bg.gotoAndStop(1);
bg.alpha = 0;
leftBtn.alpha = 0;
rightBtn.alpha = 0;

promptBox.text = "Backdrop for Scene:" + currSel + "?";
promptBox.alpha = 0;

//and if the curtain is done opening we show it
function showSceneSel(evnt:Event):void{
	//the background and prompt actually appears when the curtain is closed so it
	//can appear to be behind the curtain when it opens
	if (curtain.curtainA.x >= -251){
		bg.alpha = 1;
		curtain.gotoAndPlay(2);
		pullSound.play();
		promptBox.alpha = 1;
	}

	if (curtain.curtainA.x <= -688){
		//this time we only add one button to be visible at first because they are on the first background (min)
		rightBtn.alpha = 1;
		stage.addEventListener(KeyboardEvent.KEY_DOWN, toggleBackdrops);
		stage.removeEventListener(Event.ENTER_FRAME,showSceneSel);
	}
}


//Similar to the previous function for selecting the number of scenes, this
//just allows the user to toggle behind backdrops and choose one
function toggleBackdrops(event:KeyboardEvent):void
{
	switch(event.keyCode) {
		case 37://left arrow
			if ((currScene - 1) >= minScene){
				currScene --;
				bg.gotoAndStop(currScene);
				leftBtn.gotoAndPlay(2);
				rightBtn.alpha = 1;
				clickSound.play();
			}
			if (currScene == minScene) {
				leftBtn.alpha = 0;
			}
			break;
		case 39://right arrow
			if ((currScene + 1) <= maxScene){
				currScene ++;
				bg.gotoAndStop(currScene);
				rightBtn.gotoAndPlay(2);
				leftBtn.alpha = 1;
				clickSound.play();
			}
			if (currScene == maxScene) {
				rightBtn.alpha = 0;
			}
			break;
		case 76://L
			mainScenes.push(currScene);
			currSel ++;
			promptBox.text = "Backdrop for Scene:" + currSel + "?";

			//if they've finished selecting scenes, go to the next frame
			if (currSel > scenesToSelect){
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, toggleBackdrops);
				curtain.gotoAndPlay(21);
				pullSound.play();
				nextFrame();
			}
			clickSound.play();
			break;
	}
}

stage.addEventListener(Event.ENTER_FRAME,showSceneSel);
