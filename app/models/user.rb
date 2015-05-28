class User < ActiveRecord::Base
    has_many :contracts
    before_save { self.email = email.downcase }
    #ensures username is present
    validates :username, presence: true, length: { minimum:3, maximum: 40}
    
    #email regex to validate emails
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
    
end