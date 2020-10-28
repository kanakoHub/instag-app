import $ from 'jquery'

document.addEventListener('DOMContentLoaded', () => {
  $("#album").on("click", () => {
    $("input[type=file]").click()
  });
  
  $(".post-btn").on("click", () => {
    $("input[type=submit]").click()
  });
})