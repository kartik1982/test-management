class User < ActiveRecord::Base  
  has_many :testcases
  has_many :testsuites
  has_many :groups
  has_many :devices
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, uniqueness:{case_sensitive: false}, length:{minimum:3, maximum: 25}
  validates :email, presence:true, uniqueness:{case_sensitive: false}, length:{maximum:105}, format:{with: VALID_EMAIL_REGEX}
  before_save { self.email = email.downcase }  
  has_secure_password
end
