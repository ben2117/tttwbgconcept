package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.plugin.MouseEventManager;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
/**
 * ...
 * @author xx
 */
class StateHandler 
{
	//all current states
	public var statesList:List<State>;
	
	public var possibleCards:Array<Card>;
	public var possibleGameCards:Array<Card>;
	
	private var stateMap:Map<String, State>;
	 
	public function new() 
	{
		
		statesList = new List<State>();
		possibleCards = new Array<Card>();
		possibleGameCards = new Array<Card>();
		stateMap = new Map<String, State>();
		
		loadStateMap();
		
	}
	
	public function firstCardPlayed() {
		var x = new S_EmptyWorld();
		//trace(x.attributes);
		statesList.add(x);
		
	}
	
	
	public function loadPossibleCards() 
	{
		for (i in statesList) {
			for ( j in i.cards) {
				var x = new Card();
				x.name = j["Name"];
			    x.cardtext = j["CardText"];
				x.cardStory = j["CardStory"];
		        x.effect = j["Effect"];
	            x.stateApplication = j["StateApplication"];
				x.stateRemoval = j["StateRemoval"];
				x.stateModifier = j["StateModifier"];
				x.audioAsset = j["AudioAsset"];
				possibleCards.push(x);
			}
		}
		
	}
	
	public function loadPossibleGameCards() 
	{
		for (i in statesList) {
			for ( j in i.gameCards) {
				var x = new Card();
				x.name = j["Name"];
			    x.cardtext = j["CardText"];
				x.cardStory = j["CardStory"];
		        x.effect = j["Effect"];
	            x.stateApplication = j["StateApplication"];
				x.stateRemoval = j["StateRemoval"];
				x.stateModifier = j["StateModifier"];
				x.audioAsset = j["AudioAsset"];
				possibleGameCards.push(x);
			}
		}
		
	}
	
	
	public function addANewState(playedCard:Card) 
	{
		//state addition
		if (playedCard.stateApplication != "None" )
		{
			var x:State;
			x = stateMap[playedCard.stateApplication];
			
			var add = true;
			for (i in statesList) {
				if (i.attributes["Name"] == x.attributes["Name"]) {
					add = false;
				}
			}
			if(add){
				statesList.add(x);
			}
		}
		//state modification
		if (playedCard.stateModifier != "None") {
			trace(playedCard.stateModifier);
			//var x:State;
			
			/*"HappynessModifier"
			  "WealthModifier" =>
			  "HealthModifier" =>
			 */
			var mod = playedCard.stateModifier.split(":");
			for (i in statesList) {
				if (i.attributes["Name"] == mod[0]) 
				{
					i.modAtt("HappynessModifier", Std.parseInt(mod[1]));
					i.modAtt("WealthModifier", Std.parseInt(mod[2]));
					i.modAtt("HealthModifier", Std.parseInt(mod[3]));
					i.modAtt("HP", Std.parseInt(mod[4]));
				}
			}
		}
	}
	
	public function playEachState(health, wealth, happyness):Array<Int> 
	{
		for (i in statesList) {
			health += Std.parseInt(i.attributes["HealthModifier"]);
			wealth += Std.parseInt(i.attributes["WealthModifier"]);
			happyness += Std.parseInt(i.attributes["HappynessModifier"]);
		}
		var x = [health, wealth, happyness];
		return x;
		
	}
	
	public function checkForDeadStates():String {
		var stateToRemove = "None";
		for (i in statesList) {
			if (Std.parseInt(i.attributes["HP"]) < 0) {
				stateToRemove = i.attributes["Name"];
				
			}
		}
		return stateToRemove;
	}
	
	/////////////////////STATE MAP VERY IMPORTANT
	private function loadStateMap() {
		stateMap = [
			"Farm" => new S_Farm(),
			"Shelter" => new S_Shelter()
			
		];
	}
}