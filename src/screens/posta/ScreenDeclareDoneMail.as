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
	import feathers.core.ToggleGroup;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.skins.ImageSkin;
	import flash.geom.Rectangle;
	import starling.events.Event;
	import starling.text.TextFormat;
	
	
	public class ScreenDeclareDoneMail extends ScrollScreen {
		
		private var payBtnStyle:TextFormat;
		private var payBtnDisabledStyle:TextFormat;
		private var fillBtnStyle:TextFormat;
		
		private var buttonsGroup:LayoutGroup;
		private var buttonsGroupLayout:VerticalLayout;
		
		private var line:MyCanvas;
		private var infoLab:LabelWithTitleBlock;
		
		public function ScreenDeclareDoneMail() {
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			super.initialize();
			Settings._splash._changeBackgroundSkin(0xffffff);
			
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.TOP;
			layout.gap = Settings._getIntByDPI(50);
			layout.paddingTop = Settings._getIntByDPI(180);
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
			
			infoLab = new LabelWithTitleBlock('სტატუსი', 'გამოგზავნილი');
			addChild(infoLab);
			
			line = drawFullHorizontalLine();
			
			infoLab = new LabelWithTitleBlock('თრექინგ კოდი', '9361289681090039432375');
			addChild(infoLab);
			
			line = drawFullHorizontalLine();
			
			infoLab = new LabelWithTitleBlock('გამომგზავნი', 'amazon.com');
			addChild(infoLab);
			
			line = drawFullHorizontalLine();
			
			infoLab = new LabelWithTitleBlock('პროდუქციის დასახელება', 'იარაღები და ხელის ინსტრუმენტები (8202)');
			addChild(infoLab);
			
			line = drawFullHorizontalLine();
			
			
			infoLab = new LabelWithTitleBlock('ღირებულება (USD)', '455');
			addChild(infoLab);
			
			line = drawFullHorizontalLine();
			
			infoLab = new LabelWithTitleBlock('გადაფუთვა', 'დიახ');
			addChild(infoLab);
			
			line = drawFullHorizontalLine();
			
			infoLab = new LabelWithTitleBlock('მსურს მივიღო მისამართზე', 'თბილისი, ძმ. ზუბალაშვილების #50');
			addChild(infoLab);
			
			line = drawFullHorizontalLine();
			
			infoLab = new LabelWithTitleBlock('კომენტარი', 'საახალწლო საჩუქრები');
			addChild(infoLab);
			
			
			
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
			payBtn.addEventListener(Event.TRIGGERED, mailRegHandler);
			
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
			
			//if (arrivedGroup) StaticGUI._safeRemoveChildren(arrivedGroup, true);
			
			//StaticGUI._safeRemoveChildren(this, true);
			
			super.dispose();
		}
		
		protected function mailRegHandler(event:Event):void {
			this.dispatchEventWith(AppEvent.CLOSE);
		}
		
		protected function faceBdHandler(event:Event):void {
			this.dispatchEventWith(Event.COMPLETE);
		}
		
		protected function registerHandler(event:Event):void {
			this.dispatchEventWith(Event.COMPLETE);
		}
	}
}
