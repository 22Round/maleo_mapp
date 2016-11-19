package screens.splash.gallery {
	import feathers.controls.AutoSizeMode;
	import feathers.controls.ImageLoader;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.List;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.ScrollPolicy;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalAlign;
	import feathers.utils.textures.TextureCache;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.events.Event;
	
	public class GalleryMain extends LayoutGroup {
		//used by the extended theme
		public static const THUMBNAIL_LIST_NAME:String = "thumbnailList";
		
		public function GalleryMain() {
			//set up the theme right away!
			//this is an *extended* version of MetalWorksMobileTheme
			new GalleryTheme();
			super();
		}
		
		protected var selectedImage:ImageLoader;
		protected var list:List;
		protected var message:Label;
		protected var fadeTween:Tween;
		protected var textureCache:TextureCache;
		
		override public function dispose():void {
			if (this.textureCache) {
				this.textureCache.dispose();
				this.textureCache = null;
			}
			super.dispose();
		}
		
		override protected function initialize():void {
			super.initialize();
			
			//this is an *extended* version of MetalWorksMobileTheme
			//new GalleryTheme();
			
			this.autoSizeMode = AutoSizeMode.STAGE;
			this.layout = new AnchorLayout();
			
			this.textureCache = new TextureCache(30);
			
			var listLayout:HorizontalLayout = new HorizontalLayout();
			listLayout.verticalAlign = VerticalAlign.JUSTIFY;
			listLayout.hasVariableItemDimensions = true;
			
			var listLayoutData:AnchorLayoutData = new AnchorLayoutData();
			listLayoutData.left = 0;
			listLayoutData.right = 0;
			listLayoutData.bottom = 0;
			
			this.list = new List();
			//this.list.styleNameList.add(THUMBNAIL_LIST_NAME);
			this.list.layout = listLayout;
			this.list.horizontalScrollPolicy = ScrollPolicy.ON;
			this.list.snapScrollPositionsToPixels = true;
			this.list.scrollBarDisplayMode = ScrollBarDisplayMode.NONE;
			this.list.horizontalScrollStep = stage.stageWidth;
			this.list.itemRendererFactory = itemRendererFactory;
			this.list.snapToPages = true;
			this.list.addEventListener(Event.CHANGE, list_changeHandler);
			this.list.addEventListener(FeathersEventType.SCROLL_COMPLETE, listScrollCompleted);
			this.list.height = stage.stageHeight;
			this.list.width = stage.stageWidth;
			
			this.list.layoutData = listLayoutData;
			this.addChild(this.list);
			
			loadSlides();
		}
		
		private function listScrollCompleted(e:Event):void {
			this.dispatchEventWith(Event.CHANGE, false, this.list);
		}
		
		protected function itemRendererFactory():IListItemRenderer {
			var itemRenderer:GalleryItemRenderer = new GalleryItemRenderer();
			itemRenderer.textureCache = this.textureCache;
			return itemRenderer;
		}
		
		protected function list_changeHandler(event:Event):void {
			//this.selectedImage.visible = false;
			if (this.fadeTween) {
				Starling.juggler.remove(this.fadeTween);
				this.fadeTween = null;
			}
			
			
			//this.selectedImage.source = item.url;
			//this.message.text = "Loading...";
		}
		
		protected function loadSlides():void {
			
			var items:Vector.<GalleryItem> = new <GalleryItem>[];
			
			for (var i:int = 0; i < 3; i++) {
				
				items.push(new GalleryItem('slider', 'assets/intro_slide_' + i + '.jpg', 'assets/intro_slide_' + i + '.jpg'));
			}
			
			this.list.dataProvider = new ListCollection(items);
			this.list.selectedIndex = 0;
		}
	}
}
