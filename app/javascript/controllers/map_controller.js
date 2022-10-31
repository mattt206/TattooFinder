import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"


// Connects to data-controller="map"
export default class extends Controller {

  static values = {
    apiKey: String,
    markers: Array
  }
  static targets = ["address"]


  connect() {


    console.log("hola 22");
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element, // container ID
      style: 'mapbox://styles/mapbox/streets-v11', // style URL
    });

    this.#addMarkersToMap();
    this.#fitMapToMarkers();
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))

      this.geocoder = new MapboxGeocoder({
        accessToken: this.apiKeyValue,
        types: "country,region,place,postcode,locality,neighborhood,address"
      })
      this.geocoder.addTo(this.element)

      this.geocoder.on("result", event => this.#setInputValue(event))
      this.geocoder.on("clear", () => this.#clearInputValue())

  }

  disconnect() {
    this.geocoder.onRemove()
  }

  #addMarkersToMap(){
    // console.log(this.markersValue);
    this.markersValue.forEach(marker => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "25px"
      customMarker.style.height = "25px"

      new mapboxgl.Marker(customMarker)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(this.map);
    });

  };

  #fitMapToMarkers(){
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 0 })
  }

  #setInputValue(event) {
    this.addressTarget.value = event.result["place_name"]
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }


}
