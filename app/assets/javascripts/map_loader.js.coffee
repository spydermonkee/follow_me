$ ->
  L.mapbox.accessToken = 'pk.eyJ1IjoiZWhjIiwiYSI6InpRVUVnaVkifQ.YR49gsHwf8EPpNAU5FtPuQ'
  window.map = L.mapbox.map('map', 'ehc.map-shm0r7pp')
  $( "#loader" ).click (event) ->
    if window.fLayers?
      debugger
      $.each(window.fLayers, (_, feature) ->
        window.map.removeLayer(feature)
      )
    window.fLayers = []

    username = $('#username').val()
    loadTweets(username)
    event.preventDefault()


loadTweets = (username) ->
  $.getJSON ("/api/v1/users/" + username + "/posts"), (data) ->
    jQuery.each data, (index, tweet) ->
      window.map.setView tweet.coordinates.coordinates.reverse(), 10 if index == 0

      point = L.mapbox.featureLayer(
        type: 'Feature'
        geometry:
          type: 'Point'
          coordinates: tweet.coordinates.coordinates
        properties:
          title: tweet.text
          description: tweet.text
          'marker-size': 'large'
          'marker-color': '#BE9A6B'
          'marker-symbol': 'cafe'
      )
      window.fLayers.push point
      point.addTo window.map