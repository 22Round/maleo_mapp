package screens {
	import application.AssetsLoader;
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import feathers.skins.ImageSkin;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextFormat;
	import starling.textures.TextureSmoothing;
	

	public class StatusBar extends Header {
		
		private var bgQuad:Quad;
		private var bgSkin:Image;
		private var titleGeoStyle:TextFormat;
		
		private var menuItems:Vector.<Object>;
		public static var _currentLeftItem:String;
		public static var _currentRightItem:String;
		
		
		
		public function StatusBar() {
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, added)
			
		}
		
		public function _changeTitle(titleStr:String = ''):void {
			title = titleStr;
		}
		
		public function _changeBackgroundSkin(bgColor:uint = 0x196d98):void {
			var bgQuad:Quad = new Quad(10, 10, bgColor);
			
			this.backgroundSkin = bgQuad;
			//this.refreshBackgroundSkin();
			
		}
		
		private function added(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, added);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removed);
			
			//_setMenuItems(MENU_WHITE_ITEM, LEFT_ITEM);
			//_setMenuItems(FAQ_WHITE_ITEM, RIGHT_ITEM);
			
			titleGeoStyle = new TextFormat;
			titleGeoStyle.font = '_bpgArialRegular';
			titleGeoStyle.size = Settings._getIntByDPI(20);
			titleGeoStyle.color = 0xFFFFFF;
			
			this.fontStyles = titleGeoStyle;
			title = 'სავარაუდო ჩამოფრენა - 2016, 23 ოქტომბერი';
			
			_changeBackgroundSkin();
			
			titleFactory = function():ITextRenderer {
				var titleRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				titleRenderer.embedFonts = true;
				return titleRenderer;
			}
			
			this.width = stage.stageWidth;
			this.height = Settings._getIntByDPI(60);
			validate();
		}
		
		private function removed(e:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
	}

}