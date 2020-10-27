import $ from 'jquery'
// import axios from 'modules/axios'

const imageChange = (imgsrc) => {
  $('.profilePage_user_image_ellipse').html(
    `<img id="profilePageImage" src=${imgsrc.imgsrc}>`
  )
}

const addFileChange = (evt) => {
  const fileIn = evt.target
  
  const form = document.getElementById('profilePageForm');
  const fd = new FormData(form);

  const xhr = new XMLHttpRequest();
  xhr.open("PUT", "/profile");

  // Basic Events
  xhr.addEventListener('load', (evt) => {
      console.log('** xhr: load');
      let response = JSON.parse(xhr.responseText);
      // console.log(response);
      const imgsrc = response
      imageChange(imgsrc)
  });

  xhr.upload.addEventListener('loadstart', (evt) => {
    // アップロード開始
  });
  
  xhr.upload.addEventListener('progress', (evt) => {
    // アップロード進行パーセント
    let percent = (evt.loaded / evt.total * 100).toFixed(1);
    console.log(`++ xhr.upload: progress ${percent}%`);
  });
  
  xhr.upload.addEventListener('abort', (evt) => {
    // アップロード中断
    console.log('++ xhr.upload: abort (Upload aborted)');
  });
  
  xhr.upload.addEventListener('error', (evt) => {
    // アップロードエラー
    console.log('++ xhr.upload: error (Upload failed)');
  });
  
  xhr.upload.addEventListener('load', (evt) => {
    // アップロード正常終了
    console.log('++ xhr.upload: load (Upload Completed Successfully)');
  });
  
  xhr.upload.addEventListener('timeout', (evt) => {
    // アップロードタイムアウト
    console.log('++ xhr.upload: timeout');
  });
  
  xhr.upload.addEventListener('loadend', (evt) => {
    // アップロード終了 (エラー・正常終了両方)
    console.log('++ xhr.upload: loadend (Upload Finished)');
  });
  
  xhr.send(fd);
}

document.addEventListener('DOMContentLoaded', () => {
  $("#profilePageImage").on("click", () => {
    $("input[type=file]").click()
  });
  
  const f = document.getElementById('profile_avatar')
  f.addEventListener('change', (evt) => {
    addFileChange(evt)
  });
})