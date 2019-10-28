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
	import feathers.text.BitmapFontTextFormat;
	import flash.geom.Rectangle;
	import starling.events.Event;
	import starling.text.TextFormat;
	
	
	public class ScreenToPayMails extends ScrollScreen {
		
		private var titleStyle:TextFormat;
		private var alertStyle:TextFormat;
		private var payBtnStyle:TextFormat;
		private var fillBtnStyle:TextFormat;
		
		private var amountStyleB:BitmapFontTextFormat;
		private var amountDisableStyleB:BitmapFontTextFormat;
		
		private var subTitleStyle:TextFormat;
		private var amountStyle:TextFormat;
		private var amountDisableStyle:TextFormat;
		private var lariStyle:TextFormat;
		private var lariDisableStyle:TextFormat;
		
		private var payBtnSkin:ImageSkin;
		private var payBtn:Button;
		
		private var title:Label;
		private var item:MailBlock;
		private var amountLabel:Label;
		private var lariSymbolLabel:Label;
		private var fillBtnSkin:ImageSkin;
		private var fillBtn:Button;
		
		private var arrivedGroup:LayoutGroup;
		private var arrivedGroupLayout:VerticalLayout;
		private var notifiGroup:LayoutGroup;
		private var notifiGroupLayout:VerticalLayout;
		private var buttonsGroup:LayoutGroup;
		private var buttonsGroupLayout:VerticalLayout;
		private var payBtnIcoGroup:LayoutGroup
		
		public function ScreenToPayMails() {
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			super.initialize();
			
			
			
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
			
			
			amountStyleB = new BitmapFontTextFormat('_BPGArialBold');
			amountStyleB.size = Settings._getIntByDPI(60);
			amountStyleB.color = 0xffffff;
			
			
			lariStyle = new TextFormat;
			lariStyle.font = '_lariSymbol';
			lariStyle.size = Settings._getIntByDPI(24);
			lariStyle.color = 0xffffff;
			
			
			amountDisableStyleB = new BitmapFontTextFormat('_BPGArialBold');
			amountDisableStyleB.size = Settings._getIntByDPI(60);
			amountDisableStyleB.color = 0xd5dfe7;
			
			
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
			
			item = new MailBlock(MailBlock.COMPLETED_MAIL);
			arrivedGroup.addChild(item);
			
			item = new MailBlock(MailBlock.PAY_MAIL);
			arrivedGroup.addChild(item);
			
			item = new MailBlock(MailBlock.PAYED_MAIL);
			arrivedGroup.addChild(item);
			
			item = new MailBlock(MailBlock.CHECK_TOPAY_MAIL);
			
			arrivedGroup.addChild(item);
			
			item = new MailBlock(MailBlock.CHECK_TOPAY_MAIL);
			
			arrivedGroup.addChild(item);
			
			item = new MailBlock(MailBlock.CHECK_TOPAY_MAIL);
			
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
			
			payBtnSkin = new ImageSkin(AssetsLoader._asset.getTexture("posta_item_submit_btn_normal.png"));
			payBtnSkin.setTextureForState(ButtonState.DISABLED, AssetsLoader._asset.getTexture("posta_item_submit_btn_disabled.png"));
			payBtnSkin.scale9Grid = StaticGUI._getScale9GridRect(payBtnSkin.width, payBtnSkin.height);
			
			var aStyle:BitmapFontTextFormat;
			
			var canPay:Boolean;
			if (canPay) {
				aStyle = amountStyleB;
				
			}else {
				aStyle = amountDisableStyleB;
				
			}
			var payStr:String = Settings._mui['mails_arrived_sum_pay_btn'][Settings._lang] + ' 320122.54';
			payStr += Settings.LARI_SYMBOL;
			payStr += ' - ' + Settings._mui['mails_arrived_payment_pay_btn'][Settings._lang];
			
			payBtn = StaticGUI._addBtnSkinBFont(buttonsGroup, payStr, aStyle, payBtnSkin);
			payBtn.labelOffsetY = Settings._getIntByDPI(-27);
			payBtn.isEnabled = canPay;
			payBtn.width = stage.stageWidth - Settings._getIntByDPI(70);
			//payBtn.addEventListener(Event.TRIGGERED, mailRegHandler);
			
			
			payBtnIcoGroup = new LayoutGroup();
			payBtnIcoGroup.width = Settings._getIntByDPI(350);
			var payBtnIcoGroupLayout:FlowLayout = new FlowLayout();
			payBtnIcoGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			
			payBtnIcoGroupLayout.gap =  Settings._getIntByDPI(10);
			payBtnIcoGroup.layout = payBtnIcoGroupLayout;
			
			//addChild(statusGroup);
			
			
			/*amountLabel = StaticGUI._addLabel(payBtnIcoGroup, Settings._mui['mails_arrived_sum_pay_btn'][Settings._lang]+' 320122.54', aStyle);
			//lariSymbolLabel = StaticGUI._addLabel(payBtnIcoGroup, 's', lStyle);
			amountLabel = StaticGUI._addLabel(payBtnIcoGroup, ' - '+Settings._mui['mails_arrived_payment_pay_btn'][Settings._lang], aStyle);
			payBtn.defaultIcon = payBtnIcoGroup;
			payBtn.iconOffsetY = Settings._getIntByDPI(15);*/
			
			
			fillBtnSkin = new ImageSkin(AssetsLoader._asset.getTexture("posta_item_pay_btn.png"));
			fillBtn = StaticGUI._addBtnSkin(buttonsGroup, Settings._mui['mails_arrived_fill_balance_btn'][Settings._lang], fillBtnStyle, fillBtnSkin);
			fillBtn.width = stage.stageWidth - Settings._getIntByDPI(70);
			
			//this.validate();
		}
		
		override public function dispose():void {
			
			if (arrivedGroup) arrivedGroup = StaticGUI._safeRemoveChildren(arrivedGroup, true);
			if (buttonsGroup) buttonsGroup = StaticGUI._safeRemoveChildren(buttonsGroup, true);
			if (notifiGroup) notifiGroup = StaticGUI._safeRemoveChildren(notifiGroup, true);
			if (payBtnIcoGroup) payBtnIcoGroup = StaticGUI._safeRemoveChildren(payBtnIcoGroup, true);
			if (payBtnSkin) payBtnSkin = StaticGUI._safeRemoveChildren(payBtnSkin, true);
			if (payBtn)payBtn = StaticGUI._safeRemoveChildren(payBtn, true);
			if (title) title = StaticGUI._safeRemoveChildren(title, true);
			if (item) item = StaticGUI._safeRemoveChildren(item, true);
			if (amountLabel) amountLabel = StaticGUI._safeRemoveChildren(amountLabel, true);
			if (lariSymbolLabel) lariSymbolLabel = StaticGUI._safeRemoveChildren(lariSymbolLabel, true);
			if (fillBtnSkin) fillBtnSkin = StaticGUI._safeRemoveChildren(fillBtnSkin, true);
			if (fillBtn) fillBtn = StaticGUI._safeRemoveChildren(fillBtn, true);
			
			titleStyle = null;
			alertStyle = null;
			payBtnStyle = null;
			fillBtnStyle = null;
			
			subTitleStyle = null;
			amountStyle = null;
			amountDisableStyle = null;
			lariStyle = null;
			lariDisableStyle = null;
			arrivedGroupLayout = null;
			notifiGroupLayout = null;
			buttonsGroupLayout = null;
			
			
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
