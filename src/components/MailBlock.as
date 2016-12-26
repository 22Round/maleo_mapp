package components {
	
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import feathers.controls.Button;
	import feathers.controls.ButtonState;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.FlowLayout;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.RelativePosition;
	import feathers.layout.VerticalLayout;
	import feathers.skins.ImageSkin;
	import flash.geom.Rectangle;
	import screens.ScreenID;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextFormat;
	import starling.textures.Texture;
	import starling.textures.TextureSmoothing;
	
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
		
		private var bgSkin:Image;
		
		private var detailsBtn:Button;
		private var defaultRadioSkin:ImageSkin;
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
		
		public static const COMPLETED_MAIL:String = 'completedMail';
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
			
			
			_addDataState(_state);
		}
		
		public function _addDataState(st:String = null ):void {
			
			switch(_state) {
				case MailBlock.CHECK_TOPAY_MAIL:
					
					fromNameLayoutData = new AnchorLayoutData();
					fromNameLayoutData.top = Settings._getIntByDPI(21);
					fromNameLayoutData.left = Settings._getIntByDPI(52);
					
					productLabelLayoutData = new AnchorLayoutData();
					productLabelLayoutData.top = Settings._getIntByDPI(60);
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
					
					productLabelLayoutData = new AnchorLayoutData();
					productLabelLayoutData.top = Settings._getIntByDPI(60);
					productLabelLayoutData.left = Settings._getIntByDPI(28);
					
					fromNameLayoutData = new AnchorLayoutData();
					fromNameLayoutData.top = Settings._getIntByDPI(15);
					fromNameLayoutData.left = Settings._getIntByDPI(2);
					
			}

			
			domainIco = new Image(AssetsLoader._asset.getTexture("post_item_green_light.png"));
			//domainIco.textureSmoothing = TextureSmoothing.BILINEAR;
			domainIco.width = Settings._getIntByDPI(15);
			domainIco.scaleY = domainIco.scaleX;
			
			fromName = StaticGUI._addBtnSkin(this, 'amazon.com', domainStyle);
			fromName.defaultIcon = domainIco;
			fromName.layoutData = fromNameLayoutData;
	
		
		
			productLabel = StaticGUI._addLabel(this, "ტელეფონი", productStyle);
			productLabel.layoutData = productLabelLayoutData;
			
			
			switch(_state) {
				
				case MailBlock.COMPLETED_MAIL:
					
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
					//detailsIco.textureSmoothing = TextureSmoothing.BILINEAR;
					detailsIco.width = Settings._getIntByDPI(15);
					detailsIco.scaleY = domainIco.scaleX;
					
					
					detailsBtn = StaticGUI._addBtnSkin(this, Settings._mui['mails_block_label_1'][Settings._lang], btnStyle2);
					detailsBtn.defaultIcon = detailsIco;
					detailsBtn.iconPosition = RelativePosition.RIGHT;
					detailsBtn.layoutData = detailsBtnLayoutData;
					
					
					break;
				
				
				case MailBlock.PAYED_MAIL:
					
					infoLabelLayoutData = new AnchorLayoutData();
					infoLabelLayoutData.top = Settings._getIntByDPI(88);
					infoLabelLayoutData.left = Settings._getIntByDPI(28);
					infoLabel = StaticGUI._addLabel(this, Settings._mui['mails_block_notifi_1'][Settings._lang], infoStyle);
					infoLabel.width = 400;
					infoLabel.textRendererProperties.wordWrap = true;
					infoLabel.textRendererProperties.isHTML = true;
					infoLabel.layoutData = infoLabelLayoutData;
					
					detailsBtnLayoutData = new AnchorLayoutData();
					detailsBtnLayoutData.verticalCenter = 0;
					detailsBtnLayoutData.right = Settings._getIntByDPI(28);
			
					
					detailsIco = new Image(AssetsLoader._asset.getTexture("post_item_btn_arrow.png"));
					//detailsIco.textureSmoothing = TextureSmoothing.BILINEAR;
					detailsIco.width = Settings._getIntByDPI(15);
					detailsIco.scaleY = domainIco.scaleX;
					
					
					detailsBtn = StaticGUI._addBtnSkin(this, Settings._mui['mails_block_label_1'][Settings._lang], btnStyle2);
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
					//detailsIco.textureSmoothing = TextureSmoothing.BILINEAR;
					detailsIco.width = Settings._getIntByDPI(15);
					detailsIco.scaleY = domainIco.scaleX;
					
					
					detailsBtn = StaticGUI._addBtnSkin(this, Settings._mui['mails_block_label_1'][Settings._lang], btnStyle2);
					detailsBtn.defaultIcon = detailsIco;
					detailsBtn.iconPosition = RelativePosition.RIGHT;
					detailsBtn.layoutData = detailsBtnLayoutData;
					
					
					break;
					
				case MailBlock.ENTER_GOODS_MAIL:
					
					fromName.defaultIcon = null;
					
					infoLabelLayoutData = new AnchorLayoutData();
					infoLabelLayoutData.top = Settings._getIntByDPI(88);
					infoLabelLayoutData.left = Settings._getIntByDPI(28);
					infoLabel = StaticGUI._addLabel(this, Settings._mui['mails_block_notifi_2'][Settings._lang], infoStyle);
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
					statusLabel = StaticGUI._addLabel(statusGroup, Settings._mui['mails_block_label_2'][Settings._lang], statusStyle);
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
					statusLabel = StaticGUI._addLabel(statusGroup, Settings._mui['mails_block_label_3'][Settings._lang], statusStyle);
					statusLabel.backgroundSkin = statusImg;
					amountLabel = StaticGUI._addLabel(statusGroup, '12233.54', amountStyle);
					
					
					
					
					lariSimGroup = new LayoutGroup();
					lariSimGroupLayout = new VerticalLayout();
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
					
				case MailBlock.CHECK_TOPAY_MAIL:
					
					fromName.defaultIcon = null;
					
					infoLabelLayoutData = new AnchorLayoutData();
					infoLabelLayoutData.bottom = Settings._getIntByDPI(20);
					infoLabelLayoutData.left = Settings._getIntByDPI(70);
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
					statusLabel = StaticGUI._addLabel(statusGroup, Settings._mui['mails_block_label_3'][Settings._lang], statusStyle);
					statusLabel.backgroundSkin = statusImg;
					amountLabel = StaticGUI._addLabel(statusGroup, '12233.54', amountStyle);
					
					
					
					lariSimGroup = new LayoutGroup();
					lariSimGroupLayout = new VerticalLayout();
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
			Settings._splash._navigator.pushScreen(ScreenID.MAIL_CONTENT);
		}
		
		override public function dispose():void {
			
			if (hitBtn) {
				hitBtn.removeEventListener(Event.TRIGGERED, blockHandler);
				StaticGUI._safeRemoveChildren(hitBtn, true);
				hitQad.dispose();
			}
			
			if(detailsBtn) StaticGUI._safeRemoveChildren(detailsBtn, true);
			if(domainLabel) StaticGUI._safeRemoveChildren(domainLabel, true);
			if(productLabel) StaticGUI._safeRemoveChildren(productLabel, true);
			if(infoLabel) StaticGUI._safeRemoveChildren(infoLabel, true);
			if(lariSymbolLabel) StaticGUI._safeRemoveChildren(lariSymbolLabel, true);
			if(fromName) StaticGUI._safeRemoveChildren(fromName, true);
			if(statusLabel) StaticGUI._safeRemoveChildren(statusLabel, true);
			if(check) StaticGUI._safeRemoveChildren(check, true);
			if(amountLabel) StaticGUI._safeRemoveChildren(amountLabel, true);
			if(lariSimGroup) StaticGUI._safeRemoveChildren(lariSimGroup, true);
			if(statusGroup) StaticGUI._safeRemoveChildren(statusGroup, true);
			
			bgSkin.dispose();
			bgTexture.dispose();
			
			if (domainIco) domainIco.dispose();
			if (detailsIco) detailsIco.dispose();
			if (statusImg) statusImg.dispose();
			if (defaultRadioSkin) defaultRadioSkin.dispose();	
			
			
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