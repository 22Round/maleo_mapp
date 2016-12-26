package screens.posta {
	
	import application.utils.StaticGUI;
	import components.MailBlock;
	import components.renderers.MailBlockGroupedHeaderRenderer;
	import components.renderers.MailBlockGroupedListRenderer;
	import feathers.controls.GroupedList;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.ScrollPolicy;
	import feathers.controls.renderers.DefaultGroupedListHeaderOrFooterRenderer;
	import feathers.controls.renderers.IGroupedListHeaderRenderer;
	import feathers.controls.renderers.IGroupedListItemRenderer;
	import feathers.data.HierarchicalCollection;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import starling.events.Event;
	import starling.text.TextFormat;
	
	public class ScreenMainMails extends LayoutGroup {
		
		private var titleStyle:TextFormat;
		private var subTitleStyle:TextFormat;
		
		private var title:Label;
		private var item:MailBlock;
		
		private var arrivedGroup:LayoutGroup;
		private var arrivedGroupLayout:VerticalLayout;
		private var recivedGroup:LayoutGroup;
		private var recivedGroupLayout:VerticalLayout;
		private var sendGroup:LayoutGroup;
		private var sendGroupLayout:VerticalLayout;
		
		public function ScreenMainMails() {
			super();
			//this.title = "Screen C";
		}
		
		override protected function initialize():void {
			
			super.initialize();
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.TOP;
			
			layout.paddingTop = Settings._getIntByDPI(160);
			layout.paddingBottom = Settings._getIntByDPI(103);
			this.layout = layout;
			
			
			titleStyle = new TextFormat;
			titleStyle.font = '_bpgArialRegular';
			titleStyle.size = Settings._getIntByDPI(30);
			titleStyle.color = 0x4d5051;
			
			subTitleStyle = new TextFormat;
			subTitleStyle.font = '_bpgArialRegular';
			subTitleStyle.size = Settings._getIntByDPI(20);
			subTitleStyle.color = 0x798188;
			
			
			var listLayout:VerticalLayout = new VerticalLayout();
			listLayout.verticalAlign = VerticalAlign.TOP;
			listLayout.horizontalAlign = HorizontalAlign.CENTER;
			
			
			//listLayout.paddingLeft = Settings._getIntByDPI(15);
			//listLayout.paddingRight = Settings._getIntByDPI(15);
			
			var list:GroupedList = new GroupedList();
			list.horizontalScrollPolicy = ScrollPolicy.OFF;
			list.scrollBarDisplayMode = ScrollBarDisplayMode.NONE;
			list.clipContent = false;
			list.width = stage.stageWidth;
			list.backgroundSkin = null;
			list.height = stage.stageHeight - layout.paddingTop - layout.paddingBottom;
			this.addChild( list );
			list.validate();
			list.layout = listLayout;
			
			list.dataProvider = null;
			list.headerRendererFactory = function ():IGroupedListHeaderRenderer {
				var renderer:MailBlockGroupedHeaderRenderer = new MailBlockGroupedHeaderRenderer();
				
				
				return renderer;
			}
			
			list.itemRendererFactory = function():IGroupedListItemRenderer{
				var renderer:MailBlockGroupedListRenderer = new MailBlockGroupedListRenderer();
				
				
				renderer.padding = 5;
				return renderer;
			};
			
			var groceryList:HierarchicalCollection = new HierarchicalCollection(
			[
				{
					header: { label: Settings._mui['mails_title_arrived'][Settings._lang] },
					//footer: { label: Settings._mui['mails_title_arrived'][Settings._lang] },
					children:
					[
						{ status: MailBlock.ENTER_GOODS_MAIL  },
						{ status: MailBlock.ENTER_GOODS_MAIL  }
					]
				},
				{
					header: { label: Settings._mui['mails_title_recived_usa'][Settings._lang] },
					children:
					[
						{ status: MailBlock.ENTER_GOODS_MAIL },
						{ status: MailBlock.ENTER_GOODS_MAIL},
						{ status: MailBlock.ENTER_GOODS_MAIL },
						{ status: MailBlock.ENTER_GOODS_MAIL},
						{ status: MailBlock.ENTER_GOODS_MAIL },
						{ status: MailBlock.ENTER_GOODS_MAIL},
						{ status: MailBlock.ENTER_GOODS_MAIL }
					]
				},
				{
					header: { label: Settings._mui['mails_title_ontheway'][Settings._lang] },
					children:
					[
						{ status: MailBlock.ENTER_GOODS_MAIL},
						{ status: MailBlock.ENTER_GOODS_MAIL},
						{ status: MailBlock.ENTER_GOODS_MAIL},
						{ status: MailBlock.ENTER_GOODS_MAIL }
					]
				},
			]);
			list.dataProvider = groceryList;
			
			

			
			/*arrivedGroup = new LayoutGroup();
			arrivedGroupLayout = new VerticalLayout();
			arrivedGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			arrivedGroupLayout.verticalAlign = VerticalAlign.TOP;
			arrivedGroupLayout.gap = 10;
			arrivedGroup.layout = arrivedGroupLayout;
			addChild(arrivedGroup);
			
			title = StaticGUI._addLabel(arrivedGroup, Settings._mui['mails_title_arrived'][Settings._lang], titleStyle);
			
			item = new MailBlock(MailBlock.COMPLETED_MAIL);
			arrivedGroup.addChild(item);
			item = new MailBlock(MailBlock.PAY_MAIL);
			arrivedGroup.addChild(item);
			
			
			recivedGroup = new LayoutGroup();
			recivedGroupLayout = new VerticalLayout();
			recivedGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			recivedGroupLayout.verticalAlign = VerticalAlign.TOP;
			recivedGroupLayout.gap = 10;
			recivedGroup.layout = arrivedGroupLayout;
			addChild(recivedGroup);
			title = StaticGUI._addLabel(recivedGroup, Settings._mui['mails_title_recived_usa'][Settings._lang], titleStyle);
			item = new MailBlock(MailBlock.ENTER_GOODS_MAIL);
			recivedGroup.addChild(item);
			item = new MailBlock(MailBlock.UNKNOWN_MAIL);
			recivedGroup.addChild(item);
			
			sendGroup = new LayoutGroup();
			sendGroupLayout = new VerticalLayout();
			sendGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
			sendGroupLayout.verticalAlign = VerticalAlign.TOP;
			sendGroupLayout.gap = 10;
			sendGroup.layout = sendGroupLayout;
			addChild(sendGroup);
			title = StaticGUI._addLabel(sendGroup, Settings._mui['mails_title_ontheway'][Settings._lang], titleStyle);
			title = StaticGUI._addLabel(sendGroup, Settings._mui['mails_title_estarrival'][Settings._lang]+' - 2016, 23 ოქტომბერი', subTitleStyle);
			item = new MailBlock(MailBlock.ENTER_GOODS_MAIL);
			sendGroup.addChild(item);
			title = StaticGUI._addLabel(sendGroup, Settings._mui['mails_title_estarrival'][Settings._lang]+' - 2016, 3 ნოემბერი', subTitleStyle);
			item = new MailBlock(MailBlock.UNKNOWN_MAIL);
			sendGroup.addChild(item);*/
			
			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			
			this.validate();
		}
		
		override public function dispose():void {
			
			if (arrivedGroup) StaticGUI._safeRemoveChildren(arrivedGroup, true);
			if (recivedGroup) StaticGUI._safeRemoveChildren(recivedGroup, true);
			if (sendGroup) StaticGUI._safeRemoveChildren(sendGroup, true);
			
			super.dispose();
		}
		
		protected function mailRegHandler(event:Event):void {
			this.dispatchEventWith(Event.COMPLETE);
		}
	}
}
