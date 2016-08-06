class FlightsController < ApplicationController
  def index

    results = Skyscanner::Connection.browse_quotes({ :country => "US",
      :currency => "USD", :locale => "en-US", :originPlace => "ORD",
      :destinationPlace => "anywhere", :outboundPartialDate => "anytime",
      :inboundPartialDate => "anytime" })

    @quotes = results["Quotes"]
    @places = results["Places"]
    @carriers = results["Carriers"]

  end
end
