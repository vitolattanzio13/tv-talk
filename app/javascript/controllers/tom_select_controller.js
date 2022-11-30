import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

// Connects to data-controller="tom-select"
export default class extends Controller {
  static values = { options: Object }
  connect() {
    console.log("TomSelect controller connected")
    console.log(this.optionsValue)
    new TomSelect(this.element,
                  this.optionsValue,{
                  allowEmptyOption: false,
                  create: true,
                  sortField: {field: "text"}
  });
  }
}
