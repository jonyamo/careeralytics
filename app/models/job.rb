class Job < ActiveRecord::Base
  validates :guid, presence: true, uniqueness: true
  validates :url,  presence: true, uniqueness: true
end
