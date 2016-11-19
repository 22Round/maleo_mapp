package application{
	//import application.assetLibs.FontLoader;
	import application.assetLibs.ItemLoader;
	import application.assetLibs.Mui;
	import application.assetLibs.SoundLoader;
	import com.greensock.TweenLite;
	
	//import application.connectors.ServerAuth;
	import flash.display.MovieClip;
	import flash.display.StageDisplayState;
	import flash.system.Security;
	import application.MainSettings;
	import flash.events.*;

	
	import flash.ui.ContextMenu;
    import flash.ui.ContextMenuItem;
    import flash.ui.ContextMenuBuiltInItems;
    import flash.events.ContextMenuEvent;
	
	public class TableSetData extends MovieClip {
		
		private var $fonsLaoded:Boolean = true;
		private var $itemLaoded:Boolean;
		private var $muiLoaded:Boolean;
		private var $soundLoaded:Boolean 
		
		private var $serverAuth:Boolean =  true;
		
		private var $root;
		private var $stage;
		
		private var $mui:Mui;
		//private var $fonts:FontLoader;
		private var $item:ItemLoader;
		private var $sound:SoundLoader;
		//var $server:ServerAuth;
		
		
		public function TableSetData() {
			
			 //need real crossdomain XML policy file !!!

			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
				
		private function onRemoved(e:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
			stage.removeEventListener(Event.RESIZE, resizeHandler);
		}
		
		
		function resizeHandler(event:Event):void {
		  if (stage.stageHeight > 0 && stage.stageWidth > 0) {
			stage.removeEventListener(Event.RESIZE, resizeHandler); // only execute once
			// your initialization code here
		  }
		}
		
		private function added(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, added);
			
			stage.addEventListener(Event.RESIZE, resizeHandler);
			stage.dispatchEvent(new Event(Event.RESIZE)); // force stage resize event for normal cases 
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemoved)

			MainSettings.instance.container = root;
			MainSettings.instance.containerStage = stage;
			MainSettings._lang = 'ka';
			MainSettings.instance.langIndex = 0;
			MainSettings.instance.globalSoundValume = .7;
			
			$root = root;
			$stage = stage;
			
			
			var $protocol:String;
			var $url:String;
			var $xmlGenerator:String;
			
			Security.allowDomain('*');
			Security.allowInsecureDomain('*');
			
			if($root.loaderInfo.parameters && $root.loaderInfo.parameters.protocol){
				$protocol = $root.loaderInfo.parameters.protocol+'://';
			}else{
				$protocol = 'http://';
			}
			
			MainSettings._httpProtocol = $protocol;
			
					
			MainSettings.instance.XMLgeneratePath = $protocol + $url + $xmlGenerator;
			
			
			var $dis:BigDistractorPreLoader = new BigDistractorPreLoader;
			MainSettings.instance.bigDistractorPreLoader = $dis;
			
			/*var fullscreenCM:ContextMenu = new ContextMenu();
			fullscreenCM.hideBuiltInItems();

			var fs:ContextMenuItem = new ContextMenuItem("Developed by" );
			//fs.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, toggleFullScreen);
			fullscreenCM.customItems.push( fs );
			
			
			MainSettings.instance.container.contextMenu = fullscreenCM;*/
			

			
			//MovieClip(root).gotoAndStop(3);
			
			$mui = new Mui(MainSettings._httpProtocol, 'mygame.ge/uploads/games/jokerjapanese/muiPack/muiXML.xml');
			$mui.addEventListener(AppEvent.MUI_PACK_LOADED, _muiLoaderHandler);
			
			
			//stage.displayState = StageDisplayState.FULL_SCREEN;
			
			//MainSettings.instance.container.debTxt.text += 'added DATA';
			//MovieClip(root).debTxt.mouseEnabled = false;

			//MainSettings.instance.containerStage.addEventListener(KeyboardEvent.KEY_DOWN, _fullScreenKeyDownHandler);
			
			
		}

		private function _fullScreenKeyDownHandler(event:KeyboardEvent):void {
			/*trace("keyDownHandler: " + event.keyCode);
            trace("ctrlKey: " + event.ctrlKey);
            trace("keyLocation: " + event.keyLocation);
            trace("shiftKey: " + event.shiftKey);
            trace("altKey: " + event.altKey);*/
			
			if (event.keyCode == 70 && event.ctrlKey == true && event.altKey == true) {
				setDisplayState(null);
			}
		}
		

		
		private function toggleFullScreen(event:ContextMenuEvent):void {
			setDisplayState(null);
		}
		
		private function setDisplayState(event:MouseEvent):void {
			if (MainSettings.instance.containerStage.displayState == StageDisplayState.NORMAL) {
				
				//var screenRectangle:Rectangle = new Rectangle(0, 0, 800, 600);
				//stage.fullScreenSourceRect = screenRectangle;
				MainSettings.instance.containerStage.displayState = StageDisplayState.FULL_SCREEN;
			}else {
				
				MainSettings.instance.containerStage.displayState = StageDisplayState.NORMAL;
			}
		}
		
		private function _checkedLaoder():void {
			
			
			if ($fonsLaoded && $itemLaoded && $muiLoaded && $serverAuth && $soundLoaded) {
				
				$mui = null;
				//$fonts = null;
				$item = null;
				$sound = null;
				//$server = null;
				
				MovieClip(root).gotoAndStop(3);
				/*return;*/
				/*MainSettings.instance.container.preloader.logo.play();
				MainSettings.instance.container.preloader.txt.text = '';
				MainSettings.instance.container.preloader.progressbar.visible = false;
				TweenLite.delayedCall(3, function(){MovieClip(root).gotoAndStop(3);});*/
				
			}
		}
		
		private function _muiLoaderHandler(e:AppEvent):void {
			e.target.removeEventListener(AppEvent.FONTLIBRARY_LOADED, _muiLoaderHandler);
			$muiLoaded = true;
				
			/*$fonts = new FontLoader;
			$fonts.addEventListener(AppEvent.FONTLIBRARY_LOADED, _fontsLoaderHandler);*/
			
						
			$item = new ItemLoader;
			$item.addEventListener(AppEvent.ITEMLIBRARY_LOADED, _itemLoaderHandler);
			
			_checkedLaoder();
		}
		
		private function _fontsLoaderHandler(e:AppEvent):void {
			
			e.target.removeEventListener(AppEvent.FONTLIBRARY_LOADED, _fontsLoaderHandler);
			
			$fonsLaoded = true;

			
			_checkedLaoder();
		}
		
		
		private function _itemLoaderHandler(e:AppEvent):void {
			
			e.target.removeEventListener(AppEvent.ITEMLIBRARY_LOADED, _itemLoaderHandler);
			$itemLaoded = true;
			
			
			$sound = new SoundLoader;
			$sound.addEventListener(AppEvent.SOUND_LIBRARY_LOADED, _soundLoaderHandler);
			
			_checkedLaoder();
			
		}
		
		private function _soundLoaderHandler(e:AppEvent):void {
			e.target.removeEventListener(AppEvent.SOUND_LIBRARY_LOADED, _soundLoaderHandler);
			$soundLoaded = true;
			_checkedLaoder();
			/*$server = new ServerAuth;
			
			$server.addEventListener(AppEvent.SERVER_AUTH, _serverLoaderHandler);*/
			
			
			
		}
		
		private function _serverLoaderHandler(e:AppEvent):void {
			e.target.removeEventListener(AppEvent.SERVER_AUTH, _serverLoaderHandler);
			$serverAuth = true;
			
			_checkedLaoder();
		}
		

		


	}
}