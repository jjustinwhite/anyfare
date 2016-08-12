class FlightsController < ApplicationController

  def index
    if params[:q] && !params[:q].empty?
      results = Skyscanner::Connection.browse_quotes({ :country => "US",
        :currency => "USD", :locale => "en-US", :originPlace => params[:q],
        :destinationPlace => "anywhere", :outboundPartialDate => "2016-08",
        :inboundPartialDate => "2016-08" })

      @quotes = results["Quotes"].sort_by {|price| price["MinPrice"]}
      @places = results["Places"]
      @carriers = results["Carriers"]
    end
  end

end
