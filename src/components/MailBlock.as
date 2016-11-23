package components {
	
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.PanelScreen;
	import feathers.controls.Screen;
	import feathers.controls.text.TextBlockTextRenderer;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.RelativePosition;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.layout.VerticalLayoutData;
	import feathers.skins.ImageSkin;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.text.TextFormat;
	import starling.textures.Texture;
	import starling.textures.TextureSmoothing;
	
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
	
	public class MailBlock extends LayoutGroup {
		
		private var btnStyle1:TextFormat;
		private var btnStyle2:TextFormat;
		private var domainStyle:TextFormat;
		private var productStyle:TextFormat;
		private var infoStyle:TextFormat;
		
		private var bgQuad:Quad;
		private var bgSkin:Image;
		
		private var detailsBtn:Button;
		
		private var bgTexture:Texture;
		private var domainIco:Image;
		private var domainLabel:Label;
		private var productLabel:Label;
		private var infoLabel:Label;
		private var detailsIco:Image;
		private var fromName:Button;
		
		public static const COMPLETED_MAIL = 'completedMail';
		public static const ENTER_GOODS_MAIL = 'enterGoodsMail';
		public static const PAY_MAIL = 'payMail';
		
		public var _state:String;
		
		public function MailBlock() {
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			this.layout = new AnchorLayout();
			
			bgTexture = AssetsLoader._asset.getTexture("post_items_bg.png");
			
			bgSkin = new Image(bgTexture);
			bgSkin.scale9Grid = new Rectangle(20, 20, bgTexture.width - 40, bgTexture.height - 40);
			this.backgroundSkin = bgSkin;
			
			this.width = stage.stageWidth - 34;
			this.height = Settings._getIntByDPI(155);
			
			btnStyle1 = new TextFormat;
			btnStyle1.font = '_bpgArialRegular';
			btnStyle1.size = Settings._getIntByDPI(16);
			btnStyle1.color = 0x575a5b;
			
			btnStyle2 = new TextFormat;
			btnStyle2.font = '_bpgArialRegular';
			btnStyle2.size = 16;
			btnStyle2.color = 0x575a5b;
			
			domainStyle = new TextFormat;
			domainStyle.font = '_bpgArialRegular';
			domainStyle.size = Settings._getIntByDPI(24);
			domainStyle.color = 0x575a5b;
			
			productStyle = new TextFormat;
			productStyle.font = '_bpgArialRegular';
			productStyle.size = Settings._getIntByDPI(20);
			productStyle.color = 0x828485;
			
			infoStyle = new TextFormat;
			infoStyle.font = '_bpgArialRegular';
			infoStyle.size = Settings._getIntByDPI(20);
			infoStyle.color = 0x196d98;
			infoStyle.horizontalAlign = HorizontalAlign.LEFT;
			infoStyle.italic = true;
			
			var fromNameLayoutData:AnchorLayoutData = new AnchorLayoutData();
			fromNameLayoutData.top = Settings._getIntByDPI(21);
			fromNameLayoutData.left = Settings._getIntByDPI(12);
			
			domainIco = new Image(AssetsLoader._asset.getTexture("post_item_green_light.png"));
			domainIco.textureSmoothing = TextureSmoothing.BILINEAR;
			domainIco.width = Settings._getIntByDPI(15);
			domainIco.scaleY = domainIco.scaleX;
			//domainIco = Settings._setSize(domainIco, 15, null, true, false);
			
			fromName = StaticGUI._addBtnSkin(this, 'amazon.com', domainStyle);
			fromName.defaultIcon = domainIco;
			fromName.layoutData = fromNameLayoutData;
			
			var productLabelLayoutData:AnchorLayoutData = new AnchorLayoutData();
			productLabelLayoutData.top = Settings._getIntByDPI(55);
			productLabelLayoutData.left = Settings._getIntByDPI(28);
			productLabel = StaticGUI._addLabel(this, "ტელეფონი", productStyle);
			productLabel.layoutData = productLabelLayoutData;
			
			
			var infoLabelLayoutData:AnchorLayoutData = new AnchorLayoutData();
			infoLabelLayoutData.top = Settings._getIntByDPI(88);
			infoLabelLayoutData.left = Settings._getIntByDPI(28);
			infoLabel = StaticGUI._addLabel(this, "გთხოვთ მიაკითხოთ ამანათს<br>ანდ აელოდოთ კურიერს", infoStyle);
			infoLabel.width = 400;
			infoLabel.textRendererProperties.wordWrap = true;
			infoLabel.textRendererProperties.isHTML = true;
			infoLabel.layoutData = infoLabelLayoutData;
			
			var detailsBtnLayoutData:AnchorLayoutData = new AnchorLayoutData();
			detailsBtnLayoutData.verticalCenter = 0;
			detailsBtnLayoutData.right = Settings._getIntByDPI(28);
			
			
			detailsIco = new Image(AssetsLoader._asset.getTexture("post_item_btn_arrow.png"));
			detailsIco.textureSmoothing = TextureSmoothing.BILINEAR;
			detailsIco.width = Settings._getIntByDPI(15);
			detailsIco.scaleY = domainIco.scaleX;
			
			detailsBtn = StaticGUI._addBtnSkin(this, 'დეტალები', btnStyle2);
			detailsBtn.addEventListener(Event.TRIGGERED, detailsHandler);
			detailsBtn.defaultIcon = detailsIco;
			detailsBtn.iconPosition = RelativePosition.RIGHT;
			detailsBtn.layoutData = detailsBtnLayoutData;
		}
		
		protected function detailsHandler(event:Event):void {
			this.dispatchEventWith(Event.COMPLETE);
		}
	}
}
