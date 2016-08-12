module SearchHelper

  def get_airport_data
    @get_airport_data ||=
    begin
      @airport_data = []

      airports = JSON.parse(File.read('app/public/airports.json'))
      airports.each do |a|
        @airport_data << Hash["label", a["iata"], "category", a["continent"]]
      end
    end

    @airport_data

  end

end