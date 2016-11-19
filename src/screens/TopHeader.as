package screens {
	import application.AssetsLoader;
	import application.utils.DeviceInfo;
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.skins.ImageSkin;
	import flash.geom.Rectangle;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.textures.TextureSmoothing;
	

	public class TopHeader extends Header {
		
		private var btnLeftSkin:ImageSkin;
		private var btnRightSkin:ImageSkin;
		private var bgQuad:Quad;
		private var bgSkin:Image;
		
		public static const TOGGLE_LEFT_DRAWER:String = "toggleLeftDrawer";
		
		
		public function TopHeader() {
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, added)
			
		}
		
		private function added(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, added);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removed);
			
			bgQuad = new Quad(400, 400, 0xffffff);
			bgSkin = new Image(bgQuad.texture);
			this.backgroundSkin = bgSkin;
			this.paddingLeft = Settings._getIntByDPI(30);
			this.paddingRight = Settings._getIntByDPI(30);
			
			btnLeftSkin = new ImageSkin(AssetsLoader._asset.getTexture("menu_flow_btn.png"));
			btnLeftSkin.textureSmoothing = TextureSmoothing.TRILINEAR;
			btnRightSkin = new ImageSkin(AssetsLoader._asset.getTexture("faq_btn.png"));
			btnRightSkin.textureSmoothing = TextureSmoothing.TRILINEAR;
			
			var backButton:Button = new Button();
			backButton.width = Settings._getIntByDPI(48);
			backButton.height = Settings._getIntByDPI(34);
			backButton.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);
			//backButton.label = "MENU";
			backButton.defaultSkin = btnLeftSkin;
			leftItems = new <DisplayObject>[ backButton ];
			
			
			var FAQButton:Button = new Button();
			FAQButton.width = Settings._getIntByDPI(50);
			FAQButton.height = Settings._getIntByDPI(50);
			FAQButton.defaultSkin = btnRightSkin;
			rightItems = new <DisplayObject>[ FAQButton ];
			
			
			this.width = stage.stageWidth;
			this.height = Settings._getIntByDPI(130);
			
			
			
			
			validate();
		}
		
		private function backButton_triggeredHandler(e:Event):void {
			this.dispatchEventWith(TOGGLE_LEFT_DRAWER, true);
		}
		
		private function removed(e:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			
		}
		
	}

}