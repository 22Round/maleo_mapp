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
		private var clickedBoo:Boolean;
		
		override protected function initialize():void {
			//never forget to call super.initialize()
			super.initialize();
			
			
			Settings._topFooter = this;
			
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
											
			tabBar.addEventListener(Event.CHANGE, tabBarHandler);
			tabBar.addEventListener(Event.TRIGGERED, tabBarClickHandler);
			tabBar.layoutData = new AnchorLayoutData(NaN, 0, 0, 0);
			tabBar.styleProvider = null;
			this.addChild(tabBar);
			tabBar.validate();
			this.height = Settings._getIntByDPI(103);
			this.width = stage.stageWidth;
			
		}
		
		private function tabBarClickHandler(e:Event):void {
			clickedBoo = true;
			trace("selectedIndex:1");
		}
		
		private function tabBarHandler(event:Event):void {
			//this._label.text = "selectedIndex: " + this._tabBar.selectedIndex.toString();
			trace("selectedIndex: " + tabBar.selectedIndex.toString());
			
			
			if (clickedBoo) {
				switch(tabBar.selectedIndex) {
					case 0:
						
						Settings._splash._navigator.pushScreen(ScreenID.MAIN_MAILS);
						
						break;
					case 1:
						
						Settings._splash._navigator.pushScreen(ScreenID.ALL_MAILS);
						
						break;
					case 2:
						
						Settings._splash._navigator.pushScreen(ScreenID.DECLARE_MAIL);
						
						break
					case 3:
						
						Settings._splash._navigator.pushScreen(ScreenID.MAPS);
						
						break;
				}
				
			}
			
			
			clickedBoo = false;
			
		}
	}
}
