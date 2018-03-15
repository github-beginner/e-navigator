class UserMailer < ApplicationMailer
  default from: ENV['email']

  def request_email(interviewer, request_user)
    @interviewer = interviewer
    @url = ENV['url']
    @request_user = request_user
    mail(to: @interviewer.email, subject: '面接の希望日程が登録されました')
  end

  def decision_email_for_interviewer(request_user, interviewer)
    @request_user = request_user
    @interviewer = interviewer
    @url = ENV['url']
    mail(to: @interviewer.email, subject: '面接の日程が承認されました')
  end

  def decision_email_for_request_user(request_user, interviewer)
    @request_user = request_user
    @interviewer = interviewer
    @url = ENV['url']
    mail(to: @request_user.email, subject: '面接の日程が承認されました')
  end

end
