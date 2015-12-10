//THIS CODE IS INTENDED TO BE COPIED ONTO FRAME 2 OF THE FLA FILE
stop();

//We want to fade in the logo so we hide it first.
logo.alpha = 0;

//this counter is used to
//make sure that the logo's opacity stops increasing once it's reached 1
//delay the transition to the next frame to see the button animation (see below)
counter = 0;

//this frame loop fades the logo in
function showLogo(evnt:Event):void{
	//if the curtain is open, start fading the logo in
	if ((curtain.curtainA.x == -688)&&(logo.alpha < 1)){
		logo.alpha += 0.05;
	}

	//if the logo is totally visible (100% opacity) then add the keyboardEvent function
	//which allows the user to progress
	if ((logo.alpha >= 1)&&(counter == 0)){
		counter ++;
		stage.addEventListener(KeyboardEvent.KEY_DOWN, start);
	}

	//if the curtain is pulled again, this check will see if the curtain has fully closed
	//(the x position of a closed curtain is -251)
	//if so, remove the final frame loop and go to the next frame
	if (curtain.curtainA.x >= -251){
		stage.removeEventListener(Event.ENTER_FRAME,showLogo);
		nextFrame();
	}
}

//clicking "GO" on the controller will trigger this function which is the
//method of accessing the next frame
function start(event:KeyboardEvent):void {
	if (event.keyCode==76){//this is mapped to the L key but it can be any
			//remove this event listener
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, start);

			//yet another frame loop that will delay the transition to curtain close a bit
			stage.addEventListener(Event.ENTER_FRAME,delayThree);

			//in order to show this button's animation (a click motion)
			okBtn.gotoAndPlay(2);

			//play the sound associated with the button (a click)
			clickSound.play();
	}
}

//delay the transition a little bit just so it looks more smooth
function delayThree(evnt:Event):void{
	counter ++;

	if (counter > 20){
		//once the delay is done, remove this frame loop
		stage.removeEventListener(Event.ENTER_FRAME,delayThree);

		//pull the curtain
		curtain.gotoAndPlay(21);
		pullSound.play();
	}
}

stage.addEventListener(Event.ENTER_FRAME,showLogo);
