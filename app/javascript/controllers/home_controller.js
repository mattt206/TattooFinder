import { Controller } from "@hotwired/stimulus"



export default class extends Controller {
  // definir target para la busqueda desde el html
  static targets = ["search", "linktoscroll"]

  connect() {


  }

  busqueda(){
    const search = this.searchTarget;

  }

  setUrl() {
    console.log("entro ac");
    window.location.href = 'services?query=' + document.getElementById('busq').value;
  };

  scroll(){


  }


}


// console.log("ready for search");
// const input = document.getElementById("search-input");
// const searchBtn = document.getElementById("search-btn");
// const expand = () => {
// searchBtn.classList.toggle("close");
// input.classList.toggle("square");
// };
// searchBtn.addEventListener("click", expand);
// console.log("ready");
