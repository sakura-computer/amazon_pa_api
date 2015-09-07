require 'amazon_pa_api/request'

module AmazonPaApi
  #= This is the parent class of every PA api Operations performed.
  class Operation

    include AmazonPaApi::Request
    
    # PA api requires thease credentials.
    # String - You must to set thease before performing operations.
    attr_accessor :access_key_id, :secret_access_key, :associate_tag

    # Subclass set this variables at initialize.
    # String - The name of operation you want to perform.
    attr_accessor :operation

    # Subclass set this variables at initialize.
    # String - It will be use this to pick the right associates key up.
    #          default is jp.
    attr_accessor :region

    # You can get PA api response via thease.
    attr_reader :header, :body
    
    API_VERSION = "2010-09-01".freeze

    # PA api end points.
    #  PA api calls can be sent to any of 6 regions.
    END_POINTS = {
      ca: "http://ecs.amazonaws.ca/onca/xml",
      de: "http://ecs.amazonaws.de/onca/xml",
      fr: "http://ecs.amazonaws.fr/onca/xml",
      jp: "http://ecs.amazonaws.jp/onca/xml",
      uk: "http://ecs.amazonaws.co.uk/onca/xml",
      us: "http://ecs.amazonaws.com/onca/xml",
    }.freeze
    
    def initialize
      self.class.const_get("REQUEST_PARAMETERS").each do |param|
        self.class.send(:attr_accessor, param)
      end
    end

    # Execute the request to Amazon.
    def get
      request
    end

    # You can set PA api credentials via this.
    def credentials=(access_key_id: '',
                     secret_access_key: '',
                     associate_tag:''
                    )
      self.access_key_id = access_key_id
      self.secret_access_key = secret_access_key
      self.associate_tag = associate_tag
    end
    
    protected

    # It set instance variable from defined request parameters in subclass.
    def params
      self.class.const_get("REQUEST_PARAMETERS").inject({}) do |parameters, param|
        value = instance_variable_get("@#{param}")
        parameters[param.to_s.camel_case] = value unless value.nil?
        parameters
      end
    end

    # It set common query parameters as hash.
    def request_params
      parameters ={
        "Service"                    => "AWSECommerceService",
        "Timestamp"                  => Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ"),
        "AWSAccessKeyId"             => self.access_key_id.to_s,
        "AssociateTag"               => self.associate_tag.to_s,
        "Operation"                  => self.operation,
        "Version"                    => API_VERSION,
      }.merge!(params)                                                                                 
    end

    # It sort and set all query parameters as hash.
    def request_params_string
      request_params.sort.inject('') do |params_string, (k,v)|
        params_string  += '&' unless params_string.size == 0
        params_string  += "#{k.to_s}=#{CGI.escape(v.to_s)}"
        params_string
      end
    end

    private

    # it add signature parameter from uri
    #  URI - To Amazon AWS ECommerce Service.
    def add_signature(unsigned_uri)
      signature = OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new("sha256"),
                                       self.secret_access_key,
                                       "GET\n#{unsigned_uri.host}\n#{unsigned_uri.path}\n#{unsigned_uri.query}"
                                      )
      signature = [signature].pack("m").chomp
      signature = URI.escape(signature, Regexp.new("[+=]"))
      URI.parse "#{unsigned_uri}&Signature=#{signature}"

    end

    # it add signature and requests Amazon via http.
    def request
      if self.access_key_id.nil? ||
         self.secret_access_key.nil? ||
         self.associate_tag.nil?
        raise "PA api requires AWS credentials. Please set access_key_id, secret_access_key and associate_tag, try again."
      end
      raise "Invalid region. region: #{self.region}" unless END_POINTS.include?(self.region)

      unsigned_uri = URI.parse("#{END_POINTS[self.region]}?#{request_params_string}")
      uri = add_signature(unsigned_uri)

      response = get_response uri
      @header = response.header
      @body = response.body

      response
    end
    
  end
end
