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
	
	public class ScreenMainMails extends ScrollScreen {
		
		private var titleStyle:TextFormat;
		private var subTitleStyle:TextFormat;
		
		private var title:Label;
		private var item:MailBlock;
		
		private var arrivedGroup:LayoutGroup;
		private var arrivedGroupLayout:VerticalLayout;
		private var recivedGroup:LayoutGroup;
		private var recivedGroupLayout:VerticalLayout;
		private var sendGroup:LayoutGroup;
		private var sendGroupLayout:VerticalLayout;
		
		public function ScreenMainMails() {
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			super.initialize();
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.TOP;
			layout.gap = 50;
			layout.paddingTop = Settings._getIntByDPI(180);
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
			
			arrivedGroup = new LayoutGroup();
			arrivedGroupLayout = new VerticalLayout();
			arrivedGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			arrivedGroupLayout.verticalAlign = VerticalAlign.TOP;
			arrivedGroupLayout.gap = 10;
			arrivedGroup.layout = arrivedGroupLayout;
			addChild(arrivedGroup);
			
			title = StaticGUI._addLabel(arrivedGroup, Settings._mui['mails_title_arrived'][Settings._lang], titleStyle);
			
			item = new MailBlock(MailBlock.COMPLETED_MAIL);
			arrivedGroup.addChild(item);
			item = new MailBlock(MailBlock.PAY_MAIL);
			arrivedGroup.addChild(item);
			
			
			recivedGroup = new LayoutGroup();
			recivedGroupLayout = new VerticalLayout();
			recivedGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			recivedGroupLayout.verticalAlign = VerticalAlign.TOP;
			recivedGroupLayout.gap = 10;
			recivedGroup.layout = arrivedGroupLayout;
			addChild(recivedGroup);
			title = StaticGUI._addLabel(recivedGroup, Settings._mui['mails_title_recived_usa'][Settings._lang], titleStyle);
			item = new MailBlock(MailBlock.ENTER_GOODS_MAIL);
			recivedGroup.addChild(item);
			item = new MailBlock(MailBlock.UNKNOWN_MAIL);
			recivedGroup.addChild(item);
			
			sendGroup = new LayoutGroup();
			sendGroupLayout = new VerticalLayout();
			sendGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			sendGroupLayout.verticalAlign = VerticalAlign.TOP;
			sendGroupLayout.gap = 10;
			sendGroup.layout = sendGroupLayout;
			addChild(sendGroup);
			title = StaticGUI._addLabel(sendGroup, Settings._mui['mails_title_ontheway'][Settings._lang], titleStyle);
			title = StaticGUI._addLabel(sendGroup, Settings._mui['mails_title_estarrival'][Settings._lang]+' - 2016, 23 ოქტომბერი', subTitleStyle);
			item = new MailBlock(MailBlock.ENTER_GOODS_MAIL);
			sendGroup.addChild(item);
			title = StaticGUI._addLabel(sendGroup, Settings._mui['mails_title_estarrival'][Settings._lang]+' - 2016, 3 ნოემბერი', subTitleStyle);
			item = new MailBlock(MailBlock.UNKNOWN_MAIL);
			sendGroup.addChild(item);
			
			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			
			this.validate();
		}
		
		override public function dispose():void {
			
			if (arrivedGroup) StaticGUI._safeRemoveChildren(arrivedGroup, true);
			if (recivedGroup) StaticGUI._safeRemoveChildren(recivedGroup, true);
			if (sendGroup) StaticGUI._safeRemoveChildren(sendGroup, true);
			
			super.dispose();
		}
		
		protected function mailRegHandler(event:Event):void {
			this.dispatchEventWith(Event.COMPLETE);
		}
	}
}
