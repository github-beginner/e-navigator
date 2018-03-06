class Interview < ApplicationRecord
  belongs_to :user
  enum availability: { accept:0, reject:1, reservation:3 }
end
