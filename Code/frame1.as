//THIS CODE IS INTENDED TO BE COPIED ONTO FRAME 1 OF THE FLA FILE
//Each frame has a stop(); which simply prevents the file from skipping frames.
stop();

//this code starts playing the music.
//the boolean is set because the music might already be playing if the user restarted the game
//(see frame 8)
if (soundPlaying == false){
	//the sound is playing so set this to true
	soundPlaying == true;

	//play the music
	myChannel = menuSound.play();

	//lower the volume (1/10th the original) and apply it to the sound
	myTransform.volume = 0.1;
	myChannel.soundTransform = myTransform;
}

//the curtain movieclip has two key frames, 2 and 21.
//2 -- the start of the curtain opening sequence
//21 -- the start of the curtain closing sequence
//this will be referred to in the later files

//for now, we open the curtain
curtain.gotoAndPlay(2);

//this is the curtain pulling sound (applied each time the curtain is pulled)
pullSound.play();

//this function (a frame loop) checks if the curtain has yet been fully pulled
function open(evnt:Event):void{
	if (curtain.curtainA.x == -688){ // this number is where the curtain stops once it's opened (on its movieclip)
		stage.removeEventListener(Event.ENTER_FRAME,open); //if so, we're done opening the curtain so remove the frame loop
		nextFrame();//so go to the next frame
	}
}

//adds the frame loop to the stage
stage.addEventListener(Event.ENTER_FRAME,open);
