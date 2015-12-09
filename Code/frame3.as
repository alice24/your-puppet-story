//THIS CODE IS INTENDED TO BE COPIED ONTO FRAME 3 OF THE FLA FILE
stop();

trace("Im frame 3");

minNum = 1;
currNum = 3;
maxNum = 9;

numBox.text = currNum.toString();
promptBox.text = "How many scenes?";
promptBox.alpha = 0;
numBox.alpha = 0;

leftBtn.alpha = 0;
rightBtn.alpha = 0;

function showNumSel(evnt:Event):void{
	if (curtain.curtainA.x >= -251){
		curtain.gotoAndPlay(2);
		pullSound.play();
	}

	if (curtain.curtainA.x <= -688){
		promptBox.alpha += 0.05;
		numBox.alpha += 0.05;
	}
	
	if ((promptBox.alpha >= 1) && (numBox.alpha >= 1)){
		stage.removeEventListener(Event.ENTER_FRAME,showNumSel);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, toggleScenes);
			
		leftBtn.alpha = 1;
		rightBtn.alpha = 1;
	}
}	

function toggleScenes(event:KeyboardEvent):void 
{ 
	switch(event.keyCode) {
		case 37:
			if ((currNum - 1) >= minNum){
				currNum --;
				leftBtn.gotoAndPlay(2);
				numBox.text = currNum.toString();
				rightBtn.alpha = 1;
				clickSound.play();
			}
			if (currNum == minNum) {
				leftBtn.alpha = 0;
			}
			break;
		case 39:
			if ((currNum + 1) <= maxNum){
				currNum ++;
				rightBtn.gotoAndPlay(2);
				numBox.text = currNum.toString();
				leftBtn.alpha = 1;
				clickSound.play();
			}
			if (currNum == maxNum) {
				rightBtn.alpha = 0;
			}
			break;
		case 76:
			numScenes = currNum;
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, toggleScenes);
			curtain.gotoAndPlay(21);
			pullSound.play();
			clickSound.play();
			nextFrame();
			break;
		default:
			trace("n/a");
			break;
	}
}

stage.addEventListener(Event.ENTER_FRAME,showNumSel);