//THIS CODE IS INTENDED TO BE COPIED ONTO FRAME 3 OF THE FLA FILE
stop();

//these variables are the minimum, maximum, and the current # of scenes the user may select
minNum = 1; //minimum number of scenes they can select
currNum = 3; //the current number that they are viewing (also the first number they see)
maxNum = 9; //maximum number of scenes they can select

numBox.text = currNum.toString(); //this dynamic textbox is already on screen- put the first number inside
promptBox.text = "How many scenes?"; // a subtitle to show the prompt

//hide both boxes at first
promptBox.alpha = 0;
numBox.alpha = 0;

//and hide the buttons
leftBtn.alpha = 0;
rightBtn.alpha = 0;

//this is a function to control what displays depending on where the curtain is
//recall that it always checks for the curtain's X position to decide which transition it has finished
function showNumSel(evnt:Event):void{

	//if the curtain has just closed (from the previous frame)
	//open it up again
	if (curtain.curtainA.x >= -251){
		curtain.gotoAndPlay(2);
		pullSound.play();
	}

	//if the curtain has opened from the previous if statement, then start fading in the two textboxes
	if (curtain.curtainA.x <= -688){
		promptBox.alpha += 0.05;
		numBox.alpha += 0.05;
	}

	//if both textboxes have appeared, remove the frame loop, add the keyboardEvent (for the controller)
	//and show the buttons
	if ((promptBox.alpha >= 1) && (numBox.alpha >= 1)){
		stage.removeEventListener(Event.ENTER_FRAME,showNumSel);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, toggleScenes);

		leftBtn.alpha = 1;
		rightBtn.alpha = 1;
	}
}

//let user pick how many scenes they want
function toggleScenes(event:KeyboardEvent):void
{
	switch(event.keyCode) {
		case 37://left arrow

			//if we shift left, we subtract one from the current frame #
			//if that doesn't become less than the minimum number of scenes we allow the user to do it
			if ((currNum - 1) >= minNum){
				currNum --;
				leftBtn.gotoAndPlay(2);
				numBox.text = currNum.toString();
				rightBtn.alpha = 1; //this code makes sure to unhide the arrow if it happens to be hidden (see below)
				clickSound.play();
			}

			//if after we subtract we realize that the current scene # is now the minimum (meaning they can't go lower)
			// we hide the button so they can't think that they can keep clicking
			if (currNum == minNum) {
				leftBtn.alpha = 0;
			}
			break;
		case 39: //right arrow
			//this is exactly the same but for the maximum/right arrow
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
		case 76://L
			numScenes = currNum; //set the chosen scene to the number of scense for the show

			//remove the event listener
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, toggleScenes);

			//close the curtain
			curtain.gotoAndPlay(21);
			pullSound.play();
			clickSound.play();
			nextFrame();
			break;
	}
}

stage.addEventListener(Event.ENTER_FRAME,showNumSel);
