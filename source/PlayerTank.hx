package;

import flixel.FlxSprite;

/**
 * ...
 * @author ...
 */
class PlayerTank extends FlxSprite
{

	private var _forwardKey:String;
	private var _backwardKey:String;
	private var _rLeftKey:String;
	private var _rRightKey:String;
	private var _shootKey:String;
	private var isPlayer1:Bool
	
	public function new(X:Float=0, Y:Float=0, IsPlayer1:Bool=true) 
	{
		super(X, Y);
		
		isPlayer1 = IsPlayer1;
		if (isPlayer1)
		{
			_forwardKey = "W";
			_backwardKey = "S";
			_rLeftKey = "A";
			_rRightKey = "D";
			_shootKey = "SPACE";
		}
		else 
		{
			_forwardKey = "UP";
			_backwardKey = "DOWN";
			_rLeftKey = "LEFT";
			_rRightKey = "RIGHT";
			_shootKey = "CONTROL";
		}
		
	}
	
}