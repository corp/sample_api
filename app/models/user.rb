class User < ActiveRecord::Base
  belongs_to :country
  has_many :vehicles

  after_create :generate_auth_token

  def name_with_country
  	"#{first_name} #{last_name} (#{country.iso})"
  end

  def generate_auth_token
    self.update_attribute(:auth_token,auth_token=Digest::MD5.hexdigest("#{self.email}#{self.password}#{Time.now.to_s}"))
    self.update_attribute(:auth_token_expiration,Time.now + 30.days)
  end
end
