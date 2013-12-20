module Haruna

  class Client < API

    def initialize(token)
      super token
    end

    def go_mission(deck_id, mission_id)
      call("api_req_mission", "start", api_deck_id: deck_id, api_mission_id: mission_id)
    end

    def get_mission_result(deck_id)
      call("api_req_mission", "result", api_deck_id: deck_id)
    end

    # kind
    #   1: oil?
    #   2: bullet?
    #   3: oil + bullet?
    def supply_material(kind, ship_id_arr)
      call("api_req_hokyu", "charge", api_kind: kind, api_id_items: ship_id_arr.join(","))
    end

  end
end
