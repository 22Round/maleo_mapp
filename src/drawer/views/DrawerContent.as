package drawer.views {
	import application.AssetsLoader;
	import application.utils.DeviceInfo;
	import feathers.controls.LayoutGroup;
	import feathers.controls.StackScreenNavigator;
	import feathers.controls.StackScreenNavigatorItem;
	import feathers.events.FeathersEventType;
	import feathers.motion.Reveal;
	import screens.ScreenID;
	import screens.posta.ScreenMainMails;
	import screens.splash.ScreenIntro;
	import screens.splash.ScreenLang;
	import screens.splash.ScreenLoginCase;
	import screens.splash.ScreenRegistration;
	import screens.splash.ScreenLogin;
	import feathers.motion.Fade;
	import feathers.motion.Slide;
	import feathers.motion.Cover;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.filters.DropShadowFilter;
	import starling.textures.Texture;
	
	import starling.events.Event;
	
	public class DrawerContent extends LayoutGroup {

		public function DrawerContent() {
			
			super();
		}
		
		private var navigator:StackScreenNavigator;
		
		override protected function initialize():void {

			
			navigator = new StackScreenNavigator();
			navigator.pushTransition = Cover.createCoverUpTransition();
			navigator.popTransition = Reveal.createRevealDownTransition();
			navigator.addEventListener(FeathersEventType.TRANSITION_START, navigatorTransitionCompleteHandler);
			
			var item:StackScreenNavigatorItem = new StackScreenNavigatorItem(DrawerMain);//ScreenIntro  ScreenLoginCase ScreenAllMails
			item.setScreenIDForPushEvent(AppEvent.SETTINGS, ScreenID.DRAWER_SETTINGS);
			navigator.addScreen(ScreenID.DRAWER_MAIN, item);
			
			item = new StackScreenNavigatorItem(DrawerSettings);
			item.addPopToRootEvent(AppEvent.CLOSE);
			
			navigator.addScreen(ScreenID.DRAWER_SETTINGS, item);
			
			/*var itemC:StackScreenNavigatorItem = new StackScreenNavigatorItem(ScreenLogin);
			itemC.addPopToRootEvent(Event.CLOSE);
			itemC.addPopEvent(Event.CANCEL);
			this._navigator.addScreen(SCREEN_LOGIN, itemC);*/
			
			navigator.rootScreenID = ScreenID.DRAWER_MAIN;
			this.addChild(navigator);
			this.validate();
			
			this.width = stage.stageWidth  - Settings._getIntByDPI(stage.stageWidth / 4 - 20);
			
		}
		
		
		private function navigatorTransitionCompleteHandler(e:Event):void {
			
		}
	}
}
