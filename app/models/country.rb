class Country < ActiveRecord::Base
	has_many :advisors
	has_many :service_centers
	has_many :users
end
