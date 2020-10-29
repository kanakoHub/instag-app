import $ from 'jquery'
import axios from 'modules/axios'

document.addEventListener('DOMContentLoaded', () => {

  $(document).on('click', '[class^="snap_link_heart"]', function(){
    const idName = $(this).attr("id")
    const className = $(this).attr("class")
    const Dataset = $(`.${className}`).data()
    const snapId = Dataset.snapId
    if (idName === "inactiveHeart") {
      axios.post(`/api/snaps/${snapId}/like`)
      .then((response) => {
        if (response.data.status === 'ok' ) {
          $(`.${className}` + "#activeHeart").removeClass('hidden')
          $(`.${className}` + "#inactiveHeart").addClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
    } else if (idName === "activeHeart") {
      axios.delete(`/api/snaps/${snapId}/like`)
      .then((response) => {
        if (response.data.status === 'ok' ) {
          $(`.${className}` + "#activeHeart").addClass('hidden')
          $(`.${className}` + "#inactiveHeart").removeClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
    } else {
      console.log('e')
    }
  })
})