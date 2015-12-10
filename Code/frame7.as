//THIS CODE IS INTENDED TO BE COPIED ONTO FRAME 7 OF THE FLA FILE
stop();

//this array contains both characters; you can add more here if you have 3+.
characters = new Array(p1,p2);

//this is who is selected by default (Blue, the puppet on the left)
p1sel = characters[0];

//The two characters' starting positions
p1.x = -101.5;
p1.y = 491.1;

p2.x = 1107.5;
p2.y = 491.1;

//this property is for whether or not they're above the stage (false = ducked under)
p1.onStage = true;
p2.onStage = true;

//this property is for whether or not they're walking
p1.walkingLeft = false;
p1.walkingRight = false;

p2.walkingLeft = false;
p2.walkingRight = false;

soundPlaying = false;

//this stops them from bouncing up and down (passive motion)
p1.whole.stop();
p2.whole.stop();
curtain.stop();

//this function controls all the puppet movements
function move(evnt:Event):void{
	//anything marked double means that they're moving together
	if (double){
		if (p1sel.walkingLeft){
			p1.x -= 5;
			p2.x -= 5;
			p1.scaleX = 1;
			p2.scaleX = 1;

			//plays a bounce animation when they move (nested)
			p1.whole.play();
			p2.whole.play();
		}
		else if (p1sel.walkingRight){
			p1.x += 5;
			p2.x += 5;

			//both puppets initially face left (their right) so when they
			//move right we must flip them horizontally
			p1.scaleX = -1;
			p2.scaleX = -1;
			p1.whole.play();
			p2.whole.play();
		}
	}
	//it's the same for individuals, except only the one puppet is walking
	else{
		if (p1sel.walkingLeft){
			p1sel.x -= 5;
			p1sel.scaleX = 1;
			p1sel.whole.play();
		}
		else if (p1sel.walkingRight){
			p1sel.x += 5;
			p1sel.scaleX = -1;
			p1sel.whole.play();
		}
	}
}

//key up just stops the characters from walking and bouncing
function reportKeyUp(event:KeyboardEvent):void
{
	switch(event.keyCode){
		case 37:
			if (double){
				p1.walkingLeft = false;
				p2.walkingLeft = false;
				p1.whole.stop();
				p2.whole.stop();
			}
			else{
				p1sel.walkingLeft = false;
				p1sel.whole.stop();
			}
			break;
		case 39:
			if (double){
				p1.walkingRight = false;
				p2.walkingRight = false;
				p1.whole.stop();
				p2.whole.stop();
			}
			else{
				p1sel.walkingRight = false;
				p1sel.whole.stop();
			}
			break;
	}
}


//this toggles all the commands on the controller besides movements
//any keycodes work, these are just the ones I used
function reportKeyDown(event:KeyboardEvent):void {
	switch(event.keyCode) {
		case 90: //z ; plays a dramatic sound
			dramaticSound.play();
			break;

		case 88: //x ; plays a typical tune (happy)
			myChannel.stop();
			myChannel = neutralSound.play();
			myTransform.volume = 0.1; // all music gets its volume lowered
			myChannel.soundTransform = myTransform;
			soundPlaying = true;
			break;

		case 67: //c ; plays a sad song for sad moments
			myChannel.stop();
			myChannel = sadSound.play();
			myTransform.volume = 0.1;
			myChannel.soundTransform = myTransform;
			soundPlaying = true;
			break;

		case 86: //v ; plays an unsettling tune for strange atmospheres
			myChannel.stop();
			myChannel = creepySound.play();
			myTransform.volume = 0.1;
			myChannel.soundTransform = myTransform;
			soundPlaying = true;
			break;

		case 75: //o ; if there is a sound playing, fade it out and stop it with a separate function (below)
			if (soundPlaying == true){
				stage.addEventListener(Event.ENTER_FRAME,fadeSound);
			}
			break;

		case 81: //q ; toggle the curtain; if it's open, close it, and vice versa
			if (curtainOpen){
				curtainOpen = false;
				curtain.gotoAndPlay(21);

				// while the curtain is moving, do not allow characters to move
				// the main purpose is actually to allow the curtain to close all the way before anything else happens
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, reportKeyDown);
				stage.removeEventListener(KeyboardEvent.KEY_UP, reportKeyUp);
				stage.removeEventListener(Event.ENTER_FRAME,move);

				//if the sound is playing, then fade it out (scene done)
				if (soundPlaying == true){
					stage.addEventListener(Event.ENTER_FRAME,fadeSound);
					if (mainScenes.length > 0){
						// if the show isn't done, run the curtainPull function
						stage.addEventListener(Event.ENTER_FRAME,curtainPull);
					}
				}

				else {
					if (mainScenes.length > 0){
						stage.addEventListener(Event.ENTER_FRAME,curtainPull);
					}
					else{
						//otherwise, go to the next frame
						nextFrame();
					}
				}
			}
			else{
				curtainOpen = true;
				curtain.gotoAndPlay(2);
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, reportKeyDown);
				stage.removeEventListener(KeyboardEvent.KEY_UP, reportKeyUp);
				stage.removeEventListener(Event.ENTER_FRAME,move);
				stage.addEventListener(Event.ENTER_FRAME,curtainPull);

				//display the first scene
				bg.gotoAndStop(mainScenes[0]);

				//then remove it from the array, because we are done with it
				mainScenes.shift();
			}
			pullSound.play();
			break;

		//these are for expressions
		case 87://w ; happy face
			if (double){
				p1.whole.whole2.face.gotoAndStop(1);
				p2.whole.whole2.face.gotoAndStop(1);
			}
			else{
				p1sel.whole.whole2.face.gotoAndStop(1);
			}
			break;

		case 65: //a ; sad face
			if (double){
				p1.whole.whole2.face.gotoAndStop(5);
				p2.whole.whole2.face.gotoAndStop(5);
			}
			else{
				p1sel.whole.whole2.face.gotoAndStop(5);
			}
			break;

		case 83: //s ; shocked face
			if (double){
				p1.whole.whole2.face.gotoAndStop(10);
				p2.whole.whole2.face.gotoAndStop(10);
			}
			else{
				p1sel.whole.whole2.face.gotoAndStop(10);
			}
			break;

		case 68: //d ; angry face
			if (double){
				p1.whole.whole2.face.gotoAndStop(15);
				p2.whole.whole2.face.gotoAndStop(15);
			}
			else{
				p1sel.whole.whole2.face.gotoAndStop(15);
			}
			break;

		case 37://left arrow
			p1sel.walkingLeft = true;
			trace("walk left");
			break;

		case 39://right arrow
			p1sel.walkingRight = true;
			trace("walk right");
			break;

		case 38: // up arrow toggles whether or not they're on stage or hidden below
			if (double){
				if (p1sel.onStage==true){
					p1.onStage=false;
					p2.onStage=false;

					//this animation will either hide them or show them
					//because you can keep hitting it before it's done, you can make a sort of "bounce"
					p1.gotoAndPlay(2);
					p2.gotoAndPlay(2);
					p1.whole.stop();
					p2.whole.stop();
				}
				else{
					p1.onStage=true;
					p2.onStage=true;
					p1.gotoAndPlay(16);
					p2.gotoAndPlay(16);
					p1.whole.stop();
					p2.whole.stop();
				}
			}
			else{
				if (p1sel.onStage==true){
					p1sel.onStage=false;
					p1sel.gotoAndPlay(2);
					p1sel.whole.stop();
				}
				else{
					p1sel.onStage = true;
					p1sel.gotoAndPlay(16);
					p1sel.whole.stop();
				}
			}
			break;

		case 79://o ; sets Blue / left character as the active character
			double = false;
			p1.whole.stop();
			p2.whole.stop();
			p1sel = characters[0];
			break;
		case 80://p ; sets Red / right character as the active character
			double = false;
			p1.whole.stop();
			p2.whole.stop();
			p1sel = characters[1];
			break;
		case 76://l ; sets both to active (double == true)
			double = true;
			p1.whole.stop();
			p2.whole.stop();
			break;
	}
}

//this function fades out the sound if the user decides to stop it or if the scene ends
//note that if a song is changed via buttons there is no fade out
function fadeSound(evnt:Event):void{
	soundPlaying = false;
	myTransform.volume -= 0.005;
	myChannel.soundTransform = myTransform;

	if (myTransform.volume <= 0){
		myChannel.stop();
		stage.removeEventListener(Event.ENTER_FRAME,fadeSound);

		//if it so happens that this is the last scene (fadeout happens as curtains close) then go to the next frame
		if (mainScenes.length == 0){
			nextFrame();
		}
	}
}

//if the curtain is either fully opened or fully closed, allow the characters to move again
function curtainPull(evnt:Event):void{
	if ((curtain.curtainA.x >= -251) || (curtain.curtainA.x <= -688)){
		p1.walkingLeft = false;
		p1.walkingRight = false;

		p2.walkingLeft = false;
		p2.walkingRight = false;

		stage.removeEventListener(Event.ENTER_FRAME,curtainPull);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, reportKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, reportKeyUp);
		stage.addEventListener(Event.ENTER_FRAME,move);
	}
}

stage.addEventListener(KeyboardEvent.KEY_DOWN, reportKeyDown);
stage.addEventListener(KeyboardEvent.KEY_UP, reportKeyUp);
stage.addEventListener(Event.ENTER_FRAME,move);
