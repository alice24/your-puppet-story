//THIS CODE IS INTENDED TO BE COPIED ONTO FRAME 4 OF THE FLA FILE
stop();

trace("I'm frame 4!");

scenesToSelect = numScenes;
currScene = 1;
currSel = 1;
minScene = 1;
maxScene = 3;

bg.gotoAndStop(1);
bg.alpha = 0;
leftBtn.alpha = 0;
rightBtn.alpha = 0;

promptBox.text = "Backdrop for Scene:" + currSel + "?";
promptBox.alpha = 0;

function showSceneSel(evnt:Event):void{
	if (curtain.curtainA.x >= -251){
		bg.alpha = 1;
		curtain.gotoAndPlay(2);
		pullSound.play();
		promptBox.alpha = 1;
	}
	
	if (curtain.curtainA.x <= -688){
		rightBtn.alpha = 1;
		stage.addEventListener(KeyboardEvent.KEY_DOWN, toggleBackdrops);
		stage.removeEventListener(Event.ENTER_FRAME,showSceneSel);
	}
}

function toggleBackdrops(event:KeyboardEvent):void 
{ 
	switch(event.keyCode) {
		case 37:
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
		case 39:
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
		case 76:
			mainScenes.push(currScene);
			currSel ++;
			promptBox.text = "Backdrop for Scene:" + currSel + "?";

			if (currSel > scenesToSelect){
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, toggleBackdrops);
				curtain.gotoAndPlay(21);
				pullSound.play();
				nextFrame();
			}
			clickSound.play();
			break;
		default:
			trace("n/a");
			break;
	}
}

stage.addEventListener(Event.ENTER_FRAME,showSceneSel);
