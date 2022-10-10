import { Controller } from "@hotwired/stimulus";
import { Toast } from "bootstrap";

// Connects to data-controller="toast"
export default class extends Controller {
  /**
   * connect
   *
   * コンポーネントのマウント時に実行されるメソッド
   */
  connect() {
    // マウントされたコンポーネントから、Toastを生成
    const toast = new Toast(this.element);
    // Toastの表示
    toast.show();
  }
}
