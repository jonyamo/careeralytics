class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :jobs

  def self.top(count=10)
    select("categories.id, categories.name")
      .joins(:categories_jobs)
      .group("categories.id")
      .order("count(0) desc")
      .limit(count)
  end
end
