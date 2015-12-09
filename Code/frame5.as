//THIS CODE IS INTENDED TO BE COPIED ONTO FRAME 5 OF THE FLA FILE
stop();

trace("I'm the confirmation page!")

confirmBox.alpha = 0;
okBtn.alpha = 0;
noBtn.alpha = 0;
counter = 0;

function showConfirm(evnt:Event):void{
	if (curtain.curtainA.x >= -251){
		curtain.gotoAndPlay(2);
		pullSound.play();
	}

	if (curtain.curtainA.x <= -688){
		confirmBox.alpha += 0.05;
	}
	
	if (confirmBox.alpha >= 1){
		stage.removeEventListener(Event.ENTER_FRAME,showConfirm);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, confirm);
			
		okBtn.alpha = 1;
		noBtn.alpha = 1;
	}
}	


function goForth(evnt:Event):void{
	counter ++;
	if (counter == 5){
		confirmBox.text = "Let's start the show!";
		okBtn.alpha = 0;
		noBtn.alpha = 0;		
	}	
	
	if (counter > 30){
		confirmBox.alpha -= 0.05;
	}
	
	if (confirmBox.alpha <= 0){
		stage.removeEventListener(Event.ENTER_FRAME,goForth);
		nextFrame();
	}
}

function redo(evnt:Event):void{
	counter ++;
	if (counter == 5){
		confirmBox.text = "Let's start over!";
		okBtn.alpha = 0;
		noBtn.alpha = 0;		
	}
	
	if (counter > 30){
		confirmBox.alpha -= 0.05;
	}
	
	if (confirmBox.alpha <= 0){
		stage.removeEventListener(Event.ENTER_FRAME,redo);
		curtain.gotoAndPlay(21);
		gotoAndStop(3);
	}
}
			


function confirm(event:KeyboardEvent):void { 
	switch(event.keyCode){
		case 76:
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,confirm);
			okBtn.gotoAndPlay(2);
			clickSound.play();
			stage.addEventListener(Event.ENTER_FRAME,goForth);
			break;
		case 75:
			numScenes = 0;
			mainScenes.length = 0;
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,confirm);
			noBtn.gotoAndPlay(2);
			clickSound.play();
			stage.addEventListener(Event.ENTER_FRAME,redo);
			break;
		default:
			break;
	}
}

stage.addEventListener(Event.ENTER_FRAME,showConfirm);