//THIS CODE IS INTENDED TO BE COPIED ONTO FRAME 2 OF THE FLA FILE
stop();

trace("I'm the intro!")
logo.alpha = 0;

counter = 0;

function showLogo(evnt:Event):void{
	if ((curtain.curtainA.x == -688)&&(logo.alpha < 1)){
		logo.alpha += 0.05;		
	}
		
	if ((logo.alpha >= 1)&&(counter == 0)){
		counter ++;
		stage.addEventListener(KeyboardEvent.KEY_DOWN, start);	
	}
	
	if (curtain.curtainA.x >= -251){
		stage.removeEventListener(Event.ENTER_FRAME,showLogo);
		nextFrame();
	}
}	
	
function start(event:KeyboardEvent):void { 
	switch(event.keyCode){
		case 76:
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, start);
			stage.addEventListener(Event.ENTER_FRAME,delayThree);
			okBtn.gotoAndPlay(2);
			clickSound.play();
			break;
		default:
			break;
	}
}

function delayThree(evnt:Event):void{
	counter ++;
	
	if (counter > 20){
		stage.removeEventListener(Event.ENTER_FRAME,delayThree);
		curtain.gotoAndPlay(21);
		pullSound.play();
	}
}

stage.addEventListener(Event.ENTER_FRAME,showLogo);
