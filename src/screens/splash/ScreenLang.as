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
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextFormat;
	
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
			
			kaLangBtn = StaticGUI._addBtnSkin(this, "ქართული", btnStyle, btnSkin);
			//popToAButton.layoutData = new VerticalLayoutData(50);
			kaLangBtn.addEventListener(Event.TRIGGERED, langChangeHandler);
			
			line = new MyCanvas;
			addChild(line);
			line.lineStyle(2, 0xd6dde1);
			line.lineTo(0, 0);
			line.lineTo(300, 0);
			
			enLangBtn = StaticGUI._addBtnSkin(this, "English", btnStyle, btnSkin);
			
			//pushCButton.layoutData = new VerticalLayoutData(50);
			enLangBtn.addEventListener(Event.TRIGGERED, langChangeHandler);
			
			line = new MyCanvas;
			addChild(line);
			line.lineStyle(2, 0xd6dde1);
			line.lineTo(0, 0);
			line.lineTo(300, 0);
			
			
			ruLangBtn = StaticGUI._addBtnSkin(this, "Русский", btnStyle, btnSkin);
			//replaceWithB2Button.layoutData = new VerticalLayoutData(50);
			ruLangBtn.addEventListener(Event.TRIGGERED, langChangeHandler);
			
			
			line = new MyCanvas;
			addChild(line);
			line.lineStyle(2, 0xd6dde1);
			line.lineTo(0, 0);
			line.lineTo(300, 0);
		}
		
		override public function dispose():void {
			
			if (kaLangBtn) kaLangBtn.removeEventListener(Event.TRIGGERED, langChangeHandler);
			if (enLangBtn) enLangBtn.removeEventListener(Event.TRIGGERED, langChangeHandler);
			if (ruLangBtn) ruLangBtn.removeEventListener(Event.TRIGGERED, langChangeHandler);
			
			super.dispose();
		}
		
		
		protected function langChangeHandler(event:Event):void {
			//this.dispatchEventWith(Event.CANCEL);
			this.dispatchEventWith(AppEvent.COMPLETED);
		}
	}
}
