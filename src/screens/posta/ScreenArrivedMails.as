package screens.posta {
	
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import components.MailBlock;
	import feathers.controls.Button;
	import feathers.controls.ButtonState;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.ScrollScreen;
	import feathers.core.ToggleGroup;
	import feathers.layout.FlowLayout;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.skins.ImageSkin;
	import flash.geom.Rectangle;
	import starling.events.Event;
	import starling.text.TextFormat;
	
	
	public class ScreenArrivedMails extends ScrollScreen {
		
		private var titleStyle:TextFormat;
		private var alertStyle:TextFormat;
		private var payBtnStyle:TextFormat;
		private var fillBtnStyle:TextFormat;
		
		private var subTitleStyle:TextFormat;
		private var amountStyle:TextFormat;
		private var amountDisableStyle:TextFormat;
		private var lariStyle:TextFormat;
		private var lariDisableStyle:TextFormat;
		
		private var title:Label;
		private var item:MailBlock;
		private var mailToggleGroup:ToggleGroup;
		private var arrivedGroup:LayoutGroup;
		private var arrivedGroupLayout:VerticalLayout;
		private var notifiGroup:LayoutGroup;
		private var notifiGroupLayout:VerticalLayout;
		private var buttonsGroup:LayoutGroup;
		private var buttonsGroupLayout:VerticalLayout;
		
		public function ScreenArrivedMails() {
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			super.initialize();
			
			mailToggleGroup = new ToggleGroup;
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.TOP;
			layout.gap = Settings._getIntByDPI(20);
			layout.paddingTop = Settings._getIntByDPI(180);
			layout.paddingBottom = Settings._getIntByDPI(130);
			this.layout = layout;
			this.scrollBarDisplayMode = ScrollBarDisplayMode.NONE;
			
			titleStyle = new TextFormat;
			titleStyle.font = '_bpgArialRegular';
			titleStyle.size = Settings._getIntByDPI(30);
			titleStyle.color = 0x4d5051;
			
			alertStyle = new TextFormat;
			alertStyle.font = '_bpgArialRegular';
			alertStyle.size = Settings._getIntByDPI(20);
			alertStyle.color = 0xff6363;
			
			subTitleStyle = new TextFormat;
			subTitleStyle.font = '_bpgArialRegular';
			subTitleStyle.size = Settings._getIntByDPI(20);
			subTitleStyle.color = 0x798188;
			
			payBtnStyle = new TextFormat;
			payBtnStyle.font = '_bpgArialRegular';
			payBtnStyle.size = Settings._getIntByDPI(20);
			payBtnStyle.color = 0x798188;
			
			fillBtnStyle = new TextFormat;
			fillBtnStyle.font = '_bpgArialRegular';
			fillBtnStyle.size = Settings._getIntByDPI(20);
			fillBtnStyle.color = 0x798188;
			
			amountStyle = new TextFormat;
			amountStyle.font = '_bpgArialRegular';
			amountStyle.size = Settings._getIntByDPI(24);
			amountStyle.color = 0xffffff;
			amountStyle.horizontalAlign = HorizontalAlign.LEFT;
			
			lariStyle = new TextFormat;
			lariStyle.font = '_lariSymbol';
			lariStyle.size = Settings._getIntByDPI(24);
			lariStyle.color = 0xffffff;
			
			amountDisableStyle = new TextFormat;
			amountDisableStyle.font = '_bpgArialRegular';
			amountDisableStyle.size = Settings._getIntByDPI(24);
			amountDisableStyle.color = 0xd5dfe7;
			amountDisableStyle.horizontalAlign = HorizontalAlign.LEFT;
			
			lariDisableStyle = new TextFormat;
			lariDisableStyle.font = '_lariSymbol';
			lariDisableStyle.size = Settings._getIntByDPI(24);
			lariDisableStyle.color = 0xd5dfe7;
			
			arrivedGroup = new LayoutGroup();
			arrivedGroupLayout = new VerticalLayout();
			arrivedGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			arrivedGroupLayout.verticalAlign = VerticalAlign.TOP;
			arrivedGroupLayout.gap = Settings._getIntByDPI(10);
			arrivedGroup.layout = arrivedGroupLayout;
			addChild(arrivedGroup);
			
			title = StaticGUI._addLabel(arrivedGroup, Settings._mui['mails_title_arrived'][Settings._lang], titleStyle);
			
			item = new MailBlock;
			item._state = MailBlock.COMPLETED_MAIL;
			arrivedGroup.addChild(item);
			
			item = new MailBlock;
			item._state = MailBlock.PAY_MAIL;
			arrivedGroup.addChild(item);
			
			item = new MailBlock;
			item._state = MailBlock.PAYED_MAIL;
			arrivedGroup.addChild(item);
			
			item = new MailBlock;
			item._state = MailBlock.CHECK_TOPAY_MAIL;
			//item._radioGroup = mailToggleGroup;
			arrivedGroup.addChild(item);
			
			item = new MailBlock;
			item._state = MailBlock.CHECK_TOPAY_MAIL;
			//item._radioGroup = mailToggleGroup;
			arrivedGroup.addChild(item);
			
			item = new MailBlock;
			item._state = MailBlock.CHECK_TOPAY_MAIL;
			//item._radioGroup = mailToggleGroup;
			arrivedGroup.addChild(item);
			
			notifiGroup = new LayoutGroup();
			notifiGroupLayout = new VerticalLayout();
			notifiGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			notifiGroupLayout.verticalAlign = VerticalAlign.TOP;
			notifiGroupLayout.paddingTop = Settings._getIntByDPI(5);
			notifiGroupLayout.paddingBottom = Settings._getIntByDPI(5);
			notifiGroup.layout = notifiGroupLayout;
			addChild(notifiGroup);
			
			title = StaticGUI._addLabel(notifiGroup, Settings._mui['mails_arrived_notifi'][Settings._lang], alertStyle);
			title.width = Settings._getIntByDPI(500);
			title.textRendererProperties.wordWrap = true;
			title.textRendererProperties.isHTML = true;
			
			buttonsGroup = new LayoutGroup();
			buttonsGroupLayout = new VerticalLayout();
			buttonsGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			buttonsGroupLayout.verticalAlign = VerticalAlign.TOP;
			buttonsGroupLayout.gap = Settings._getIntByDPI(5);
			buttonsGroup.layout = buttonsGroupLayout;
			addChild(buttonsGroup);
			
			var payBtnSkin:ImageSkin = new ImageSkin(AssetsLoader._asset.getTexture("posta_item_submit_btn_normal.png"));
			payBtnSkin.setTextureForState(ButtonState.DISABLED, AssetsLoader._asset.getTexture("posta_item_submit_btn_disabled.png"));
			payBtnSkin.scale9Grid = new Rectangle(40, 40, 120, 120);
			
			var payBtn:Button = StaticGUI._addBtnSkin(buttonsGroup, '', null, payBtnSkin);
			payBtn.isEnabled = false;
			//payBtn.addEventListener(Event.TRIGGERED, mailRegHandler);
			
			
			var payBtnIcoGroup:LayoutGroup = new LayoutGroup();
			payBtnIcoGroup.width = Settings._getIntByDPI(350);
			var payBtnIcoGroupLayout:FlowLayout = new FlowLayout();
			payBtnIcoGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			
			payBtnIcoGroupLayout.gap =  Settings._getIntByDPI(10);
			payBtnIcoGroup.layout = payBtnIcoGroupLayout;
			
			//addChild(statusGroup);
			var aStyle:TextFormat;
			var lStyle:TextFormat;
			
			if (payBtn.isEnabled) {
				aStyle = amountStyle;
				lStyle = lariStyle;
			}else {
				aStyle = amountDisableStyle;
				lStyle = lariDisableStyle;
			}
			
			var amountLabel:Label = StaticGUI._addLabel(payBtnIcoGroup, Settings._mui['mails_arrived_sum_pay_btn'][Settings._lang]+' 320122.54', aStyle);
			var lariSymbolLabel:Label = StaticGUI._addLabel(payBtnIcoGroup, 's', lStyle);
			amountLabel = StaticGUI._addLabel(payBtnIcoGroup, ' - '+Settings._mui['mails_arrived_payment_pay_btn'][Settings._lang], aStyle);
			payBtn.defaultIcon = payBtnIcoGroup;
			payBtn.iconOffsetY = 25;
			
			
			var fillBtnSkin:ImageSkin = new ImageSkin(AssetsLoader._asset.getTexture("posta_item_pay_btn.png"));
			var fillBtn:Button = StaticGUI._addBtnSkin(buttonsGroup, Settings._mui['mails_arrived_fill_balance_btn'][Settings._lang], fillBtnStyle, fillBtnSkin);
			
			
			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			
			this.validate();
		}
		
		override public function dispose():void {
			
			if (arrivedGroup) StaticGUI._safeRemoveChildren(arrivedGroup, true);
			if (notifiGroup) StaticGUI._safeRemoveChildren(notifiGroup, true);
			
			super.dispose();
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
