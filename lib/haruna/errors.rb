module Haruna

  class HarunaError < StandardError; end
  module API
    class APIError < ::Haruna::HarunaError; end
    class BadResponseError < APIError; end
  end

end