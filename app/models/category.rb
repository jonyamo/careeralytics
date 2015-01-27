class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :jobs

  def self.top(start_date, end_date, limit=5)
    select("categories.id, categories.name")
      .joins(:categories_jobs)
      .joins(:jobs)
      .where("jobs.published_at >= ? AND jobs.published_at <= ?", start_date, end_date)
      .group("categories.id")
      .order("count(0) desc")
      .limit(limit)
  end
end
