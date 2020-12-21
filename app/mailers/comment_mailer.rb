class CommentMailer < ApplicationMailer
  def including_account(user, snap)
    @user = user
    @snap = snap
    mail to: user.email, subject: '【お知らせ】コメントにあなたのアカウントが書き込まれました'
  end
end