package  {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.Timer;
	import flash.media.*;
	import flash.media.Sound;
	import flash.events.Event;
	import flash.display.MovieClip;


	//This actionscript file simply stores all the variables to be used in order
	//to keep things more organized.

	//It is also in charge of loading all the music.
	public class techstudio extends MovieClip
	{
		//the below variables are explained in the code where it is used.
		var numScenes:int = 0;
		var mainScenes:Array = new Array();

		// if the sound is not on, set it as false.
		var soundPlaying = false;

		// This soundchannel controls the music (needed for volume control)
		var myChannel:SoundChannel = new SoundChannel();
		var myTransform:SoundTransform = new SoundTransform();

		var neutralSound:Sound = new Normal();
		var clapping:Sound = new Clap();
		var menuSound:Sound = new Menu();
		var sadSound:Sound = new Sad();
		var creepySound:Sound = new Creepy();
		var dramaticSound:Sound = new Shock();
		var clickSound:Sound = new Click();
		var pullSound:Sound = new Pull();

		//the below variables are explained in the code where it is used.
		var double:Boolean = false;
		var characters:Array;

		var p1sel;

		var curtainOpen:Boolean = false;

		var scenesToSelect:int;
		var currScene:int;
		var currSel:int;
		var minScene:int;
		var maxScene:int;

		var minNum:int;
		var currNum:int;
		var maxNum:int;

		var counter:int;

		var enterFrame:Boolean = false;
		var exitFrame:Boolean = false;

		public function techstudio()
		{

		}  // end constructor function

	} // end class

} // end package
