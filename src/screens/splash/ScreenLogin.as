package screens.splash {
	
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.Screen;
	import feathers.controls.TextInput;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.skins.ImageSkin;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextFormat;
	import starling.textures.Texture;
	
	
	public class ScreenLogin extends Screen {
		
		private var btnStyle1:TextFormat;
		private var labelStyle:TextFormat;
		private var inputStyle:TextFormat;
		
		private var btnMailSkin:ImageSkin;
		private var btnFaceBSkin:ImageSkin;
		private var btnFaceBIcom:Texture;
		
		private var bgQuad:Quad;
		private var bgSkin:Image;
		
		private var mailRegBtn:Button;
		private var faceBRegBtn:Button;
		
		private var label:Label;
		
		private var inputGroup:LayoutGroup;
		private var inputGroupLayout:VerticalLayout;
		
		private var group:LayoutGroup;
		private var groupLayout:VerticalLayout;
		
		public function ScreenLogin() {
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			super.initialize();
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.MIDDLE;
			layout.gap = 25;
			this.layout = layout;
			
			btnStyle1 = new TextFormat;
			btnStyle1.font = '_bpgArialRegular';
			btnStyle1.size = Settings._getIntByDPI(24);
			btnStyle1.color = 0xffffff;
			
			labelStyle = new TextFormat;
			labelStyle.font = '_hKolkhetyMtavBold';
			labelStyle.size = Settings._getIntByDPI(30);
			labelStyle.color = 0x575a5b;
			
			inputStyle = new TextFormat;
			inputStyle.font = '_bpgArialRegular';
			inputStyle.size = Settings._getIntByDPI(24);
			inputStyle.horizontalAlign = HorizontalAlign.CENTER;
			inputStyle.color = 0x747474;
			
			btnMailSkin = new ImageSkin(AssetsLoader._asset.getTexture("login_mail_btn.png"));
			btnMailSkin.scale9Grid = new Rectangle(40, 40, 120, 120);
			
			btnFaceBSkin = new ImageSkin(AssetsLoader._asset.getTexture("login_facebook_btn.png"));
			btnFaceBSkin.scale9Grid = new Rectangle(40, 40, 120, 120);
			
			
			//var label:Label = StaticGUI._addLabel(this, "Sesvla", labelStyle);
			
			inputGroup = new LayoutGroup();
			inputGroupLayout = new VerticalLayout();
			inputGroupLayout.gap = 7;
			inputGroup.layout = inputGroupLayout;
			this.addChild(inputGroup);
			
			var userInputSkin:ImageSkin = new ImageSkin(AssetsLoader._asset.getTexture("login_field_border.png"));
			userInputSkin.scale9Grid = new Rectangle(40, 40, 120, 120);
			
			var userInput:TextInput = StaticGUI._addTextInput(inputGroup, Settings._mui['login_user_input'][Settings._lang], inputStyle, inputStyle);
			userInput.backgroundSkin = userInputSkin;
			
			
			var userPassInputSkin:ImageSkin = new ImageSkin(AssetsLoader._asset.getTexture("login_field_border.png"));
			userPassInputSkin.scale9Grid = new Rectangle(40, 40, 120, 120);
			
			var passInput:TextInput = StaticGUI._addTextInput(inputGroup, Settings._mui['login_pass_input'][Settings._lang], inputStyle, inputStyle);
			passInput.backgroundSkin = userPassInputSkin;
			passInput.displayAsPassword = true;
			
			group = new LayoutGroup();
			groupLayout = new VerticalLayout();
			groupLayout.horizontalAlign = HorizontalAlign.CENTER;
			groupLayout.gap = 50;
			group.layout = groupLayout;
			
			this.addChild(group);
			
			mailRegBtn = StaticGUI._addBtnSkin(group, Settings._mui['login_submit_btn'][Settings._lang], btnStyle1, btnMailSkin);
			mailRegBtn.addEventListener(Event.TRIGGERED, mailRegHandler);
			
			label = StaticGUI._addLabel(group, Settings._mui['login_or_lbl'][Settings._lang], labelStyle);
			
			faceBRegBtn = StaticGUI._addBtnSkin(group, Settings._mui['login_login_facebook_btn'][Settings._lang], btnStyle1, btnFaceBSkin);
			faceBRegBtn.defaultIcon = new Image(AssetsLoader._asset.getTexture("facebook_btn_ico.png"));
			faceBRegBtn.iconOffsetX = -15;
			faceBRegBtn.addEventListener(Event.TRIGGERED, faceBdHandler);
			
			
		
		}
		
		override public function dispose():void {
			
			
			if (mailRegBtn) mailRegBtn.removeEventListener(Event.TRIGGERED, mailRegHandler);
			if (faceBRegBtn) faceBRegBtn.removeEventListener(Event.TRIGGERED, faceBdHandler);
			
			StaticGUI._safeRemoveChildren(group, true);
			StaticGUI._safeRemoveChildren(inputGroup, true);
			
			super.dispose();
		}
		
		protected function mailRegHandler(event:Event):void {
			this.dispatchEventWith(AppEvent.LOGIN_NATIVE);
		}
		
		protected function faceBdHandler(event:Event):void {
			this.dispatchEventWith(AppEvent.LOGIN_FACEBOOK);
		}
	}
}
