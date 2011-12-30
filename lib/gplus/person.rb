module Gplus
  class Client
    # Get a person's Google+ profile.
    # See http://developers.google.com/+/api/latest/people/get for more details.
    #
    # @param [String] id The unique ID of the person whose profile you want to retrieve. Pass the string 'me' to fetch the profile for the person that the API client is authorized as.
    # @return [Hash] A nested hash representation of a {http://developers.google.com/+/api/latest/people#resource Person resource}
    def get_person(id)
      get("people/#{id}")
    end

    # Search all public Google+ profiles.
    # See https://developers.google.com/+/api/latest/people/search for more details
    #
    # @option options [String] query The full text query to search for. This option is required.
    # @option options [String] language The preferred language to search with. See https://developers.google.com/+/api/search#available-languages for the list of allowed language codes.
    # @option options [Integer] maxResults (10) The number of profiles, between 1 and 20, to return.
    # @option options [String] pageToken The page of profiles to fetch. Pass the value of :nextPageToken from the previous result set to get the next page of results.
    # @return [Hash] A nested hash representation of a {http://developers.google.com/+/api/latest/people/search#response search result for people}.
    def search_people(options = {})
      get("people", options)
    end
  end
end
