module GoogleMapsService::Apis

  # Performs requests to the Google Maps Places API.
  module Places
    #
    # @return [Array] Array of places data responses
    def nearby(location, radius: nil, rankby: nil, types: nil)
      params = {
        location: GoogleMapsService::Convert.waypoints(location)
      }

      params[:radius] = radius if radius
      params[:rankby] = rankby if rankby
      params[:types] = GoogleMapsService::Convert.join_list('|', types) if types

      return get('/maps/api/place/nearbysearch/json', params)[:results]
    end

  end
end