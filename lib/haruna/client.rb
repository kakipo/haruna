module Haruna

  class Client < API

    def initialize(token)
      super token
    end

    def req_mission_start(deck_id, mission_id)
      validate_deck_id(deck_id)
      validate_mission_id(mission_id)
      call("api_req_mission", "start", api_deck_id: deck_id, api_mission_id: mission_id)
    end

    def req_mission_result(deck_id)
      validate_deck_id(deck_id)
      call("api_req_mission", "result", api_deck_id: deck_id)
    end

    def get_member_deck_port
      call("api_get_member", "deck_port")
    end

    # kind
    #   1: oil?
    #   2: bullet?
    #   3: oil + bullet?
    def req_hokyu_charge(kind, ship_id_arr)
      validate_supply_kind(kind)
      validate_ship_ids(ship_id_arr)
      call("api_req_hokyu", "charge", api_kind: kind, api_id_items: ship_id_arr.join(","))
    end

    # validators
    def validate_deck_id(deck_id)
      raise ArgumentError, "deck id must be between 1~4" unless deck_id.between?(1, 4)
    end

    def validate_mission_id(mission_id)
      raise ArgumentError, "mission_id must be positive" unless 0 < mission_id
    end

    def validate_supply_kind(kind)
      raise ArgumentError, "kind must be between 1~3" unless kind.between?(1, 3)
    end

    def validate_ship_ids(ship_id_arr)
      raise ArgumentError, "at least 1 ship id is required" if ship_id_arr.empty?
      raise ArgumentError, "at least 1 ship id is required" unless ship_id_arr.select{|id| id <= 0 }.empty?
    end



  end
end
