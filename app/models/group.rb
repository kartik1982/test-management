class Group < ActiveRecord::Base
  belongs_to :user
  has_many :devices
  validates :name, presence: true, length:{minimum: 4, maximum: 100}
  validates :description, presence: true, length:{minimum: 4, maximum: 200}
end