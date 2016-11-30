package application.assetLibs{

	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.net.LocalConnection;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.Security;
	import flash.system.LoaderContext;
	import flash.events.HTTPStatusEvent;
	import flash.events.ProgressEvent;
	import flash.events.IEventDispatcher;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.system.System;

	public class Mui extends EventDispatcher {
		
		private var $loader:URLLoader;
		private var $muiObject:Object;
		private var $request:URLRequest;
		
		public var _loaded:Boolean;

		public function Mui(langRemoteURL:String='') {

			$loader = new URLLoader();
			$loader.addEventListener(Event.COMPLETE, onXmlComplete);
			
			var $url:String = langRemoteURL;
			
			$request = new URLRequest($url);//MainSettings.instance.baseDomain+  ?+ Math.random() * 1589
			
			configureListeners($loader);
			
			try {
				$loader.load($request);
			
				//throw new Error('\n XML MUI : ' + request.url);
				
			} catch (error:Error) {
				
				throw new Error('\n XML MUI ERROR: '+error);

			}	
		}
				
		
		
	    private function onXMLOpenHandler(event:Event):void {
           // trace("openHandler: " + event);

        }

        private function onXMLOprogressHandler(event:ProgressEvent):void {
           //race("progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
		    //MainSettings.instance.container.preloader._updateProgress(event.bytesTotal, event.bytesLoaded , null,'Loading Mui Pack...');
			
        }

        private function onXMLSecurityErrorHandler(event:SecurityErrorEvent):void {
          // MainSettings.instance.container.debTxt.text += 'ERROR SecurityErrorEvent MUI: '+event+' \n';
			
        }

        private function onXMLHttpStatusHandler(event:HTTPStatusEvent):void {
          
			//MainSettings.instance.container.debTxt.text += 'ERROR HTTPStatusEvent MUI: '+event+' \n';
        }

        private function onXMLIoErrorHandler(event:IOErrorEvent):void {
			
			//MainSettings.instance.container.preloader.error_txt.text = 'ERROR IOErrorEvent MUI: ' + event;
			//MainSettings.instance.container.debTxt.text += 'ERROR IOErrorEvent MUI: '+event+' \n';
        }
		
		
		private function onXmlComplete(e:Event):void {
		
			try {
				
				$muiObject = new Object  ;
				
				var xmlCont:XML = new XML(e.target.data);
				var muiLength:uint = xmlCont.children().length();
				for (var i:uint = 0; i < muiLength; i++) {
					var $key:String = String(xmlCont.children()[i].attribute('word')).toString();
					$muiObject[$key];
					
					var muiLengthInt:uint = xmlCont.children()[i].children().length();
					var langArray:Array = new Array;
					var intLangID:Object = new Object;

					for (var k:uint = 0; k<muiLengthInt; k++) {
						var IDSringer:String = String(xmlCont.children()[i].children()[k].attribute('ID')).toString();
						intLangID[IDSringer] = String(xmlCont.children()[i].children()[k]).toString();
						
						$muiObject[$key] = intLangID;
					}
				}
				
				

				Settings._mui = $muiObject;
				System.disposeXML(xmlCont);
			
				_loaded = true;
				
				configureRemoveListeners($loader);
				dispatchEvent(new AppEvent(AppEvent.RESOURCE_LOADED, null, true));
				

			} catch (e:TypeError) {
				
				//MainSettings.instance.container.preloader.error_txt.text = 'ERROR PARCING MUI: ' +e;
				//MainSettings.instance.container.debTxt.text += 'ERROR READEING MUI: '+TypeError+' \n';

			}
		}
		
		private function configureRemoveListeners(dispatcher:IEventDispatcher):void {
			dispatcher.removeEventListener(Event.COMPLETE, onXmlComplete);
            dispatcher.removeEventListener(Event.OPEN, onXMLOpenHandler);
            dispatcher.removeEventListener(ProgressEvent.PROGRESS, onXMLOprogressHandler);
            dispatcher.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onXMLSecurityErrorHandler);
            dispatcher.removeEventListener(HTTPStatusEvent.HTTP_STATUS, onXMLHttpStatusHandler);
            dispatcher.removeEventListener(IOErrorEvent.IO_ERROR, onXMLIoErrorHandler);
		}
		
		private function configureListeners(dispatcher:IEventDispatcher):void {
            dispatcher.addEventListener(Event.COMPLETE, onXmlComplete);
            dispatcher.addEventListener(Event.OPEN, onXMLOpenHandler);
            dispatcher.addEventListener(ProgressEvent.PROGRESS, onXMLOprogressHandler);
            dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onXMLSecurityErrorHandler);
            dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, onXMLHttpStatusHandler);
            dispatcher.addEventListener(IOErrorEvent.IO_ERROR, onXMLIoErrorHandler);
        }
	}
}