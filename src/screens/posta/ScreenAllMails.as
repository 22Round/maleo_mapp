package screens.posta {
	
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import components.MailBlock;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.ScrollScreen;
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
	
	public class ScreenAllMails extends ScrollScreen {
		
		private var titleStyle:TextFormat;
		private var subTitleStyle:TextFormat;
		
		private var title:Label;
		private var item:MailBlock;
		
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
			layout.paddingBottom = Settings._getIntByDPI(130);
			this.layout = layout;
			this.scrollBarDisplayMode = ScrollBarDisplayMode.NONE;
			
			titleStyle = new TextFormat;
			titleStyle.font = '_bpgArialRegular';
			titleStyle.size = Settings._getIntByDPI(30);
			titleStyle.color = 0x4d5051;
			
			subTitleStyle = new TextFormat;
			subTitleStyle.font = '_bpgArialRegular';
			subTitleStyle.size = Settings._getIntByDPI(20);
			subTitleStyle.color = 0x798188;
			
			
			var arrivedGroup:LayoutGroup = new LayoutGroup();
			var arrivedGroupLayout:VerticalLayout = new VerticalLayout();
			arrivedGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			arrivedGroupLayout.verticalAlign = VerticalAlign.TOP;
			arrivedGroupLayout.gap = 10;
			arrivedGroup.layout = arrivedGroupLayout;
			addChild(arrivedGroup);
			
			title = StaticGUI._addLabel(arrivedGroup, "ჩამოსული", titleStyle);
			
			item = new MailBlock(MailBlock.COMPLETED_MAIL);
			arrivedGroup.addChild(item);
			item = new MailBlock(MailBlock.PAY_MAIL);
			arrivedGroup.addChild(item);
			
			
			var recivedGroup:LayoutGroup = new LayoutGroup();
			var recivedGroupLayout:VerticalLayout = new VerticalLayout();
			recivedGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			recivedGroupLayout.verticalAlign = VerticalAlign.TOP;
			recivedGroupLayout.gap = 10;
			recivedGroup.layout = arrivedGroupLayout;
			addChild(recivedGroup);
			title = StaticGUI._addLabel(recivedGroup, "ჩამოსული აშშ-ში", titleStyle);
			item = new MailBlock(MailBlock.ENTER_GOODS_MAIL);
			recivedGroup.addChild(item);
			item = new MailBlock(MailBlock.UNKNOWN_MAIL);
			recivedGroup.addChild(item);
			
			
			var sendGroup:LayoutGroup = new LayoutGroup();
			var sendGroupLayout:VerticalLayout = new VerticalLayout();
			sendGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			sendGroupLayout.verticalAlign = VerticalAlign.TOP;
			sendGroupLayout.gap = 10;
			sendGroup.layout = sendGroupLayout;
			addChild(sendGroup);
			title = StaticGUI._addLabel(sendGroup, "გამოგზავნილი (გზაშია)", titleStyle);
			title = StaticGUI._addLabel(sendGroup, 'სავარაუდო ჩამოფრენა - 2016, 23 ოქტომბერი', subTitleStyle);
			item = new MailBlock(MailBlock.ENTER_GOODS_MAIL);
			sendGroup.addChild(item);
			title = StaticGUI._addLabel(sendGroup, 'სავარაუდო ჩამოფრენა - 2016, 3 ნოემბერი', subTitleStyle);
			item = new MailBlock(MailBlock.UNKNOWN_MAIL);
			sendGroup.addChild(item);
			
			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			
			this.validate();
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
