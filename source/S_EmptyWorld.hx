package;

/**
 * ...
 * @author xx
 */
class S_EmptyWorld extends State
{

	public function new() 
	{
		super();
		attributes = [
			"Name" => "EmptyWorld",
			"HappynessModifier" => "0",
			"WealthModifier" => "0",
			"HealthModifier" => "0",
			"HP" => "-1",
			"ImageAsset" => "assets/images/_EmptyWorld.png"
		];
		
		loadCards();
		loadGameCards();
		this.loadSprite();
	}
	
	
	
	private override function loadCards() {
		this.cards.add( [
			"Name" => "Farm",
			"CardText" => "A Farm can provide food for the people",
			"CardStory" => "A Farm can provide food for the people",
			"Effect" => "None",
			"StateApplication" => "Farm",
			"StateRemoval" => "None",
			"StateModifier" => "None",
			"AudioAsset" => "None"
		]);
		
		this.cards.add( [
			"Name" => "Shelter",
			"CardText" => "Somewhere to rest",
			"CardStory" => "People need to rest, they cant sleep in the open",
			"Effect" => "None",
			"StateApplication" => "Shelter",
			"StateRemoval" => "None",
			"StateModifier" => "None",
			"AudioAsset" => "None"
		]);
		
		this.cards.add( [
			"Name" => "Man",
			"CardText" => "A Man for enjoyment",
			"CardStory" => "A Farm can provide food for the people",
			"Effect" => "None",
			"StateApplication" => "None",
			"StateRemoval" => "None",
			//state modifier, happyness, wealth, health, stateHP
			"StateModifier" => "None",
			"AudioAsset" => "None"
		]);
		
		
	}
	
	private override function loadGameCards() {
		//gameCards Card text is always none
		this.gameCards.add([
			"Name" => "Quite",
			"CardText" => "None",
			"CardStory" => "All is quite, except the distant echo",
			"Effect" => "None",
			"StateApplication" => "None",
			"StateRemoval" => "None",
			//state modifier, happyness, wealth, health, stateHP
			"StateModifier" => "None",
			"AudioAsset" => "None"
			
		]);
	}
	
}