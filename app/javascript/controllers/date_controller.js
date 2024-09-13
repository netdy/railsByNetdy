import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dateField"];

  connect() {
    this.setDefaultDate();
  }

  setDefaultDate() {
    if (!this.dateFieldTarget.value) {
      const currentYear = new Date().getFullYear();
      const buddhistYear = currentYear;

      const formattedDate = this.formatDate(buddhistYear);
      this.dateFieldTarget.value = formattedDate;
    }
  }

  formatDate(buddhistYear) {
    const date = new Date(this.dateFieldTarget.value || new Date()); 
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");
    return `${buddhistYear}-${month}-${day}`;
  }
}