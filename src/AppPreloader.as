package {
	import application.AssetsLoader;
	import application.assetLibs.FontLoader;
	import application.assetLibs.Mui;
	import feathers.system.DeviceCapabilities;
	import feathers.utils.ScreenDensityScaleFactorManager;
	import flash.desktop.NativeApplication;
	import flash.text.Font;
	import flash.utils.setTimeout;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageOrientation;
	import flash.display.StageScaleMode;
	import flash.display3D.Context3DProfile;
	import flash.display3D.Context3DRenderMode;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.system.Capabilities;
	import flash.utils.ByteArray;
	
	import starling.core.Starling;
	
	[SWF(width = "320", height = "480", frameRate = "60", backgroundColor = "#ffffff")]
	
	public class AppPreloader extends Sprite {
		/*DeviceCapabilities.dpi = 326;
		DeviceCapabilities.screenPixelWidth = 640;
		DeviceCapabilities.screenPixelHeight = 1136;*/
		
		
		public function AppPreloader() {
			if (this.stage) {
				this.stage.scaleMode = StageScaleMode.NO_SCALE;
				this.stage.align = StageAlign.TOP_LEFT;
				_cont = this;
			}
			this.mouseEnabled = this.mouseChildren = false;
			this.showLaunchImage();
			this.loaderInfo.addEventListener(Event.COMPLETE, loaderInfo_completeHandler);
		}
		
		private var starling:Starling;
		private var scaler:ScreenDensityScaleFactorManager;
		private var launchImage:Loader;
		private var savedAutoOrients:Boolean;
		
		private var assets:AssetsLoader;
		private var mui:Mui;
		private var fonts:FontLoader;
		private var savedScreenID:String;
		
		public static var _cont:AppPreloader;
		
		private function showLaunchImage():void {
			var filePath:String;
			var isPortraitOnly:Boolean = false;
			if (Capabilities.manufacturer.indexOf("iOS") >= 0) {
				
				var isCurrentlyPortrait:Boolean = this.stage.orientation == StageOrientation.DEFAULT || this.stage.orientation == StageOrientation.UPSIDE_DOWN;
				
				if (Capabilities.screenResolutionX == 1242 && Capabilities.screenResolutionY == 2208) {
					//iphone 6 plus
					filePath = isCurrentlyPortrait ? "Default-414w-736h@3x.png" : "Default-414w-736h-Landscape@3x.png";
				} else if (Capabilities.screenResolutionX == 1536 && Capabilities.screenResolutionY == 2048) {
					//ipad retina
					filePath = isCurrentlyPortrait ? "Default-Portrait@2x.png" : "Default-Landscape@2x.png";
				} else if (Capabilities.screenResolutionX == 768 && Capabilities.screenResolutionY == 1024) {
					//ipad classic
					filePath = isCurrentlyPortrait ? "Default-Portrait.png" : "Default-Landscape.png";
				} else if (Capabilities.screenResolutionX == 750) {
					//iphone 6
					isPortraitOnly = true;
					filePath = "Default-375w-667h@2x.png";
				} else if (Capabilities.screenResolutionX == 640) {
					//iphone retina
					isPortraitOnly = true;
					if (Capabilities.screenResolutionY == 1136) {
						filePath = "Default-568h@2x.png";
					} else {
						filePath = "Default@2x.png";
					}
				} else if (Capabilities.screenResolutionX == 320) {
					//iphone classic
					isPortraitOnly = true;
					filePath = "Default.png";
				}
			}
			
			if (filePath) {
				var file:File = File.applicationDirectory.resolvePath(filePath);
				if (file.exists) {
					var bytes:ByteArray = new ByteArray();
					var stream:FileStream = new FileStream();
					stream.open(file, FileMode.READ);
					stream.readBytes(bytes, 0, stream.bytesAvailable);
					stream.close();
					launchImage = new Loader();
					launchImage.loadBytes(bytes);
					this.addChild(launchImage);
					savedAutoOrients = this.stage.autoOrients;
					this.stage.autoOrients = false;
					if (isPortraitOnly) {
						this.stage.setOrientation(StageOrientation.DEFAULT);
					}
				}
			}
		}
		
		private function loaderInfo_completeHandler(event:Event):void {
			
			Starling.multitouchEnabled = true;
			Settings._lang = 'ka';
			
			starling = new Starling(Main, this.stage, null, null, Context3DRenderMode.AUTO, Context3DProfile.BASELINE);
			starling.supportHighResolutions = true;
			starling.skipUnchangedFrames = true;
			//this._starling.showStats = true;
			//this._starling.showStatsAt('right', 'bottom', 1);
			starling.antiAliasing = 2;
			starling.start();
			starling.addEventListener("rootCreated", starling_rootCreatedHandler);
			/*if (this._launchImage) {
				this._starling.addEventListener("rootCreated", starling_rootCreatedHandler);
			}*/
			
			scaler = new ScreenDensityScaleFactorManager(starling);
			this.stage.addEventListener(Event.DEACTIVATE, stageDeactivateHandler, false, 0, true);
		}
		
		private function starling_rootCreatedHandler(event:Object):void {
			
			mui = new Mui('mui/muiXML.xml');
			mui.addEventListener(AppEvent.RESOURCE_LOADED, resorceLoaderHandler);
			
			fonts = new FontLoader('FontsLibrary.swf');
			fonts.addEventListener(AppEvent.RESOURCE_LOADED, resorceLoaderHandler);
		}
		
		private function resorceLoaderHandler(e:AppEvent):void {
			e.target.removeEventListener(AppEvent.RESOURCE_LOADED, resorceLoaderHandler);
			
			if (mui && mui._loaded && fonts && fonts._loaded) {
				
				assets = new AssetsLoader(Starling.current.contentScaleFactor);
			}
		}
		
		
		public  function _assetLoaded():void{
			
			if (launchImage) {
				this.removeChild(launchImage);
				launchImage.unloadAndStop(true);
				launchImage = null;
				this.stage.autoOrients = savedAutoOrients;
				
				//if (savedScreenID) setTimeout(Settings._splash._navigator.replaceScreen, 1000, [savedScreenID]);
			}
		}
		
		private function stageDeactivateHandler(event:Event):void {
			//NativeApplication.nativeApplication.executeInBackground = true;
			Starling.current.nativeStage.frameRate = 0.1;
			starling.stop(true);
			this.stage.addEventListener(Event.ACTIVATE, stageActivateHandler, false, 0, true);
		}
		
		private function stageActivateHandler(event:Event):void {
			
			//if (Settings._splash._savedScreenID) savedScreenID = Settings._splash._savedScreenID;
			//NativeApplication.nativeApplication.executeInBackground = false;
			Starling.current.nativeStage.frameRate = 60;
			starling.start();
			this.stage.removeEventListener(Event.ACTIVATE, stageActivateHandler);
			
		}
	}
}