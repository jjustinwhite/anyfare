class SearchController < ApplicationController

  def index
    if params[:commit]
      redirect_to flights_path(q: params[:q])
    end
  end

end