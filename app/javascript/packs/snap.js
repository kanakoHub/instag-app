import $ from 'jquery'

document.addEventListener('DOMContentLoaded', () => {
  $("#album").on("click", () => {
    $("input[type=file]").click()
  });
  
  $("#postBtn").on("click", () => {
    $("input[type=submit]").click()
  });
})