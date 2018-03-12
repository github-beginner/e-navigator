class ChangeAvailabilityOptionsToInterviews < ActiveRecord::Migration[5.1]
  def change
    change_column :interviews, :availability, :integer, default:3
  end
end
