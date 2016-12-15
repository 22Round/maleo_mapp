package screens.faq {
	
	import feathers.controls.Screen;
	import feathers.controls.WebView;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	
	
	public class ScreenFAQ extends Screen {
		
		
		public function ScreenFAQ() {
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			super.initialize();
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.MIDDLE;
			
			layout.paddingTop = Settings._getIntByDPI(130);
			this.layout = layout;

			
			
			
			//var label:Label = StaticGUI._addLabel(this, "Sesvla", labelStyle);
			
			var browser:WebView = new WebView();
			browser.width = stage.stageWidth;
			browser.height = stage.stageHeight - layout.paddingTop;
			
			browser.loadString( "<!doctype html><html><body><h1>THIS IS FAQ PAGE</h1><br>1<br>2</body></html>");
			addChild( browser );
			browser.validate();
			
		
		}
		
		override public function dispose():void {
			
			
			
			
			//StaticGUI._safeRemoveChildren(group, true);

			
			super.dispose();
		}
	}
}
