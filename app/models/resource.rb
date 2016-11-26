class Resource < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, length: {minimum: 3, maximum: 30}
  validates :resource_type, presence: true, length: {minimum: 3, maximum: 20}
  validates :description, presence: true, length: {minimum: 5, maximum: 100}
  validates :user_id, presence: true
  
  
end
