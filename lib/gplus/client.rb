require 'gplus/activity'
require 'gplus/person'

module Gplus
  class Client
    def initialize(options = {})
      @api_key = options[:api_key]
      @client_id = options[:client_id]
      @client_secret = options[:client_secret]
      @redirect_uri = options[:redirect_uri]
      @token = options[:token]

      @oauth_client = OAuth2::Client.new(
        @client_id,
        @client_secret,
        :site => 'https://www.googleapis.com/plus/',
        :authorize_url => 'https://accounts.google.com/o/oauth2/auth',
        :token_url => 'https://accounts.google.com/o/oauth2/token'
      )
    end

    def authorize_url(redirect_uri = @redirect_uri)
      @oauth_client.auth_code.authorize_url(:redirect_uri => redirect_uri, :scope => 'https://www.googleapis.com/auth/plus.me')
    end

    def authorize(auth_code, redirect_uri = @redirect_uri)
      @access_token = @oauth_client.auth_code.get_token(auth_code, :redirect_uri => redirect_uri)
    end

  private
    def access_token
      if @token
        @access_token ||= OAuth2::AccessToken.new(@oauth_client, @token)
      end
    end

    def get(path, params = {})
      if access_token
        response = access_token.get("v1/#{path}", params)
      else
        response = @oauth_client.request(:get, "v1/#{path}", { :params => params.merge(:key => @api_key) })
      end
      MultiJson.decode(response.body)
    end
  end
end
