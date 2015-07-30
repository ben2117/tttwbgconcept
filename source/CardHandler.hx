package;
import flixel.util.FlxRandom;

/**
 * ...
 * @author xx
 */
class CardHandler 
{
	
	public var card1:Card;
	public var card2:Card;
	public var card3:Card;

	public var cardStory:String;
	
	public var stateHandler:StateHandler;
	public var effectHandler:EffectHandler;
	
	private var hasStartGame:Bool;
	
	public function new()
	{
		card1 = new Card();
		card2 = new Card();
		card3 = new Card();
		
		stateHandler = new StateHandler();
		effectHandler = new EffectHandler();
		
		hasStartGame = true;
		//startGame();
	}

	
	public function card1Play() 
	{
		//return "hello from card 1";
		if(!hasStartGame){
			playCard(card1);
		}
	}
	
	public function card2Play()
	{
		//return "Hello im card 2";
		if(!hasStartGame){
			playCard(card2);
		} else {
			trace("Start");
			stateHandler.firstCardPlayed();
			hasStartGame = false;
			selectNewCards();
			cardStory = "\n\nWe arrive, weary... raggad";
			trace("End");
		}
	}
	
	public function card3Play() 
	{
		//return "Beep bop boop card 3"; 
		if(!hasStartGame){
			playCard(card3);
		}
	}
	
	private function playCard(playedCard:Card) 
	{
		cardStory = playedCard.cardStory;
		stateHandler.addANewState(playedCard);
		selectNewCards();
	}
	
	private function selectNewCards()
	{
		
		stateHandler.loadPossibleCards();
		
		var c1 = FlxRandom.intRanged(0, stateHandler.possibleCards.length-1);
		var c2 = FlxRandom.intRanged(0, stateHandler.possibleCards.length-1);
		while (c1 == c2) {
			c2 = FlxRandom.intRanged(0, stateHandler.possibleCards.length-1);
		}
		var c3 = FlxRandom.intRanged(0, stateHandler.possibleCards.length-1);
		while (c3 == c2 || c3 == c1) {
			c3 = FlxRandom.intRanged(0, stateHandler.possibleCards.length-1);
		}
		
		card1 = stateHandler.possibleCards[c1];
		card2 = stateHandler.possibleCards[c2];
		card3 = stateHandler.possibleCards[c3];
		
	
	}
	
	public function playGameCard():String
	{
		stateHandler.loadPossibleGameCards();
		
		var randNum = FlxRandom.intRanged(0, stateHandler.possibleGameCards.length - 1);
		trace(randNum);
		var gameCard = stateHandler.possibleGameCards[randNum];
		stateHandler.addANewState(gameCard);
		return gameCard.cardStory;
	}
	
}