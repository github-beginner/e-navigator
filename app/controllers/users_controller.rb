class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
    @users.each do |user|
      d1 = user.birthday.strftime("%Y%m%d").to_i
      d2 = Date.today.strftime("%Y%m%d").to_i
      user.birthday = (d2 - d1) / 10000
    end
  end
end
