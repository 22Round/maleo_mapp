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
	import feathers.layout.FlowLayout;
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
		private var amountStyle:TextFormat;
		private var statusStyle:TextFormat;
		private var mailLocAmountStyle:TextFormat;
		private var lariStyle:TextFormat;
		
		private var bgQuad:Quad;
		private var bgSkin:Image;
		
		private var detailsBtn:Button;
		
		private var bgTexture:Texture;
		private var domainIco:Image;
		private var domainLabel:Label;
		private var productLabel:Label;
		private var infoLabel:Label;
		private var detailsIco:Image;
		private var lariSymbolLabel:Label;
		private var fromName:Button;
		
		private var statusImg:Image;
		private var statusLabel:Label;
		
		private var infoLabelLayoutData:AnchorLayoutData;
		private var statusLayoutData:AnchorLayoutData;
		private var detailsBtnLayoutData:AnchorLayoutData;
		private var statusGroup:LayoutGroup;
		private var statusGroupLayout:FlowLayout;
		
		public static const COMPLETED_MAIL:String = 'completedMail';
		public static const ENTER_GOODS_MAIL:String = 'enterGoodsMail';
		public static const PAY_MAIL:String = 'payMail';
		public static const UNKNOWN_MAIL:String = 'unknownMail';
		
		public var _state:String;
		
		
		
		public function MailBlock(st:String) {
			
			_state = st;
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
			
			mailLocAmountStyle = new TextFormat;
			mailLocAmountStyle.font = '_bpgArialRegular';
			mailLocAmountStyle.size = Settings._getIntByDPI(30);
			mailLocAmountStyle.color = 0x575a5b;
			mailLocAmountStyle.horizontalAlign = HorizontalAlign.LEFT;
			
			statusStyle = new TextFormat;
			statusStyle.font = '_bpgArialRegular';
			statusStyle.size = Settings._getIntByDPI(14);
			statusStyle.color = 0xffffff;
			statusStyle.horizontalAlign = HorizontalAlign.CENTER;
			
			amountStyle = new TextFormat;
			amountStyle.font = '_bpgArialRegular';
			amountStyle.size = Settings._getIntByDPI(24);
			amountStyle.color = 0xff6363;
			amountStyle.horizontalAlign = HorizontalAlign.LEFT;
			
			lariStyle = new TextFormat;
			lariStyle.font = '_lariSymbol';
			lariStyle.size = Settings._getIntByDPI(24);
			lariStyle.color = 0xff6363;
			
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
			
			
			switch(_state) {
				
				case MailBlock.COMPLETED_MAIL:
					
					infoLabelLayoutData = new AnchorLayoutData();
					infoLabelLayoutData.top = Settings._getIntByDPI(88);
					infoLabelLayoutData.left = Settings._getIntByDPI(28);
					infoLabel = StaticGUI._addLabel(this, "გთხოვთ მიაკითხოთ ამანათს<br>ანდ აელოდოთ კურიერს", infoStyle);
					infoLabel.width = 400;
					infoLabel.textRendererProperties.wordWrap = true;
					infoLabel.textRendererProperties.isHTML = true;
					infoLabel.layoutData = infoLabelLayoutData;
					
					detailsBtnLayoutData = new AnchorLayoutData();
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
					
					break;
					
				case MailBlock.UNKNOWN_MAIL:
					
					fromName.defaultIcon = null;
					
					infoLabelLayoutData = new AnchorLayoutData();
					infoLabelLayoutData.bottom = Settings._getIntByDPI(20);
					infoLabelLayoutData.left = Settings._getIntByDPI(28);
					infoLabel = StaticGUI._addLabel(this, "20 $", mailLocAmountStyle);
					infoLabel.width = 200;
					infoLabel.layoutData = infoLabelLayoutData;
					
					detailsBtnLayoutData = new AnchorLayoutData();
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
					
					break;
					
				case MailBlock.ENTER_GOODS_MAIL:
					
					fromName.defaultIcon = null;
					
					infoLabelLayoutData = new AnchorLayoutData();
					infoLabelLayoutData.top = Settings._getIntByDPI(88);
					infoLabelLayoutData.left = Settings._getIntByDPI(28);
					infoLabel = StaticGUI._addLabel(this, "გთხოვთ დაადეკლარიროთ ამანათი<br>მომდევნო 24 საათის გამვალობაში", infoStyle);
					infoLabel.width = 400;
					infoLabel.textRendererProperties.wordWrap = true;
					infoLabel.textRendererProperties.isHTML = true;
					infoLabel.layoutData = infoLabelLayoutData;
					
					statusLayoutData = new AnchorLayoutData();
					statusLayoutData.verticalCenter = 0;
					statusLayoutData.right = Settings._getIntByDPI(-75);
					
					statusGroup = new LayoutGroup();
					statusGroup.width = Settings._getIntByDPI(350);
					statusGroupLayout = new FlowLayout();
					statusGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
					statusGroupLayout.firstHorizontalGap = Settings._getIntByDPI(170);
					statusGroupLayout.gap = 5;
					statusGroup.layout = statusGroupLayout;
					statusGroup.layoutData = statusLayoutData;
					addChild(statusGroup);
					
					statusImg = new Image(AssetsLoader._asset.getTexture("item_label_yellow.png"));
					statusImg.width = Settings._getIntByDPI(145);
					statusImg.scaleY = statusImg.scaleX;
					//label2Group.addChild(statusImg)
					statusLabel = StaticGUI._addLabel(statusGroup, 'დეკლარირება', statusStyle);
					statusLabel.backgroundSkin = statusImg;
					
					break;
					
				case MailBlock.PAY_MAIL:
					
					fromName.defaultIcon = null;
					
					infoLabelLayoutData = new AnchorLayoutData();
					infoLabelLayoutData.bottom = Settings._getIntByDPI(20);
					infoLabelLayoutData.left = Settings._getIntByDPI(28);
					infoLabel = StaticGUI._addLabel(this, "20 $", mailLocAmountStyle);
					infoLabel.width = 200;
					infoLabel.layoutData = infoLabelLayoutData;
					
					statusLayoutData = new AnchorLayoutData();
					statusLayoutData.verticalCenter = 30;
					statusLayoutData.right = Settings._getIntByDPI(-75);
					
					statusGroup = new LayoutGroup();
					statusGroup.width = Settings._getIntByDPI(350);
					statusGroupLayout = new FlowLayout();
					statusGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
					statusGroupLayout.firstHorizontalGap = Settings._getIntByDPI(170);
					statusGroupLayout.gap = 5;
					statusGroup.layout = statusGroupLayout;
					statusGroup.layoutData = statusLayoutData;
					addChild(statusGroup);
					
					statusImg = new Image(AssetsLoader._asset.getTexture("item_label_red.png"));
					statusImg.width = Settings._getIntByDPI(145);
					statusImg.scaleY = statusImg.scaleX;
					//label2Group.addChild(statusImg)
					statusLabel = StaticGUI._addLabel(statusGroup, 'გადასახდელია', statusStyle);
					statusLabel.backgroundSkin = statusImg;
					var amountLabel:Label = StaticGUI._addLabel(statusGroup, '12233.54', amountStyle);
					
					
					var lariSimGroup:LayoutGroup = new LayoutGroup();
					var lariSimGroupLayout:VerticalLayout = new VerticalLayout();
					lariSimGroupLayout.paddingTop = Settings._getIntByDPI(1);
					
					lariSimGroup.layout = lariSimGroupLayout;
					statusGroup.addChild(lariSimGroup);
					
					lariSymbolLabel = StaticGUI._addLabel(lariSimGroup, 's', lariStyle);
					//var lariImg:Image = new Image(AssetsLoader._asset.getTexture("lari_simb.png"));
					/*lariImg.color = 0xff6363;
					lariImg.textureSmoothing = TextureSmoothing.TRILINEAR;
					lariImg.width = Settings._getIntByDPI(19);
					lariImg.scaleY = lariImg.scaleX;
					lariSimGroup.addChild(lariImg);*/
					
					break;
			}
			
		}
		
		protected function detailsHandler(event:Event):void {
			this.dispatchEventWith(Event.COMPLETE);
		}
	}
}
