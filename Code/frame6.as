//THIS CODE IS INTENDED TO BE COPIED ONTO FRAME 6 OF THE FLA FILE
stop();

//this frame is just for closing the curtain. You can actually omit it but it works either way.
curtain.gotoAndPlay(21);
pullSound.play();

function close(evnt:Event):void{
		//remember the menu music from frame one? if it's still playing, fade it out now (smooth transition)
		myTransform.volume -= 0.005;
		myChannel.soundTransform = myTransform;

	//if the curtain is closed and the volume is 0
	if ((curtain.curtainA.x >= -251) && (myTransform.volume <= 0)){
		//stop the music
		soundPlaying == false;
		myChannel.stop();
		stage.removeEventListener(Event.ENTER_FRAME,close);
		nextFrame();
	}
}

stage.addEventListener(Event.ENTER_FRAME,close);
