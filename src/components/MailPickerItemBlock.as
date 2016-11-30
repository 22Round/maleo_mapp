package components {
	
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.List;
	import feathers.controls.PickerList;
	import feathers.controls.popups.VerticalCenteredPopUpContentManager;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.RelativePosition;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.skins.ImageSkin;
	import flash.geom.Rectangle;
	import starling.events.Event;
	import starling.text.TextFormat;
	import starling.textures.TextureSmoothing;
	
	
	public class MailPickerItemBlock extends LayoutGroup {
		private var title:Label;
		private var titleStyle:TextFormat;
		private var titleDisabledStyle:TextFormat;
		
		private var inputStyle:TextFormat;
		private var inputPromptStyle:TextFormat;
		private var titleStr:String;
		private var inputPromptStr:String;
		
		public function MailPickerItemBlock(title:String, inputPrompt:String) {
			titleStr = title;
			inputPromptStr = inputPrompt;
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.TOP;
			layout.gap = Settings._getIntByDPI(20);
			this.layout = layout;
			
			inputStyle = new TextFormat;
			inputStyle.font = '_bpgArialRegular';
			inputStyle.size = Settings._getIntByDPI(24);
			inputStyle.horizontalAlign = HorizontalAlign.CENTER;
			inputStyle.color = 0xd3d4d4;
			
			inputPromptStyle = new TextFormat;
			inputPromptStyle.font = '_bpgArialRegular';
			inputPromptStyle.size = Settings._getIntByDPI(24);
			inputPromptStyle.horizontalAlign = HorizontalAlign.CENTER;
			inputPromptStyle.color = 0xd3d4d4;
			
			titleStyle = new TextFormat;
			titleStyle.font = '_bpgArialRegular';
			titleStyle.size = Settings._getIntByDPI(24);
			titleStyle.color = 0x575a5b;
			
			titleDisabledStyle = new TextFormat;
			titleDisabledStyle.font = '_bpgArialRegular';
			titleDisabledStyle.size = Settings._getIntByDPI(24);
			titleDisabledStyle.color = 0xabadad;
			

			
			title = StaticGUI._addLabel(this, titleStr, titleStyle);
			title.disabledFontStyles = titleDisabledStyle;
			
			var inputSkin:ImageSkin = new ImageSkin(AssetsLoader._asset.getTexture("posta_declare_field_default.png"));
			inputSkin.disabledTexture = AssetsLoader._asset.getTexture("posta_declare_field_disabled.png")
			inputSkin.scale9Grid = new Rectangle(40, 40, 120, 120);
			
			var items:Array = [];
			for (var i:int = 0; i < 150; i++) {
				var item:Object = {text: "Item " + (i + 1).toString()};
				items[i] = item;
			}
			items.fixed = true;
			
			var list:PickerList = new PickerList();
			list.styleProvider = null;
			
			list.buttonFactory = function():Button {
				var btn:Button = StaticGUI._addBtnSkin(this, inputPromptStr, inputStyle, inputSkin);
				btn.styleProvider = null;
				btn.horizontalAlign = HorizontalAlign.CENTER;
				var icoSkin:ImageSkin = new ImageSkin(AssetsLoader._asset.getTexture("posta_pickerfield_arrow.png"));
				icoSkin.textureSmoothing = TextureSmoothing.TRILINEAR;
				icoSkin.width = Settings._getIntByDPI(16);
				icoSkin.scaleY = icoSkin.scaleX;
				btn.defaultIcon = icoSkin;
				btn.iconPosition = RelativePosition.RIGHT_BASELINE;
				btn.iconOffsetX = 200;
				return btn; 
			}
			
			
			
			list.prompt = "Select an Item";
			list.dataProvider = new ListCollection(items);
			//normally, the first item is selected, but let's show the prompt
			list.selectedIndex = -1;
			
			list.addEventListener(Event.CHANGE, pickerListHandler);
			addChild(list);
			
			//the typical item helps us set an ideal width for the button
			//if we don't use a typical item, the button will resize to fit
			//the currently selected item.
			list.typicalItem = {text: "Select an Item"};
			list.labelField = "text";
			list.popUpContentManager = new VerticalCenteredPopUpContentManager
			list.listFactory = function():List {
				var list:List = new List;
				
				//notice that we're setting typicalItem on the list separately. we
				//may want to have the list measure at a different width, so it
				//might need a different typical item than the picker list's button.
				list.typicalItem = {text: "Item 1000"};
				list.itemRendererFactory = function():IListItemRenderer {
					var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
					//notice that we're setting labelField on the item renderers
					//separately. the default item renderer has a labelField property,
					//but a custom item renderer may not even have a label, so
					//PickerList cannot simply pass its labelField down to item
					//renderers automatically
					renderer.labelField = "text";
					return renderer;
				};
				return list;
			};
		}
		
		private function pickerListHandler(e:Event):void {
		
		}
		
		private function tabBarHandler(event:Event):void {
			//this._label.text = "selectedIndex: " + this._tabBar.selectedIndex.toString();
		}
		
		override public function dispose():void {
			
			//StaticGUI._safeRemoveChildren(this, true);
			
			super.dispose();
		}
	}
}
