package;

/**
 * ...
 * @author xx
 */
class S_Farm extends State
{

	public function new() 
	{
		super();
		
		attributes = [
			"Name" => "Farm",
			"HappynessModifier" => "0",
			"WealthModifier" => "1",
			"HealthModifier" => "1",
			"HP" => "10",
			"ImageAsset" => "assets/images/_Farm.png"
		];
		
		
		
		loadCards();
		loadGameCards();
		this.loadSprite();
	}
	
	
	
	private override function loadCards() {
		this.cards.add( [
			"Name" => "FarmWork",
			"CardText" => "The farmers could work harder",
			"CardStory" => "The men toil on the farm",
			"Effect" => "None",
			"StateApplication" => "Farm",
			"StateRemoval" => "None",
			//state modifier, happyness, wealth, health, stateHP
			"StateModifier" => "Farm:-1:1:-1:0",
			"AudioAsset" => "None"
		]);
				
	}
	
	private override function loadGameCards() 
	{
		this.gameCards.add( [
			"Name" => "Famine",
			"CardText" => "None",
			"CardStory" => "When the famine hits, the farms dont do so well",
			"Effect" => "None",
			"StateApplication" => "Farm",
			"StateRemoval" => "None",
			//state modifier, happyness, wealth, health, stateHP
			"StateModifier" => "Farm:-1:-1:-1:0",
			"AudioAsset" => "None"
		]);
	}
	
}