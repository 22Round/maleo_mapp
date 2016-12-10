package screens.faq {
	
	import application.utils.StaticGUI;
	import feathers.controls.Screen;
	import feathers.controls.WebView;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;

	public class ScreenFAQ extends Screen {
		
		private var browser:WebView;
		private var layout:VerticalLayout;
		
		public function ScreenFAQ() {
			super();
		}
		
		override protected function initialize():void {
			super.initialize();
			
			layout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.MIDDLE;
			layout.paddingTop = Settings._getIntByDPI(130);
			this.layout = layout;
			
			browser = new WebView();
			browser.width = stage.stageWidth;
			browser.height = stage.stageHeight - layout.paddingTop;
			
			browser.loadString( "<!doctype html><html><body><h1>THIS IS FAQ PAGE</h1><br>1<br>2</body></html>" );
			this.addChild( browser );
			browser.validate();
			
		}
		
	
		
		override public function dispose():void {
			
			StaticGUI._safeRemoveChildren(browser, true);
			browser = null;
			layout = null;
			
			super.dispose();
		}
		
		
	}
}