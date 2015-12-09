//THIS CODE IS INTENDED TO BE COPIED ONTO FRAME 7 OF THE FLA FILE
stop();

trace("I'm frame 5...");

characters = new Array(p1,p2);
		
p1sel = characters[0];

p1.x = -101.5;
p1.y = 491.1;
addChildAt(p1,2);

p2.x = 1107.5;
p2.y = 491.1;
addChildAt(p2,2);

p1.onStage = true;
p2.onStage = true;

p1.walkingLeft = false;
p1.walkingRight = false;

p2.walkingLeft = false;
p2.walkingRight = false;

soundPlaying = false;

p1.whole.stop();
p2.whole.stop();
curtain.stop();

function move(evnt:Event):void{
	if (double){
		if (p1sel.walkingLeft){
			p1.x -= 5;
			p2.x -= 5;			
			p1.scaleX = 1;
			p2.scaleX = 1;
			p1.whole.play();
			p2.whole.play();
		}
		else if (p1sel.walkingRight){
			p1.x += 5;
			p2.x += 5;			
			p1.scaleX = -1;
			p2.scaleX = -1;
			p1.whole.play();
			p2.whole.play();
		}
	}
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


function reportKeyDown(event:KeyboardEvent):void {	
	switch(event.keyCode) {
		case 90: //z
			trace("dramatic sound");
			dramaticSound.play();
			break;
		case 88: //x
			trace("neutral sound");
			myChannel.stop();
			myChannel = neutralSound.play();
			myTransform.volume = 0.1;
			myChannel.soundTransform = myTransform;
			soundPlaying = true;
			break;
		case 67: //c
			trace("sad sound");
			myChannel.stop();
			myChannel = sadSound.play();
			myTransform.volume = 0.1;
			myChannel.soundTransform = myTransform;
			soundPlaying = true;
			break;
		case 86: //v
			trace("creepy sound");
			myChannel.stop();
			myChannel = creepySound.play();
			myTransform.volume = 0.1;
			myChannel.soundTransform = myTransform;
			soundPlaying = true;
			break;
		case 75:
			if (soundPlaying == true){
				trace("stop sound");
				stage.addEventListener(Event.ENTER_FRAME,fadeSound);
			}
			break;
		case 81: //q
			if (curtainOpen){
				curtainOpen = false;
				curtain.gotoAndPlay(21);
				
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, reportKeyDown);
				stage.removeEventListener(KeyboardEvent.KEY_UP, reportKeyUp);
				stage.removeEventListener(Event.ENTER_FRAME,move);		

				if (soundPlaying == true){
					stage.addEventListener(Event.ENTER_FRAME,fadeSound);					
					if (mainScenes.length > 0){
						stage.addEventListener(Event.ENTER_FRAME,curtainPull);
					}
				}
					
				else {
					if (mainScenes.length > 0){
						stage.addEventListener(Event.ENTER_FRAME,curtainPull);
					}
					else{
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

				bg.gotoAndStop(mainScenes[0]);
				mainScenes.shift();
			}
			pullSound.play();
			break;
		case 87:
			if (double){
				p1.whole.whole2.face.gotoAndStop(1);
				p2.whole.whole2.face.gotoAndStop(1);
			}
			else{
				p1sel.whole.whole2.face.gotoAndStop(1);
			}
			trace("neutral");
			break;
		case 65:
			if (double){
				p1.whole.whole2.face.gotoAndStop(5);
				p2.whole.whole2.face.gotoAndStop(5);
			}
			else{
				p1sel.whole.whole2.face.gotoAndStop(5);
			}
			trace("sad");
			break;
		case 83:
			if (double){
				p1.whole.whole2.face.gotoAndStop(10);
				p2.whole.whole2.face.gotoAndStop(10);
			}
			else{
				p1sel.whole.whole2.face.gotoAndStop(10);
			}
			trace("shocked");
			break;
		case 68:
			if (double){
				p1.whole.whole2.face.gotoAndStop(15);
				p2.whole.whole2.face.gotoAndStop(15);			
			}
			else{
				p1sel.whole.whole2.face.gotoAndStop(15);
			}
			trace("angry");
			break;
		case 37:
			p1sel.walkingLeft = true;
			trace("walk left");
			break;
		case 39:
			p1sel.walkingRight = true;
			trace("walk right");
			break;
		case 38:
			if (double){
				if (p1sel.onStage==true){
					p1.onStage=false;
					p2.onStage=false;
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
		case 79://o
			double = false;
			p1.whole.stop();
			p2.whole.stop();
			p1sel = characters[0];
			break;
		case 80://p
			double = false;
			p1.whole.stop();
			p2.whole.stop();
			p1sel = characters[1];
			break;
		case 76://l
			if (double){
				double = false;
				p1.whole.stop();
				p2.whole.stop();
			}
			else{
				double = true;
			}
			break;
		default:
			trace("n/a");
			break;
	}
} 

function fadeSound(evnt:Event):void{
	soundPlaying = false;
	myTransform.volume -= 0.005;
	myChannel.soundTransform = myTransform;
	
	if (myTransform.volume <= 0){
		myChannel.stop();
		stage.removeEventListener(Event.ENTER_FRAME,fadeSound);
		
		if (mainScenes.length == 0){
			nextFrame();
		}
	}
}

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