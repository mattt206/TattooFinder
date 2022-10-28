import { Controller } from "@hotwired/stimulus"



export default class extends Controller {


  connect() {


  }

  busqueda(){
    console.log("ready for search");
    const input = document.getElementById("search-input");
    const searchBtn = document.getElementById("search-btn");

    const expand = () => {
    searchBtn.classList.toggle("close");
    input.classList.toggle("square");
  };

    searchBtn.addEventListener("click", expand);

    console.log("ready");
  }



}
