class Interview < ApplicationRecord
  belongs_to :user
  enum availability: { accept:0, reject:1, reservation:3 }
  after_update :reject_unaccepted_interview

  private
    def reject_unaccepted_interview
      if self.availability == 'accept'
        Interview.where(user_id: self.user_id).where.not(id: self.id).update_all(availability: 'reject')
      end
    end

end
