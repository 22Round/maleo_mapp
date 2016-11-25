package screens {
	import application.AssetsLoader;
	import application.utils.DeviceInfo;
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import feathers.skins.ImageSkin;
	import flash.geom.Rectangle;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextFormat;
	import starling.textures.TextureSmoothing;
	

	public class TopHeader extends Header {
		
		private var btnLeftSkin:ImageSkin;
		private var btnRightSkin:ImageSkin;
		private var bgQuad:Quad;
		private var bgSkin:Image;
		private var titleGeoStyle:TextFormat;
		
		public static const TOGGLE_LEFT_DRAWER:String = "toggleLeftDrawer";
		
		public static const FAQ_BLUE_ITEM:String = 'faqBlueItem';
		public static const MENU_BLUE_ITEM:String = 'menuBlueItem';
		public static const FAQ_WHITE_ITEM:String = 'faqWhiteItem';
		public static const MENU_WHITE_ITEM:String = 'menuWhiteItem';
		public static const EDIT_WHITE_ITEM:String = 'editWhiteItem';
		public static const ARROWTOLEFT_WHITE_ITEM:String = 'arrowToLeftWhiteItem';
		public static const CLOSE_WHITE_ITEM:String = 'closeWhiteItem';
		
		public static const LEFT_ITEM:String = 'leftSideItm';
		public static const RIGHT_ITEM:String = 'rightSideItm';
		
		private var menuItems:Vector.<Object>;
		public static var _currentLeftItem:String;
		public static var _currentRightItem:String;
		
		
		
		public function TopHeader() {
			super();
			
			menuItems = new Vector.<Object>;
			
			menuItems.push({name:FAQ_BLUE_ITEM,            texture:'faq_blue_btn.png',              widthDPI:50,   heightDPI:50});
			menuItems.push({name:FAQ_WHITE_ITEM,           texture:'faq_white_btn.png',             widthDPI:50,   heightDPI:50});
			menuItems.push({name:MENU_BLUE_ITEM,           texture:'menu_blue_btn.png',             widthDPI:48,   heightDPI:34});
			menuItems.push({name:MENU_WHITE_ITEM,          texture:'menu_white_btn.png',            widthDPI:48,   heightDPI:34});
			menuItems.push({name:EDIT_WHITE_ITEM,          texture:'edit_white_btn.png',            widthDPI:41,   heightDPI:40});
			menuItems.push({name:ARROWTOLEFT_WHITE_ITEM,   texture:'arrowtoleft_white_btn.png',     widthDPI:47,   heightDPI:40});
			menuItems.push({name:CLOSE_WHITE_ITEM,         texture:'close_white_btn.png',           widthDPI:38,   heightDPI:38});
			
			
			this.addEventListener(Event.ADDED_TO_STAGE, added)
			
		}
		
		public function _changeBackgroundSkin(bgColor:uint = 0xffffff):void {
			var bgQuad:Quad = new Quad(10, 10, bgColor);
			
			this.backgroundSkin = bgQuad;
			//this.refreshBackgroundSkin();
			
		}
		
		private function added(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, added);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removed);
			
			this.paddingLeft = Settings._getIntByDPI(30);
			this.paddingRight = Settings._getIntByDPI(30);
			
			_setMenuItems(MENU_WHITE_ITEM, LEFT_ITEM);
			_setMenuItems(FAQ_WHITE_ITEM, RIGHT_ITEM);
			
			titleGeoStyle = new TextFormat;
			titleGeoStyle.font = '_hKolkhetyMtavBold';
			titleGeoStyle.size = Settings._getIntByDPI(30);
			titleGeoStyle.color = 0xFFFFFF;
			
			this.fontStyles = titleGeoStyle;
			title = 'mTavari123'
			
			titleFactory = function():ITextRenderer {
				var titleRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				titleRenderer.embedFonts = true;
				return titleRenderer;
			}
			
			this.width = stage.stageWidth;
			this.height = Settings._getIntByDPI(130);
			validate();
		}
		
		
		public function _setMenuItems(setIco:String, side:String = LEFT_ITEM):void {
			
			var skin:ImageSkin;
			var btn:Button;
			if(side == LEFT_ITEM && leftItems){
				while (leftItems.length>0) {
					leftItems.pop();
				}
				_currentLeftItem = '';
			}
			
			if(side == RIGHT_ITEM && rightItems){
				while (rightItems.length>0) {
					rightItems.pop();
				}
				_currentRightItem = '';
			}
			
			for (var i:uint; i < menuItems.length; i++ ) {
				if (setIco  == menuItems[i].name) {
					skin = new ImageSkin(AssetsLoader._asset.getTexture(menuItems[i].texture));
					skin.textureSmoothing = TextureSmoothing.TRILINEAR;
					btn = new Button();
					btn.width = Settings._getIntByDPI(menuItems[i].widthDPI);
					btn.height = Settings._getIntByDPI(menuItems[i].heightDPI);
					btn.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);
					btn.defaultSkin = skin;
					
					if (side == LEFT_ITEM) {
						
						if (!leftItems) leftItems = new <DisplayObject>[];
						leftItems.push(btn);
						_currentLeftItem = menuItems[i].name;
						
					}else if (side == RIGHT_ITEM) {
						
						if (!rightItems) rightItems = new <DisplayObject>[];
						rightItems.push(btn);
						_currentRightItem = menuItems[i].name;
						
					}else {
						
					}
					break;	
				}
			}
		}
		
		private function backButton_triggeredHandler(e:Event):void {
			this.dispatchEventWith(TOGGLE_LEFT_DRAWER, true);
		}
		
		private function removed(e:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
	}

}