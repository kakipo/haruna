# encoding: utf-8
require 'rubygems'
require 'haruna'
require 'pry'

def create_stub_connection

  resp_headers = {"date"=>"Sat, 21 Dec 2013 04:11:07 GMT", "server"=>"Apache", "x-powered-by"=>"PHP/5.3.3", "content-length"=>"149", "content-type"=>"text/plain", "proxy-connection"=>"Close"}

  stubs = Faraday::Adapter::Test::Stubs.new do |stub|
    # stub.post(url) { [status_code, response_header, response_body] }
    stub.post('/kcsapi/get_seafood/tamago') {[ 200, {}, 'egg' ]}
    stub.post('/kcsapi/get_seafood/ebi') {[ 200, {}, 'shrimp' ]}
    stub.post('/kcsapi/get_seafood/uni') {[ 200, {}, 'urchin' ]}

    # stub.post(url) { [status_code, response_header, response_body] }
    stub.post('/kcsapi/api_req_mission/start') {[ 200, resp_headers,
      "svdata={\"api_result\":1,\"api_result_msg\":\"\\u6210\\u529f\",\"api_data\":{\"api_complatetime\":1387604467275,\"api_complatetime_str\":\"2013-12-21 14:41:07\"}}" ]} # BOM: \xEF\xBB\xBF

    stub.post('/kcsapi/api_req_mission/result') {[ 200, resp_headers,
      "" ]}

    stub.post('/kcsapi/api_req_hokyu/charge') {[ 200, resp_headers,
      "svdata={\"api_result\":1,\"api_result_msg\":\"\\u6210\\u529f\",\"api_data\":{\"api_ship\":[{\"api_id\":54,\"api_fuel\":15,\"api_bull\":15,\"api_onslot\":[0,0,0,0,0]},{\"api_id\":78,\"api_fuel\":15,\"api_bull\":15,\"api_onslot\":[0,0,0,0,0]},{\"api_id\":71,\"api_fuel\":15,\"api_bull\":15,\"api_onslot\":[0,0,0,0,0]},{\"api_id\":50,\"api_fuel\":15,\"api_bull\":15,\"api_onslot\":[0,0,0,0,0]}],\"api_material\":[2938,5864,4151,3933],\"api_use_bou\":0}}" ]}

    stub.post('/kcsapi/api_get_member/deck_port') {[ 200, resp_headers,
      "svdata={\"api_result\":1,\"api_result_msg\":\"\\u6210\\u529f\",\"api_data\":[{\"api_member_id\":15010331,\"api_id\":1,\"api_name\":\"First\",\"api_name_id\":\"\",\"api_mission\":[0,0,0,0],\"api_flagship\":\"0\",\"api_ship\":[177,227,276,31,30,109]},{\"api_member_id\":15010331,\"api_id\":2,\"api_name\":\"Second\",\"api_name_id\":\"\",\"api_mission\":[0,0,0,0],\"api_flagship\":\"0\",\"api_ship\":[150,66,57,83,-1,-1]},{\"api_member_id\":15010331,\"api_id\":3,\"api_name\":\"Third\",\"api_name_id\":\"\",\"api_mission\":[2,9,1387822430036,0],\"api_flagship\":\"0\",\"api_ship\":[54,78,71,193,-1,-1]},{\"api_member_id\":15010331,\"api_id\":4,\"api_name\":\"Fourth\",\"api_name_id\":\"\",\"api_mission\":[2,12,1387840275830,0],\"api_flagship\":\"0\",\"api_ship\":[50,82,210,164,-1,-1]}]}" ]}

  end

  Faraday.new do |builder|
    builder.adapter :test, stubs
  end

end