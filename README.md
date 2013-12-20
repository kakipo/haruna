# Haruna

A Ruby interface to the 艦これ API.

## Installation

Add this line to your application's Gemfile:

    gem 'haruna'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install haruna

## Usage

    client = Haruna::Client.new(token)

    # to start a mission
    client.req_mission_start(deck_id, mission_id)

    # to obtain mission result
    client.req_mission_result(deck_id)

    # to refill fuel & bullets
    client.req_hokyu_charge(kind, ship_id_arr)

### Parameter

| Param         | Description    | Constraint |
| ------------- | -------------- | ---------- |
| ship_id       | ship's id      | 1~         |
| deck_id       | deck's id      | 1~4        |
| kind          | refill mode - 1: fuel, 2: bullets, 3: fuel + bullets      |  1~3 |


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
