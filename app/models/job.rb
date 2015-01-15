class Job < ActiveRecord::Base
  validates :guid, presence: true, uniqueness: true
  validates :url,  presence: true, uniqueness: true

  belongs_to :company
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :categories
end
