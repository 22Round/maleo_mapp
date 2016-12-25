package screens.splash {
	import application.utils.MyCanvas;
	import application.utils.StaticGUI;
	import feathers.controls.Button;
	import feathers.controls.Screen;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.skins.ImageSkin;
	import flash.geom.Rectangle;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextFormat;
	import starling.textures.RenderTexture;
	
	public class ScreenLang extends Screen {
		
		private var btnStyle:TextFormat;
		private var btnTexture:RenderTexture;
		private var btnSkin:ImageSkin;
		
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
			layout.gap = Settings._getIntByDPI(10);
			layout.paddingTop = Settings._getIntByDPI(50);
			this.layout = layout;
			
			
			btnTexture = new RenderTexture(Settings._getIntByDPI(400), Settings._getIntByDPI(80));
			btnSkin = new ImageSkin(btnTexture);
			
			
			btnStyle = new TextFormat;
			btnStyle.font = '_bpgArialRegular';
			btnStyle.size = Settings._getIntByDPI(24);
			btnStyle.color = 0x575757;
			
			line = new MyCanvas;
			addChild(line);
			line.lineStyle(Settings._getIntByDPI(3), 0xd6dde1);
			line.lineTo(0, 0);
			line.lineTo(Settings._getIntByDPI(300), 0);
			
			
			kaLangBtn = StaticGUI._addBtnSkin(this, "ქართული", btnStyle, btnSkin);
			kaLangBtn.width = Settings._getIntByDPI(400);
			kaLangBtn.height = Settings._getIntByDPI(80);
			//popToAButton.layoutData = new VerticalLayoutData(50);
			kaLangBtn.addEventListener(Event.TRIGGERED, langChangeHandler);
			
			line = new MyCanvas;
			addChild(line);
			line.lineStyle(Settings._getIntByDPI(3), 0xd6dde1);
			line.lineTo(0, 0);
			line.lineTo(Settings._getIntByDPI(300), 0);
			
			enLangBtn = StaticGUI._addBtnSkin(this, "English", btnStyle, btnSkin);
			
			//pushCButton.layoutData = new VerticalLayoutData(50);
			enLangBtn.addEventListener(Event.TRIGGERED, langChangeHandler);
			enLangBtn.width = Settings._getIntByDPI(400);
			enLangBtn.height = Settings._getIntByDPI(80);
			
			line = new MyCanvas;
			addChild(line);
			line.lineStyle(Settings._getIntByDPI(3), 0xd6dde1);
			line.lineTo(0, 0);
			line.lineTo(Settings._getIntByDPI(300), 0);
			
			
			ruLangBtn = StaticGUI._addBtnSkin(this, "Русский"+Starling.current.contentScaleFactor, btnStyle, btnSkin);
			ruLangBtn.width = Settings._getIntByDPI(400);
			ruLangBtn.height = Settings._getIntByDPI(80);
			//replaceWithB2Button.layoutData = new VerticalLayoutData(50);
			ruLangBtn.addEventListener(Event.TRIGGERED, langChangeHandler);
			
			line = new MyCanvas;
			addChild(line);
			line.lineStyle(Settings._getIntByDPI(3), 0xd6dde1);
			line.lineTo(0, 0);
			line.lineTo(Settings._getIntByDPI(300), 0);
		}
		
		override public function dispose():void {
			
			if (kaLangBtn) kaLangBtn.removeEventListener(Event.TRIGGERED, langChangeHandler);
			if (enLangBtn) enLangBtn.removeEventListener(Event.TRIGGERED, langChangeHandler);
			if (ruLangBtn) ruLangBtn.removeEventListener(Event.TRIGGERED, langChangeHandler);
			
			
			StaticGUI._safeRemoveChildren(kaLangBtn, true);
			StaticGUI._safeRemoveChildren(enLangBtn, true);
			StaticGUI._safeRemoveChildren(ruLangBtn, true);
			
			btnSkin.dispose();
			super.dispose();
			
			btnStyle = null;
			kaLangBtn = null;
			ruLangBtn = null;
			btnSkin = null;
		}
		
		
		protected function langChangeHandler(event:Event):void {
			//this.dispatchEventWith(Event.CANCEL);
			this.dispatchEventWith(AppEvent.COMPLETED);
		}
	}
}
