import $ from 'jquery'

document.addEventListener('DOMContentLoaded', () => {
  $("#album").on("click", () => {
    $("input[type=file]").click()
  });
  
  $("#postBtn").on("click", () => {
    $("input[type=submit]").click()
  });

  // 画像をプレビュー表示させる.prev-contentを作成
  function buildHTML(image) {
    var html =
      `
      <div class="prev-content">
        <img src="${image}", alt="preview" class="prev-image">
      </div>
      `
    return html;
  }
  
  // 画像が選択された時に発火します
  $(document).on('change', '.hidden_file', function () {
    $(".prev-content").remove();
    var len = this.files.length
    for (var i = 0 ; i < len ; i++){
      // .file_filedからデータを取得して変数fileに代入します
      var file = this.files[i];
      // FileReaderオブジェクトを作成します
      var reader = new FileReader();
      // DataURIScheme文字列を取得します
      reader.readAsDataURL(file);
      // 読み込みが完了したら処理が実行されます
      reader.onload = function () {
        // 読み込んだファイルの内容を取得して変数imageに代入します
        var image = this.result;
        // 読み込んだ画像ファイルをbuildHTMLに渡します
        var html = buildHTML(image)
        // 作成した.prev-contentを表示させます
        $('.prev-contents').prepend(html);
      }
    }  
  });
})