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
      "svdata={\"api_result\":1,\"api_result_msg\":\"\\u6210\\u529f\",\"api_data\":{\"api_ship_id\":[-1,54,78,71,50],\"api_clear_result\":1,\"api_get_exp\":20,\"api_member_lv\":28,\"api_member_exp\":40216,\"api_get_ship_exp\":[22,15,15,15],\"api_get_exp_lvup\":[[2157,2800],[1730,2100],[2230,2800],[1555,2100]],\"api_maparea_name\":\"\\u93ae\\u5b88\\u5e9c\\u6d77\\u57df\",\"api_detail\":\"\\u5916\\u6d77\\u307e\\u3067\\u8db3\\u3092\\u5ef6\\u3070\\u3057\\u3001\\u8266\\u968a\\u306e\\u7df4\\u5ea6\\u3092\\u9ad8\\u3081\\u3088\\u3046\\uff01\",\"api_quest_name\":\"\\u9577\\u8ddd\\u96e2\\u7df4\\u7fd2\\u822a\\u6d77\",\"api_quest_level\":1,\"api_get_material\":[0,100,30,0],\"api_useitem_flag\":[1,0],\"api_get_item1\":{\"api_useitem_id\":-1,\"api_useitem_name\":null,\"api_useitem_count\":1}}}" ]}

    stub.post('/kcsapi/api_req_hokyu/charge') {[ 200, resp_headers,
      "svdata={\"api_result\":1,\"api_result_msg\":\"\\u6210\\u529f\",\"api_data\":{\"api_ship\":[{\"api_id\":54,\"api_fuel\":15,\"api_bull\":15,\"api_onslot\":[0,0,0,0,0]},{\"api_id\":78,\"api_fuel\":15,\"api_bull\":15,\"api_onslot\":[0,0,0,0,0]},{\"api_id\":71,\"api_fuel\":15,\"api_bull\":15,\"api_onslot\":[0,0,0,0,0]},{\"api_id\":50,\"api_fuel\":15,\"api_bull\":15,\"api_onslot\":[0,0,0,0,0]}],\"api_material\":[2938,5864,4151,3933],\"api_use_bou\":0}}" ]}

    stub.post('/kcsapi/api_get_member/deck_port') {[ 200, resp_headers,
      "svdata={\"api_result\":1,\"api_result_msg\":\"\\u6210\\u529f\",\"api_data\":[{\"api_member_id\":15010331,\"api_id\":1,\"api_name\":\"First\",\"api_name_id\":\"\",\"api_mission\":[0,0,0,0],\"api_flagship\":\"0\",\"api_ship\":[109,156,177,31,194,30]},{\"api_member_id\":15010331,\"api_id\":2,\"api_name\":\"Second\",\"api_name_id\":\"\",\"api_mission\":[1,5,1387598754473,0],\"api_flagship\":\"0\",\"api_ship\":[15,66,57,83,-1,-1]},{\"api_member_id\":15010331,\"api_id\":3,\"api_name\":\"Third\",\"api_name_id\":\"\",\"api_mission\":[1,2,1387595310643,0],\"api_flagship\":\"0\",\"api_ship\":[54,78,71,50,-1,-1]}]}" ]}

  end

  Faraday.new do |builder|
    builder.adapter :test, stubs
  end

end