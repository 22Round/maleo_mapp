package screens.map {
	import drawer.views.DrawerView;
	import feathers.controls.DragGesture;
	import feathers.controls.Drawers;
	import feathers.controls.LayoutGroup;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.Orientation;
	import feathers.layout.RelativeDepth;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import starling.events.Event;
	
	
	public class DrawerMapAddress extends LayoutGroup {
		
		public function DrawerMapAddress() {
			//set up the theme right away!
			
			super();
			
		}
		
		private var drawers:Drawers;
		
		
		override protected function initialize():void {
			
			super.initialize();
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.TOP;
			
			layout.paddingTop = Settings._getIntByDPI(130);
			this.layout = layout;
			
			drawers = new Drawers();
			//drawers.overlaySkin = null;
			Settings._mapSettingsDrawer = drawers;

			drawers.openGesture = DragGesture.EDGE;
			
			drawers.content = new ScreenMapAdressList();

			drawers.topDrawerToggleEventType = AppEvent.TOGGLE_TOP_MAP_DRAWER;
			drawers.content.addEventListener(Event.CHANGE, contentView_openDrawerChangeHandler);
			
			
			var topDrawer:DrawerMapContent = new DrawerMapContent();
			drawers.topDrawer = topDrawer;
			drawers.topDrawerDockMode = Orientation.LANDSCAPE;
			drawers.openMode = RelativeDepth.ABOVE;
			
			this.addChild(drawers);
			
			
		}
		
		override public function dispose():void {
			drawers.content.removeEventListener(Event.CHANGE, contentView_openDrawerChangeHandler);
			drawers.topDrawer.dispose();
			drawers.content.dispose();
			drawers.dispose();
			drawers = null;
			Settings._mapSettingsDrawer = null;
			super.dispose();
		}
		
		
		private function changeDockMode(drawer:DrawerView, dockMode:String):void {
			switch (drawer) {
				case drawers.topDrawer:  {
					drawers.topDrawerDockMode = dockMode;
					break;
				}
			}
		}

		
		private function contentView_openDrawerChangeHandler(event:Event):void {
			
			drawers.openMode = 'CHANEG_MODE';
		}
	}
}