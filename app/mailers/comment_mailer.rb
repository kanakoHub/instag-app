class CommentMailer < ApplicationMailer
  def including_account(user, snap, content)
    @user = user
    @snap = snap
    @content = content
    binding.pry
    mail to: user.email, subject: '【お知らせ】コメントにあなたのアカウントが書き込まれました'
  end
end