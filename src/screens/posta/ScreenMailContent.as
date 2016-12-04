package screens.posta {
	
	import application.AssetsLoader;
	import application.utils.MyCanvas;
	import application.utils.StaticGUI;
	import components.LabelWithTitleBlock;
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
	
	
	public class ScreenMailContent extends ScrollScreen {
		
		private var payBtnStyle:TextFormat;
		private var payBtnDisabledStyle:TextFormat;
		private var fillBtnStyle:TextFormat;
		
		private var buttonsGroup:LayoutGroup;
		private var buttonsGroupLayout:VerticalLayout;
		
		private var line:MyCanvas;
		private var infoLab:LabelWithTitleBlock;
		
		private var mui:Object;
		private var lang:String;
		
		private var submitBtnSkin:ImageSkin;
		private var submitBtn:Button;
		
		public function ScreenMailContent() {
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
			layout.paddingTop = Settings._getIntByDPI(220);
			layout.paddingBottom = Settings._getIntByDPI(50);
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
			
			infoLab = new LabelWithTitleBlock(mui['mails_declare_status'][lang], 'გამოგზავნილი');
			addChild(infoLab);
			
			line = drawFullHorizontalLine();
			
			infoLab = new LabelWithTitleBlock(mui['mails_declare_trackingcode'][lang], '9361289681090039432375');
			addChild(infoLab);
			
			line = drawFullHorizontalLine();
			
			infoLab = new LabelWithTitleBlock(mui['mails_declare_sender'][lang], 'amazon.com');
			addChild(infoLab);
			
			line = drawFullHorizontalLine();
			
			infoLab = new LabelWithTitleBlock(mui['mails_declare_productname'][lang], 'იარაღები და ხელის ინსტრუმენტები (8202)');
			addChild(infoLab);
			
			line = drawFullHorizontalLine();
			
			
			infoLab = new LabelWithTitleBlock(mui['mails_declare_priseusd'][lang], '455');
			addChild(infoLab);
			
			line = drawFullHorizontalLine();
			
			infoLab = new LabelWithTitleBlock(mui['mails_declare_repack'][lang], mui['mails_declare_yes'][lang]); //mails_declare_no
			addChild(infoLab);
			
			line = drawFullHorizontalLine();
			
			infoLab = new LabelWithTitleBlock(mui['mails_declare_toaddress'][lang], 'თბილისი, ძმ. ზუბალაშვილების #50');
			addChild(infoLab);
			
			line = drawFullHorizontalLine();
			
			infoLab = new LabelWithTitleBlock(mui['mails_declare_comment'][lang], 'საახალწლო საჩუქრები');
			addChild(infoLab);
			
			
			
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
			
			submitBtn = StaticGUI._addBtnSkin(buttonsGroup, 'მონაცემების შენახვა', payBtnStyle, submitBtnSkin);
			submitBtn.disabledFontStyles = payBtnDisabledStyle;
			//payBtn.isEnabled = false;
			submitBtn.addEventListener(Event.TRIGGERED, submitHandler);
			
			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			
			this.validate();
		}
		
		private function drawFullHorizontalLine():MyCanvas {
			var l:MyCanvas = new MyCanvas;
			l.lineStyle(2, 0xe5e6e6);
			l.lineTo(0, 0);
			l.lineTo(stage.stageWidth, 0);
			addChild(l);
			return l;
		}
		
		override public function dispose():void {
			
			submitBtn.removeEventListener(Event.TRIGGERED, submitHandler);
			if (buttonsGroup) StaticGUI._safeRemoveChildren(buttonsGroup, true);
			
			//StaticGUI._safeRemoveChildren(this, true);
			
			mui = null;
			lang = null;
			
			submitBtnSkin = null;
			submitBtn = null;
			
			super.dispose();
		}
		
		protected function submitHandler(event:Event):void {
			this.dispatchEventWith(AppEvent.CLOSE);
		}
	}
}
