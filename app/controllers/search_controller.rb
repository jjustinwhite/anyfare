class SearchController < ApplicationController

  def index
    @buckets = Bucket.all
    if params[:commit]
      redirect_to flights_path(q: params[:q])
    end
  end

end