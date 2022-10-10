import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="form"
export default class extends Controller {
  // static targetsでDOM要素取得可能
  // static targets = ["search"];

  /**
   * form#submit
   */
  submit() {
    // 登録されたSetTimeout イベントを削除
    clearTimeout(this.timeout);

    // イベントの登録（200ms後に発火）
    // debounce（負荷対策）
    // 200ms以内にイベントが発生した場合は最後のリクエストを実行する。
    this.timeout = setTimeout(() => {
      this.element.requestSubmit();
    }, 200);

    // targetを利用する場合
    // this.searchTarget.requestSubmit();
  }
}
