module Haruna

  class API
    attr_writer :conn # for testing, not really need to rewrite this
    attr_accessor :proxy, :api_ver, :user_agent, :referer, :accept_enc, :accept_lang, :content_type

    DEFAULT_OPTS = {
      proxy:          nil,
      api_ver:        1,
      user_agent:     'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36',
      referer:        '/kcs/port.swf?version=1.5.6',
      accept_enc:     'gzip,deflate,sdch',
      accept_lang:    'ja,en-US;q=0.8,en;q=0.6',
      content_type:   'application/x-www-form-urlencoded'
    }

    def initialize(token, end_point, opts={})
      require 'faraday'
      @token = token
      @end_point = end_point

      self.setup(opts || {})

      @conn = Faraday.new(:url => @end_point, :proxy => @proxy) do |faraday|
        faraday.request  :url_encoded
        # faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end

    def call(action, target, param={})
      @conn.post do |req|
        req.url "/kcsapi/#{action}/#{target}"
        req.headers['User-Agent']       = @user_agent
        req.headers['Referer']          = "#{@end_point}#{@referer}"
        req.headers['Accept-Encoding']  = @accept_enc
        req.headers['Accept-Language']  = @accept_lang
        req.headers['Content-Type']     = @content_type
        req.body = setup_param(param)
      end
    end

    def setup_param(param)
      param.merge(api_verno: @api_ver, api_token: @token)
    end

    def setup(opts)
      DEFAULT_OPTS.merge(opts).each { |key, value| instance_variable_set("@#{key}", value) }
      self
    end

  end
end
