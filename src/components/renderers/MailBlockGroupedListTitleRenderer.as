package components.renderers {
	
	import application.utils.StaticGUI;
	import feathers.controls.GroupedList;
	import feathers.controls.Label;
	import feathers.controls.renderers.IGroupedListItemRenderer;
	import feathers.core.FeathersControl;
	import starling.events.Event;
	import starling.text.TextFormat;
	
	
	public class MailBlockGroupedListTitleRenderer extends FeathersControl implements IGroupedListItemRenderer {
		
		
		private var titleStyle:TextFormat;
		
		public function MailBlockGroupedListTitleRenderer() {
			super();
			
			titleStyle = new TextFormat;
			titleStyle.font = '_bpgArialRegular';
			titleStyle.size = Settings._getIntByDPI(20);
			titleStyle.color = 0x78828b;
		}
		
		protected var _label:Label;
		
		protected var _groupIndex:int = -1;
		
		public function get groupIndex () : int {
			return this._groupIndex;
		};
		
		public function set groupIndex (value:int) : void {
			if (this._groupIndex == value) {
				return;
			}
			this._groupIndex = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		
		protected var _layoutIndex:int = -1;
		
		public function get layoutIndex () : int {
			return this._layoutIndex;
		};
		
		public function set layoutIndex (value:int) : void {
			if (this._layoutIndex == value) {
				return;
			}
			this._layoutIndex = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		
		protected var _itemIndex:int = -1;
		
		public function get itemIndex () : int {
			return this._itemIndex;
		};
		
		public function set itemIndex (value:int) : void {
			if (this._itemIndex == value) {
				return;
			}
			this._itemIndex = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}		
		
		
		protected var _owner:GroupedList;
		
		public function get owner():GroupedList {
			return this._owner;
		}
		
		public function set owner(value:GroupedList):void {
			if (this._owner == value) {
				return;
			}
			this._owner = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		protected var _data:Object;
		
		public function get data():Object {
			return this._data;
		}
		
		public function set data(value:Object):void {
			if (this._data == value) {
				return;
			}
			this._data = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		protected var _factoryID:String;
		
		public function get factoryID():String {
			return this._factoryID;
		}
		
		public function set factoryID(value:String):void {
			this._factoryID = value;
		}
		
		protected var _isSelected:Boolean;
		
		public function get isSelected():Boolean {
			return this._isSelected;
		}
		
		public function set isSelected(value:Boolean):void {
			if (this._isSelected == value) {
				return;
			}
			this._isSelected = value;
			this.invalidate(INVALIDATION_FLAG_SELECTED);
			this.dispatchEventWith(Event.CHANGE);
		}
		
		protected var _padding:Number = 0;
		
		public function get padding():Number {
			return this._padding;
		}
		
		public function set padding(value:Number):void {
			if (this._padding == value) {
				return;
			}
			this._padding = value;
			this.invalidate(INVALIDATION_FLAG_LAYOUT);
		}
		
		override protected function initialize():void {
			
			super.initialize();
			
			if (!this._label) {
				this._label = StaticGUI._addLabel(this, '', titleStyle);
				
			}
		}
		
		override public function dispose():void {
			
			if (_label) _label = StaticGUI._safeRemoveChildren(_label, true);
			
			super.dispose();
		}
		
		override protected function draw():void {
			var dataInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_DATA);
			
			if (dataInvalid) {
				this.commitData();
			}
			
			this.autoSizeIfNeeded();
			this.layoutChildren();
		}
		
		protected function autoSizeIfNeeded():Boolean {
			var needsWidth:Boolean = isNaN(this.explicitWidth);
			var needsHeight:Boolean = isNaN(this.explicitHeight);
			if (!needsWidth && !needsHeight) {
				return false;
			}
			
			this._label.width = this.explicitWidth - 2 * this._padding;
			this._label.height = this.explicitHeight - 2 * this._padding;
			this._label.validate();
			
			var newWidth:Number = this.explicitWidth;
			if (needsWidth) {
				newWidth = this._label.width + 2 * this._padding;
			}
			var newHeight:Number = this.explicitHeight;
			if (needsHeight) {
				newHeight = this._label.height + 2 * this._padding;
			}
			
			return this.setSizeInternal(newWidth, newHeight, false);
		}
		
		protected function commitData():void {
			if (this._data) {
				this._label.text = this._data.title;
				
				/*_blockIitem._addDataState(this._data.status);
				_blockIitem.validate();*/
				
			} else {
				
			}
		}
		
		protected function layoutChildren():void {
			this._label.x = this._padding;
			this._label.y = this._padding;
			this._label.width = this.actualWidth - 2 * this._padding;
			this._label.height = this.actualHeight - 2 * this._padding;
		}
	}
}