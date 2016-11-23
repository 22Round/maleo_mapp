package screens.posta {
	
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import components.MailBlock;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.PanelScreen;
	import feathers.controls.Screen;
	import feathers.controls.text.TextBlockTextRenderer;
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
	import starling.textures.Texture;
	
	import starling.events.Event;
	
	/**
	 * Pops all screens from the stack to return to the root screen. An event
	 * is mapped to the pop to root action by calling addPopToRootEvent() on the
	 * StackScreenNavigatorItem.
	 *
	 * item.addPopToRootEvent(Event.CLOSE);
	 */
	[Event(name = "close", type = "starling.events.Event")]
	
	/**
	 * Pops this screen from the stack to return to the previous screen. An
	 * event is mapped to the pop action by calling addPopEvent() on the
	 * StackScreenNavigatorItem.
	 *
	 * item.addPopEvent(Event.CANCEL);
	 */
	[Event(name = "cancel", type = "starling.events.Event")]
	
	
	
	[Event(name = "complete", type = "starling.events.Event")]
	
	public class ScreenAllMails extends Screen {
		
		private var btnStyle1:TextFormat;
		private var btnStyle2:TextFormat;
		private var labelStyle:TextFormat;
		
		private var btnMailSkin:ImageSkin;
		private var btnFaceBSkin:ImageSkin;
		private var btnRegSkin:ImageSkin;
		private var btnFaceBIcom:Texture;
		
		private var bgQuad:Quad;
		private var bgSkin:Image;
		
		private var mailRegBtn:Button;
		private var faceBRegBtn:Button;
		private var registRegBtn:Button;
		
		private var title:Label;
		
		
		public function ScreenAllMails() {
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			super.initialize();
			Settings._splash._changeBackgroundSkin(0xecf0f4);
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.TOP;
			layout.gap = 50;
			layout.paddingTop = Settings._getIntByDPI(220);
			this.layout = layout;
			
			btnStyle1 = new TextFormat;
			btnStyle1.font = '_bpgArialRegular';
			btnStyle1.size = 24;
			btnStyle1.color = 0xffffff;
			
			btnStyle2 = new TextFormat;
			btnStyle2.font = '_bpgArialRegular';
			btnStyle2.size = 24;
			btnStyle2.color = 0x575a5b;
			
			labelStyle = new TextFormat;
			labelStyle.font = '_bpgArialRegular';
			labelStyle.size = 30;
			labelStyle.color = 0x4d5051;
			
			title = StaticGUI._addLabel(this, "ჩამოსული", labelStyle);
			
			var item:MailBlock = new MailBlock;
			addChild(item);
			
			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			
			
		}
		
		protected function mailRegHandler(event:Event):void {
			this.dispatchEventWith(Event.COMPLETE);
		}
		
		protected function faceBdHandler(event:Event):void {
			this.dispatchEventWith(Event.COMPLETE);
		}
		
		protected function registerHandler(event:Event):void {
			this.dispatchEventWith(Event.COMPLETE);
		}
	}
}
