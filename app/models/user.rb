class User < ActiveRecord::Base
	attr_accessor :password
	validates :password, confirmation: true
	before_save :encrypt_password #wonder at what point this is triggered.

	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
	end

	def self.authenticate(email,password)
		user = User.where(email: email).first
		if user && user.password_hash == BCrypt::Engine.hash_secret(password,user.password_salt)
			user
		else
			nil
		end
	end

	has_many :posts
end
