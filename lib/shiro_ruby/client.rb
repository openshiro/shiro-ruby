module ShiroRuby
  class Client
    def initialize
      @api_key = ENV["SHIRO_API_KEY"]
      unless @api_key
        raise "no api key defined in environment variables"
      end
    end

    def parse_url(path)
      url = URI.parse("https://openshiro.com/api/v1/#{path}")

      request = Net::HTTP::Get.new(url)

      request["Authorization"] = "Bearer #{@api_key}"

      response = Net::HTTP.start(url.host, url.port, use_ssl: url.scheme == "https") do |http|
        http.request(request)
      end

      JSON.parse(response.body)
    end
  end
end
