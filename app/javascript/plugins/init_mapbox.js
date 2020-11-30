import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/odealtry/ckhw4ydw3110j19pa4hz7swez',
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    // const element = document.createElement('div');
    // element.className = 'marker';
    // element.style.backgroundImage = `url('../assets/images/fire.png')`;
    // element.style.backgroundSize = 'contain';
    // element.style.width = '25px';
    // element.style.height = '25px';

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
}

const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  const initMapbox = () => {
    const mapElement = document.getElementById('map');
    if (mapElement) {
      const map = buildMap(mapElement);
      const markers = JSON.parse(mapElement.dataset.markers);
      addMarkersToMap(map, markers);
      fitMapToMarkers(map, markers);
      map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken, mapboxgl: mapboxgl }), "bottom-right");
    }
  };

export { initMapbox };

