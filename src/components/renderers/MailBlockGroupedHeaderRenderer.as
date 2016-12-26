package components.renderers {
	import application.utils.StaticGUI;
	import feathers.controls.GroupedList;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.renderers.IGroupedListHeaderRenderer;
	import feathers.core.FeathersControl;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import starling.events.Event;
	import starling.text.TextFormat;
	
	
	public class MailBlockGroupedHeaderRenderer extends FeathersControl implements IGroupedListHeaderRenderer {
		
		private var titleStyle:TextFormat;
		
		public function MailBlockGroupedHeaderRenderer() {
			
			
			titleStyle = new TextFormat;
			titleStyle.font = '_bpgArialRegular';
			titleStyle.size = Settings._getIntByDPI(30);
			titleStyle.color = 0x4d5051;
		}
		
		protected var _label:Label;
		private var labelGroup:LayoutGroup;
		protected var _index:int = -1;
		
		public function get index():int {
			return this._index;
		}
		
		public function set index(value:int):void {
			if (this._index == value) {
				return;
			}
			this._index = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		
		protected var _groupIndex:int = -1;
		
		public function get groupIndex():int {
			return this._groupIndex;
		}
		
		public function set groupIndex(value:int):void {
			if (this._groupIndex == value) {
				return;
			}
			this._groupIndex = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}
		
		protected var _layoutIndex:int = -1;
		
		public function get layoutIndex():int {
			return this._layoutIndex;
		}
		
		public function set layoutIndex(value:int):void {
			if (this._layoutIndex == value) {
				return;
			}
			this._layoutIndex = value;
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
		
		
		protected var _paddingTop:Number = 0;
		
		public function get paddingTop():Number {
			return this._paddingTop;
		}
		
		public function set paddingTop(value:Number):void {
			if (this._paddingTop == value) {
				return;
			}
			this._paddingTop = value;
			this.invalidate(INVALIDATION_FLAG_LAYOUT);
		}
		
		override protected function initialize():void {
			
			if(!labelGroup){
				labelGroup = new LayoutGroup();
				var labelLayout:VerticalLayout = new VerticalLayout();
				labelLayout.horizontalAlign = HorizontalAlign.CENTER;
				labelLayout.verticalAlign = VerticalAlign.TOP;
				
				labelLayout.paddingTop = Settings._getIntByDPI(70);
				labelLayout.paddingBottom =  Settings._getIntByDPI(30);
				labelGroup.layout = labelLayout;
				addChild(labelGroup);
			}
			
			
			if (!this._label) {
				this._label = StaticGUI._addLabel(labelGroup, '', titleStyle);
				
			}
		}
		
		
		override public function dispose():void {
			
			
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
			
			this.labelGroup.width = this.explicitWidth - 2 * this._padding;
			this.labelGroup.height = this.explicitHeight - 2 * this._padding;
			this.labelGroup.validate();
			
			var newWidth:Number = this.explicitWidth;
			if (needsWidth) {
				newWidth = this.labelGroup.width + 2 * this._padding;
			}
			var newHeight:Number = this.explicitHeight;
			if (needsHeight) {
				newHeight = this.labelGroup.height + 2 * this._padding;
			}
			
			return this.setSizeInternal(newWidth, newHeight, false);
		}
		
		protected function commitData():void {
			if (this._data) {
				this._label.text = this._data.label;
			} else {
				this._label.text = null;
			}
		}
		
		protected function layoutChildren():void {
			this.labelGroup.x = this._padding;
			this.labelGroup.y = this._padding;
			this.labelGroup.width = this.actualWidth - 2 * this._padding;
			this.labelGroup.height = this.actualHeight - 2 * this._padding;
		}
	}
}