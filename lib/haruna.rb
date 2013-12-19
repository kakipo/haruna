require "haruna/version"
require "haruna/extention/object"

module Haruna
  # Your code goes here...
  class Client
    def initialize(token)
      @token = token
    end

    def say
      p @token
    end
  end
end
