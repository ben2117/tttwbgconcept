package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSplash;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 * 
	 */
	
	//private var title:FlxText;
	private var title:FlxSprite;
	private var btn_new:FlxButton;
	
	override public function create():Void
	{
		super.create();
		

		FlxG.sound.playMusic(AssetPaths.Xenomorphs__wav, 1, true);
		var init_x:Int = Math.floor(FlxG.width / 2 - 20);
		
		title = new FlxSprite(init_x - 100, 0, "assets/images/title.png");
		add(title);
		
		btn_new = new FlxButton(init_x, 200, " ", onNew);
		btn_new.loadGraphic("assets/images/startGame.png", false, 200, 58);
		add(btn_new);
		
	}
	
	private function onNew():Void {
		FlxG.switchState(new PlayState());
	}

	private function onLoad():Void {
		trace("Load...");
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
	}	
 }