package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxDestroyUtil;
import flixel.util.FlxColor;
import flash.system.System;
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
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_title = new FlxText(0, 100, 0, "Tanks", 32);
		_title.screenCenter(true, false);
		add(_title);
		
		_btnOptions = new FlxButton(0, 0, "Options");
		_btnOptions.screenCenter();
		add(_btnOptions);
		
		_btnPlay = new FlxButton(0, _btnOptions.y - _btnOptions.height / 2 - 10, "Play", playGame);
		_btnPlay.screenCenter(true, false);
		add(_btnPlay);
		
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
		
		_title = FlxDestroyUtil.destroy(_title);
		_btnPlay = FlxDestroyUtil.destroy(_btnPlay);
		_btnOptions = FlxDestroyUtil.destroy(_btnOptions);
		_btnExit = FlxDestroyUtil.destroy(_btnExit);
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
	
	private function playGame() {
		FlxG.camera.fade(FlxColor.BLACK,.33, false, function() {
			FlxG.switchState(new PlayState());
		});
	}
	
	private function quitGame() {
		System.exit(0);
	}
}