package drawer {
	import drawer.views.DrawerMain;
	import feathers.controls.DragGesture;
	import feathers.controls.Drawers;
	import drawer.skins.DrawersExplorerTheme;
	import drawer.views.ContentView;
	import drawer.views.DrawerView;
	import feathers.layout.Orientation;
	import screens.Splash;
	import screens.TopHeader;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Drawer extends Sprite {
		public function Drawer() {
			//set up the theme right away!
			new DrawersExplorerTheme();
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		private var drawers:Drawers;
		
		private function changeDockMode(drawer:DrawerView, dockMode:String):void {
			switch (drawer) {
				case drawers.leftDrawer:  {
					drawers.leftDrawerDockMode = dockMode;
					break;
				}
			}
		}
		
		private function addedToStageHandler(event:Event):void {
			drawers = new Drawers();
			drawers.overlaySkin = null;
			//a drawer may be opened by dragging from the edge of the content
			//you can also set it to drag from anywhere inside the content
			//or you can disable gestures entirely and only open a drawer when
			//an event is dispatched by the content or by calling a function
			//on the drawer component to open a drawer programmatically.
			drawers.openGesture = DragGesture.EDGE;
			
			drawers.content = new Splash();
			//these events are dispatched by the content
			//Drawers listens for each of these events and opens the drawer
			//associated with an event when it is dispatched
			//this._drawers.topDrawerToggleEventType = ContentView.TOGGLE_TOP_DRAWER;
			drawers.leftDrawerToggleEventType = TopHeader.TOGGLE_LEFT_DRAWER;
			drawers.content.addEventListener(ContentView.OPEN_MODE_CHANGE, contentView_openDrawerChangeHandler);
			
			
			var leftDrawer:DrawerMain = new DrawerMain();
			
			//leftDrawer.addEventListener(DrawerView.CHANGE_DOCK_MODE_TO_NONE, drawer_dockNoneHandler);
			//leftDrawer.addEventListener(DrawerView.CHANGE_DOCK_MODE_TO_BOTH, drawer_dockBothHandler);
			drawers.leftDrawer = leftDrawer;
			drawers.leftDrawerDockMode = Orientation.NONE;
			
			this.addChild(drawers);
		}
		
		/*private function drawer_dockNoneHandler(event:Event):void {
			var drawer:DrawerView = DrawerView(event.currentTarget);
			this.changeDockMode(drawer, Orientation.NONE);
		}
		
		private function drawer_dockBothHandler(event:Event):void {
			var drawer:DrawerView = DrawerView(event.currentTarget);
			this.changeDockMode(drawer, Orientation.BOTH);
		}*/
		
		private function contentView_openDrawerChangeHandler(event:Event):void {
			var content:ContentView = ContentView(event.currentTarget);
			drawers.openMode = content.openMode;
		}
	}
}