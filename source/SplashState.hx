package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;



/**
 * A FlxState which can be used for the actual gameplay.
 */
class SplashState extends FlxState
{
	
	private var splash:FlxSprite;
	
	//private var txtScore:FlxText;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		
		super.create();
		
		
		splash = new FlxSprite(0, 0, "assets/images/splash.png");
		
		add(splash);
		
		
		
		
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
		splash.y += 1;
		if (splash.y > 150) {
			
			FlxG.switchState(new MenuState());
		}
		
	}	
}