package screens {
	import application.AssetsLoader;
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.PanelScreen;
	import feathers.controls.Screen;
	import feathers.controls.TabBar;
	import feathers.controls.ToggleButton;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.system.DeviceCapabilities;
	import starling.display.Image;
	import starling.display.Quad;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class TopFooter extends Screen {
		
		public function TopFooter() {
			super();
		}
		
		private var tabBar:TabBar;
		
		override protected function initialize():void {
			//never forget to call super.initialize()
			super.initialize();
			
			this.layout = new AnchorLayout();
			
			var dataProvArr:Array = new Array;
			var dataProvObj:Object;
			var defaultIco:Image;
			var defaultSelectedIco:Image;
			
			for (var i:uint; i < 5; i++) {
				dataProvObj = new Object;
				dataProvObj.label = '';
				defaultIco = new Image(AssetsLoader._asset.getTexture('footer_item_' + (i + 1) + '_normal.png'));
				
				
				defaultSelectedIco = new Image(AssetsLoader._asset.getTexture('footer_item_' + (i + 1) + '_selected.png'));
				dataProvObj.defaultIcon = defaultIco;
				dataProvObj.defaultSelectedIcon = defaultSelectedIco;
				dataProvArr.push(dataProvObj);
				
			}
			
			tabBar = new TabBar();
			
			tabBar.tabFactory = function():ToggleButton{
				var tab:ToggleButton = new ToggleButton();
				tab.defaultSkin = new Quad(50,50,0x273447);

				return tab;
			}
			
			tabBar.height = Settings._getIntByDPI(103);
			tabBar.dataProvider = new ListCollection(dataProvArr);
											
			tabBar.addEventListener(Event.CHANGE, tabBar_changeHandler);
			tabBar.layoutData = new AnchorLayoutData(NaN, 0, 0, 0);
			tabBar.styleProvider = null;
			this.addChild(tabBar);
			tabBar.validate();
			this.height = Settings._getIntByDPI(103);
			this.width = stage.stageWidth;
			
		}
		
		private function tabBar_changeHandler(event:Event):void {
			//this._label.text = "selectedIndex: " + this._tabBar.selectedIndex.toString();
		}
	}
}
