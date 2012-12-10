class User < ActiveRecord::Base	
	has_many :contests, :through => :participations
	has_many :participations
	has_many :ratings
	attr_accessible :email, :name, :password, :password_confirmation
	
	attr_accessor :password
	before_save :encrypt_password
	
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_presence_of :name
	validates_uniqueness_of :email
	
	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.pwh == BCrypt::Engine.hash_secret(password, user.pws)
			user
		else
			nil
		end
	end
	
	def encrypt_password
		if password.present?
			self.pws = BCrypt::Engine.generate_salt
			self.pwh = BCrypt::Engine.hash_secret(password, pws)
		end
	end
	
end