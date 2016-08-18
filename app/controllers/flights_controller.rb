class FlightsController < ApplicationController

  def index

    current_month = Time.now.strftime "%Y-%m"

    if params[:q] && !params[:q].empty?
      results = Skyscanner::Connection.browse_quotes({ :country => "US",
        :currency => "USD", :locale => "en-US", :originPlace => params[:q],
        :destinationPlace => "US", :outboundPartialDate => current_month,
        :inboundPartialDate => current_month })


      @quotes = results["Quotes"].sort_by {|price| price["MinPrice"]}
      @places = results["Places"]
      @carriers = results["Carriers"]
    end
  end

end
