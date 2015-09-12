package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class PlayerTank extends FlxSprite
{

	private var isPlayer1:Bool
	
	//Variables for keys
	private var _forwardKey:String;
	private var _backwardKey:String;
	private var _rLeftKey:String;
	private var _rRightKey:String;
	private var _shootKey:String;
	
	public function new(X:Float=0, Y:Float=0, IsPlayer1:Bool=true) 
	{
		super(X, Y);
		
		isPlayer1 = IsPlayer1;
		if (isPlayer1)
		{
			//Sets keys for player1
			_forwardKey = "W";
			_backwardKey = "S";
			_rLeftKey = "A";
			_rRightKey = "D";
			_shootKey = "SPACE";
			
			//makes graphics for player1
			makeGraphic(32, 48, FlxColor.RED);
		}
		else 
		{
			//Sets keys for player2
			_forwardKey = "UP";
			_backwardKey = "DOWN";
			_rLeftKey = "LEFT";
			_rRightKey = "RIGHT";
			_shootKey = "CONTROL";
			
			//makes graphics for player2
			makeGraphic(32, 48, FlxColor.BLUE);
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
	}
	
}