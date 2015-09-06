# coding: utf-8
module AmazonPaApi
  module Request
    attr_accessor :open_timeout, :read_timeout
    
    private

    def get_response(uri_or_url, limit = 10)
      raise "Redirect is too depp." if limit <= 0
      uri = uri_or_url.class == String ? URI.parse(uri_or_url) : uri_or_url

      http = Net::HTTP.new(uri.host)

      http.open_timeout = self.open_timeout || 30
      http.read_timeout = self.read_timeout || 60

      response = http.start do
        http.get(uri.request_uri)
      end

      case response
      when Net::HTTPSuccess
        response
      when Net::HTTPMovedPermanently, Net::HTTPRedirection
        redirect_uri = URI::parse(response.header['location'])
        return get_response(redirect_uri, limit -1 )
      else
        raise "Error connecting to Amazon. response: #{response.to_w}"
      end
    end
                     
  end
end
