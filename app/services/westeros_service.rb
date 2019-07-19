class WesterosService
  def initialize(house)
    @house = house
  end

  def members
    get_json("/api/v1/house/#{@house}")[:data][0][:attributes][:members]
  end

  private

  def get_json(url, params = {})
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://westerosapi.herokuapp.com') do |f|
      f.params['api_key'] = ENV['WESTEROS_API_KEY']
      f.headers['Accept'] = 'v1'
      f.adapter Faraday.default_adapter
    end
  end
end
