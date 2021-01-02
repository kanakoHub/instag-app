import $ from 'jquery'
import axios from 'modules/axios'

document.addEventListener('DOMContentLoaded', () => {

  $(document).on('click', '[class^="account_follow"]', function(){
    const idName = $(this).attr("id")
    const Dataset = $(this).data()
    const accountId = Dataset.accountId
    let cnt = $('#followers').text()
    cnt = Number( cnt )
    if (idName === "follow") {
      axios.post(`/api/accounts/${accountId}/follows`)
      .then((response) => {
        if (response.data.status === 'ok' ) {
          $(this).text('Unfollow')
          $(this).attr('id', 'unfollow')
          cnt += 1
          $('#followers').text(cnt)
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
    } else if (idName === "unfollow") {
      axios.post(`/api/accounts/${accountId}/unfollows`)
      .then((response) => {
        if (response.data.status === 'ok' ) {
          $(this).text('Follow')
          $(this).attr('id', 'follow')
          cnt -= 1
          $('#followers').text(cnt)
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