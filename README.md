# Haruna

[![Gem Version](https://badge.fury.io/rb/haruna.png)](http://badge.fury.io/rb/haruna)
[![Build Status](https://travis-ci.org/kakipo/haruna.png?branch=master)](https://travis-ci.org/kakipo/haruna)

A Ruby interface to the 艦これ API.

## Installation

Add this line to your application's Gemfile:

    gem 'haruna'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install haruna

## Usage

```ruby
client = Haruna::Client.new(token, end_point)

# start a mission
client.req_mission_start(deck_id, mission_id)

# obtain mission result
client.req_mission_result(deck_id)

# refill fuel & bullets
client.req_hokyu_charge(kind, ship_id_arr)
```

### Parameters

| Param         | Description    | Sample                                     | Constraint |
| ------------- | -------------- | ------------------------------------------ | ---------- |
| token         | Your API token | "835d2a8f2ca5fea2463248cc6910af96880fc29e" |            |
| end_point     | API endpoint   | "http://125.6.189.215"                     |            |
| ship_id       | Ship's id      | 35                                         | > 0        |
| deck_id       | Deck's id      | 3                                          | 1 ~ 4      |
| kind          | Refill mode - 1: fuel, 2: bullets, 3: fuel + bullets  | 3   | 1 ~ 3      |

### Configuration

You can configure a `Haruna::Client` by passing it options when it's initialized.

```ruby
# specify proxy server
proxy_client = Haruna::Client.new(token, end_point, proxy: "http://127.0.0.1:8888")

# you can modify HTTP request header
client = Haruna::Client.new(token, end_point, user_agent: "My User Agent", accept_enc: "gzip")
# or you can rewrite the settings after initialization
client.user_agent = "Foo Bar"
```

| Option         | Description       | Default                              | 
| -------------- | ----------------- | ------------------------------------ | 
| :proxy         | Proxy server URL  | nil                                  | 
| :api_ver       | API version       | 1                                    | 
| :user_agent    | User Agent        |  "Mozilla/5.0 (M..."                 | 
| :referer       | Referer           |  "/kcs/port.swf?version=1.5.5"       | 
| :accept_enc    | Accept-Encoding   |  "gzip,deflate,sdch"                 | 
| :accept_lang   | Accept-Encoding   |  "ja,en-US;q=0.8,en;q=0.6"           | 
| :content_type  | Content-Type      |  "application/x-www-form-urlencoded" | 



## Disclaimer

This software library ("gem") is provided by kakipo "as is" and "with all faults." kakipo makes no representations or warranties of any kind concerning the safety, suitability, inaccuracies, typographical errors, or other harmful components of this gem. There are inherent dangers in the use of any software, and you are solely responsible for determining whether this gem is compatible with your equipment and other software installed on your equipment. You are also solely responsible for the protection of your equipment and backup of your data, and kakipo will not be liable for any damages you may suffer in connection with using, modifying, or distributing this gem.

Put simply, it's your responsibility to use this gem.
Plus, please read and respect [the official terms of use](http://www.dmm.co.jp/rule/=/category=onlinegame_service/).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
