class Testcase < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: {minimum: 4, maxmimum: 100}
  validates :description, presence: true, length: {minimum: 4, maximum: 200}
end