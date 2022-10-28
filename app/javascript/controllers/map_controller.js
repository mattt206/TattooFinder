import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";

export default class extends Controller {
  static targets = ["paragraph", "inputfield"];


  find(event) {
    console.log("hi");
    const query = this.inputfieldTarget;
    const paragraph = this.paragraphTarget;
    event.preventDefault();

    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${query.value}.json?access_token=pk.eyJ1IjoibWF0dHQyMDYiLCJhIjoiY2w2eTY2cXkwMnk5ZTNjcnFnemh6Ym1lYiJ9.K6gDfWo-ngFCSsu2kr07vg`)
      .then(response => response.json())
      .then((data) => {
        console.log("hola mapa");
        paragraph.insertAdjacentHTML('beforeend', `<h2>${data.features[0].center}</h2>`);
        console.log(data);
        mapboxgl.accessToken = "pk.eyJ1IjoibWF0dHQyMDYiLCJhIjoiY2w2eTY2cXkwMnk5ZTNjcnFnemh6Ym1lYiJ9.K6gDfWo-ngFCSsu2kr07vg";
        const map = new mapboxgl.Map({
          container: "map",
          style: "mapbox://styles/mapbox/dark-v10",
          center: [data.features[0].center[0], data.features[0].center[1]],
          zoom: 12
        });
        new mapboxgl.Marker()
          .setLngLat([data.features[0].center[0], data.features[0].center[1]
          ])
          .addTo(map);
      });
    paragraph.innerHTML = "";
  }
}
