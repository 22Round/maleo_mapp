package screens.posta {
	
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import components.MailBlock;
	import components.MailMenuBlock;
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
		

		private var item:MailBlock;
		
		private var mailsGroup:LayoutGroup;
		private var mailsGroupLayout:VerticalLayout;
		private var menu:MailMenuBlock;
		
		public function ScreenAllMails() {
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			super.initialize();
			
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.TOP;
			layout.gap = 20;
			layout.paddingTop = Settings._getIntByDPI(160);
			layout.paddingBottom = Settings._getIntByDPI(130);
			this.layout = layout;
			this.scrollBarDisplayMode = ScrollBarDisplayMode.NONE;
			
			mailsGroup = new LayoutGroup();
			
			var menuArr:Array = String(Settings._mui['mails_allmails_menu'][Settings._lang]).split(',');
			menu = new MailMenuBlock(menuArr);
			menu.addEventListener(AppEvent.CHANGE, menuChangeHandler);
			addChild(menu);
			
			
			
			mailsGroupLayout = new VerticalLayout();
			mailsGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			mailsGroupLayout.verticalAlign = VerticalAlign.TOP;
			mailsGroupLayout.gap = 10;
			mailsGroup.layout = mailsGroupLayout;
			addChild(mailsGroup);
			
			
			
			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			
			this.validate();
		}
		
		private function menuChangeHandler(e:Event):void {
			trace(e.data.selectedIndex);
			if (mailsGroup) mailsGroup.removeChildren();
			
			switch(e.data.selectedIndex) {
				case 0:
					item = new MailBlock(MailBlock.COMPLETED_MAIL);
					mailsGroup.addChild(item);
					item = new MailBlock(MailBlock.PAY_MAIL);
					mailsGroup.addChild(item);
					item = new MailBlock(MailBlock.ENTER_GOODS_MAIL);
					mailsGroup.addChild(item);
					break;
					
					
				case 1:
					item = new MailBlock(MailBlock.COMPLETED_MAIL);
					mailsGroup.addChild(item);
					item = new MailBlock(MailBlock.PAY_MAIL);
					mailsGroup.addChild(item);
					break;
					
					
				case 2:
					mailsGroup.addChild(item);
					item = new MailBlock(MailBlock.PAYED_MAIL);
					mailsGroup.addChild(item);
					break;
			}
		}
		
		override public function dispose():void {
			
			if (mailsGroup) StaticGUI._safeRemoveChildren(mailsGroup, true);
			
			menu.removeEventListener(AppEvent.CHANGE, menuChangeHandler);
			menu = null;
			super.dispose();
		}
	}
}
