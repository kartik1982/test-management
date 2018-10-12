class Device < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  validates :devicetype, presence: true, length:{mimimum: 5, maximum: 25}
  validates :name, presence: true, length:{minimum: 5, maximum: 50}
  validates :description, presence: true, length: {minimum: 5, maximum: 200}  
end