import { Controller } from "@hotwired/stimulus"



export default class extends Controller {
  // definir target para la busqueda desde el html
  static targets = ["search"]

  connect() {


  }

  busqueda(){
    const search = this.searchTarget;
    // console.log(search)
    // console.log(document.getElementById('busq').value);
  }

  setUrl() {
    console.log("entro ac");
    window.location.href = 'services?query=' + document.getElementById('busq').value;
  };



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
