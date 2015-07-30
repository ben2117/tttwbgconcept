package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.plugin.MouseEventManager;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;



/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	
	private var bg1:FlxSprite;
	private var bg2:FlxSprite;
	
	private var card1:FlxButton;
	private var card2:FlxButton;
	private var card3:FlxButton;
	
	private var scroll:FlxButton;
	
	private var healthText:FlxText;
	private var wealthText:FlxText;
	private var happynessText:FlxText;
	
	private var cardHandler:CardHandler;
	
	private var turnPlaceMent:Int; //1 = players turn, 2 = game turn, 3 = effects turn
	
	private var stateSprites:FlxTypedGroup<FlxSprite>;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		
		super.create();
		
		cardHandler = new CardHandler();
		
		FlxG.plugins.add(new MouseEventManager());
		
		stateSprites = new FlxTypedGroup<FlxSprite>();
		
		bg1 = new FlxSprite(-1500, 0, "assets/images/bg.png");
		bg1.scale.set(5, 5);
		bg2 = new FlxSprite( -3000, 0, "assets/images/bg.png");
		bg2.scale.set(5, 5);
		add(bg1);
		add(bg2);
		
		///3 cards
		card1 = new FlxButton(0, 395, " ", card1Callback);
		card1.loadGraphic("assets/images/card.PNG", false, 133, 214);
		card1.label.setFormat( 14, 255, "center");
		
		
		card2 = new FlxButton(125, 345, "Find a new place... to start again.", card2Callback);
		card2.loadGraphic("assets/images/card.PNG", false, 133, 214);
		card2.label.setFormat( 14, 255, "center");
		
		card3 = new FlxButton(250, 395, " ", card3Callback);
		card3.loadGraphic("assets/images/card.PNG", false, 133, 214);
		card3.label.setFormat( 14, 255, "center");
		
		scroll = new FlxButton(190, 330, "\n\n\nSample Text is seeing how it \nlooks", scrollCallback);
		scroll.loadGraphic(AssetPaths.scroll__png, false, 330, 164);
		scroll.label.setFormat(14, 255, "center");
		scroll.set_visible(false);
		
		add(card2);
		
		add(card1);
		
		add(card3);
		
		add(scroll); ////330*184
		
		var stats = new FlxSprite(0, 0, "assets/images/stats.png");
		add(stats);
		
		healthText = new FlxText(42, 12, 100, "10", 8);
		wealthText = new FlxText(42, 49, 100, "10", 8);
		happynessText = new FlxText(42, 87, 100, "10", 8);
		add(healthText);
		add(wealthText);
		add(happynessText);
		
		
		turnPlaceMent = 1;
	}
	
	private function card1Callback() {
		cardHandler.card1Play();
		turnMakeHappen();
	}
	private function card2Callback() {
		cardHandler.card2Play();
		//trace(cardHandler.card2.cardtext);
		turnMakeHappen();
	}
	private function card3Callback() {
		cardHandler.card3Play();
		turnMakeHappen();
	}
	
	private function scrollCallback() {
		trace(turnPlaceMent);
		if (turnPlaceMent == 2) {
			gameMakeHappen();
		}
		else if (turnPlaceMent == 3) {
			effectMakeHappen();
		}
		else {
			card1.set_visible(true);
			card2.set_visible(true);
			card3.set_visible(true);
			scroll.set_visible(false);
			turnPlaceMent = 1;
		}
	}
	
	
	private function playEachState() {
		var x = cardHandler.stateHandler.playEachState(Std.parseInt(healthText.text), Std.parseInt(wealthText.text), Std.parseInt(happynessText.text));
		healthText.text = Std.string(x[0]);
		wealthText.text = Std.string(x[1]);
		happynessText.text = Std.string(x[2]);
	}
	
	private function turnMakeHappen() {
		
		card1.text = cardHandler.card1.cardtext;
 
		card2.text = cardHandler.card2.cardtext;

		card3.text = cardHandler.card3.cardtext;
		
		//add the image of the state
		for (i in cardHandler.stateHandler.statesList) {
			if (i.attributes["ImageAsset"] != "None") {
				add(i.stateSprite);
			}
		}
		  
		//run throgh all of the states and add modifierz
		
		
		
		FlxG.sound.play(AssetPaths.fled__wav);
		
		//turn off cards and move to next turn placement
		card1.set_visible(false);
		card2.set_visible(false);
		card3.set_visible(false);
		
		scroll.text = "\n\n" + cardHandler.cardStory;
		scroll.set_visible(true);
		
		turnPlaceMent++;
	}
	
	private function gameMakeHappen() {
		
		//add image of state
		for (i in cardHandler.stateHandler.statesList) {
			if (i.attributes["ImageAsset"] != "None") {
				add(i.stateSprite); 
			}
		}
		//pick the game card and apply its states and modifiers
		
		var cardStory = cardHandler.playGameCard();
		scroll.text = "\n\n"+cardStory;
		
		playEachState();
		
		turnPlaceMent++;
		trace(turnPlaceMent);
		
	}
	
	private function effectMakeHappen() {
		scroll.text = "\n\n"+"effects are not uet implimented";
		turnPlaceMent++;
		
		/////////////////////USED TO REMOVE A SPRITE\\\\\\\\\\\\\\\\//
		//for (i in cardHandler.stateHandler.statesList) {
		//	if (i.attributes["Name"] == "Farm") {
		//		remove(i.stateSprite); 
		//	}
		//}
		
		///////////////////////////\\\\\\\\\\\\\\\\\\\\\//
		trace(turnPlaceMent);
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
		
		
		///BackGround
		bg1.x += 1;
		if (bg1.x > 1500) {
			bg1.x = -3000;
		}
		
		bg2.x += 1;
		if (bg2.x > 1500) {
			bg2.x = -3000;
		}
		
		if (FlxG.mouse.pressed)
		{
			// The left mouse button is currently pressed
			trace(FlxG.mouse.x + " " + FlxG.mouse.y);
		}
	}	
}