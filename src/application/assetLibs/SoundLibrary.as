package application.assetLibs {

	import application.MainSettings;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import flash.media.SoundChannel;

  public class SoundLibrary{


	  // init static class
	private static var _instance:SoundLibrary;
	private static var _canInit:Boolean = false;
	
	//
	
	
	 public static var _bell1:Class;
	 private static var _bell2:Class;
	
	 private static var _cardAction1:Class;
	 private static var _cardAction2:Class;
	 private static var _cardAction3:Class;
	
	 private static var _cardMove1:Class;
	 private static var _cardMove2:Class;
	 private static var _cardMove3:Class;
	 
	 private static var _cardSlide1:Class;
	 private static var _cardSlide2:Class;
	 private static var _cardSlide3:Class;
	 
	 private static var _cardDeal:Class;
	 
	 private static var _cardTurn1:Class;
	 private static var _cardTurn2:Class;
	 private static var _cardTurn3:Class;
	 
	 private static var _notifi:Class;
	 private static var _turn:Class;
	 private static var _chooseTrumpCard:Class;
	 private static var _newGame:Class;
	 private static var _gameOver:Class;
     private static var _soundTimer:Class
	 private static var _gameLoose:Class;
	 private static var _gameWin:Class;
	 private static var _gameScore:Class;
	 
	// private var $transform:SoundTransform;
	
	 
	
    public function SoundLibrary() {
      super();

      if (_canInit == false) {
        throw new Error('ItemLibrary is an singleton and cannot be instantiated.');
      }
    }
	
	public static function  get getSound():SoundLibrary {
      if (_instance == null) {
        _canInit = true;
        _instance = new SoundLibrary();
        _canInit = false;
      }
      return _instance;
    }
	
	public  function get GameScore():* {
			
			return makeSound(_gameScore);
	}
	public  function set GameScore(value:Class) {
			_gameScore = value;
	}	
	public  function get GameWin():* {
			
			return makeSound(_gameWin);
	}
	public  function set GameWin(value:Class) {
			_gameWin = value;
	}
	
	public  function get GameLoose():* {
			
			return makeSound(_gameLoose);
	}
	public  function set GameLoose(value:Class) {
			_gameLoose = value;
	}
	
	public  function get SoundTimer():* {
			
			return makeSound(_soundTimer);
	}
	public  function set SoundTimer(value:Class) {
			_soundTimer = value;
	}
	
	public  function get ChooseTrumpCard():* {
			return makeSound(_chooseTrumpCard);
	}
	public  function set ChooseTrumpCard(value:Class) {
			_chooseTrumpCard = value;
	}
	
	public  function get GameOver ():* {
			
			return makeSound(_gameOver);
	}
	public  function set GameOver(value:Class) {
			_gameOver = value;
	}
	
	public  function get NewGame():* {
			
			return makeSound(_newGame);
	}
	public  function set NewGame(value:Class) {
			_newGame = value;
	}
	
	public  function get Notifi():* {
			
			return makeSound(_notifi);
	}
	public  function set Notifi(value:Class) {
			_notifi = value;
	}
	
	public  function get Turn():* {
			
			return makeSound(_turn);
	}
	public  function set Turn(value:Class) {
			_turn = value;
	}
		
	
	public  function get Bell2():* {
			
			return makeSound(_bell2);
	}
	public  function set Bell2(value:Class) {
			_bell2 = value;
	}
	
	public  function get Bell1():* {
			
			return makeSound(_bell1);
	}
	public  function set Bell1(value:Class) {
			_bell1 = value;
	}
	
	public  function get CardAction3():* {
			
			return makeSound(_cardAction3);
	}
	public  function set CardAction3(value:Class) {
			_cardAction3 = value;
	}
	
	public  function get CardAction2():* {
			
			return makeSound(_cardAction2);
	}
	public  function set CardAction2(value:Class) {
			_cardAction2 = value;
	}
	
	public  function get CardAction1():* {
			
			return makeSound(_cardAction1);
	}
	public  function set CardAction1(value:Class) {
			_cardAction1 = value;
	}
	
	public  function get CardMove1():* {
			
			return makeSound(_cardMove1);
	}
	public  function set CardMove1(value:Class) {
			_cardMove1 = value;
	}
	
	public  function get CardMove2():* {
			
			return makeSound(_cardMove2);
	}
	public  function set CardMove2(value:Class) {
			_cardMove2 = value;
	}
	
	public  function get CardMove3():* {
			
			return makeSound(_cardMove3);
	}
	public  function set CardMove3(value:Class) {
			_cardMove3 = value;
	}
	
	public  function get CardSlide1():* {
			
			return makeSound(_cardSlide1);
	}
	public  function set CardSlide1(value:Class) {
			_cardSlide1 = value;
	}
	
	public  function get CardSlide2():* {
			
			return makeSound(_cardSlide2);
	}
	public  function set CardSlide2(value:Class) {
			_cardSlide2 = value;
	}
	
	public  function get CardSlide3():* {
			
			return makeSound(_cardSlide3);
	}
	public  function set CardSlide3(value:Class) {
			_cardSlide3 = value;
	}
	
	public  function get CardDeal():* {
			return makeSound(_cardDeal);
	}
	public  function set CardDeal(value:Class) {
			_cardDeal = value;
	}
	
	public  function get CardTurn1():* {
			return makeSound(_cardTurn1);
	}
	public  function set CardTurn1(value:Class) {
			_cardTurn1 = value;
	}
	
	public  function get CardTurn2():* {
			return makeSound(_cardTurn2);
	}
	public  function set CardTurn2(value:Class) {
			_cardTurn2 = value;
	}
		
	public  function get CardTurn3():* {
			return makeSound(_cardTurn3);
	}
	public  function set CardTurn3(value:Class) {
			_cardTurn3 = value;
	}
	private static function makeSound(_soundSource:Class):* {
		
		var $sc:SoundChannel = new SoundChannel();
		var $s:Sound = new _soundSource
		$sc = Sound($s).play();
		var $transform:SoundTransform = $sc.soundTransform;
		$transform.volume = MainSettings.instance.globalSoundValume;
		$sc.soundTransform = $transform;
		
		return $sc;
	}
  }
}
