import $ from 'jquery'
import axios from 'modules/axios'

const image = 'profilePageImage'
const avatar = 'avatar'
const profileForm = 'profilePageForm'
const ellipse = 'profilePage_user_image_ellipse'

const imageChange = (imgsrc) => {
  $(`.${ellipse}`).html(
    `<img id=${image} src=${imgsrc}>`
  )
}
  
const addFileChange = (evt) => {
  const form = document.getElementById(profileForm);
  const fd = new FormData(form);

  axios.put('/profile', fd)
  .then((response) => {
    const imgsrc = response.data.imgsrc
    imageChange(imgsrc)
  })
  .catch((e) => {
    window.alert('Error')
    console.log(e)
  })
}

document.addEventListener('DOMContentLoaded', () => {
  $(document).on('click', `#${image}`, function(){
    $("input[type=file]").click()
  });
  
  $(document).on('change', `#${avatar}`, (evt) => {
    addFileChange(evt)
  });

  // const f = document.getElementById(avatar)
  // f.addEventListener('change', (evt) => {
  //   addFileChange(evt)
  // });
})