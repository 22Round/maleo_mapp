package screens.splash {
	
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
		
		private var group:LayoutGroup;
		private var groupLayout:VerticalLayout;
		
		
		public function ScreenLoginCase() {
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			super.initialize();
			
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.MIDDLE;
			layout.gap = Settings._getIntByDPI(50);
			this.layout = layout;
			
			btnStyle1 = new TextFormat;
			btnStyle1.font = '_bpgArialRegular';
			btnStyle1.size = Settings._getIntByDPI(24);
			btnStyle1.color = 0xffffff;
			
			btnStyle2 = new TextFormat;
			btnStyle2.font = '_bpgArialRegular';
			btnStyle2.size = Settings._getIntByDPI(24);
			btnStyle2.color = 0x575a5b;
			
			labelStyle = new TextFormat;
			labelStyle.font = '_hKolkhetyMtavBold';
			labelStyle.size = Settings._getIntByDPI(30);
			labelStyle.color = 0x575a5b;
			
			btnMailSkin = new ImageSkin(AssetsLoader._asset.getTexture("login_mail_btn.png"));
			btnMailSkin.scale9Grid = new Rectangle(40, 40, 120, 120);
			
			btnFaceBSkin = new ImageSkin(AssetsLoader._asset.getTexture("login_facebook_btn.png"));
			btnFaceBSkin.scale9Grid = new Rectangle(40, 40, 120, 120);
			
			btnRegSkin = new ImageSkin(AssetsLoader._asset.getTexture("register_btn.png"));
			btnRegSkin.scale9Grid = new Rectangle(40, 40, 120, 120);
			
			
			var label:Label = StaticGUI._addLabel(this, Settings._mui['logincase_enter_lbl'][Settings._lang], labelStyle);
			
			group = new LayoutGroup();
			groupLayout = new VerticalLayout();
			groupLayout.gap = 7;
			group.layout = groupLayout;
			this.addChild( group );

			mailRegBtn = StaticGUI._addBtnSkin(group, Settings._mui['logincase_login_mail_btn'][Settings._lang], btnStyle1, btnMailSkin);
			mailRegBtn.addEventListener(Event.TRIGGERED, mailRegHandler);
			
			
			faceBRegBtn = StaticGUI._addBtnSkin(group,  Settings._mui['logincase_login_facebook_btn'][Settings._lang], btnStyle1, btnFaceBSkin);
			faceBRegBtn.defaultIcon = new Image(AssetsLoader._asset.getTexture("facebook_btn_ico.png"));
			faceBRegBtn.iconOffsetX = -15;
			faceBRegBtn.addEventListener(Event.TRIGGERED, faceBdHandler);
			
			
			label = StaticGUI._addLabel(this, Settings._mui['logincase_orregister_lbl'][Settings._lang], labelStyle);
			
			registRegBtn = StaticGUI._addBtnSkin(this, "რეგისტრაცია", btnStyle2, btnRegSkin);
			registRegBtn.addEventListener(Event.TRIGGERED, registerHandler);
			
	
			
		}
		
		
		override public function dispose():void {
			
			if (mailRegBtn) mailRegBtn.removeEventListener(Event.TRIGGERED, mailRegHandler);
			if (faceBRegBtn) faceBRegBtn.removeEventListener(Event.TRIGGERED, faceBdHandler);
			if (registRegBtn) registRegBtn.removeEventListener(Event.TRIGGERED, registerHandler);
			
			StaticGUI._safeRemoveChildren(group, true);
			//StaticGUI._safeRemoveChildren(this, true);
			
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
