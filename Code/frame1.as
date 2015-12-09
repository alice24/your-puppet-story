//THIS CODE IS INTENDED TO BE COPIED ONTO FRAME 1 OF THE FLA FILE
stop();

if (soundPlaying == false){
	soundPlaying == true;
	myChannel = menuSound.play();
	myTransform.volume = 0.1;
	myChannel.soundTransform = myTransform;
}
curtain.gotoAndPlay(2);
pullSound.play();

function open(evnt:Event):void{
	if (curtain.curtainA.x == -688){
		stage.removeEventListener(Event.ENTER_FRAME,open);
		nextFrame();
	}
}

stage.addEventListener(Event.ENTER_FRAME,open);