package application.assetLibs{
	import flash.display.Sprite;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;

	public class Shared extends Sprite {

		public var mySo:SharedObject;

		public function Shared() {
			Settings._sharedObj = this;

			// clearBtn.addEventListener(MouseEvent.CLICK, clearValue);

			mySo=SharedObject.getLocal("application-name");
			//trace("SharedObject loaded...\n",mySo.data.scrX);

		}


		public function saveValue(intLang:String = null):void {
			trace("saving value...\n");
			
			mySo.data.lang = intLang;
			

			var flushStatus:String=null;
			try {
				flushStatus=mySo.flush(10000);
			} catch (error:Error) {
				trace("Error...Could not write SharedObject to disk\n");
			}
			if (flushStatus!=null) {
				switch (flushStatus) {
					case SharedObjectFlushStatus.PENDING :
						trace("Requesting permission to save object...\n");
						mySo.addEventListener(NetStatusEvent.NET_STATUS,onFlushStatus);
						break;
					case SharedObjectFlushStatus.FLUSHED :
						trace("Value flushed to disk.\n");
						break;
				}
			}
			trace("\n");
		}

		private function clearValue(event:MouseEvent):void {
			trace("Cleared saved value...Reload SWF and the value should be \"undefined\".\n\n");
			delete mySo.data.lang;
		}

		private function onFlushStatus(event:NetStatusEvent):void {
			trace("User closed permission dialog...\n");
			switch (event.info.code) {
				case "SharedObject.Flush.Success" :
					trace("User granted permission -- value saved.\n");
					break;
				case "SharedObject.Flush.Failed" :
					trace("User denied permission -- value not saved.\n");
					break;
			}
			trace("\n");
			mySo.removeEventListener(NetStatusEvent.NET_STATUS,onFlushStatus);
		}
	}
}