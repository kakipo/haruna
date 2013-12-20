module Haruna

  class API
    # config req header
    API_VER         = 1
    USER_AGENT      = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36'
    REFERER = 'http://125.6.189.215/kcs/port.swf?version=1.5.5'
    ACCEPT_ENCODING = 'gzip,deflate,sdch'
    ACCEPT_LANGUAGE = 'ja,en-US;q=0.8,en;q=0.6'
    CONTENT_TYPE    = 'application/x-www-form-urlencoded'

    def initialize(token)
      require 'faraday'
      @token = token

      @conn = Faraday.new(:url => 'http://kakipo.com', :proxy => 'http://127.0.0.1:9999') do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    attr_writer :conn # for testing, not really need to rewrite

    def call(action, target, param={})
      @conn.post do |req|
        req.url "/kcsapi/#{action}/#{target}"
        req.headers['User-Agent']       = USER_AGENT
        req.headers['Referer']          = REFERER
        req.headers['Accept-Encoding']  = ACCEPT_ENCODING
        req.headers['Accept-Language']  = ACCEPT_LANGUAGE
        req.headers['Content-Type']     = CONTENT_TYPE
        req.body = setup_param(param)
      end
    end

    def setup_param(param)
      param.merge(api_verno: API_VER, api_token: @token)
    end

  end
end
