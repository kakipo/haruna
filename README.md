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
| token         | Your API token |            |
| ship_id       | Ship's id      | 1 ~        |
| deck_id       | Deck's id      | 1 ~ 4      |
| kind          | Refill mode - 1: oil, 2: bullets, 3: oil + bullets      | 1 ~ 3 |


## Disclaimer

This software library ("gem") is provided by kakipo "as is" and "with all faults." kakipo makes no representations or warranties of any kind concerning the safety, suitability, inaccuracies, typographical errors, or other harmful components of this gem. There are inherent dangers in the use of any software, and you are solely responsible for determining whether this gem is compatible with your equipment and other software installed on your equipment. You are also solely responsible for the protection of your equipment and backup of your data, and kakipo will not be liable for any damages you may suffer in connection with using, modifying, or distributing this gem.

Plus, please read and respect [the official terms of use](http://www.dmm.co.jp/rule/=/category=onlinegame_service/).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
