module Haruna

  class CachedClient < API
    require 'cache_method'

    def initialize(token, end_point, opts={})
      super(token, end_point, opts)
    end

    def clear_cache
      # nop
    end

    cache_method :call
    cache_method_clear_on :clear_cache, :call

  end
end
