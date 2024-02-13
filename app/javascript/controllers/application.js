// app/javascript/controllers/date_range_controller.js
// app/javascript/packs/application.js
import "flatpickr/dist/flatpickr.css";
import { Controller } from "stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      mode: "range",
      dateFormat: "Y-m-d",
    });
  }
}
