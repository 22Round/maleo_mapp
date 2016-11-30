package screens.posta {
	
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import components.InputWithTitleBlock;
	import components.MailBlock;
	import components.MailPickerItemBlock;
	import components.MailRepacBlock;
	import components.MailSenderBlock;
	import feathers.controls.Button;
	import feathers.controls.ButtonState;
	import feathers.controls.LayoutGroup;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.ScrollScreen;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.skins.ImageSkin;
	import flash.geom.Rectangle;
	import starling.events.Event;
	import starling.text.TextFormat;
	
	
	public class ScreenDeclareMail extends ScrollScreen {
		

		private var payBtnStyle:TextFormat;
		private var payBtnDisabledStyle:TextFormat;
		private var fillBtnStyle:TextFormat;
		
		private var item:MailBlock;
		private var buttonsGroup:LayoutGroup;
		private var buttonsGroupLayout:VerticalLayout;
		
		private var mui:Object;
		private var lang:String;
		private var submitBtnSkin:ImageSkin;
		private var submitBtn:Button;
		
		private var trackingInput:InputWithTitleBlock;
		private var sender:MailSenderBlock;
		private var product:MailPickerItemBlock;
		private var mailPrice:InputWithTitleBlock;
		private var checkPac:MailRepacBlock;
		private var address:MailPickerItemBlock;
		private var comment:InputWithTitleBlock;
		
		public function ScreenDeclareMail() {
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			super.initialize();
			
			
			mui = Settings._mui;
			lang = Settings._lang;
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.TOP;
			layout.gap = Settings._getIntByDPI(50);
			layout.paddingTop = Settings._getIntByDPI(180);
			layout.paddingBottom = Settings._getIntByDPI(30);
			this.layout = layout;
			this.scrollBarDisplayMode = ScrollBarDisplayMode.NONE;
			
			payBtnStyle = new TextFormat;
			payBtnStyle.font = '_bpgArialRegular';
			payBtnStyle.size = Settings._getIntByDPI(24);
			payBtnStyle.color = 0xffffff;
			
			payBtnDisabledStyle = new TextFormat;
			payBtnDisabledStyle.font = '_bpgArialRegular';
			payBtnDisabledStyle.size = Settings._getIntByDPI(24);
			payBtnDisabledStyle.color = 0xd5dfe7;
			
			
			fillBtnStyle = new TextFormat;
			fillBtnStyle.font = '_bpgArialRegular';
			fillBtnStyle.size = Settings._getIntByDPI(20);
			fillBtnStyle.color = 0x798188;
			

			trackingInput = new InputWithTitleBlock(mui['mails_declare_trackingcode'][lang], '9361289681090039432375');
			addChild(trackingInput);
			
			sender = new MailSenderBlock(mui['mails_declare_sender'][lang], mui['mails_declare_sender_example'][lang]);
			addChild(sender);
			
			product = new MailPickerItemBlock(mui['mails_declare_productname'][lang], mui['mails_declare_product_choose'][lang]);
			addChild(product);
			
			mailPrice = new InputWithTitleBlock(mui['mails_declare_priseusd'][lang], '');
			addChild(mailPrice);
			
			checkPac = new MailRepacBlock(mui['mails_declare_repack'][lang]);
			addChild(checkPac);
			
			address = new MailPickerItemBlock(mui['mails_declare_toaddress'][lang], 'თბილისი, ზუბალაშვილების #50');
			addChild(address);
			
			comment = new InputWithTitleBlock(mui['mails_declare_comment'][lang], '');
			addChild(comment);
			
			buttonsGroup = new LayoutGroup();
			buttonsGroupLayout = new VerticalLayout();
			buttonsGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			buttonsGroupLayout.verticalAlign = VerticalAlign.TOP;
			buttonsGroupLayout.gap = Settings._getIntByDPI(5);
			buttonsGroup.layout = buttonsGroupLayout;
			addChild(buttonsGroup);
			
			submitBtnSkin = new ImageSkin(AssetsLoader._asset.getTexture("posta_item_submit_btn_normal.png"));
			submitBtnSkin.setTextureForState(ButtonState.DISABLED, AssetsLoader._asset.getTexture("posta_item_submit_btn_disabled.png"));
			submitBtnSkin.scale9Grid = new Rectangle(40, 40, 120, 120);
			
			submitBtn = StaticGUI._addBtnSkin(buttonsGroup, mui['mails_declare_submit'][lang], payBtnStyle, submitBtnSkin);
			submitBtn.disabledFontStyles = payBtnDisabledStyle;
			//payBtn.isEnabled = false;
			submitBtn.addEventListener(Event.TRIGGERED, submitHandler);
			
			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			
			this.validate();
		}
		
		override public function dispose():void {
			
			submitBtn.removeEventListener(Event.TRIGGERED, submitHandler);
			//if (arrivedGroup) StaticGUI._safeRemoveChildren(arrivedGroup, true);
			if (buttonsGroup) StaticGUI._safeRemoveChildren(buttonsGroup, true);
			//StaticGUI._safeRemoveChildren(this, true);
			
			mui = null;
			lang = null;
			
			submitBtnSkin = null;
			submitBtn = null;
		
			trackingInput = null;
			sender = null;
			product = null;
			mailPrice = null;
			checkPac = null;
			address = null;
			comment = null;
			
			super.dispose();
		}
		
		protected function submitHandler(event:Event):void {
			this.dispatchEventWith(Event.COMPLETE);
		}
	}
}
