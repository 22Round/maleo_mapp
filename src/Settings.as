package  {


	import application.assetLibs.Shared;
	import application.utils.DeviceInfo;
	import application.utils.SendAndLoadData;
	import flash.text.engine.FontLookup;
	import flash.text.engine.Kerning;
	import flash.text.engine.RenderingMode;
	import flash.text.engine.TextRotation;
	import flash.text.AntiAliasType;
	import flash.text.TextFieldAutoSize;
	
	/*import fl.text.TLFTextField;
	import flashx.textLayout.formats.TextLayoutFormat;
	import flashx.textLayout.elements.TextFlow;
	import flash.text.engine.FontLookup;
	import flash.text.engine.Kerning;
	import flash.text.engine.RenderingMode;
	import flash.text.engine.TextRotation;
	import flash.text.AntiAliasType;
	import flash.text.TextFieldAutoSize;
	import flashx.textLayout.formats.TextAlign;
	import flash.external.ExternalInterface;*/


	public class Settings {
		
		private static var __instance:Settings;
		private static var __allowInstantiation:Boolean = false;

		public static var _accessToken:String;
		public static var _userID:String = '0215587';
		
		public static var _lang:String;
		public static var _muiPack:Object;
		public static var _sharedObj:Shared;
		
		
		//ITEM LIBRARY
				
		//fonts...
		public static function get instance():Settings {
			if (! __instance) {
				__allowInstantiation=true;
				__instance=new Settings  ;
				__allowInstantiation=false;
			}
			return __instance;
		}
		
		public function Settings() {

			if (! __allowInstantiation) {
				throw new Error("используй  MainSettings.instance");
			}
		}

		public static function debugFullString(stringer:String):String {
			var myPattern:RegExp=/\r\n/g;
			return stringer.replace(myPattern,'');
		}
		
		
		public static function debugFullHTMLString(stringer:String):String {
			var myPattern:RegExp=/<3/g;
			return stringer.replace(myPattern,'♥');
		}
		
		
		public static function _getIntByDPI(exInt:int = 0):int {
			return int(exInt * DeviceInfo.dpiScaleMultiplier);
		}


		
		public static function callSandAndLoad(url:String, obj:Object, method:String, callBack:Function):void {
			var $send:SendAndLoadData = new SendAndLoadData(false);
			$send.initUser(url, obj, method);//MainSettings.instance.XMLgeneratePathRating  'xmlMuiPack/ratingAllXml.xml.xml'
			$send.addEventListener(AppEvent.XML_LOADED, callBack);
		}
	}
}