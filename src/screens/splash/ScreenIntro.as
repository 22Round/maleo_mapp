package screens.splash {
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.PageIndicator;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.RelativePosition;
	import feathers.skins.ImageSkin;
	import flash.geom.Rectangle;
	import screens.splash.gallery.GalleryMain;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextFormat;
	import starling.textures.TextureSmoothing;
	
	public class ScreenIntro extends LayoutGroup {
		
		private var pageIndicator:PageIndicator;
		private var sh:GalleryMain;
		private var skipBtn:Button;
		private var contBtn:Button;
		
		private var btnStyle:TextFormat;
		private var legendStyle:TextFormat;
		
		public function ScreenIntro() {
			super();
		
			
		}
		
		override protected function initialize():void {
			
			super.initialize();
			
			
			
			this.layout = new AnchorLayout();
			
			/*var loader:ImageLoader = new ImageLoader();
			
			loader.source = 'assets/intro_slide_1.jpg';
			loader.x = 0;
			this.addChild( loader );
			
			loader.height = stage.stageHeight;
			loader.width = stage.stageWidth;
			loader.maintainAspectRatio = false;
			loader.validate();*/
			
			var pageIndLabelLayoutData:AnchorLayoutData = new AnchorLayoutData();
			pageIndLabelLayoutData.horizontalCenter = 0;
			pageIndLabelLayoutData.bottom = Settings._getIntByDPI(150)
			pageIndLabelLayoutData.left = Settings._getIntByDPI(68);
			
			pageIndicator = new PageIndicator();
			pageIndicator.styleProvider = null;
			pageIndicator.gap = Settings._getIntByDPI(18);
			
			btnStyle = new TextFormat;
			btnStyle.font = '_bpgArialRegular';
			btnStyle.size = Settings._getIntByDPI(24);
			btnStyle.color = 0xffffff;
			
			legendStyle = new TextFormat;
			legendStyle.font = '_bpgMrglovaniCapsRegular';
			legendStyle.size = Settings._getIntByDPI(30);
			legendStyle.color = 0xffffff;
			
			
			pageIndicator.normalSymbolFactory = function():DisplayObject {
			
				var dot:Image = new Image(AssetsLoader._asset.getTexture("paging_dot_default.png"));
				dot.width = Settings._getIntByDPI(11);
				dot.scaleY = dot.scaleX;
				dot.textureSmoothing = TextureSmoothing.TRILINEAR;
				return dot;
			};
			 
			pageIndicator.selectedSymbolFactory = function():DisplayObject{
				var dot:Image = new Image(AssetsLoader._asset.getTexture("paging_dot_selected.png"));
				dot.width = Settings._getIntByDPI(11);
				dot.scaleY = dot.scaleX;
				dot.textureSmoothing = TextureSmoothing.TRILINEAR;
				return dot;
			};
			
			sh = new GalleryMain;
			sh.addEventListener(Event.CHANGE, galleryChange);
			addChild(sh);
			
			pageIndicator.pageCount = 3;
			pageIndicator.layoutData = pageIndLabelLayoutData;
			pageIndicator.addEventListener(Event.CHANGE, pagingHandler);
			addChild(pageIndicator);
			pageIndicator.validate();
			
			var skipBtnLayoutData:AnchorLayoutData = new AnchorLayoutData();
			
			skipBtnLayoutData.top = Settings._getIntByDPI(40)
			skipBtnLayoutData.right = Settings._getIntByDPI(40);
			
			
			var skipBtnIco:ImageSkin = new ImageSkin(AssetsLoader._asset.getTexture("intro_skip_arrow_btn.png"));
			skipBtnIco.textureSmoothing = TextureSmoothing.TRILINEAR;
			skipBtnIco.width = Settings._getIntByDPI(9);
			skipBtnIco.scaleY = skipBtnIco.scaleX;
			
			skipBtn = StaticGUI._addBtnSkin(this, 'გამოტოვება', btnStyle, null);
			skipBtn.layoutData = skipBtnLayoutData;
			skipBtn.defaultIcon = skipBtnIco;
			skipBtn.iconPosition = RelativePosition.RIGHT;
			skipBtn.addEventListener(Event.TRIGGERED, skipHandler);
			
			var contBtnLayoutData:AnchorLayoutData = new AnchorLayoutData();
			contBtnLayoutData.horizontalCenter = 0;
			contBtnLayoutData.bottom = Settings._getIntByDPI(250)
			
			
			var contBtnSkin:ImageSkin = new ImageSkin(AssetsLoader._asset.getTexture("intro_start_btn.png"));
			contBtnSkin.scale9Grid = new Rectangle(40, 40, 120, 120);
			contBtnSkin.textureSmoothing = TextureSmoothing.TRILINEAR;
			contBtnSkin.width = Settings._getIntByDPI(295);
			contBtnSkin.scaleY = contBtnSkin.scaleX;
		
			
			contBtn = StaticGUI._addBtnSkin(this, 'გაგრძელება', btnStyle, contBtnSkin);
			contBtn.labelOffsetY =  Settings._getIntByDPI(10);
			contBtn.layoutData = contBtnLayoutData;
			contBtn.addEventListener(Event.TRIGGERED, contHandler);
			
			
			var labelLayoutData:AnchorLayoutData = new AnchorLayoutData();
			labelLayoutData.horizontalCenter = 0;
			labelLayoutData.bottom = Settings._getIntByDPI(400)
			var label:Label = StaticGUI._addLabel(this, 'ამანათების ჩამოტანა ამერიკიდან,<br>ყველაზე დაბალ ფასებში', legendStyle);
			label.width = stage.stageWidth - 60;
			label.textRendererProperties.wordWrap = true;
			label.textRendererProperties.isHTML = true;
			label.layoutData = labelLayoutData;
			
			
		}
		
		private function contHandler(e:Event):void {
			
		}
		
		private function galleryChange(e:Event):void {
			
			pageIndicator.selectedIndex = Object(e.data).horizontalPageIndex;
		}
		
		override public function dispose():void {
			
			if (skipBtn) skipBtn.removeEventListener(Event.TRIGGERED, skipHandler);
			if (pageIndicator) pageIndicator.removeEventListener(Event.TRIGGERED, pagingHandler);
			if (contBtn) contBtn.removeEventListener(Event.TRIGGERED, contHandler);
			//if (mailRegBtn) mailRegBtn.removeEventListener(Event.TRIGGERED, mailRegHandler);
			//if (faceBRegBtn) faceBRegBtn.removeEventListener(Event.TRIGGERED, faceBdHandler);
			
			//StaticGUI._safeRemoveChildren(group, true);
			//StaticGUI._safeRemoveChildren(inputGroup, true);
			
			super.dispose();
		}
		
				
		private function pagingHandler(event:Event):void {
			trace("page indicator change:", pageIndicator.selectedIndex);
		}
		
		
				
		protected function skipHandler(event:Event):void {
			this.dispatchEventWith(AppEvent.COMPLETED);
		}	
	}
}