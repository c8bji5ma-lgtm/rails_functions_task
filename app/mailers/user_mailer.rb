class UserMailer < ApplicationMailer
  def registration_complete(user)
    @user = user

    mail(
      to: @user.email,
      subject: '登録完了'
    )
  end
end