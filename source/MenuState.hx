package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxDestroyUtil;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import flash.system.System;
import haxe.ds.Option;
using flixel.util.FlxSpriteUtil;


/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	private var _btnPlay:FlxButton;
	private var _btnOptions:FlxButton;
	private var _btnExit:FlxButton;
	private var _title:FlxText;
	private var _save:FlxSave;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		//Sets up a save to store settings and scores
		_save = new FlxSave();
		_save.bind("tanks");
		
		//If the variable fullscreen exists, make sure FlxG.fullscreen is set to the same value
		if (_save.data.fullscreen != null)
			FlxG.fullscreen = _save.data.fullscreen;
		
		//Displays title
		_title = new FlxText(0, 100, 0, "Tanks", 32);
		_title.alignment = "center";
		_title.screenCenter(true, false);
		add(_title);
		
		//Button for options menu
		_btnOptions = new FlxButton(0, 0, "Options", toOptions);
		_btnOptions.screenCenter();
		add(_btnOptions);
		
		//Button to start the game
		_btnPlay = new FlxButton(0, _btnOptions.y - _btnOptions.height / 2 - 10, "Play", playGame);
		_btnPlay.screenCenter(true, false);
		add(_btnPlay);
		
		//Button to close the game
		_btnExit = new FlxButton(0, _btnOptions.y + _btnOptions.height / 2 + 10, "Exit", quitGame);
		_btnExit.screenCenter(true, false);
		add(_btnExit);
		
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
		
		//Destroys all objects
		_title = FlxDestroyUtil.destroy(_title);
		_btnPlay = FlxDestroyUtil.destroy(_btnPlay);
		_btnOptions = FlxDestroyUtil.destroy(_btnOptions);
		_btnExit = FlxDestroyUtil.destroy(_btnExit);
		
		_save.destroy();
		_save = null;
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}	
	
	private function playGame() {
		//Fade to black and switch states
		FlxG.camera.fade(FlxColor.BLACK, .33, false, function() {
			FlxG.switchState(new PlayState());
		});
	}
	
	private function toOptions() {
		//Fade to black and switch states
		FlxG.camera.fade(FlxColor.BLACK, .33, false, function() {
			FlxG.switchState(new OptionsState());
		});
	}
	
	private function quitGame() {
		//Exits the game
		System.exit(0);
	}
}
