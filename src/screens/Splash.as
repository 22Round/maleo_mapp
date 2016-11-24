package screens {
	import application.AssetsLoader;
	import application.utils.DeviceInfo;
	import feathers.controls.LayoutGroup;
	import feathers.controls.StackScreenNavigator;
	import feathers.controls.StackScreenNavigatorItem;
	import feathers.events.FeathersEventType;
	import screens.posta.ScreenAllMails;
	import screens.splash.ScreenIntro;
	//import screens.splash.ScreenLang;
	//import screens.splash.ScreenLoginCase;
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
		
		private var logoWiteTexture:Texture;
		private var logoBlueTexture:Texture;
		
		private var logoImg:Image;
		private var shadowQade:Quad;
		private var topHeader:TopHeader;
		
		public function Splash() {
			
			super();
		}
		
		private var navigator:StackScreenNavigator;
		
		override protected function initialize():void {
			
			
			Settings._splash = this;
			
			
			_changeBackgroundSkin(0xecf0f4);
			topHeader = new TopHeader;
			
			logoWiteTexture = AssetsLoader._asset.getTexture("maleo_logo_wite.png");
			logoBlueTexture = AssetsLoader._asset.getTexture("maleo_logo_blue.png");
			
			logoImg = new Image(logoWiteTexture);
			logoImg.width = 280 * DeviceInfo.dpiScaleMultiplier;
			logoImg.height = 55 * DeviceInfo.dpiScaleMultiplier;
			logoImg.x = Math.round((stage.stageWidth - logoImg.width) / 2);
			logoImg.y = 211 * DeviceInfo.dpiScaleMultiplier;
			
			navigator = new StackScreenNavigator();
			navigator.pushTransition = Slide.createSlideLeftTransition();
			navigator.popTransition = Slide.createSlideRightTransition();
			navigator.addEventListener(FeathersEventType.TRANSITION_START, navigatorTransitionCompleteHandler);
			
			var item:StackScreenNavigatorItem = new StackScreenNavigatorItem(ScreenAllMails);//ScreenIntro  ScreenLoginCase ScreenAllMails
			item.setScreenIDForPushEvent(AppEvent.LOGIN_NATIVE, ScreenID.LOGIN_CASE);
			navigator.addScreen(ScreenID.INTRO, item);
			/*
			item = new StackScreenNavigatorItem(ScreenLang);
			item.setScreenIDForPushEvent(Event.COMPLETE, ScreenID.LOGIN_CASE);
			item.setScreenIDForReplaceEvent(Event.CHANGE, ScreenID.LOGIN_CASE);
			item.addPopEvent(Event.CANCEL);
			navigator.addScreen(ScreenID.LANG_SELECT, item);
			
			item = new StackScreenNavigatorItem(ScreenLoginCase);
			//itemLoginCase.pushTransition = Fade.createFadeInTransition();
			item.addPopEvent(Event.CANCEL);
			navigator.addScreen(ScreenID.LOGIN_CASE, item);
			*/
			/*var itemC:StackScreenNavigatorItem = new StackScreenNavigatorItem(ScreenLogin);
			itemC.addPopToRootEvent(Event.CLOSE);
			itemC.addPopEvent(Event.CANCEL);
			this._navigator.addScreen(SCREEN_LOGIN, itemC);*/
			
			navigator.rootScreenID = ScreenID.INTRO;//SCREEN_INTRO
			this.addChild(navigator);
			this.validate();
			
			//addChild(logoImg);
			
			
			addChild(topHeader);
			
			/*var bottomH:TopFooter = new TopFooter;
			addChild(bottomH);
			bottomH.y = stage.stageWidth - bottomH.height;*/
			
		}
		
		
		public function _changeBackgroundSkin(bgColor:uint = 0xffffff):void {
			var bgQuad:Quad = new Quad(10, 10, bgColor);
			
			this.backgroundSkin = bgQuad;
			this.refreshBackgroundSkin();
			
			if (shadowQade) {
				this.removeChild(shadowQade);
				shadowQade.dispose();
				shadowQade = null;
			}
			shadowQade = new Quad(50, stage.stageHeight, bgColor);
			shadowQade.filter = new DropShadowFilter(4, Math.PI);
			addChildAt(shadowQade,0);
			
		}
		
		private function navigatorTransitionCompleteHandler(e:Event):void {
			//addChild(logoImg);
			
			
			switch(StackScreenNavigator(e.target).activeScreenID) {
				
				case ScreenID.INTRO:
					topHeader._changeBackgroundSkin(0x00b7f0);
					logoImg.texture = logoWiteTexture;
					
					break;
					
				case ScreenID.LANG_SELECT:
				case ScreenID.LOGIN:
				case ScreenID.LOGIN_CASE:
				case ScreenID.REGISTER:
					
					logoImg.texture = logoBlueTexture;
					
					break;
					
				default:
					if(logoImg && contains(logoImg))removeChild(logoImg);
					
			}
		}
	}
}
