package drawer.views {
	
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import components.MailBlock;
	import feathers.controls.Button;
	import feathers.controls.Screen;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextFormat;
	
	
	
	public class DrawerMain extends Screen {
		
		private var btnStyle1:TextFormat;
		private var settingsBtn:Button;
		private var settingsIco:Image;
		
		private var drw:DrawerView;
		
		public function DrawerMain() {
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			super.initialize();
			
			var layout:AnchorLayout =  new AnchorLayout();
			this.layout = layout;
			/*var layout:VerticalLayout = new VerticalLayout();
			//layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.TOP;
			layout.paddingBottom = 20;
			//layout.gap = 50;
			this.layout = layout;*/
			
			backgroundSkin = new Quad(10, 10, /*LIST_BACKGROUND_COLOR*/0x4d5051);
			
			btnStyle1 = new TextFormat;
			btnStyle1.font = '_bpgArialRegular';
			btnStyle1.size = Settings._getIntByDPI(20);
			btnStyle1.color = 0x898a8b;
			
			
			var drw:DrawerView = new DrawerView;
			//drw.styleNameList.add(DrawersExplorerTheme.THEME_NAME_LEFT_AND_RIGHT_DRAWER);
			addChild(drw);
		
			
			settingsIco = new Image(AssetsLoader._asset.getTexture("drawer_setting_ico.png"));
			settingsIco.width = Settings._getIntByDPI(55)
			settingsIco.scaleY = settingsIco.scaleX;
			
			var fillBottomLayoutData:AnchorLayoutData = new AnchorLayoutData();
			fillBottomLayoutData.left = Settings._getIntByDPI(30);
			fillBottomLayoutData.bottom = Settings._getIntByDPI(25);
			
			settingsBtn = StaticGUI._addButton(this, 0, 0, Settings._mui['drawer_settings_btn'][Settings._lang], btnStyle1);
			settingsBtn.addEventListener(Event.TRIGGERED, settingsHandler);
			settingsBtn.defaultIcon = settingsIco;
			//settingsBtn.iconOffsetX = -15;
			settingsBtn.defaultSkin = null;
			settingsBtn.layoutData = fillBottomLayoutData;
			
			
			
			//this.height = stage.stageHeight;
			
		}
		
		override public function dispose():void {

			settingsBtn.removeEventListener(Event.TRIGGERED, settingsHandler);
			this.removeChildren();
			settingsBtn = null;
			drw = null
			
			super.dispose();
		}
		
		private function settingsHandler(e:Event):void {
			this.dispatchEventWith(AppEvent.SETTINGS);
			
			
		}
	}
}
