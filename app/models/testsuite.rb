class Testsuite < ActiveRecord::Base
  belongs_to :user
  has_many :testcases
  validates :title, presence: true, length:{minimum: 4, maximum: 100}
  validates :description, presence: true, length:{minimum: 4, maximum: 200}
end