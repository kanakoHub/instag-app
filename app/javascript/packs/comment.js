import $ from 'jquery'
import axios from 'modules/axios'

const handleCommentForm = () => {
  $('.show-comment-form').on('click', () => {
    $('.show-comment-form').addClass('hidden')
    $('.comment-text-area').removeClass('hidden')
  })
}

const appendNewComment = (comment) => {
  $('.comments_container').prepend(
    `<div class="comment_card">
    <div class="comment_author">
    <div class="comment_author_image"><img src=${comment.imgsrc}></div>
    <div class="comment_author_info">
    <div class="comment_author_info_name"><p>${comment.account}</p></div>
    <div class="comment_author_info_content"><p>${comment.comment.content}</p></div>
    </div>
    </div>
    </div>`
  )
}
  
  const hiddenCommentForm = () => {
  $('#comment_content').val('')
  $('.comment-text-area').addClass('hidden')
  $('.show-comment-form').removeClass('hidden')
}

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#comment-show').data()
  const snapId = dataset.snapId
  
  handleCommentForm()
  
  $('.add-comment-button').on('click', () => {
    const content = $('#comment_content').val()
    if (!content) {
      window.alert('コメントを入力してください')
    } else {
      axios.post(`/api/snaps/${snapId}/comments`, {
        comment: {content: content}
      })
      .then((res) => {
        const comment = res.data
        appendNewComment(comment)
        hiddenCommentForm()
      })
    }
  })
})