package screens {
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.PanelScreen;
	import feathers.controls.Screen;
	import feathers.controls.TabBar;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.system.DeviceCapabilities;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	[Event(name = "complete", type = "starling.events.Event")]
	
	public class TopFooter extends Screen {
		public function TopFooter() {
			super();
		}
		
		private var _tabBar:TabBar;
		
		override protected function initialize():void {
			//never forget to call super.initialize()
			super.initialize();
			
			this.layout = new AnchorLayout();
			
			this._tabBar = new TabBar();
			this._tabBar.dataProvider = new ListCollection([{label: "One"}, {label: "Two"}, {label: "Three"}, {label: "Disabled", isEnabled: false}]);
			this._tabBar.addEventListener(Event.CHANGE, tabBar_changeHandler);
			this._tabBar.layoutData = new AnchorLayoutData(NaN, 0, 0, 0);
			this.addChild(this._tabBar);
			
			this.width = stage.stageWidth;
			
		}
		
		private function tabBar_changeHandler(event:Event):void {
			//this._label.text = "selectedIndex: " + this._tabBar.selectedIndex.toString();
		}
	}
}
