package screens.posta {
	
	import application.utils.StaticGUI;
	import components.MailBlock;
	import components.renderers.MailBlockGroupedFooterRenderer;
	import components.renderers.MailBlockGroupedHeaderRenderer;
	import components.renderers.MailBlockGroupedListRenderer;
	import feathers.controls.GroupedList;
	import feathers.controls.LayoutGroup;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.ScrollPolicy;
	import feathers.controls.renderers.IGroupedListFooterRenderer;
	import feathers.controls.renderers.IGroupedListHeaderRenderer;
	import feathers.controls.renderers.IGroupedListItemRenderer;
	import feathers.data.HierarchicalCollection;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import screens.ScreenID;
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class ScreenMainMails extends LayoutGroup {
		
		private var list:GroupedList;
		private var groceryList:HierarchicalCollection;
		
		public function ScreenMainMails() {
			super();
			
		}
		
		override protected function initialize():void {
			
			super.initialize();
			
			var layout:VerticalLayout = new VerticalLayout();
			layout.horizontalAlign = HorizontalAlign.CENTER;
			layout.verticalAlign = VerticalAlign.TOP;
			
			layout.paddingTop = Settings._getIntByDPI(120);
			layout.paddingBottom = Settings._getIntByDPI(103);
			this.layout = layout;
			
			var listLayout:VerticalLayout = new VerticalLayout();
			listLayout.verticalAlign = VerticalAlign.TOP;
			listLayout.horizontalAlign = HorizontalAlign.CENTER;
			
			
			//listLayout.paddingLeft = Settings._getIntByDPI(15);
			//listLayout.paddingRight = Settings._getIntByDPI(15);
			
			list = new GroupedList();
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
			
			list.footerRendererFactory = function ():IGroupedListFooterRenderer {
				var renderer:MailBlockGroupedFooterRenderer = new MailBlockGroupedFooterRenderer();
				return renderer;
			}
			
			/*list.itemRendererFactory = function():IGroupedListItemRenderer{
				var renderer:MailBlockGroupedListRenderer = new MailBlockGroupedListRenderer();
				
				
				renderer.padding = 5;
				return renderer;
			};*/
			
			groceryList = new HierarchicalCollection(
			[
				{
					header: { label: Settings._mui['mails_title_arrived'][Settings._lang] },
					footer: { label: Settings._mui['mails_footer_payall'][Settings._lang] },
					children:
					[
						{ status: MailBlock.COMPLETED_MAIL  },
						{ status: MailBlock.COMPLETED_MAIL  }
					]
				},
				{
					header: { label: Settings._mui['mails_title_recived_usa'][Settings._lang] },
					children:
					[
						{ status: MailBlock.UNKNOWN_MAIL },
						{ status: MailBlock.COMPLETED_MAIL},
						{ status: MailBlock.COMPLETED_MAIL },
						{ status: MailBlock.COMPLETED_MAIL},
						{ status: MailBlock.PAY_MAIL },
						{ status: MailBlock.ENTER_GOODS_MAIL},
						{ status: MailBlock.ENTER_GOODS_MAIL }
					]
				},
				{
					header: { label: Settings._mui['mails_title_ontheway'][Settings._lang] },
					children:
					[
						{ status: MailBlock.ENTER_GOODS_MAIL},
						{ status: MailBlock.COMPLETED_MAIL},
						{ status: MailBlock.PAY_MAIL},
						{ status: MailBlock.COMPLETED_MAIL }
					]
				},
			]);
			
			list.snapScrollPositionsToPixels = true;
			list.dataProvider = groceryList;
			list.addEventListener(Event.CHANGE, listChangeHandler );
			list.setItemRendererFactoryWithID(MailBlock.CHECK_TOPAY_MAIL,      CHECK_TOPAY_MAIL_itemFactory);
			list.setItemRendererFactoryWithID(MailBlock.COMPLETED_MAIL,        COMPLETED_MAIL_itemFactory);
			list.setItemRendererFactoryWithID(MailBlock.ENTER_GOODS_MAIL,      ENTER_GOODS_MAIL_itemFactory);
			list.setItemRendererFactoryWithID(MailBlock.PAY_MAIL,              PAY_MAIL_itemFactory);
			list.setItemRendererFactoryWithID(MailBlock.PAYED_MAIL,            PAYED_MAIL_itemFactory);
			list.setItemRendererFactoryWithID(MailBlock.UNKNOWN_MAIL,          UNKNOWN_MAIL_itemFactory);
			
			list.factoryIDFunction = function( item:Object, groupIndex:int, itemIndex:int ):String {
				
				return item.status;
			};
			
			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			
			this.validate();
		}
		
		private function listChangeHandler(e:Event):void {
			Settings._splash._navigator.pushScreen(ScreenID.ARRIVED_MAIL);
		}
		
		private function CHECK_TOPAY_MAIL_itemFactory():IGroupedListItemRenderer {
			return itemFactory(MailBlock.CHECK_TOPAY_MAIL);
		}
		
		private function COMPLETED_MAIL_itemFactory():IGroupedListItemRenderer {
			return itemFactory(MailBlock.COMPLETED_MAIL);	
		}
		
		private function ENTER_GOODS_MAIL_itemFactory():IGroupedListItemRenderer{
			return itemFactory(MailBlock.ENTER_GOODS_MAIL);	
		}
		
		private function PAY_MAIL_itemFactory():IGroupedListItemRenderer {
			return itemFactory(MailBlock.PAY_MAIL);	
		}
		
		private function PAYED_MAIL_itemFactory():IGroupedListItemRenderer {
			return itemFactory(MailBlock.PAYED_MAIL);	
		}
		
		private function UNKNOWN_MAIL_itemFactory():IGroupedListItemRenderer {
			return itemFactory(MailBlock.UNKNOWN_MAIL);	
		}
		
		private function itemFactory(st:String):IGroupedListItemRenderer {
			var renderer:MailBlockGroupedListRenderer = new MailBlockGroupedListRenderer(st);
			renderer.padding =  Settings._getIntByDPI(5);
			return renderer;	
		}
		
		private function disposeItemAccessory(item:Object):void {
			DisplayObject(itemFactory(item.status)).dispose();
		}
		
		
		override public function dispose():void {
			
			if (list) {
				list.removeEventListener(Event.CHANGE, listChangeHandler );
				list.dataProvider.dispose(null, disposeItemAccessory);
				StaticGUI._safeRemoveChildren(list, true);
			}
			list = null;
			super.dispose();
		}
	}
}
