package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.util.FlxAngle;

/**
 * ...
 * @author ...
 */
class Bullet extends FlxSprite
{

	//Variables for movement
	private var speed:Int = 300;
	
	//Variables for appearance
	private var _width:Int = 8;
	private var _height:Int = 8;
	
	public function new(X:Float=0, Y:Float=0, tankAngle:Float) 
	{
		super(X, Y);
		makeGraphic( _width, _height, FlxColor.BROWN);
		FlxAngle.rotatePoint(speed, 0, 0, 0, tankAngle, velocity);
	}
	
}