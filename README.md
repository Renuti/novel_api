# Concert Suggestion API

##Description
This program is an API digestible by other programs. It pulls from two separate APIs: 1) TasteKid and 2) BandsinTown. The API allows a user to enter an artist, receive a list of similar artists based on the information entered, and returns all recommended artists and any upcoming concerts they have worldwide.

### How it's Done

Pulling a list of suggested artists from TasteKid and limiting it to three artists:

```ruby 
def top_three_recommendations
    artists = []
    (1..3).each do |item|
      artists << @response["Similar"]["Results"][item]["Name"]
    end
    artists
  end

  def top_recommendation
    @response["Similar"]["Results"][1]["Name"]
  end
```

Pulling artists and venue lists from BandsinTown:

```ruby
def venues_all
    venues = {}
    @response.each_index {|item| venues[venue_name(item)] = venue_city(item)}
    venues
  end

  def concert_date
    dates = []
    (1..10).each do |item|
      dates << @response[item]["datetime"]
    end
    dates
  end
```

