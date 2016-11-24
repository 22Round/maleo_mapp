package drawer.skins {
	import drawer.views.ContentView;
	import drawer.views.DrawerView;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.themes.MetalWorksMobileTheme;
	
	import starling.display.Quad;
	
	public class DrawersExplorerTheme extends MetalWorksMobileTheme {
		public static const THEME_NAME_TOP_AND_BOTTOM_DRAWER:String = "drawers-explorer-top-and-bottom-drawer";
		public static const THEME_NAME_LEFT_AND_RIGHT_DRAWER:String = "drawers-explorer-left-and-right-drawer";
		
		public function DrawersExplorerTheme() {
			super();
		}
		
		override protected function initializeStyleProviders():void {
			super.initializeStyleProviders();
			this.getStyleProviderForClass(ContentView).defaultStyleFunction = setContentViewStyles;
			this.getStyleProviderForClass(DrawerView).setFunctionForStyleName(THEME_NAME_LEFT_AND_RIGHT_DRAWER, setLeftAndRightDrawerViewStyles);
		}
		
		protected function setContentViewStyles(view:ContentView):void {
			//don't forget to set styles from the super class, if required
			this.setScrollerStyles(view);
			
			var layout:VerticalLayout = new VerticalLayout();
			//layout.horizontalAlign = HorizontalAlign.CENTER;
			//layout.padding = 20;
			layout.paddingTop = 110;
			layout.gap = this.gutterSize;
			view.layout = layout;
		}
		
		protected function setLeftAndRightDrawerViewStyles(view:DrawerView):void {
			//don't forget to set styles from the super class, if required
			this.setScrollerStyles(view);
			
			//view.backgroundSkin = new Quad(10, 10, /*LIST_BACKGROUND_COLOR*/0x4d5051);
			
			var layout:VerticalLayout = new VerticalLayout();
			//layout.horizontalAlign = HorizontalAlign.CENTER;
			//layout.verticalAlign = VerticalAlign.MIDDLE;
			layout.paddingTop = Settings._getIntByDPI(110);
			layout.paddingLeft = Settings._getIntByDPI(45);
			layout.gap = Settings._getIntByDPI(60);
			view.layout = layout;
		}
	}
}
