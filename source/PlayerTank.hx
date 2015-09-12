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
	
	private function movement():Void
	{
	}
	
}