//THIS CODE IS INTENDED TO BE COPIED ONTO FRAME 5 OF THE FLA FILE
stop();

//hide all the on screen text
confirmBox.alpha = 0;
okBtn.alpha = 0;
noBtn.alpha = 0;

//this counter is also used for delay
counter = 0;

//same as before
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

//if the user says OK (that everything is correct) we continue to the show
function goForth(evnt:Event):void{

	//increment counter in this frame loop to delay (in order to make it more smooth/show btn animation)
	counter ++;
	if (counter == 5){
		//display this text after a few moments
		confirmBox.text = "Let's start the show!";
		okBtn.alpha = 0;
		noBtn.alpha = 0;
	}

	if (counter > 30){
		//fade the previous text out after allowing it to show for a while
		confirmBox.alpha -= 0.05;
	}

	if (confirmBox.alpha <= 0){
		//remove the frame loop and go to the next frame
		stage.removeEventListener(Event.ENTER_FRAME,goForth);
		nextFrame();
	}
}

//if they AREN'T HAPPY and want to change
function redo(evnt:Event):void{
	counter ++;
	if (counter == 5){
		//display a different text
		confirmBox.text = "Let's start over!";
		okBtn.alpha = 0;
		noBtn.alpha = 0;
	}

	if (counter > 30){
		confirmBox.alpha -= 0.05;
	}

	//return to frame 3 which is where the first selection was made, and do it again
	if (confirmBox.alpha <= 0){
		stage.removeEventListener(Event.ENTER_FRAME,redo);
		curtain.gotoAndPlay(21);
		gotoAndStop(3);
	}
}


//this is the keyboard event so they can pick redo or go
function confirm(event:KeyboardEvent):void {
	switch(event.keyCode){
		case 76:
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,confirm);
			okBtn.gotoAndPlay(2);
			clickSound.play();

			//start the start show to next frame loop
			stage.addEventListener(Event.ENTER_FRAME,goForth);
			break;
		case 75:
			//clear the values chosen
			numScenes = 0;
			mainScenes.length = 0;
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,confirm);
			noBtn.gotoAndPlay(2);
			clickSound.play();

			//start the redo selection loop
			stage.addEventListener(Event.ENTER_FRAME,redo);
			break;
	}
}

stage.addEventListener(Event.ENTER_FRAME,showConfirm);
