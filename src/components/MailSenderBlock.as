package components {
	
	import application.AssetsLoader;
	import application.utils.StaticGUI;
	import feathers.controls.AutoComplete;
	import feathers.controls.ButtonState;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.List;
	import feathers.controls.TabBar;
	import feathers.controls.ToggleButton;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import feathers.data.ListCollection;
	import feathers.data.LocalAutoCompleteSource;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.skins.ImageSkin;
	import flash.geom.Rectangle;
	import starling.events.Event;
	import starling.text.TextFormat;
	
	
	public class MailSenderBlock extends LayoutGroup {
		private var title:Label;
		private var titleStyle:TextFormat;
		private var titleDisabledStyle:TextFormat;
		private var tabStyle:TextFormat;
		private var tabSelectedStyle:TextFormat;
		private var tabDisabledStyle:TextFormat;
		
		private var inputStyle:TextFormat;
		private var inputPromptStyle:TextFormat;
		private var titleStr:String;
		private var inputPromptStr:String;
		private var tabBar:TabBar;
		
		public function MailSenderBlock(title:String, inputPrompt:String) {
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
			
			tabStyle = new TextFormat;
			tabStyle.font = '_bpgArialRegular';
			tabStyle.size = Settings._getIntByDPI(20);
			tabStyle.color = 0x575a5b;
			
			tabSelectedStyle = new TextFormat;
			tabSelectedStyle.font = '_bpgArialRegular';
			tabSelectedStyle.size = Settings._getIntByDPI(20);
			tabSelectedStyle.color = 0xffffff;
			
			tabDisabledStyle = new TextFormat;
			tabDisabledStyle.font = '_bpgArialRegular';
			tabDisabledStyle.size = Settings._getIntByDPI(20);
			tabDisabledStyle.color = 0xabadad;
			
			title = StaticGUI._addLabel(this, titleStr, titleStyle);
			title.disabledFontStyles = titleDisabledStyle;
			
			
			
			var dataProvObj:Object;
			var dataProvArr:Array = new Array;
			
			var labelArr:Array = new Array(Settings._mui['mails_declare_sendercase1'][Settings._lang], Settings._mui['mails_declare_sendercase2'][Settings._lang]);
			for (var i:uint; i < 2; i++) {
				dataProvObj = new Object;
				dataProvObj.label = labelArr[i];
				dataProvArr.push(dataProvObj);
				
			}
			
			tabBar = new TabBar();
			
			tabBar.firstTabFactory = function():ToggleButton {
				
				var tabSkin:ImageSkin = new ImageSkin(AssetsLoader._asset.getTexture("posta_declare_menuitem_1_default_btn.png"));
				tabSkin.selectedTexture = AssetsLoader._asset.getTexture("posta_declare_menuitem_1_selected_btn.png");
				tabSkin.disabledTexture = AssetsLoader._asset.getTexture("posta_declare_menuitem_1_disabled_btn.png");
				var tab:ToggleButton = new ToggleButton();
				
				tab.labelFactory = function():ITextRenderer {
					var renderer:TextFieldTextRenderer = new TextFieldTextRenderer();
					renderer.embedFonts = true;
					return renderer;
				};
				
				tab.defaultSkin = tabSkin;
				tab.fontStyles = tabStyle;
				tab.setFontStylesForState(ButtonState.DOWN_AND_SELECTED, tabSelectedStyle);
				tab.setFontStylesForState(ButtonState.HOVER_AND_SELECTED, tabSelectedStyle);
				tab.setFontStylesForState(ButtonState.UP_AND_SELECTED, tabSelectedStyle);
				tab.setFontStylesForState(ButtonState.DISABLED, tabDisabledStyle);
				
				return tab;
			}
			
			tabBar.lastTabFactory = function():ToggleButton {
				
				var tabSkin:ImageSkin = new ImageSkin(AssetsLoader._asset.getTexture("posta_declare_menuitem_2_default_btn.png"));
				tabSkin.selectedTexture = AssetsLoader._asset.getTexture("posta_declare_menuitem_2_selected_btn.png");
				tabSkin.disabledTexture = AssetsLoader._asset.getTexture("posta_declare_menuitem_2_disabled_btn.png");
				var tab:ToggleButton = new ToggleButton();
				
				tab.labelFactory = function():ITextRenderer {
					var renderer:TextFieldTextRenderer = new TextFieldTextRenderer();
					renderer.embedFonts = true;
					return renderer;
				};
				
				tab.defaultSkin = tabSkin;
				tab.fontStyles = tabStyle;
				tab.setFontStylesForState(ButtonState.DOWN_AND_SELECTED, tabSelectedStyle);
				tab.setFontStylesForState(ButtonState.HOVER_AND_SELECTED, tabSelectedStyle);
				tab.setFontStylesForState(ButtonState.UP_AND_SELECTED, tabSelectedStyle);
				tab.setFontStylesForState(ButtonState.DISABLED, tabDisabledStyle);
				
				return tab;
			}
			
			tabBar.dataProvider = new ListCollection(dataProvArr);
			
			tabBar.addEventListener(Event.CHANGE, tabBarHandler);
			tabBar.layoutData = new AnchorLayoutData(NaN, 0, 0, 0);
			tabBar.styleProvider = null;
			this.addChild(tabBar);
			tabBar.validate();
			
			var inputSkin:ImageSkin = new ImageSkin(AssetsLoader._asset.getTexture("posta_declare_field_default.png"));
			inputSkin.disabledTexture = AssetsLoader._asset.getTexture("posta_declare_field_disabled.png")
			inputSkin.scale9Grid = new Rectangle(40, 40, 120, 120);
			
			var input:AutoComplete = StaticGUI._addAutoComplete(this, inputPromptStr, inputStyle, inputPromptStyle);
			input.backgroundSkin = inputSkin;
			input.source = new LocalAutoCompleteSource(new ListCollection(new <String>["Apple", "Apricot", "Banana", "Cantaloupe", "Cherry", "Grape", "Lemon", "Lime", "Mango", "Orange", "Peach", "Pineapple", "Plum", "Pomegranate", "Raspberry", "Strawberry", "Watermelon"]));
			//TODO neen real data from server
			
			input.listFactory = function():List{
				var list:List = new List();
				
				list.itemRendererFactory = function():IListItemRenderer{
					var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
					renderer.height = 40;
					renderer.labelFactory = function():ITextRenderer {
						var renderer:TextFieldTextRenderer = new TextFieldTextRenderer();
						renderer.embedFonts = true;
						return renderer;
					};
					
					//set item renderer styles here, if not using a theme
					var skin:ImageSkin = new ImageSkin();
					skin.defaultColor = 0xeff2f2;
					skin.setColorForState( ButtonState.HOVER, 0xe9ebeb);
					skin.setColorForState( ButtonState.DOWN, 0xe9ebeb);
					skin.scale9Grid = new Rectangle( 2, 2, 1, 6 );
					renderer.defaultSkin = skin;
					renderer.fontStyles = inputStyle;
					return renderer;
				}
				
				return list;
			}
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
