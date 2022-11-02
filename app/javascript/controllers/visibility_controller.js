import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="visibility"
export default class extends Controller {
  static targets = [ "hideable" ]
  connect() {
  }

  showTargets() {
    this.hideableTargets.forEach(el => {
      if (el.hidden === false){
        el.hidden = true
      } else{
        el.hidden = false
      }
    });

  }


  // hideTargets() {
  //   this.hideableTargets.forEach(el => {
  //     el.hidden = true
  //   });
  // }

  toggleTargets() {
    this.hideableTargets.forEach((el) => {
      el.hidden = !el.hidden
    });
  }

  scrollWin() {
    window.scrollBy(0, 200);
  }



}
