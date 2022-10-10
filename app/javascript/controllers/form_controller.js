import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="form"
export default class extends Controller {
  connect() {}

  // static targetsでDOM要素取得可能
  // static targets = ["search"];

  // form#submit
  // 要素をSubmitする
  submit() {
    this.element.requestSubmit();

    // targetを利用する場合
    // this.searchTarget.requestSubmit();
  }
}
