class User < ActiveRecord::Base
	has_many :posts
	
	validates :password,
	presence: true,
	on: :create

	validates :email,
	presence: true,
	uniqueness: {:case_sensitive => false}

	validates :my_email_attribute, email: true

	validates :name,
	presence: true,
	length: {maximum: 20}

	has_secure_password

	def self.authenticate(email, password)
		User.find_by_email(email).try(:authenticate, password)
	end
end
