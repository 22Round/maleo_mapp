package screens {
	import application.AssetsLoader;
	import feathers.controls.Button;
	import feathers.controls.Header;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import feathers.skins.ImageSkin;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextFormat;
	import starling.textures.TextureSmoothing;
	

	public class StatusBar extends Header {
		
		private var bgQuad:Quad;
		private var bgSkin:Image;
		private var titleStyle:TextFormat;
		
		private var menuItems:Vector.<Object>;
		public static var _currentLeftItem:String;
		public static var _currentRightItem:String;
		
		private var tween:Tween;
		
		
		public function StatusBar() {
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, added)
			
		}
		
		public function _changeTitle(titleStr:String = ''):void {
			title = titleStr;
		}
		
		public function _changeBackgroundSkin(bgColor:uint = 0x196d98):void {
			var bgQuad:Quad = new Quad(10, 10, bgColor);
			
			this.backgroundSkin = bgQuad;
			//this.refreshBackgroundSkin();
		}
		
		private function added(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, added);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removed);
			
			//_setMenuItems(MENU_WHITE_ITEM, LEFT_ITEM);
			//_setMenuItems(FAQ_WHITE_ITEM, RIGHT_ITEM);
			
			titleStyle = new TextFormat;
			titleStyle.font = '_bpgArialRegular';
			titleStyle.size = Settings._getIntByDPI(20);
			titleStyle.color = 0xFFFFFF;
			
			this.fontStyles = titleStyle;
			title = 'სავარაუდო ჩამოფრენა - 2016, 23 ოქტომბერი';
			
			_changeBackgroundSkin();
			
			titleFactory = function():ITextRenderer {
				var titleRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				titleRenderer.embedFonts = true;
				return titleRenderer;
			}
			
			this.width = stage.stageWidth;
			this.height = 0;
			this.alpha = 0;
			validate();
			
		}
		
		public function set _visible(boo:Boolean):void {
			const time:Number = .5;
			var thisAlpha:Number;
			var thisHeight:int;
			
			if (!this.visible && !boo) {
				return;
			}
			
			Starling.juggler.remove(tween);
			tween = new Tween(this, time, Transitions.EASE_OUT);
			
			if (boo) {
				this.visible = boo;
				thisAlpha = 1;
				
				thisHeight = Settings._getIntByDPI(60);
				
			}else {
				
				thisAlpha = 0;
				thisHeight = 0;
			}
			tween.animate("height", thisHeight);
			tween.fadeTo(thisAlpha);
			tween.onComplete = onTweenCompleted;
			tween.onCompleteArgs = [boo];
			Starling.juggler.add(tween);	
		}
		
		private function onTweenCompleted(boo:Boolean):void {
			this.visible = boo;
			Starling.juggler.remove(tween);
		}
		
		public function get _visible():Boolean {
			return this.visible;
		}
		
		private function removed(e:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
	}

}