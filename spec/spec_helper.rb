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
      "svdata={\"api_result\":1,\"api_result_msg\":\"\u6210\u529f\",\"api_data\":{\"api_ship_id\":[-1,150,66,57,83],\"api_clear_result\":1,\"api_get_exp\":40,\"api_member_lv\":35,\"api_member_exp\":61702,\"api_get_ship_exp\":[120,80,80,80],\"api_get_exp_lvup\":[[1584,2100],[3460,3600],[3460,3600],[3280,3600]],\"api_maparea_name\":\"\u93ae\u5b88\u5e9c\u6d77\u57df\",\"api_detail\":\"\u8f38\u9001\u8239\u56e3\u306e\u5b89\u5168\u3092\u56f3\u308b\u305f\u3081\u306b\u3001\u8239\u56e3\u306b\u540c\u884c\u3057\u3066\u3001\u3053\u308c\u3092\u8b77\u885b\u3057\u3088\u3046\uff01\",\"api_quest_name\":\"\u6d77\u4e0a\u8b77\u885b\u4efb\u52d9\",\"api_quest_level\":3,\"api_get_material\":[200,200,20,20],\"api_useitem_flag\":[0,0]}}" ]}

    stub.post('/kcsapi/api_req_hokyu/charge') {[ 200, resp_headers,
      "svdata={\"api_result\":1,\"api_result_msg\":\"\u6210\u529f\",\"api_data\":{\"api_ship\":[{\"api_id\":54,\"api_fuel\":15,\"api_bull\":15,\"api_onslot\":[0,0,0,0,0]},{\"api_id\":71,\"api_fuel\":15,\"api_bull\":15,\"api_onslot\":[0,0,0,0,0]},{\"api_id\":78,\"api_fuel\":15,\"api_bull\":15,\"api_onslot\":[1,1,0,0,0]},{\"api_id\":193,\"api_fuel\":25,\"api_bull\":25,\"api_onslot\":[1,1,0,0,0]}],\"api_material\":[2242,7714,5398,1128],\"api_use_bou\":0}}" ]}

    stub.post('/kcsapi/api_get_member/deck_port') {[ 200, resp_headers,
      "svdata={\"api_result\":1,\"api_result_msg\":\"\\u6210\\u529f\",\"api_data\":[{\"api_member_id\":15010331,\"api_id\":1,\"api_name\":\"First\",\"api_name_id\":\"\",\"api_mission\":[0,0,0,0],\"api_flagship\":\"0\",\"api_ship\":[177,227,276,31,30,109]},{\"api_member_id\":15010331,\"api_id\":2,\"api_name\":\"Second\",\"api_name_id\":\"\",\"api_mission\":[0,0,0,0],\"api_flagship\":\"0\",\"api_ship\":[150,66,57,83,-1,-1]},{\"api_member_id\":15010331,\"api_id\":3,\"api_name\":\"Third\",\"api_name_id\":\"\",\"api_mission\":[2,9,1387822430036,0],\"api_flagship\":\"0\",\"api_ship\":[54,78,71,193,-1,-1]},{\"api_member_id\":15010331,\"api_id\":4,\"api_name\":\"Fourth\",\"api_name_id\":\"\",\"api_mission\":[2,12,1387840275830,0],\"api_flagship\":\"0\",\"api_ship\":[50,82,210,164,-1,-1]}]}" ]}

  end

  Faraday.new do |builder|
    builder.adapter :test, stubs
  end

end