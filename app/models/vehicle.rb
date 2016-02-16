class Vehicle < ActiveRecord::Base
  belongs_to :user

  def full_name
  	"#{make} #{year} (#{license_plate})"
  end
end
