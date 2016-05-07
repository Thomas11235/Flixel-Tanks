package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxAngle;

/**
 * ...
 * @author ...
 */
class PlayerTank extends FlxSprite
{

	private var isPlayer1:Bool;
	
	//Variables for the size of the tank
	var _width:Int = 24;
	var _height:Int = 16;
	
	//Variables for movement
	private var speed:Float = 125;
	private var rSpeed:Float = 3;
	private var _drag:Int = 2000;
	
	//Variables for keys
	private var _forwardKey:Array<String>;
	private var _backwardKey:Array<String>;
	private var _rLeftKey:Array<String>;
	private var _rRightKey:Array<String>;	
	
	public function new(IsPlayer1:Bool=true, X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		
		//sets the drag
		drag.x = drag.y = _drag;
		
		isPlayer1 = IsPlayer1;
		if (isPlayer1)
		{
			//Sets keys for player1
			_forwardKey = ["W"];
			_backwardKey = ["S"];
			_rLeftKey = ["A"];
			_rRightKey = ["D"];
			
			//makes graphics for player1
			makeGraphic( _width, _height, FlxColor.RED);
		}
		else 
		{
			//Sets keys for player2
			_forwardKey = ["UP"];
			_backwardKey = ["DOWN"];
			_rLeftKey = ["LEFT"];
			_rRightKey = ["RIGHT"];
			
			//makes graphics for player2
			makeGraphic(_width, _height, FlxColor.BLUE);
		}
		
	}
	
	override public function update()
	{
		super.update();
		movement();
	}
	
	private function movement():Void
	{
		//Declare variables
		var _forward:Bool = false;
		var _backward:Bool = false;
		var _rLeft:Bool = false;
		var _rRight:Bool = false;
		
		//Bools become true when the corresponding key is pressed
		_forward = FlxG.keys.anyPressed(_forwardKey);
		_backward = FlxG.keys.anyPressed(_backwardKey);
		_rLeft = FlxG.keys.anyPressed(_rLeftKey);
		_rRight = FlxG.keys.anyPressed(_rRightKey);
		
		//sets _forward and _backward to false when both pressed
		if (_forward && _backward)
		{
			_forward = _backward = false;
		}
		//sets _rLeft and _rRight to false when both pressed
		if (_rLeft && _rRight)
		{
			_rRight = _rLeft = false;
		}
		
		//rotates the tank counter-clockwise
		if (_rLeft)
		{
			angle -= rSpeed;
		}
		//rotates the tank clockwise
		else if (_rRight)
		{
			angle += rSpeed;
		}
		
		//moves the tank towards forward
		if (_forward)
		{
			FlxAngle.rotatePoint(speed, 0, 0, 0, angle, velocity);
		}
		
		//moves the tank towards backward
		if (_backward)
		{
			FlxAngle.rotatePoint(speed, 0, 0, 0, angle + 180, velocity);
		}
		
		
	}
	
}
