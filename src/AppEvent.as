

package {
	
	import flash.events.Event;
	
	public class AppEvent extends Event {
		
		// global events
		
		public static const LIB_LOADED:String                  = 'libLoaded';
		public static const XML_LOADED:String                  = 'xmlLoaded';
		public static const RESOURCE_LOADED:String             = 'resourceLoaded';
		public static const ASSETS_LOADED:String               = 'assetsLoaded';
		
		//app event for animation, transform, dependences, error
		
		public static const COMPLETED:String              	   = 'completed';
		public static const SETTINGS:String              	   = 'settings';
		public static const CLOSE:String              	  	   = 'close';
		public static const CANCEL:String              	  	   = 'cancel';
		public static const CHANGE:String              	  	   = 'change';
		public static const REGISTER:String              	   = 'register';
		public static const LOGIN_FACEBOOK:String              = 'loginFacebook';
		public static const LOGIN_NATIVE:String                = 'loginNative';
		public static const POSTA_MENU_CALLBACK:String         = 'postaMenuCallBack';
		
	
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