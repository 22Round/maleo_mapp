package components {
	
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import feathers.controls.Button;
	import feathers.controls.ButtonState;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.text.BitmapFontTextRenderer;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.FlowLayout;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.RelativePosition;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.skins.ImageSkin;
	import feathers.text.BitmapFontTextFormat;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import screens.ScreenID;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.rendering.Painter;
	import starling.text.BitmapFont;
	import starling.text.TextFormat;
	import starling.textures.RenderTexture;
	import starling.textures.Texture;
	import starling.textures.TextureSmoothing;
	
	public class MailBlock extends LayoutGroup {
		
		private var btnStyle1:TextFormat;
		private var btnStyle2:TextFormat;
		private var btnStyle2B:BitmapFontTextFormat;
		private var domainStyle:TextFormat;
		private var productStyle:TextFormat;
		private var productStyleB:BitmapFontTextFormat;
		private var domainStyleB:BitmapFontTextFormat;
		private var mailLocAmountStyleB:BitmapFontTextFormat;
		
		
		private var infoStyle:TextFormat;
		private var infoStyleB:BitmapFontTextFormat;
		private var amountStyle:TextFormat;
		private var amountStyleB:BitmapFontTextFormat;
		private var statusStyle:TextFormat;
		private var statusStyleB:BitmapFontTextFormat;
		private var mailLocAmountStyle:TextFormat;
		private var lariStyle:TextFormat;
		
		private var bgSkin:Image;
		
		private var detailsBtn:Button;
		private var defaultRadioSkin:ImageSkin;
		private var bgTexture:Texture;
		private var domainIco:Image;
		private var domainLabel:Label;
		private var productLabel:Label;//BitmapFontTextRenderer;
		private var infoLabelAmount:BitmapFontTextRenderer;
		private var infoLabel:Label;
		private var detailsIco:Image;
		private var lariSymbolLabel:Label;
		
		private var fromName:Label;//BitmapFontTextRenderer;
		
		private var statusImg:Image;
		private var statusLabel:Label;
		
		private var infoLabelLayoutData:AnchorLayoutData;
		private var statusLayoutData:AnchorLayoutData;
		private var detailsBtnLayoutData:AnchorLayoutData;
		private var fromNameLayoutData:AnchorLayoutData;
		private var productLabelLayoutData:AnchorLayoutData;
		private var radioLayoutData:AnchorLayoutData;

		private var lariSimGroup:LayoutGroup;
		private var lariSimGroupLayout:VerticalLayout;
		private var statusGroup:LayoutGroup;
		private var statusGroupLayout:FlowLayout;
		
		private var check:Check;
		private var amountLabel:Label;
		
		private var hitQad:Quad;
		private var hitBtn:Button;
		
		private var lariSymbolImg:Image;
		
		public static const COMPLETED_MAIL:String = 'completedMail';
		public static const SUBTITLE_MAIL:String = 'subTitle';
		public static const ENTER_GOODS_MAIL:String = 'enterGoodsMail';
		public static const PAY_MAIL:String = 'payMail';
		public static const UNKNOWN_MAIL:String = 'unknownMail';
		public static const PAYED_MAIL:String = 'payedMail';
		public static const CHECK_TOPAY_MAIL:String = 'checkToPayMail';
		
		
		public var _state:String;
		public var _inited:Boolean;
		
		
		
		public function MailBlock(st:String = null) {
			_state = st;
		
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			this.layout = new AnchorLayout();
			
			bgTexture = AssetsLoader._asset.getTexture("post_items_bg.png");
			
			bgSkin = new Image(bgTexture);
			bgSkin.scale9Grid = StaticGUI._getScale9GridRect(bgTexture.width, bgTexture.height);
			this.backgroundSkin = bgSkin;
			
			this.width = stage.stageWidth - Settings._getIntByDPI(34);
			this.height = Settings._getIntByDPI(155);
			
			btnStyle1 = new TextFormat;
			btnStyle1.font = '_bpgArialRegular';
			btnStyle1.size = Settings._getIntByDPI(16);
			btnStyle1.color = 0x575a5b;
			
			btnStyle2 = new TextFormat;
			btnStyle2.font = '_bpgArialRegular';
			btnStyle2.size = Settings._getIntByDPI(16);
			btnStyle2.color = 0x575a5b;
			
			btnStyle2B = new BitmapFontTextFormat('_BPGArial');
			btnStyle2B.letterSpacing = Settings._getIntByDPI(1);
			btnStyle2B.size = Settings._getIntByDPI(50);
			btnStyle2B.color = 0x575a5b;
			
			domainStyle = new TextFormat;
			domainStyle.font = '_bpgArialRegular';
			domainStyle.size = Settings._getIntByDPI(26);
			domainStyle.color = 0x575a5b;
			
			domainStyleB = new BitmapFontTextFormat('_BPGArial');
			domainStyleB.letterSpacing = Settings._getIntByDPI(1);
			//domainStyleB.font = '_bpgArialRegular';
			domainStyleB.size = Settings._getIntByDPI(64);
			domainStyleB.color = 0x575a5b;
			domainStyleB.align = HorizontalAlign.LEFT;
			
			productStyle = new TextFormat;
			productStyle.font = '_bpgArialRegular';
			productStyle.size = Settings._getIntByDPI(24);
			productStyle.color = 0x828485;
			
			
			productStyleB = new BitmapFontTextFormat('_BPGArial');
			//productStyleB.font = '_BPGArial';
			productStyleB.size = Settings._getIntByDPI(50);
			productStyleB.color = 0x828485;
			
			
			infoStyle = new TextFormat;
			infoStyle.font = '_bpgArialRegular';
			infoStyle.size = Settings._getIntByDPI(20);
			infoStyle.color = 0x196d98;
			infoStyle.horizontalAlign = HorizontalAlign.LEFT;
			infoStyle.italic = true;
			
			
			infoStyleB = new BitmapFontTextFormat('_BPGArialBold');
			infoStyleB.leading = Settings._getIntByDPI(-27)
			infoStyleB.size = Settings._getIntByDPI(48);
			infoStyleB.color = 0x196d98;
			infoStyleB.align = HorizontalAlign.LEFT;
			
			
			mailLocAmountStyleB = new BitmapFontTextFormat('_BPGArial');
			//mailLocAmountStyleB.font = '_bpgArialRegular';
			mailLocAmountStyleB.size = Settings._getIntByDPI(80);
			mailLocAmountStyleB.color = 0x575a5b;
			mailLocAmountStyleB.align = HorizontalAlign.LEFT;
			
			mailLocAmountStyle = new TextFormat;
			mailLocAmountStyle.font = '_bpgArialRegular';
			mailLocAmountStyle.size = Settings._getIntByDPI(30);
			mailLocAmountStyle.color = 0x575a5b;
			mailLocAmountStyle.horizontalAlign = HorizontalAlign.LEFT;
			
			statusStyle = new TextFormat;
			statusStyle.font = '_bpgArialRegular';
			statusStyle.size = Settings._getIntByDPI(16);
			statusStyle.color = 0xffffff;
			statusStyle.horizontalAlign = HorizontalAlign.CENTER;
			
			statusStyleB = new BitmapFontTextFormat('_BPGArial');
			
			statusStyleB.size = Settings._getIntByDPI(35);
			statusStyleB.color = 0xffffff;
			statusStyleB.align = HorizontalAlign.CENTER;
			
			amountStyle = new TextFormat;
			amountStyle.font = '_bpgArialRegular';
			amountStyle.size = Settings._getIntByDPI(24);
			amountStyle.color = 0xff6363;
			amountStyle.horizontalAlign = HorizontalAlign.LEFT;
			
			amountStyleB = new BitmapFontTextFormat('_BPGArial');
			amountStyleB.letterSpacing = Settings._getIntByDPI(1);
			amountStyleB.size = Settings._getIntByDPI(63);
			amountStyleB.color = 0xff6363;
			amountStyleB.align = HorizontalAlign.LEFT;
			
			
			lariStyle = new TextFormat;
			lariStyle.font = '_lariSymbol';
			lariStyle.size = Settings._getIntByDPI(24);
			lariStyle.color = 0xff6363;
			
			
			_addDataState(_state);
		}
		
		public function _addDataState(st:String = null ):void {
			_state = st;
			
				fromNameLayoutData = new AnchorLayoutData();
				fromNameLayoutData.top = Settings._getIntByDPI(20);
			switch(_state) {
				
				case MailBlock.CHECK_TOPAY_MAIL:
					
				
					
					fromNameLayoutData.left = Settings._getIntByDPI(52);
					
					productLabelLayoutData = new AnchorLayoutData();
					productLabelLayoutData.verticalCenter = Settings._getIntByDPI(-5);
					productLabelLayoutData.left = Settings._getIntByDPI(68);
					
					radioLayoutData = new AnchorLayoutData();
					radioLayoutData.verticalCenter = 0;
					radioLayoutData.left = Settings._getIntByDPI(22);
					
					defaultRadioSkin = new ImageSkin(AssetsLoader._asset.getTexture('check_empty.png'));
					
					defaultRadioSkin.setTextureForState(ButtonState.DOWN, AssetsLoader._asset.getTexture('check_full.png'));
					defaultRadioSkin.setTextureForState(ButtonState.DOWN_AND_SELECTED, AssetsLoader._asset.getTexture('check_full.png'));
					defaultRadioSkin.setTextureForState(ButtonState.UP_AND_SELECTED, AssetsLoader._asset.getTexture('check_full.png'));
					defaultRadioSkin.setTextureForState(ButtonState.HOVER_AND_SELECTED, AssetsLoader._asset.getTexture('check_full.png'));
					//defaultRadioSkin.textureSmoothing = TextureSmoothing.TRILINEAR;
					defaultRadioSkin.width = Settings._getIntByDPI(34);
					defaultRadioSkin.scaleY = defaultRadioSkin.scaleX;
					
					check = new Check;
					check.styleProvider = null;
					check.isSelected = false;
					check.layoutData = radioLayoutData;
					check.defaultSkin = defaultRadioSkin;
					addChild(check);
					
				
					break;
					
				default:
					
					if (_state == MailBlock.COMPLETED_MAIL) {
						
						
						fromNameLayoutData.left = Settings._getIntByDPI(40);
					}else{
						
						
						fromNameLayoutData.left = Settings._getIntByDPI(30);
					}
					productLabelLayoutData = new AnchorLayoutData();
					productLabelLayoutData.verticalCenter = Settings._getIntByDPI(-5);
					productLabelLayoutData.left = Settings._getIntByDPI(28);
					
					
			}
			
			
			
			fromName = StaticGUI._addLabel(this, 'amazon.com', domainStyle);
			//fromName.defaultIcon = domainIco;
			fromName.layoutData = fromNameLayoutData;
			
		
			productLabel = StaticGUI._addLabel(this, "ტელეფონი", productStyle);
			productLabel.layoutData = productLabelLayoutData;
			
			
			switch(_state) {
				
				case MailBlock.COMPLETED_MAIL:
					
					
					domainIco = new Image(AssetsLoader._asset.getTexture("post_item_green_light.png"));
					domainIco.x = Settings._getIntByDPI(15);
					domainIco.y = Settings._getIntByDPI(30);
					//domainIco.textureSmoothing = TextureSmoothing.BILINEAR;
					domainIco.width = Settings._getIntByDPI(15);
					domainIco.scaleY = domainIco.scaleX;
					addChild(domainIco);
					
					infoLabelLayoutData = new AnchorLayoutData();
					infoLabelLayoutData.bottom = Settings._getIntByDPI(20);
					infoLabelLayoutData.left = Settings._getIntByDPI(28);
					
					infoLabelAmount = StaticGUI._addBFTR(this, "20 $", mailLocAmountStyleB);
					infoLabelAmount.layoutData = infoLabelLayoutData;
					
					detailsBtnLayoutData = new AnchorLayoutData();
					detailsBtnLayoutData.verticalCenter = 0;
					detailsBtnLayoutData.right = Settings._getIntByDPI(28);
					
					
					detailsIco = new Image(AssetsLoader._asset.getTexture("post_item_btn_arrow.png"));
					//detailsIco.textureSmoothing = TextureSmoothing.BILINEAR;
					detailsIco.width = Settings._getIntByDPI(15);
					detailsIco.scaleY = detailsIco.scaleX;
					
					
					detailsBtn = StaticGUI._addBtnSkinBFont(this, Settings._mui['mails_block_label_1'][Settings._lang], btnStyle2B);
					detailsBtn.defaultIcon = detailsIco;
					detailsBtn.iconPosition = RelativePosition.RIGHT;
					detailsBtn.layoutData = detailsBtnLayoutData;
					detailsBtn.labelOffsetY = Settings._getIntByDPI(-17);

					
					
					break;
				
				
				case MailBlock.PAYED_MAIL:
					
					infoLabelLayoutData = new AnchorLayoutData();
					infoLabelLayoutData.top = Settings._getIntByDPI(88);
					infoLabelLayoutData.left = Settings._getIntByDPI(28);
					infoLabel = StaticGUI._addLabel(this, Settings._mui['mails_block_notifi_1'][Settings._lang], infoStyle);
					infoLabel.width = Settings._getIntByDPI(400);
					infoLabel.textRendererProperties.wordWrap = true;
					infoLabel.textRendererProperties.isHTML = true;
					infoLabel.layoutData = infoLabelLayoutData;
					
					detailsBtnLayoutData = new AnchorLayoutData();
					detailsBtnLayoutData.verticalCenter = 0;
					detailsBtnLayoutData.right = Settings._getIntByDPI(28);
			
					
					detailsIco = new Image(AssetsLoader._asset.getTexture("post_item_btn_arrow.png"));
					//detailsIco.textureSmoothing = TextureSmoothing.BILINEAR;
					detailsIco.width = Settings._getIntByDPI(15);
					detailsIco.scaleY = detailsIco.scaleX;
					
					
					detailsBtn = StaticGUI._addBtnSkinBFont(this, Settings._mui['mails_block_label_1'][Settings._lang], btnStyle2B);
					detailsBtn.defaultIcon = detailsIco;
					detailsBtn.iconPosition = RelativePosition.RIGHT;
					detailsBtn.layoutData = detailsBtnLayoutData;
					detailsBtn.labelOffsetY = Settings._getIntByDPI(-17);
					
					
					break;
					
				case MailBlock.UNKNOWN_MAIL:
					
					//fromName.defaultIcon = null;
					
					infoLabelLayoutData = new AnchorLayoutData();
					infoLabelLayoutData.bottom = Settings._getIntByDPI(20);
					infoLabelLayoutData.left = Settings._getIntByDPI(28);
					infoLabelAmount = StaticGUI._addBFTR(this, "20 $", mailLocAmountStyleB);
					infoLabelAmount.layoutData = infoLabelLayoutData;
					
					detailsBtnLayoutData = new AnchorLayoutData();
					detailsBtnLayoutData.verticalCenter = 0;
					detailsBtnLayoutData.right = Settings._getIntByDPI(28);
			
					
					detailsIco = new Image(AssetsLoader._asset.getTexture("post_item_btn_arrow.png"));
					//detailsIco.textureSmoothing = TextureSmoothing.BILINEAR;
					detailsIco.width = Settings._getIntByDPI(15);
					detailsIco.scaleY = detailsIco.scaleX;
					
					
					detailsBtn = StaticGUI._addBtnSkinBFont(this, Settings._mui['mails_block_label_1'][Settings._lang], btnStyle2B);
					detailsBtn.defaultIcon = detailsIco;
					detailsBtn.iconPosition = RelativePosition.RIGHT;
					detailsBtn.layoutData = detailsBtnLayoutData;
					detailsBtn.labelOffsetY = Settings._getIntByDPI(-17);
					
					
					break;
					
				case MailBlock.ENTER_GOODS_MAIL:
					
					//fromName.defaultIcon = null;
					
					infoLabelLayoutData = new AnchorLayoutData();
					infoLabelLayoutData.verticalCenter = Settings._getIntByDPI(20);
					infoLabelLayoutData.left = Settings._getIntByDPI(28);
					infoLabel = StaticGUI._addLabelBFont(this, Settings._mui['mails_block_notifi_2'][Settings._lang], infoStyleB);
					infoLabel.width = Settings._getIntByDPI(400);
					infoLabel.textRendererProperties.wordWrap = true;
					//infoLabel.textRendererProperties.isHTML = true;
					infoLabel.layoutData = infoLabelLayoutData;
					
					statusLayoutData = new AnchorLayoutData();
					statusLayoutData.verticalCenter = 0;
					statusLayoutData.right = Settings._getIntByDPI(-75);
					
					
					statusGroup = new LayoutGroup();
					statusGroup.width = Settings._getIntByDPI(350);
					statusGroupLayout = new FlowLayout();
					statusGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
					statusGroupLayout.firstHorizontalGap = Settings._getIntByDPI(170);
					statusGroupLayout.gap = Settings._getIntByDPI(5);
					statusGroup.layout = statusGroupLayout;
					statusGroup.layoutData = statusLayoutData;
					addChild(statusGroup);
					
					
					
					statusImg = new Image(AssetsLoader._asset.getTexture("item_label_yellow.png"));
					statusImg.width = Settings._getIntByDPI(145);
					statusImg.scaleY = statusImg.scaleX;
					//label2Group.addChild(statusImg)
					statusLabel = StaticGUI._addLabel(statusGroup, Settings._mui['mails_block_label_2'][Settings._lang], statusStyle);
					statusLabel.backgroundSkin = statusImg;
					
					
					break;
					
				case MailBlock.PAY_MAIL:
				case MailBlock.CHECK_TOPAY_MAIL:
					
					//fromName.defaultIcon = null;
					
					infoLabelLayoutData = new AnchorLayoutData();
					infoLabelLayoutData.bottom = Settings._getIntByDPI(20);
					infoLabelLayoutData.left = Settings._getIntByDPI(28);
					infoLabelAmount = StaticGUI._addBFTR(this, "20 $", mailLocAmountStyleB);
					infoLabelAmount.layoutData = infoLabelLayoutData;
					
					statusLayoutData = new AnchorLayoutData();
					statusLayoutData.verticalCenter = Settings._getIntByDPI(10);
					statusLayoutData.right = Settings._getIntByDPI(-75);
					
					
					statusGroup = new LayoutGroup();
					statusGroup.width = Settings._getIntByDPI(350);
					statusGroupLayout = new FlowLayout();
					statusGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
					statusGroupLayout.firstHorizontalGap = Settings._getIntByDPI(170);
					statusGroupLayout.gap =  Settings._getIntByDPI(-35);
					statusGroup.layout = statusGroupLayout;
					statusGroup.layoutData = statusLayoutData;
					addChild(statusGroup);
					
					
					statusImg = new Image(AssetsLoader._asset.getTexture("item_label_red.png"));
					statusImg.width = Settings._getIntByDPI(145);
					statusImg.scaleY = statusImg.scaleX;
					//label2Group.addChild(statusImg)
					statusLabel = StaticGUI._addLabel(statusGroup, Settings._mui['mails_block_label_3'][Settings._lang], statusStyle);
					statusLabel.backgroundSkin = statusImg;
					amountLabel = StaticGUI._addLabelBFont(statusGroup, '12233.54 '+Settings.LARI_SYMBOL, amountStyleB);
					
					
					/*lariSimGroup = new LayoutGroup();
					lariSimGroupLayout = new VerticalLayout();
					lariSimGroupLayout.paddingTop = Settings._getIntByDPI(1);
					
					lariSimGroup.layout = lariSimGroupLayout;
					statusGroup.addChild(lariSimGroup);
					
					//lariSymbolLabel = StaticGUI._addLabel(lariSimGroup, 's', lariStyle);
					
					
					lariSymbolImg = new Image(AssetsLoader._asset.getTexture("lari_simb.png"));
					lariSymbolImg.color = 0xff6363;
					lariSymbolImg.textureSmoothing = TextureSmoothing.TRILINEAR;
					lariSymbolImg.width = Settings._getIntByDPI(19);
					lariSymbolImg.scaleY = lariSymbolImg.scaleX;
					lariSimGroup.addChild(lariSymbolImg);*/
					
					break;
			}
			

			hitQad = new Quad(50, 50);
			hitQad.alpha = 0;
			hitBtn = new Button;
			//hitBtn.defaultStyleProvider = null;
			hitBtn.defaultSkin = hitQad;
			hitBtn.layoutData = new AnchorLayoutData(0, 0, 0, 0);
			addChild(hitBtn);
			hitBtn.addEventListener(Event.TRIGGERED, blockHandler);	
		}
		
		
		
		
		private function blockHandler(e:Event):void {
			//this.dispatchEventWith(AppEvent.COMPLETED, true);
			if (_state == MailBlock.CHECK_TOPAY_MAIL) {
				check.isSelected = !check.isSelected;
			}else {
				Settings._splash._navigator.pushScreen(ScreenID.MAIL_CONTENT);
			}
			
		}
		
		override public function dispose():void {
			
			if (hitBtn) {
				hitBtn.removeEventListener(Event.TRIGGERED, blockHandler);
				StaticGUI._safeRemoveChildren(hitBtn, true);
				hitQad.dispose();
			}
			
			if (detailsBtn) StaticGUI._safeRemoveChildren(detailsBtn, true);
			if (domainLabel) StaticGUI._safeRemoveChildren(domainLabel, true);
			if (productLabel) StaticGUI._safeRemoveChildren(productLabel, true);
			if (infoLabel) StaticGUI._safeRemoveChildren(infoLabel, true);
			if (lariSymbolLabel) StaticGUI._safeRemoveChildren(lariSymbolLabel, true);
			if (fromName) StaticGUI._safeRemoveChildren(fromName, true);
			if (statusLabel) StaticGUI._safeRemoveChildren(statusLabel, true);
			if (check) StaticGUI._safeRemoveChildren(check, true);
			if (amountLabel) StaticGUI._safeRemoveChildren(amountLabel, true);
			if (lariSimGroup) StaticGUI._safeRemoveChildren(lariSimGroup, true);
			if (statusGroup) StaticGUI._safeRemoveChildren(statusGroup, true);
			if (domainIco) StaticGUI._safeRemoveChildren(domainIco, true);
			
			if (bgSkin) bgSkin.dispose();
			if (bgTexture) bgTexture.dispose();
			
			if (lariSymbolImg) lariSymbolImg.dispose();
			if (domainIco) domainIco.dispose();
			if (detailsIco) detailsIco.dispose();
			if (statusImg) statusImg.dispose();
			if (defaultRadioSkin) defaultRadioSkin.dispose();	
			
			lariSymbolImg = null;
			btnStyle1 = null;
			btnStyle2 = null;
			domainStyle = null;
			productStyle = null;
			infoStyle = null;
			amountStyle = null;
			statusStyle = null;
			mailLocAmountStyle = null;
			lariStyle = null;
			defaultRadioSkin = null;
			bgSkin = null;
			detailsBtn = null;
			bgTexture = null;
			domainIco = null;
			
			domainLabel = null;
			productLabel = null;
			infoLabel = null;
			detailsIco = null;
			lariSymbolLabel = null;
			fromName = null;
			
			statusImg = null;
			statusLabel = null;
			
			infoLabelLayoutData = null;
			statusLayoutData = null;
			detailsBtnLayoutData = null;
			fromNameLayoutData = null;
			productLabelLayoutData = null;
			radioLayoutData = null;

			lariSimGroup = null;
			lariSimGroupLayout = null;
			statusGroup = null;
			statusGroupLayout = null;
			
			check = null;
			amountLabel = null;
			
			hitQad = null;
			hitBtn = null;
			
			
			super.dispose();
		}
	}
}