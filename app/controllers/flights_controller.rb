class FlightsController < ApplicationController

  def index
    if params[:q] && !params[:q].empty?
      results = Skyscanner::Connection.browse_quotes({ :country => "US",
        :currency => "USD", :locale => "en-US", :originPlace => params[:q],
        :destinationPlace => "anywhere", :outboundPartialDate => "anytime",
        :inboundPartialDate => "anytime" })

      @quotes = results["Quotes"].sort_by {|price| price["OutboundLeg"]["DepartureDate"]}
      @places = results["Places"]
      @carriers = results["Carriers"]
    end
  end
end
