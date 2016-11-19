package screens.splash {
	import application.AssetsLoader;
	import application.utils.DeviceInfo;
	import feathers.controls.Button;
	import feathers.controls.ImageLoader;
	import feathers.controls.PageIndicator;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import screens.splash.gallery.GalleryMain;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	
	[Event(name = "change", type = "starling.events.Event")]
	
	public class ScreenIntro extends Sprite {
		
		private var pageIndicator:PageIndicator;
		
		public function ScreenIntro() {
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, added);
			
		}
		
		private function added(e:Event):void {
			
			removeEventListener(Event.ADDED_TO_STAGE, added);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removed);
			
			/*var loader:ImageLoader = new ImageLoader();
			
			loader.source = 'assets/intro_slide_1.jpg';
			loader.x = 0;
			this.addChild( loader );
			
			loader.height = stage.stageHeight;
			loader.width = stage.stageWidth;
			loader.maintainAspectRatio = false;
			loader.validate();*/
			
			pageIndicator = new PageIndicator();
			
			var sh:GalleryMain = new GalleryMain;
			sh.addEventListener(Event.CHANGE, galleryChange);
			addChild(sh);
			
			pageIndicator.pageCount = 4;
			pageIndicator.addEventListener(Event.CHANGE, pageIndicator_changeHandler);
			addChild(pageIndicator);
			pageIndicator.validate();
			pageIndicator.x = (stage.stageWidth-pageIndicator.width)/2;
			pageIndicator.y = stage.stageHeight - 150;
			
			var pushB1Button:Button = new Button();
			pushB1Button.label = "გამოტოვება";
			pushB1Button.width = 150;
			pushB1Button.height = 30;
			pushB1Button.x = stage.stageWidth - pushB1Button.width-10;
			pushB1Button.y = 10;
			pushB1Button.addEventListener(Event.TRIGGERED, pushB1Button_triggeredHandler);
			this.addChild(pushB1Button);
			
		}
		
		private function galleryChange(e:Event):void {
			
			pageIndicator.selectedIndex = Object(e.data).horizontalPageIndex;
		}
		
				
		private function pageIndicator_changeHandler(event:Event):void {
			trace("page indicator change:", pageIndicator.selectedIndex);
		}
		
		private function removed(e:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			
		}
		
				
		protected function pushB1Button_triggeredHandler(event:Event):void {
			this.dispatchEventWith(Event.COMPLETE);
		}
		
	}

}