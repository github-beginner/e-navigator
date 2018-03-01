class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum sex: { man:0, woman:1 }
  def age
    d1 = self.birthday.strftime("%Y%m%d").to_i
    d2 = Date.today.strftime("%Y%m%d").to_i
    (d2 - d1) / 10000
  end
end
