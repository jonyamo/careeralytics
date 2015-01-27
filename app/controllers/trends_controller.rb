class TrendsController < ApplicationController
  def index
    begin
      params[:start_date] ||= 1.week.ago.strftime("%Y-%m-%d")
      params[:end_date]   ||= Time.now.strftime("%Y-%m-%d")
      Date.parse(params[:start_date])
      Date.parse(params[:end_date])
    rescue ArgumentError
      flash[:error] = "Invalid date range."
    end
    @start_date = params[:start_date]
    @end_date   = params[:end_date]
    @categories = Category.top(@start_date, @end_date).map do |category|
      { name: category.name,
        data: category.jobs.group_by_day(:published_at, range: @start_date..@end_date).count }
    end
  end
end
