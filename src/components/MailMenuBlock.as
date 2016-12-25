package components {
	
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import feathers.controls.ButtonState;
	import feathers.controls.LayoutGroup;
	import feathers.controls.TabBar;
	import feathers.controls.ToggleButton;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.skins.ImageSkin;
	import flash.geom.Rectangle;
	import starling.events.Event;
	import starling.text.TextFormat;
	
	
	public class MailMenuBlock extends LayoutGroup {
		
		private var tabStyle:TextFormat;
		private var tabSelectedStyle:TextFormat;
		private var tabDisabledStyle:TextFormat;
		
		private var tabBar:TabBar;
		
		private var menuArray:Array;
		
		public function MailMenuBlock(menuArr:Array = null) {
			menuArray = menuArr
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.TOP;
			layout.gap = Settings._getIntByDPI(20);
			this.layout = layout;

			tabStyle = new TextFormat;
			tabStyle.font = '_bpgArialRegular';
			tabStyle.size = Settings._getIntByDPI(20);
			tabStyle.color = 0x575a5b;
			
			tabSelectedStyle = new TextFormat;
			tabSelectedStyle.font = '_bpgArialRegular';
			tabSelectedStyle.size = Settings._getIntByDPI(20);
			tabSelectedStyle.color = 0xffffff;
			
			tabDisabledStyle = new TextFormat;
			tabDisabledStyle.font = '_bpgArialRegular';
			tabDisabledStyle.size = Settings._getIntByDPI(20);
			tabDisabledStyle.color = 0xabadad;

			
			var dataProvObj:Object;
			var dataProvArr:Array = new Array;
			
			for (var i:uint; i < menuArray.length; i++) {
				dataProvObj = new Object;
				dataProvObj.label = menuArray[i];
				dataProvArr.push(dataProvObj);
				
			}
			
			tabBar = new TabBar();
			
			tabBar.firstTabFactory = function():ToggleButton {
				
				var tabSkin:ImageSkin = new ImageSkin(AssetsLoader._asset.getTexture("posta_mails_menu_default_left.png"));
				tabSkin.selectedTexture = AssetsLoader._asset.getTexture("posta_mails_menu_selected_left.png");
				tabSkin.scale9Grid = StaticGUI._getScale9GridRect(tabSkin.width, tabSkin.height);
				var tab:ToggleButton = new ToggleButton();
				
				tab.labelFactory = function():ITextRenderer {
					var renderer:TextFieldTextRenderer = new TextFieldTextRenderer();
					renderer.embedFonts = true;
					return renderer;
				};
				
				tab.defaultSkin = tabSkin;
				tab.fontStyles = tabStyle;
				tab.setFontStylesForState(ButtonState.DOWN_AND_SELECTED, tabSelectedStyle);
				tab.setFontStylesForState(ButtonState.HOVER_AND_SELECTED, tabSelectedStyle);
				tab.setFontStylesForState(ButtonState.UP_AND_SELECTED, tabSelectedStyle);
				tab.setFontStylesForState(ButtonState.DISABLED, tabDisabledStyle);
				
				return tab;
			}
			
			
			tabBar.tabFactory = function():ToggleButton {
				
				var tabSkin:ImageSkin = new ImageSkin(AssetsLoader._asset.getTexture("posta_mails_menu_default_center.png"));
				tabSkin.selectedTexture = AssetsLoader._asset.getTexture("posta_mails_menu_selected_center.png");
				tabSkin.scale9Grid = StaticGUI._getScale9GridRect(tabSkin.width, tabSkin.height);
				var tab:ToggleButton = new ToggleButton();
				
				tab.labelFactory = function():ITextRenderer {
					var renderer:TextFieldTextRenderer = new TextFieldTextRenderer();
					renderer.embedFonts = true;
					return renderer;
				};
				
				tab.defaultSkin = tabSkin;
				tab.fontStyles = tabStyle;
				tab.setFontStylesForState(ButtonState.DOWN_AND_SELECTED, tabSelectedStyle);
				tab.setFontStylesForState(ButtonState.HOVER_AND_SELECTED, tabSelectedStyle);
				tab.setFontStylesForState(ButtonState.UP_AND_SELECTED, tabSelectedStyle);
				tab.setFontStylesForState(ButtonState.DISABLED, tabDisabledStyle);
				
				return tab;
			}
			
			tabBar.lastTabFactory = function():ToggleButton {
				
				var tabSkin:ImageSkin = new ImageSkin(AssetsLoader._asset.getTexture("posta_mails_menu_default_right.png"));
				tabSkin.selectedTexture = AssetsLoader._asset.getTexture("posta_mails_menu_selected_right.png");
				tabSkin.scale9Grid = StaticGUI._getScale9GridRect(tabSkin.width, tabSkin.height);
				var tab:ToggleButton = new ToggleButton();
				
				tab.labelFactory = function():ITextRenderer {
					var renderer:TextFieldTextRenderer = new TextFieldTextRenderer();
					renderer.embedFonts = true;
					return renderer;
				};
				
				tab.defaultSkin = tabSkin;
				tab.fontStyles = tabStyle;
				tab.setFontStylesForState(ButtonState.DOWN_AND_SELECTED, tabSelectedStyle);
				tab.setFontStylesForState(ButtonState.HOVER_AND_SELECTED, tabSelectedStyle);
				tab.setFontStylesForState(ButtonState.UP_AND_SELECTED, tabSelectedStyle);
				tab.setFontStylesForState(ButtonState.DISABLED, tabDisabledStyle);
				
				return tab;
			}
			
			tabBar.dataProvider = new ListCollection(dataProvArr);
			
			tabBar.addEventListener(Event.CHANGE, tabBarHandler);
			tabBar.layoutData = new AnchorLayoutData(NaN, 0, 0, 0);
			tabBar.styleProvider = null;
			this.addChild(tabBar);
			tabBar.validate();
			
			tabBarHandler(null);
			
		}
		
		private function tabBarHandler(event:Event):void {
			//this._label.text = "selectedIndex: " + this._tabBar.selectedIndex.toString();
			this.dispatchEventWith(AppEvent.CHANGE, false, {selectedIndex:tabBar.selectedIndex } );
		}
		
		override public function dispose():void {
			
			//StaticGUI._safeRemoveChildren(this, true);
			tabBar.removeEventListener(Event.CHANGE, tabBarHandler);
			tabDisabledStyle = null;
			tabSelectedStyle = null;
			tabStyle = null;
			menuArray = null;
			
			tabBar.dispose();
			tabBar = null;
			super.dispose();
		}
	}
}
