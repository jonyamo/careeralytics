class TrendsController < ApplicationController
  def index
    @categories = Category.top.map do |category|
      { name: category.name, data: category.jobs.group_by_day(:published_at).count }
    end
  end
end
