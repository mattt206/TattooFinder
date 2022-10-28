import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="likes"
var ban = 0;
var xwe = 0;
export default class extends Controller {
  static targets = ["likeicon", "numlikes"];


  connect() {
    console.log("likes connected");
  }

  ranked(){

    // console.log(this.likeiconTarget.classList);
    if (ban ===0) {
      this.likeiconTarget.classList.remove("fa-regular");
      this.likeiconTarget.classList.add("fa-solid");
      let sum = parseInt(this.numlikesTarget.innerHTML);
      sum += 1;
      this.numlikesTarget.innerHTML = sum;
      ban = 1;
      console.log("sumando");
    }else{
      this.likeiconTarget.classList.remove("fa-solid");
      this.likeiconTarget.classList.add("fa-regular");
      let rest = parseInt(this.numlikesTarget.innerHTML);
      rest -= 1;
      this.numlikesTarget.innerHTML = rest;
      console.log("rstando");
      ban = 0;
    }

    // console.log(this.likeiconTarget);
    // this.likeiconTarget.addClassList.toggle("fa-solid");
    // "fa-solid fa-thumbs-up"
    // sumatoria
  }
}
