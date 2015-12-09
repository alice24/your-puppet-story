//THIS CODE IS INTENDED TO BE COPIED ONTO FRAME 6 OF THE FLA FILE
stop();

curtain.gotoAndPlay(21);
pullSound.play();

function close(evnt:Event):void{
		myTransform.volume -= 0.005;
		myChannel.soundTransform = myTransform;

	if ((curtain.curtainA.x >= -251) && (myTransform.volume <= 0)){
		soundPlaying == false;
		myChannel.stop();
		stage.removeEventListener(Event.ENTER_FRAME,close);
		nextFrame();
	}
}

stage.addEventListener(Event.ENTER_FRAME,close);