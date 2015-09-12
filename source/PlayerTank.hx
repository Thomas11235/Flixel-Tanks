package;

import flixel.FlxSprite;

/**
 * ...
 * @author ...
 */
class PlayerTank extends FlxSprite
{

	private var isPlayer1:Bool
	
	
	public function new(X:Float=0, Y:Float=0) 
	public function new(X:Float=0, Y:Float=0, IsPlayer1:Bool) 
	{
		super(X, Y);
		
		isPlayer1 = IsPlayer1;
	}
	
}