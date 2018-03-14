class UserMailer < ApplicationMailer
  default from: ENV['email']

  def request_email(user, request_user)
    @user = user
    @url = ENV['url']
    @request_user = request_user
    mail(to: @user.email, subject: '面接の希望日程が登録されました')
  end

  def decision_email(user,interview)
    @user = user
    @interview = interview
    @url = ENV['url']
    mail(to: @user.email, subject: '面接の日程が承認されました')
  end

end
