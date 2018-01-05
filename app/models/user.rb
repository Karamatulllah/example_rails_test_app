class User < ActiveRecord::Base
  has_many :articles
  before_save { self.email = email.downcase }
  validates :username, presence: true,
                     uniqueness: { case_sensitive: false },
                     length: { minimum: 3, maximum: 50 }
  validate_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                  length: { maximum: 50},
                  uniqueness: { case_sensitive: false },
                  format: { with: validate_email_regex}
  has_secure_password
end
