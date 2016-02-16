class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :service_center
  belongs_to :advisor
  belongs_to :vehicle
end
