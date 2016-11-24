package drawer.views {
	
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.Screen;
	import feathers.controls.text.TextBlockTextRenderer;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
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
			
			
			drw = new DrawerView;
			//drw.styleNameList.add(DrawersExplorerTheme.THEME_NAME_LEFT_AND_RIGHT_DRAWER);
			addChild(drw);
		
			
			settingsIco = new Image(AssetsLoader._asset.getTexture("drawer_setting_ico.png"));
			settingsIco.width = Settings._getIntByDPI(55)
			settingsIco.scaleY = settingsIco.scaleX;
			
			
			var fillBottomLayoutData:AnchorLayoutData = new AnchorLayoutData();
			fillBottomLayoutData.left = Settings._getIntByDPI(30);
			fillBottomLayoutData.bottom = Settings._getIntByDPI(25);
			
			settingsBtn = StaticGUI._addButton(this, 0, 0, Settings._muiPack['drawer_settings_btn'][Settings._lang], btnStyle1);
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
