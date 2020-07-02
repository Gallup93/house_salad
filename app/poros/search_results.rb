class SearchResults
  def  members(state)
    # conn = Faraday.new("https://api.propublica.org") do |req|
    #   req.headers["X-API-Key"] = ENV["PROPUBLICA_API_KEY"]
    # end
    #
    # response = conn.get("/congress/v1/members/house/#{state}/current.json")
    #
    # parsed_response = JSON.parse(response.body, symbolize_names: true)
    parsed_response = PropublicaService.new.members_of_house(state)

    @members = parsed_response[:results].map do |member_data|
      Member.new(member_data)
    end
  end
end
