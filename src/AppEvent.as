

package {
	
	import flash.events.Event;
	
	public class AppEvent extends Event {
		
		public static const LIB_LOADED:String                  = 'libLoaded';
		public static const XML_LOADED:String                  = 'xmlLoaded';
		public static const RESOURCE_LOADED:String             = 'resourceLoaded';
		public static const ASSETS_LOADED:String               = 'assetsLoaded';
	
		public var data:Object;
		
		public function AppEvent(type:String, data:Object=null, bubbles:Boolean=true, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
			this.data = data;
		}
		
		override public function clone():Event {
			return new AppEvent(type, data, bubbles, cancelable);
		}
		
		override public function toString():String {
			return '[ SlideEvent data=' + data.toString() + '" ]';
		}
	}
}