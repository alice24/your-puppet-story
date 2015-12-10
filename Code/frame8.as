//THIS CODE IS INTENDED TO BE COPIED ONTO FRAME 8 OF THE FLA FILE
stop();

//start playing the menu music again
myChannel = menuSound.play();
myTransform.volume = 0.1;
myChannel.soundTransform = myTransform;
soundPlaying = true;

clapping.play();

//hide everything in order to fade it in, like before
endBox.alpha = 0;
restartBox.alpha = 0;
okBtn.alpha = 0;
endBox.text = "THE END!";

//delay once again to show the button animation on the restart (GO) button
counter = 0;

function end(evnt:Event):void{
	if (curtain.curtainA.x >= -251){
		endBox.alpha += 0.05;
		if (endBox.alpha >= 1){
			stage.removeEventListener(Event.ENTER_FRAME,end);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, restart);
			okBtn.alpha = 1;
			restartBox.alpha = 1;
		}
	}
}

//brief pause to show button animation 
function pause(evnt:Event):void{
	counter++;
	if (counter > 10){
		gotoAndPlay(1);
		stage.removeEventListener(Event.ENTER_FRAME,pause);
	}
}

function restart(event:KeyboardEvent):void {
	switch(event.keyCode){
		case 76:
			clickSound.play();
			okBtn.gotoAndPlay(2);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, restart);

			//resets the number of scenes
			numScenes = 0;
			stage.addEventListener(Event.ENTER_FRAME,pause);
			break;
	}
}
stage.addEventListener(Event.ENTER_FRAME,end);
