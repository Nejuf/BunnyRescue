class User < ActiveRecord::Base

	attr_reader :password

	validates :password_digest, presence: { message: "Password can't be blank." }
	validates :password, length: { minimum: 6, allow_nil: true }
	validates :session_token, presence: true
	validates :name, presence: true

	after_initialize :ensure_session_token

	def self.find_by_credentials(username, pass)
		user = User.find_by(name: username)

		return nil if user.nil?

		user.is_password?(pass) ? user : nil
	end

	def is_password?(pass)
		BCrypt::Password.new(self.password_digest).is_password?(pass)
	end

	def password=(pass)
		@password = pass
		self.password_digest = BCrypt::Password.create(pass)
	end

	def self.generate_session_token
		SecureRandom::urlsafe_base64(16)
	end

	def reset_session_token!
		self.session_token = self.class.generate_session_token
		self.save!
	end

private
	def ensure_session_token
		self.session_token ||= self.class.generate_session_token
	end
end
