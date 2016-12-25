package application {
	import flash.filesystem.File;
	import starling.utils.AssetManager;
	import starling.events.Event;
	
	[AppEvent(name = "assetsLoaded", type = "AppEvent")]
	
	public class AssetsLoader extends AssetManager {
		
		public var _loaded:Boolean;
		public static var _asset:AssetsLoader;
		
		public function AssetsLoader(scaleFactor:Number=1, useMipmaps:Boolean=false):void {
			super(scaleFactor, useMipmaps);
			_asset = this;
			
			
			var appDir:File = File.applicationDirectory;
			
			this.enqueue(appDir.resolvePath("assets/assets.xml"));
			this.enqueue(appDir.resolvePath("assets/assets.png"));
			
			this.enqueue(appDir.resolvePath("assets/assets_x" + 3 + ".xml"));
			this.enqueue(appDir.resolvePath("assets/assets_x" + 3 + ".png"));
			
			
			this.loadQueue(function(ratio:Number):void {
				//trace("Loading assets, progress:", ratio);
			 
				// -> When the ratio equals '1', we are finished.
				if (ratio == 1.0) {
					_loaded = true;
					
				}	
			});
		}
	}
}