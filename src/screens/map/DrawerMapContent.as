package screens.map {
	import feathers.controls.Button;
	import feathers.controls.LayoutGroup;
	import feathers.controls.StackScreenNavigator;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalAlign;
	import starling.display.Quad;
	
	
	public class DrawerMapContent extends LayoutGroup {

		public function DrawerMapContent() {
			
			super();
		}
		
		private var navigator:StackScreenNavigator;
		
		override protected function initialize():void {
		
			
			var layout:HorizontalLayout = new HorizontalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.TOP;
			layout.padding = 20;
			
			backgroundSkin = new Quad(10, 10, /*LIST_BACKGROUND_COLOR*/0x4d5051);
			
			layout.gap = Settings._getIntByDPI(20);
			this.layout = layout;
			
			var btn1:Button = new Button;
			btn1.label = 'settings 1';
			addChild(btn1);
			
			var btn2:Button = new Button;
			btn2.label = 'settings 2';
			addChild(btn2);
			
			this.width = stage.stageWidth;
			this.height = Settings._getIntByDPI(200);
			
		}
		
		
		override public function dispose():void {
			
			super.dispose();
		}
		
	}
}
