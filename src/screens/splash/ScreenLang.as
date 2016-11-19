package screens.splash {
	import application.utils.MyCanvas;
	import feathers.controls.Button;
	import feathers.controls.PanelScreen;
	import feathers.controls.Screen;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.layout.VerticalLayoutData;
	import feathers.skins.ImageSkin;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.text.TextFormat;
	
	import starling.events.Event;
	
	/**
	 * Pops this screen from the stack to return to the previous screen. An
	 * event is mapped to the pop action by calling addPopEvent() on the
	 * StackScreenNavigatorItem.
	 *
	 * item.addPopEvent(Event.CANCEL);
	 */
	[Event(name = "cancel", type = "starling.events.Event")]
	
	/**
	 * Replaces this screen with another screen at the same position in the
	 * stack. An event is mapped to the replace action by calling
	 * setScreenIDForReplaceEvent() on the StackScreenNavigatorItem.
	 *
	 * item.setScreenIDForReplaceEvent(Event.CHANGE, otherScreenID);
	 */
	[Event(name = "change", type = "starling.events.Event")]
	
	/**
	 * Pushes another screen onto the stack. An event is mapped to the push
	 * action by calling setScreenIDForPushEvent() on the
	 * StackScreenNavigatorItem.
	 *
	 * item.setScreenIDForPushEvent(Event.COMPLETE, otherScreenID);
	 */
	[Event(name = "complete", type = "starling.events.Event")]
	
	public class ScreenLang extends Screen {
		
		private var btnStyle:TextFormat;
		private var btnQuad:Quad;
		private var btnSkin:ImageSkin;
		
		private var bgQuad:Quad;
		private var bgSkin:Image;
		
		private var kaLangBtn:Button;
		private var enLangBtn:Button;
		private var ruLangBtn:Button;
		
		private var line:MyCanvas;
		
		public function ScreenLang() {
			super();
			//this.title = "Screen B1";
		}
		
		override protected function initialize():void {
			super.initialize();
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.MIDDLE;
			layout.gap = 10;
			layout.paddingTop = 50;
			this.layout = layout;
			
			bgQuad = new Quad(400, 400, 0xffffff);
			bgSkin = new Image(bgQuad.texture);
			
			this.backgroundSkin = bgSkin
			
			btnQuad = new Quad(400, 80);
			btnSkin = new ImageSkin(btnQuad.texture);
			btnSkin.scale9Grid = new Rectangle(2, 3, 3, 8);
			
			btnStyle = new TextFormat;
			btnStyle.font = '_bpgArialRegular';
			btnStyle.size = 24;
			btnStyle.color = 0x575757;
			
			line = new MyCanvas;
			addChild(line);
			line.lineStyle(2, 0xd6dde1);
			line.lineTo(0, 0);
			line.lineTo(300, 0);
			
			kaLangBtn = new Button();
			kaLangBtn.label = "ქართული";
			//popToAButton.layoutData = new VerticalLayoutData(50);
			kaLangBtn.addEventListener(Event.TRIGGERED, popToAButton_triggeredHandler);
			kaLangBtn = addBtnSkin(this, btnStyle, btnSkin, kaLangBtn);
			
			line = new MyCanvas;
			addChild(line);
			line.lineStyle(2, 0xd6dde1);
			line.lineTo(0, 0);
			line.lineTo(300, 0);
			
			enLangBtn = new Button();
			enLangBtn.label = "English";
			//pushCButton.layoutData = new VerticalLayoutData(50);
			enLangBtn.addEventListener(Event.TRIGGERED, pushCButton_triggeredHandler);
			enLangBtn = addBtnSkin(this, btnStyle, btnSkin, enLangBtn);
			
			line = new MyCanvas;
			addChild(line);
			line.lineStyle(2, 0xd6dde1);
			line.lineTo(0, 0);
			line.lineTo(300, 0);
			
			ruLangBtn = new Button();
			ruLangBtn.label = "Русский";
			//replaceWithB2Button.layoutData = new VerticalLayoutData(50);
			ruLangBtn.addEventListener(Event.TRIGGERED, replaceWithB2Button_triggeredHandler);
			ruLangBtn = addBtnSkin(this, btnStyle, btnSkin, ruLangBtn);
			
			line = new MyCanvas;
			addChild(line);
			line.lineStyle(2, 0xd6dde1);
			line.lineTo(0, 0);
			line.lineTo(300, 0);
		}
		
		private function addBtnSkin(cont:Screen, fStyle:TextFormat, bSkin:ImageSkin ,btn:Button):Button {
			btn.fontStyles = fStyle;
			
			btn.labelFactory = function():ITextRenderer {
				var renderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				renderer.embedFonts = true;
				//renderer.textFormat = btnStyle
				return renderer;
			}
			btn.defaultSkin = bSkin;
			this.addChild(btn);
			btn.validate();
			return btn;
		}
		
		protected function popToAButton_triggeredHandler(event:Event):void {
			//this.dispatchEventWith(Event.CANCEL);
			this.dispatchEventWith(Event.COMPLETE);
		}
		
		protected function pushCButton_triggeredHandler(event:Event):void {
			this.dispatchEventWith(Event.COMPLETE);
		}
		
		protected function replaceWithB2Button_triggeredHandler(event:Event):void {
			//this.dispatchEventWith(Event.CHANGE);
			this.dispatchEventWith(Event.COMPLETE);
		}
	}
}
