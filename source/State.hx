package;
import flixel.FlxSprite;
import openfl.display.Sprite;

/**
 * ...
 * @author xx
 */
class State
{
	public var cards:List<Map<String, String>>;
	public var gameCards:List<Map<String, String>>;
	
	public var attributes:Map<String, String>;
	
	public var stateSprite:FlxSprite;
	
	public function new() 
	{
		cards = new List<Map<String, String>>();
		gameCards = new List<Map<String, String>>();
	}
		
	
	private function loadCards() { };
	
	private function loadGameCards() { };
	
	private function loadSprite() 
	{
		if(this.attributes["ImageAsset"] != "None"){
			stateSprite = new FlxSprite(0, 0, this.attributes["ImageAsset"]);
		}
	}
	
	public function modAtt(name, mod) {
		var str:String;
		var inte:Int;
		
		str = this.attributes[name];
		inte = Std.parseInt(str);
		inte += mod;
		str = Std.string(inte);
		this.attributes.set(name, str);
	}
	
	public function destroyMe()
	{
		//this = null;
	}
	
}