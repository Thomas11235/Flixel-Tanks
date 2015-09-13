package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var player1:PlayerTank;
	private var player2:PlayerTank;
	
	private var _bullets:FlxTypedGroup<Bullet>;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		_bullets = new FlxTypedGroup<Bullet>();
		add(_bullets);
				
		player1 = new PlayerTank(30, 30, true);
		add(player1);
		
		player2 = new PlayerTank(70, 70, false);
		add(player2);
		
		
	}
	
	private function shootBullets():Void
	{
		if (FlxG.keys.anyJustPressed(["SPACE"]))
		{
			_bullets.add(new Bullet(player1.x, player1.y, player1.angle));
		}
		
		if (FlxG.keys.anyJustPressed(["CONTROL"]))
		{
			_bullets.add(new Bullet(player2.x, player2.y, player2.angle));
		}
	}
	
	
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		shootBullets();
	}	
}