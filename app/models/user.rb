class User < ApplicationRecord
  include Clearance::User

    has_secure_password

    before_save { |user| user.email = email.downcase }
    before_save { |user| user.name = name.downcase }
    before_save :create_remember_token

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :name, presence: true, length: { maximum: 50 }
    validates :password, length: {minimum: 6}
    validates :email, presence: true, length: {maximum: 255},
                                      format: {with: VALID_EMAIL_REGEX},
                                      uniqueness: { case_sensitive: true}

    
    
    
    

    has_many :contacts




    private

    def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
    end
end
