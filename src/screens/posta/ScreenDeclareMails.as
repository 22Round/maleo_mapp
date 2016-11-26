package screens.posta {
	
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import components.InputWithTitle;
	import components.MailBlock;
	import components.MailPickerItemBlock;
	import components.MailRepacBlock;
	import components.MailSenderBlock;
	import feathers.controls.Button;
	import feathers.controls.ButtonState;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.ScrollScreen;
	import feathers.controls.TextInput;
	import feathers.controls.text.TextBlockTextRenderer;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import feathers.core.ToggleGroup;
	import feathers.layout.FlowLayout;
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
	
	public class ScreenDeclareMails extends ScrollScreen {
		

		private var payBtnStyle:TextFormat;
		private var payBtnDisabledStyle:TextFormat;
		private var fillBtnStyle:TextFormat;

		

		private var item:MailBlock;
		private var mailToggleGroup:ToggleGroup;
		private var trackingGroup:LayoutGroup;
		private var trackingGroupLayout:VerticalLayout;
		private var notifiGroup:LayoutGroup;
		private var notifiGroupLayout:VerticalLayout;
		private var buttonsGroup:LayoutGroup;
		private var buttonsGroupLayout:VerticalLayout;
		
		public function ScreenDeclareMails() {
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			super.initialize();
			Settings._splash._changeBackgroundSkin(0xffffff);
			
			mailToggleGroup = new ToggleGroup;
			
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
			

			var trackingInput:InputWithTitle = new InputWithTitle('თრექინგ კოდი', '9361289681090039432375');
			addChild(trackingInput);
			
			var sender:MailSenderBlock = new MailSenderBlock('მიუთითეთ გამომგზავნი', 'მაგ. amazon.com');
			addChild(sender);
			
			var product:MailPickerItemBlock = new MailPickerItemBlock('პროდუქციის დასახელება', 'ამოირჩიეთ პროდუქტი');
			addChild(product);
			
			var mailPrice:InputWithTitle = new InputWithTitle('ღირებულება (USD)', '');
			addChild(mailPrice);
			
			var checkPac:MailRepacBlock = new MailRepacBlock('გადაფუთვა');
			addChild(checkPac);
			
			var address:MailPickerItemBlock = new MailPickerItemBlock('მსურს მივიღო მისამართზე', 'თბილისი, ზუბალაშვილების #50');
			addChild(address);
			
			var comment:InputWithTitle = new InputWithTitle('კომენტარი', '');
			addChild(comment);
			
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
			
			var payBtn:Button = StaticGUI._addBtnSkin(buttonsGroup, 'მონაცემების შენახვა', payBtnStyle, payBtnSkin);
			payBtn.disabledFontStyles = payBtnDisabledStyle;
			//payBtn.isEnabled = false;
			//payBtn.addEventListener(Event.TRIGGERED, mailRegHandler);
			
			
			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			
			this.validate();
		}
		
		override public function dispose():void {
			
			//if (arrivedGroup) StaticGUI._safeRemoveChildren(arrivedGroup, true);
			if (notifiGroup) StaticGUI._safeRemoveChildren(notifiGroup, true);
			StaticGUI._safeRemoveChildren(this, true);
			
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
