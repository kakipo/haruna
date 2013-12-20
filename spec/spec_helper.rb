# encoding: utf-8
require 'rubygems'
require 'haruna'

def gunma
  "は群馬県になりました。"
end

def create_stub_connection
  # It's possible to define stubbed request outside a test adapter block.
  stubs = Faraday::Adapter::Test::Stubs.new do |stub|
    # stub.post(url) { [status_code, response_header, response_body] }
    stub.post('/kcsapi/get_seafood/tamago') {[ 200, {}, 'egg' ]}
    stub.post('/kcsapi/get_seafood/ebi') {[ 200, {}, 'shrimp' ]}
    stub.post('/kcsapi/get_seafood/uni') {[ 200, {}, 'urchin' ]}

    stub.post('/kcsapi/api_req_mission/start') {[ 200, {}, 'ok' ]}
    stub.post('/kcsapi/api_req_mission/result') {[ 200, {}, 'ok' ]}
    stub.post('/kcsapi/api_req_hokyu/charge') {[ 200, {}, 'ok' ]}

  end

  Faraday.new do |builder|
    builder.adapter :test, stubs
  end

end