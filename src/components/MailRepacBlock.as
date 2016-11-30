package components {
	
	import application.AssetsLoader;
	import application.utils.MyCanvas;
	import application.utils.StaticGUI;
	import feathers.controls.ButtonState;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.Radio;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.skins.ImageSkin;
	import starling.text.TextFormat;
	import starling.textures.TextureSmoothing;
	
	
	public class MailRepacBlock extends LayoutGroup {
		private var title:Label;
		private var titleStyle:TextFormat;
		private var titleDisabledStyle:TextFormat;
		private var radioStyle:TextFormat;
		private var radioDisabledStyle:TextFormat;
		
		
		private var titleStr:String;
		private var radioGroup:LayoutGroup;
		private var radio:Radio;
		private var radioSkin:ImageSkin;

		
		public function MailRepacBlock(title:String) {
			titleStr = title;
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.TOP;
			layout.gap = Settings._getIntByDPI(40);
			this.layout = layout;
			
			radioStyle = new TextFormat;
			radioStyle.font = '_bpgArialRegular';
			radioStyle.size = Settings._getIntByDPI(24);
			radioStyle.color = 0x575a5b;
			
			radioDisabledStyle = new TextFormat;
			radioDisabledStyle.font = '_bpgArialRegular';
			radioDisabledStyle.size = Settings._getIntByDPI(24);
			radioDisabledStyle.color = 0xd3d4d4;
			
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
			
			
			radioGroup = new LayoutGroup();
			var radionHorizontalLayout:HorizontalLayout = new HorizontalLayout;
			radionHorizontalLayout.horizontalAlign = HorizontalAlign.CENTER;
			radionHorizontalLayout.gap = Settings._getIntByDPI(130);
			radioGroup.layout = radionHorizontalLayout;
			addChild(radioGroup);
			
			radioSkin = new ImageSkin(AssetsLoader._asset.getTexture('check_empty.png'));
			radioSkin.setTextureForState(ButtonState.DOWN, AssetsLoader._asset.getTexture('check_full.png'));
			radioSkin.setTextureForState(ButtonState.DOWN_AND_SELECTED, AssetsLoader._asset.getTexture('check_full.png'));
			radioSkin.setTextureForState(ButtonState.UP_AND_SELECTED, AssetsLoader._asset.getTexture('check_full.png'));
			radioSkin.setTextureForState(ButtonState.HOVER_AND_SELECTED, AssetsLoader._asset.getTexture('check_full.png'));
			radioSkin.setTextureForState(ButtonState.DISABLED_AND_SELECTED, AssetsLoader._asset.getTexture('check_disabled.png'));
			
			radioSkin.textureSmoothing = TextureSmoothing.TRILINEAR;
			radioSkin.width = Settings._getIntByDPI(34);
			radioSkin.scaleY = radioSkin.scaleX;
			
			radio = new Radio;
			radio.styleProvider = null;
			radio.isSelected = false;
			radio.fontStyles = radioStyle;
			radio.disabledFontStyles = radioDisabledStyle;
			radio.defaultIcon = radioSkin;
			radio.label = Settings._mui['mails_declare_yes'][Settings._lang];
			radio.labelOffsetX = 10;
			radio.labelFactory = function():ITextRenderer {
				
				var renderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				renderer.embedFonts = true;
				return renderer;
	
			}
			
			radioGroup.addChild(radio);
			radio.validate();
			
			var line:MyCanvas = new MyCanvas;
			line.lineStyle(1, 0xd6d7d7);
			line.lineTo(0, 0);
			line.lineTo(0, Settings._getIntByDPI(32));
			radioGroup.addChild(line);
			
			
			radioSkin = new ImageSkin(AssetsLoader._asset.getTexture('check_empty.png'));
			radioSkin.setTextureForState(ButtonState.DOWN, AssetsLoader._asset.getTexture('check_full.png'));
			radioSkin.setTextureForState(ButtonState.DOWN_AND_SELECTED, AssetsLoader._asset.getTexture('check_full.png'));
			radioSkin.setTextureForState(ButtonState.UP_AND_SELECTED, AssetsLoader._asset.getTexture('check_full.png'));
			radioSkin.setTextureForState(ButtonState.HOVER_AND_SELECTED, AssetsLoader._asset.getTexture('check_full.png'));
			radioSkin.setTextureForState(ButtonState.DISABLED_AND_SELECTED, AssetsLoader._asset.getTexture('check_disabled.png'));
			
			radioSkin.textureSmoothing = TextureSmoothing.TRILINEAR;
			radioSkin.width = Settings._getIntByDPI(34);
			radioSkin.scaleY = radioSkin.scaleX;
			
			radio = new Radio;
			radio.styleProvider = null;
			radio.isSelected = false;
			radio.fontStyles = radioStyle;
			radio.disabledFontStyles = radioDisabledStyle;
			radio.defaultIcon = radioSkin;
			radio.label = Settings._mui['mails_declare_no'][Settings._lang];
			radio.labelOffsetX = 10;
			radio.labelFactory = function():ITextRenderer {
				
				var renderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				renderer.embedFonts = true;
				return renderer;
	
			}
			
			radioGroup.addChild(radio);
			radio.validate();
		}
		
		override public function dispose():void {
			
			//StaticGUI._safeRemoveChildren(this, true);
			
			super.dispose();
		}
	}
}
