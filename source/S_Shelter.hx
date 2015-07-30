package;

/**
 * ...
 * @author xx
 */
class S_Shelter extends State
{

	public function new() 
	{
		super();
		
		attributes = [
			"Name" => "Shelter",
			"HappynessModifier" => "1",
			"WealthModifier" => "-2",
			"HealthModifier" => "1",
			"HP" => "10",
			"ImageAsset" => "assets/images/_Shelter.png"
		];
		
		
		
		loadCards();
		
		this.loadSprite();
	}
	
	
	
	private override function loadCards() {
		//this.cards.add( [

		//]);
				
	}
		
	private override function loadGameCards() 
	{
		//this.gameCards.add( [

		//]);
	}
	
	
}