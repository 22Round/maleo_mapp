package screens.map {
	
	import application.utils.StaticGUI;
	import cz.j4w.map.MapLayerOptions;
	import cz.j4w.map.MapOptions;
	import cz.j4w.map.events.MapEvent;
	import cz.j4w.map.geo.GeoMap;
	import cz.j4w.map.geo.GeoUtils;
	import cz.j4w.map.geo.Maps;
	import feathers.core.FeathersControl;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import flash.events.Event;
	import flash.events.GeolocationEvent;
	import flash.events.StatusEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.sensors.Geolocation;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.textures.Texture;
	

	public class ScreenMap extends FeathersControl {
		[Embed(source="../../../bin/assets/marker.png")]
		private var MarkerClass:Class;
		
		private var mapOptions:MapOptions;
		private var geoMap:GeoMap;
		private var googleMaps:MapLayerOptions;
		
		private var geo:Geolocation;
		
		public function ScreenMap() {
			super();
		}
		
		override protected function initialize():void {
			super.initialize();
			
			
			var mapScale:Number = 2; // use 1 for non-retina displays
			GeoUtils.scale = mapScale;
			
			mapOptions = new MapOptions();
			mapOptions.initialCenter = new Point(44.777580, 41.726495 );
			mapOptions.initialScale = 1 / 32 / mapScale;
			mapOptions.disableRotation = true;
			mapOptions.minimumScale = 1 / 64 / mapScale;
			mapOptions.maximumScale = 1 / 1 / mapScale;
			/*mapOptions.movementBounds = new Rectangle();
			mapOptions.movementBounds.left = GeoUtils.lon2x(-2.96842);
			mapOptions.movementBounds.top = GeoUtils.lat2y(43.28071);
			mapOptions.movementBounds.right = GeoUtils.lon2x(-2.90044);
			mapOptions.movementBounds.bottom = GeoUtils.lat2y(43.23870);*/
			
			geoMap = new GeoMap(mapOptions);
			geoMap.setSize(stage.stageWidth, stage.stageHeight - Settings._getIntByDPI(130) -Settings._getIntByDPI(103)); // header and footer height
			geoMap.y = Settings._getIntByDPI(130);
			addChild(geoMap);
			
			googleMaps = Maps.GOOGLE_MAPS_SCALED(mapScale);
			googleMaps.notUsedZoomThreshold = 1;
			geoMap.addLayer("googleMaps", googleMaps);
			
			var markerTexture:Texture = Texture.fromEmbeddedAsset(MarkerClass);
			var image:Image = new Image(markerTexture);
			image.alignPivot(HorizontalAlign.CENTER, VerticalAlign.BOTTOM);
			geoMap.addMarkerLongLat("marker", 44.777580, 41.726495, image);
			/*for (var i:int = 0; i < 100; i++) {
				var image:Image = new Image(markerTexture);
				image.alignPivot(HorizontalAlign.CENTER, VerticalAlign.BOTTOM);
				
				geoMap.addMarkerLongLat("marker" + i, mapOptions.initialCenter.x + .1 - Math.random() * .2, mapOptions.initialCenter.y + .1 - Math.random() * .2, image);
			}*/
			geoMap.addEventListener(MapEvent.MARKER_TRIGGERED, onGeoMapMarkerTriggered);
			
			//referance http://stackoverflow.com/questions/24797998/detect-the-closest-to-the-user-point
			if (Geolocation.isSupported) {
				geo = new Geolocation();
				if (!geo.muted)  { 
                    geo.addEventListener(GeolocationEvent.UPDATE, geoUpdateHandler);
                } 
				geo.addEventListener(StatusEvent.STATUS, geoStatusHandler);
			} 

		}
		
		private function geoStatusHandler(e:Event):void {
			if (geo.muted)
                geo.removeEventListener(GeolocationEvent.UPDATE, geoUpdateHandler);
            else
                geo.addEventListener(GeolocationEvent.UPDATE, geoUpdateHandler);
		}
		
		private function geoUpdateHandler(e:GeolocationEvent):void{
			//embeddedIconPoi.latLng = new LatLng(e.latitude, e.longitude);
		}
		
		private const RADIUS_OF_EARTH_IN_MILES:int = 3963;
		private const RADIUS_OF_EARTH_IN_FEET:int = 20925525;
		private const RADIUS_OF_EARTH_IN_KM:int = 6378;
		private const RADIUS_OF_EARTH_IN_M:int = 6378000;

		private function distanceBetweenCoordinates(lat1:Number,lon1:Number,
												lat2:Number,lon2:Number,
												units:String="miles"):Number{

			var R:int = RADIUS_OF_EARTH_IN_MILES;
			if (units == "km"){
				R = RADIUS_OF_EARTH_IN_KM;
			}
			if (units == "meters"){
				R = RADIUS_OF_EARTH_IN_M;
			}
			if (units =="feet"){
				R= RADIUS_OF_EARTH_IN_FEET;
			}

			var dLat:Number = (lat2-lat1) * Math.PI/180;
			var dLon:Number = (lon2-lon1) * Math.PI/180;

			var lat1inRadians:Number = lat1 * Math.PI/180;
			var lat2inRadians:Number = lat2 * Math.PI/180;

			var a:Number = Math.sin(dLat/2) * Math.sin(dLat/2) + 
							   Math.sin(dLon/2) * Math.sin(dLon/2) * 
							   Math.cos(lat1inRadians) * Math.cos(lat2inRadians);
			var c:Number = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
			var d:Number = R * c;

			return d;
		}
		
		
		override public function dispose():void {
			
			
			if (geo) {
				geo.removeEventListener(GeolocationEvent.UPDATE, geoUpdateHandler);
				geo.removeEventListener(StatusEvent.STATUS, geoStatusHandler);
			}
			if (geoMap) {
				geoMap.removeEventListener(MapEvent.MARKER_TRIGGERED, onGeoMapMarkerTriggered);
				StaticGUI._safeRemoveChildren(geoMap, true);
			}
			
			mapOptions = null;
			geoMap = null;
			googleMaps = null;
			
			super.dispose();
		}
		
		private function onGeoMapMarkerTriggered(e:MapEvent):void {
			trace(e.target);
		}
	}
}