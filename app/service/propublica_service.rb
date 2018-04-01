class PropublicaService

  def self.find_house_members(state)
    @conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-Key"] = ""
      faraday.adapter  Faraday.default_adapter
    end

    response = @conn.get("/congress/v1/members/house/#{state}/current.json")

    results = JSON.parse(response.body, symbolize_names: true)[:results]
  end

end