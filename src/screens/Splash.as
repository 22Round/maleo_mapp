package screens {
	import application.AssetsLoader;
	import application.utils.DeviceInfo;
	import feathers.controls.LayoutGroup;
	import feathers.controls.StackScreenNavigator;
	import feathers.controls.StackScreenNavigatorItem;
	import feathers.events.FeathersEventType;
	import screens.splash.ScreenIntro;
	import screens.splash.ScreenLang;
	import screens.splash.ScreenLoginCase;
	import screens.splash.ScreenRegistration;
	import screens.splash.ScreenLogin;
	import feathers.motion.Fade;
	import feathers.motion.Slide;
	import feathers.themes.MetalWorksMobileTheme;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.filters.DropShadowFilter;
	import starling.textures.Texture;
	
	import starling.events.Event;
	
	public class Splash extends LayoutGroup {
		
		private static const SCREEN_INTRO:String = "Intro";
		private static const SCREEN_LANG:String = "Language";
		private static const SCREEN_LOGINCASE:String = "LoginCase";
		private static const SCREEN_REGISTER:String = "Registration";
		private static const SCREEN_LOGIN:String = "Login";
		
		private var logoWiteTexture:Texture;
		private var logoBlueTexture:Texture;
		
		private var logoImg:Image;
		
		
		public function Splash() {
			new MetalWorksMobileTheme();
			super();
		}
		
		private var _navigator:StackScreenNavigator;
		
		override protected function initialize():void {
			
			var quad:Quad = new Quad(50, stage.stageHeight);
			quad.alpha = 1;
			quad.filter = new DropShadowFilter(4, Math.PI);
			addChild(quad);
			
			logoWiteTexture = AssetsLoader._asset.getTexture("maleo_logo_wite.png");
			logoBlueTexture = AssetsLoader._asset.getTexture("maleo_logo_blue.png");
			
			logoImg = new Image(logoWiteTexture);
			logoImg.width = 280 * DeviceInfo.dpiScaleMultiplier;
			logoImg.height = 55 * DeviceInfo.dpiScaleMultiplier;
			logoImg.x = Math.round((stage.stageWidth - logoImg.width) / 2);
			logoImg.y = 211 * DeviceInfo.dpiScaleMultiplier;
			
			this._navigator = new StackScreenNavigator();
			this._navigator.pushTransition = Slide.createSlideLeftTransition();
			this._navigator.popTransition = Slide.createSlideRightTransition();
			this._navigator.addEventListener(FeathersEventType.TRANSITION_START, navigatorTransitionCompleteHandler);
			
			var itemIntro:StackScreenNavigatorItem = new StackScreenNavigatorItem(ScreenLoginCase);//ScreenIntro
			itemIntro.setScreenIDForPushEvent(Event.COMPLETE, SCREEN_LANG);
			this._navigator.addScreen(SCREEN_INTRO, itemIntro);
			
			var itemLang:StackScreenNavigatorItem = new StackScreenNavigatorItem(ScreenLang);
			itemLang.setScreenIDForPushEvent(Event.COMPLETE, SCREEN_LOGINCASE);
			itemLang.setScreenIDForReplaceEvent(Event.CHANGE, SCREEN_LOGIN);
			itemLang.addPopEvent(Event.CANCEL);
			this._navigator.addScreen(SCREEN_LANG, itemLang);
			
			var itemLoginCase:StackScreenNavigatorItem = new StackScreenNavigatorItem(ScreenLoginCase);
			//itemLoginCase.pushTransition = Fade.createFadeInTransition();
			itemLoginCase.addPopEvent(Event.CANCEL);
			this._navigator.addScreen(SCREEN_LOGINCASE, itemLoginCase);
			
			/*var itemC:StackScreenNavigatorItem = new StackScreenNavigatorItem(ScreenLogin);
			itemC.addPopToRootEvent(Event.CLOSE);
			itemC.addPopEvent(Event.CANCEL);
			this._navigator.addScreen(SCREEN_LOGIN, itemC);*/
			
			this._navigator.rootScreenID = SCREEN_INTRO;
			this.addChild(this._navigator);
			this.validate();
			
			addChild(logoImg);
			
			var topH:TopHeader = new TopHeader;
			addChild(topH);
		
		}
		
		private function navigatorTransitionCompleteHandler(e:Event):void {
			
			switch(StackScreenNavigator(e.target).activeScreenID) {
				
				case SCREEN_INTRO:
					
					logoImg.texture = logoWiteTexture;
					
					break;
					
				case SCREEN_LANG:
				case SCREEN_LOGIN:
				case SCREEN_REGISTER:
					
					logoImg.texture = logoBlueTexture;
					
					break;
					
			}
		}
	}
}
