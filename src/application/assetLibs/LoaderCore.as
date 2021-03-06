﻿package application.assetLibs {
	
	import flash.display.Loader
	import flash.events.EventDispatcher;
	import flash.net.LocalConnection;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.Security;
	import flash.system.LoaderContext;
	import flash.events.HTTPStatusEvent;
	import flash.events.ProgressEvent;
	import flash.events.IEventDispatcher;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.system.SecurityDomain;
	
	public class LoaderCore extends EventDispatcher {
		
		private var $loader:Loader;
		private var $lc:LoaderContext;
		private var request:URLRequest;
		private var $request:URLRequest;
		
		public var _loaded:Boolean;

		public function _callLoadAssets(asset:String):void {
			$loader = new Loader();
			
			$lc = new LoaderContext(false, ApplicationDomain.currentDomain, null);
			//$lc.checkPolicyFile = true;
			
			var $url:String = asset;
			
			$request = new URLRequest($url); //MainSettings.instance.baseDomain+  ?+ Math.random() * 1589
			
			_configureListeners($loader.contentLoaderInfo);
			
			try {
				$loader.load($request, $lc);
					//throw new Error('\n XML MUI : ' + request.url);
			} catch (error:Error) {
				throw new Error('\n XML MUI ERROR: ' + error);
			}
		}
		
		/*private function getDomain():String {
			var uri:String = MainSettings.instance.containerStage.loaderInfo.loaderURL;
			uri = uri.substring(uri.indexOf("//") + 2, uri.length);
			uri = uri.substring(0, uri.indexOf("/"));
			var urp:String = MainSettings.instance.containerStage.loaderInfo.loaderURL;
			urp = urp.substring(0, urp.indexOf("//") + 2);
			uri = urp + uri;
			return uri;
		}*/
		
		public function _onComplete(event:Event):void {
				
		}
		public function _onOpenHandler(event:Event):void {
			//trace("openHandler: " + event);
		}
		
		public function _onProgressHandler(event:ProgressEvent):void {
			//trace("progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
		}
		
		public function _onSecurityErrorHandler(event:SecurityErrorEvent):void {
			//trace("onSecurityErrorHandler: " + event);
			//MainSettings.instance.container.preloader.error_txt.text = event;
		}
		
		public function _onHttpStatusHandler(event:HTTPStatusEvent):void {
			//trace("onHttpStatusHandler: " + event);
		}
		
		public function _onIoErrorHandler(event:IOErrorEvent):void {
			// MainSettings.instance.container.preloader.error_txt.text = event;
			// trace("onIoErrorHandler: " + event);
		}
		
		public function _configureRemoveListeners():void {
			
			$loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, _onComplete);
			$loader.contentLoaderInfo.removeEventListener(Event.OPEN, _onOpenHandler);
			$loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, _onProgressHandler);
			$loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, _onSecurityErrorHandler);
			$loader.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS, _onHttpStatusHandler);
			$loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, _onIoErrorHandler);
			
			$loader.unloadAndStop();
			$loader = null;
		}
		
		public function _configureListeners(dispatcher:IEventDispatcher):void {
			dispatcher.addEventListener(Event.COMPLETE, _onComplete);
			dispatcher.addEventListener(Event.OPEN, _onOpenHandler);
			dispatcher.addEventListener(ProgressEvent.PROGRESS, _onProgressHandler);
			dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _onSecurityErrorHandler);
			dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, _onHttpStatusHandler);
			dispatcher.addEventListener(IOErrorEvent.IO_ERROR, _onIoErrorHandler);
		}
	}
}