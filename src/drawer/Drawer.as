package drawer {
	import drawer.views.DrawerContent;
	import drawer.views.DrawerMain;
	import feathers.controls.DragGesture;
	import feathers.controls.Drawers;
	import drawer.views.DrawerView;
	import feathers.layout.Orientation;
	import screens.Splash;
	import screens.TopHeader;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Drawer extends Sprite {
		public function Drawer() {
			//set up the theme right away!
			
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

			drawers.openGesture = DragGesture.EDGE;
			
			drawers.content = new Splash();

			drawers.leftDrawerToggleEventType = TopHeader.TOGGLE_LEFT_DRAWER;
			drawers.content.addEventListener(Event.CHANGE, contentView_openDrawerChangeHandler);
			
			
			var leftDrawer:DrawerContent = new DrawerContent();
			drawers.leftDrawer = leftDrawer;
			drawers.leftDrawerDockMode = Orientation.NONE;
			
			this.addChild(drawers);
		}

		
		private function contentView_openDrawerChangeHandler(event:Event):void {
			
			drawers.openMode = 'CHANEG_MODE';
		}
	}
}