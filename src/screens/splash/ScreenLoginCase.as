package screens.splash {
	
	import application.AssetsLoader;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.PanelScreen;
	import feathers.controls.Screen;
	import feathers.controls.text.TextBlockTextRenderer;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
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
	
	public class ScreenLoginCase extends Screen {
		
		private var btnStyle1:TextFormat;
		private var btnStyle2:TextFormat;
		private var labelStyle:TextFormat;
		
		private var btnMailSkin:ImageSkin;
		private var btnFaceBSkin:ImageSkin;
		private var btnRegSkin:ImageSkin;
		private var btnFaceBIcom:Texture;
		
		private var bgQuad:Quad;
		private var bgSkin:Image;
		
		private var mailRegBtn:Button;
		private var faceBRegBtn:Button;
		private var registRegBtn:Button;
		
		
		public function ScreenLoginCase() {
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			super.initialize();
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.MIDDLE;
			layout.gap = 50;
			this.layout = layout;
			
			bgQuad = new Quad(400, 400, 0xffffff);
			bgSkin = new Image(bgQuad.texture);
			
			this.backgroundSkin = bgSkin
			
			btnStyle1 = new TextFormat;
			btnStyle1.font = '_bpgArialRegular';
			btnStyle1.size = 24;
			btnStyle1.color = 0xffffff;
			
			btnStyle2 = new TextFormat;
			btnStyle2.font = '_bpgArialRegular';
			btnStyle2.size = 24;
			btnStyle2.color = 0x575a5b;
			
			labelStyle = new TextFormat;
			labelStyle.font = '_hKolkhetyMtavBold';
			labelStyle.size = 30;
			labelStyle.color = 0x575a5b;
			
			
			btnMailSkin = new ImageSkin(AssetsLoader._asset.getTexture("login_mail_btn.png"));
			btnMailSkin.scale9Grid = new Rectangle(2, 3, 3, 8);
			
			btnFaceBSkin = new ImageSkin(AssetsLoader._asset.getTexture("login_facebook_btn.png"));
			btnFaceBSkin.scale9Grid = new Rectangle(2, 3, 3, 8);
			
			btnRegSkin = new ImageSkin(AssetsLoader._asset.getTexture("register_btn.png"));
			btnRegSkin.scale9Grid = new Rectangle(2, 3, 3, 8);
			
			
			var label:Label = addLabelStyle(this, "Sesvla", labelStyle);
			
			var group:LayoutGroup = new LayoutGroup();
			var groupLayout:VerticalLayout = new VerticalLayout();
			groupLayout.gap = 7;
			group.layout = groupLayout;
			this.addChild( group );

			mailRegBtn = new Button();
			mailRegBtn.label = 'ელ. ფოსტის მეშვეობით';
			mailRegBtn.addEventListener(Event.TRIGGERED, mailRegHandler);
			mailRegBtn = addBtnSkin(group, btnStyle1, btnMailSkin, mailRegBtn);
			
			faceBRegBtn = new Button();
			faceBRegBtn.label = "facebook - ით შესვლა";
			//faceBRegBtn.layoutData = new VerticalLayoutData(50);
			faceBRegBtn.defaultIcon = new Image(AssetsLoader._asset.getTexture("facebook_btn_ico.png"));
			faceBRegBtn.iconOffsetX = -15;

			faceBRegBtn.addEventListener(Event.TRIGGERED, faceBdHandler);
			faceBRegBtn = addBtnSkin(group, btnStyle1, btnFaceBSkin, faceBRegBtn);
			
			
			label = addLabelStyle(this, "an gaxseniT angariSi", labelStyle);
			
			registRegBtn = new Button();
			registRegBtn.label = "რეგისტრაცია";
			//faceBRegBtn.layoutData = new VerticalLayoutData(50);
			registRegBtn.addEventListener(Event.TRIGGERED, registerHandler);
			registRegBtn = addBtnSkin(this, btnStyle2, btnRegSkin, registRegBtn);
			
			
			
		}
		
		
		private function addLabelStyle(cont:Screen, lab:String, style:TextFormat):Label {
			var l:Label = new Label;
			l.text = lab;
			l.fontStyles = style
			l.textRendererFactory = function():ITextRenderer {
				var renderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				renderer
				renderer.embedFonts = true;
				return renderer;
			};
			cont.addChild(l);
			return l;
		}
		
		private function addBtnSkin(cont:*, fStyle:TextFormat, bSkin:ImageSkin ,btn:Button):Button {
			btn.fontStyles = fStyle;
			
			btn.labelFactory = function():ITextRenderer {
				var renderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				renderer.embedFonts = true;
				//renderer.textFormat = btnStyle
				return renderer;
			}
			btn.defaultSkin = bSkin;
			cont.addChild(btn);
			btn.validate();
			return btn;
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
