package
{
	import com.mesmotronic.ane.AndroidFullScreen;
	import flash.display.Bitmap;
	import flash.display.CapsStyle;
	import flash.display.LineScaleMode;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageOrientation;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.utils.getDefinitionByName;
	

	//[SWF(width="534",height="800",frameRate="60",backgroundColor="#B0E0FF")] // MOBILE
	[SWF(width="432",height="576",frameRate="60",backgroundColor="#7DCEF2")] // FGL
	//[SWF(width="408",height="544",frameRate="60",backgroundColor="#B0E0FF")] // FACEBOOK
	/**
	 * An example of a startup class that displays a preloader for a Starling
	 * app. Uses the <code>-frame</code> compiler argument to include the root
	 * Starling display object on the second frame of the SWF rather than on the
	 * first frame. The first frame loads quickly and can display things on the
	 * native display list while the second frame is still loading.
	 *
	 * <p>DO NOT import or reference anything in this class that you do not want
	 * to include in the first frame. Carefully consider any decision to
	 * import any class that has embedded assets like images or sounds. If you
	 * need embedded assets in the preloader, they should be separate from the
	 * rest of your embedded assets to keep the first frame nice and small.</p>
	 *
	 * <p>The following compiler argument is required to make this work:</p>
	 * <pre>-frame=two,com.example.StarlingRoot</pre>
	 *
	 * <p>Because our StarlingRoot class is a Starling display object, and
	 * because we don't import starling.core.Starling in this class, the
	 * Starling Framework will also be included on frame 2 instead of frame 1.</p>
	 */
	public class Preloader extends MovieClip
	{
		
		// -frame=two,GAME
		// Compilation failed while executing : ld64
		
		
		public static var preloader:Preloader;
		
		
		[Embed(source="assets/graphics/splashScreenLogo.png", mimeType="image/png")]
		public static const splashScreenLogo:Class;
		
		
		private var p:Number = 0;
		
		
		public var SS:Sprite;
		private var _circle1:Shape;
		private var _circle2:Shape;
		private var _angle:Number = 0;
		private var RADIUS:int = 30;
		private var WIDTH:int = 5;
		private var logo:Bitmap;
		
		
		
		public function Preloader()
		{
			Preloader.preloader = this;
			
			
			this.stop();
			
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.quality = StageQuality.BEST;
			
			
			addEventListener(Event.ADDED_TO_STAGE, handleAdedToStage);
			
			stage.addEventListener(Event.RESIZE, onResize);
			
		}
		
		
		public function handleAdedToStage(event:Event):void
		{
			removeEventListener(flash.events.Event.ADDED_TO_STAGE, handleAdedToStage);
			
			
			
			SS = new Sprite();
			addChild( SS );
			
			
			var rectangle:Shape = new Shape();
			rectangle.graphics.beginFill(0x7DCEF2);
			rectangle.graphics.drawRect(-806, -640, 1612, 1280);
			rectangle.graphics.endFill();
			SS.addChild(rectangle);
			
			
			logo = new Preloader.splashScreenLogo() as Bitmap;
			logo.scaleX *= 0.625;
			logo.scaleY *= 0.625;
			logo.x = logo.width / -2;
			logo.y = logo.height / -2;
			logo.smoothing = true;
			SS.addChild(logo);
			
			
			_circle1 = new Shape();
			_circle1.y = 270;
			_circle1.graphics.lineStyle(WIDTH, 0xFFFFFF, 0.5);
			_circle1.graphics.moveTo(0, -RADIUS);
			SS.addChild(_circle1);
			
			_circle2 = new Shape();
			_circle2.y = 270;
			_circle2.graphics.beginFill(0xFFFFFF, 0.25);
			_circle2.graphics.drawCircle(0, 0, 28);
			_circle2.graphics.endFill();
			_circle2.scaleX = _circle2.scaleY = 0;
			SS.addChild(_circle2);
			
			
			AndroidFullScreen.stage = stage;
			
			if (AndroidFullScreen.isImmersiveModeSupported)
			{
				AndroidFullScreen.immersiveMode();
			}
			
			//AndroidFullScreen.showUnderSystemUI();
			//AndroidFullScreen.fullScreen();
			//stage.setOrientation(StageOrientation.UPSIDE_DOWN);
			//stage.setOrientation(StageOrientation.DEFAULT);
			
			
			onResize(null);
			
			
			//initFakeLoader(); return;
			initRealLoader();
		}
		
		
		public function onResize(e:Event):void 
		{
			var sc:Number = stage.stageHeight / 800;
			
			SS.scaleX = SS.scaleY = sc;
			SS.y = stage.stageHeight / 2;
			SS.x = stage.stageWidth / 2;
		}
		
		
		
		
		private function initRealLoader():void
		{
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, loaderInfo_progressHandler);
			loaderInfo.addEventListener(Event.COMPLETE, loaderInfo_completeHandler);
		}
		
		
		private function initFakeLoader():void
		{
			function OEF(e:Event):void
			{
				p += 0.01;
				loaderInfo_progressHandler( { bytesLoaded:p, bytesTotal:1 } )
				
				if (p >= 1)
				{
					removeEventListener(Event.ENTER_FRAME, OEF);
					loaderInfo_completeHandler(null);
				}
			}
			addEventListener(Event.ENTER_FRAME, OEF);
		}
		
		
		
		
		
		
		private function loaderInfo_progressHandler(e:*):void
		{
			
			p = e.bytesLoaded / e.bytesTotal;
			
			updateGraphics1(p);
			
		}
		
		
		
		public function updateGraphics1(p:Number):void
		{
			
			//if (p > 1) { RADIUS = RADIUS2; p -= 1; };
			
			_angle = Math.round(360 * p) - 90;
			
			_angle = _angle * Math.PI / 180;
			
			var newX:Number = Math.cos(_angle) * RADIUS;
			var newY:Number = Math.sin(_angle) * RADIUS;
			
			if (!isNaN(newY) && !isNaN(newX)){
				_circle1.graphics.lineTo(newX, newY);
			}
			
			//onResize(null);
			
			/*
			trace("-----------" + p)
			_logoCover.scaleX = 1-p;
			_logoCover.x = logo.x + logo.width - _logoCover.width/2;
			*/
		}
		
		public function updateGraphics2(p:Number):void
		{
			_circle2.scaleX = _circle2.scaleY = p;
			
			//onResize(null);
			
		}
		
		
		
		private function loaderInfo_completeHandler(event:Event):void
		{
			/*
			_circle.graphics.clear();
			SS.removeChild(_circle);
			_circle = null;
			*/
			
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, loaderInfo_progressHandler);
			loaderInfo.removeEventListener(Event.COMPLETE, loaderInfo_completeHandler);
			stage.removeEventListener(Event.RESIZE, onResize);
			
			gotoAndStop(2);
			
			var mainClass:Class = getDefinitionByName("GAME") as Class;
			addChild( new mainClass() );
			
		}
		
		
		
	}
}