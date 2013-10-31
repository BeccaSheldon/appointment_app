class Appointment < ActiveRecord::Base 
  belongs_to :user
  belongs_to :appointee, :class_name => "User"

  scope :my_invites, ->(user_id) {where("appointee_id = ?", user_id)}
  scope :my_requests, ->(user_id) {where("user_id = ?", user_id)}

  def self.get_my_appointments(user_id)
    results = []
    self.my_invites(user_id).each do |column| 
      results << column
    end
    self.my_requests(user_id).each do |column| 
      results << column
    end
    results
  end
end


