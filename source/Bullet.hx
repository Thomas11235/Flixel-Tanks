package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;

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
	    velocity.set(speed, 0);
        velocity.rotate(FlxPoint.weak(0, 0), tankAngle);
	}
	
}
