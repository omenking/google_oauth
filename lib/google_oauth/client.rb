#require 'google_oauth/timeline'
#require 'google_oauth/status'
require 'google_oauth/youtube'
#require 'google_oauth/direct_messages'
#require 'google_oauth/search'
#require 'google_oauth/notifications'
#require 'google_oauth/blocks'
#require 'google_oauth/friendships'
#require 'google_oauth/user'
#require 'google_oauth/favorites'
#require 'google_oauth/utils'
#require 'google_oauth/trends'
#require 'google_oauth/lists'
#require 'google_oauth/saved_searches'
#require 'google_oauth/spam'
#require 'google_oauth/geo'

module GoogleOAuth
  class Client
    
    def initialize(options = {})
      @consumer_key    = options[:consumer_key]
      @consumer_secret = options[:consumer_secret]
      @token           = options[:token]
      @secret          = options[:secret]
      @scope           = options[:scope]
      raise "You must include a scope eg. (http://gdata.youtube.com)"unless options[:scope]
    end
    
    def authorize(token, secret, options = {})
      request_token = OAuth::RequestToken.new(consumer, token, secret)
      @access_token = request_token.get_access_token(options)
      @token        = @access_token.token
      @secret       = @access_token.secret
      @access_token
    end
    
    def request_token(options={})
      consumer.get_request_token(options,{:scope => @scope})
    end
    
    def authentication_request_token(options={})
      consumer.options[:authorize_path] = '/accounts/OAuthGetRequestToken'
      request_token(options)
    end
    
    #private    
      def consumer
        @consumer ||= OAuth::Consumer.new(
          @consumer_key,
          @consumer_secret,
          {:site => 'https://www.google.com',
           :request_token_path => '/accounts/OAuthGetRequestToken', 
           :access_token_path => '/accounts/OAuthGetAccessToken', 
           :authorize_path => '/accounts/OAuthAuthorizeToken' }
        )
      end

      def access_token
        @access_token ||= OAuth::AccessToken.new(consumer, @token, @secret)
      end
      
      def get(path, headers={})
        headers.merge!("User-Agent" => "google_oauth gem v#{GoogleOAuth::VERSION}")
        oauth_response = access_token.get("#{@scope}#{path}?v=2&alt=json", headers)
        JSON.parse(oauth_response.body)
      end

      def post(path, body='', headers={})
        headers.merge!("User-Agent" => "google_oauth gem v#{GoogleOAuth::VERSION}")
        oauth_response = access_token.post("#{@scope}#{path}", body, headers)
        JSON.parse(oauth_response.body)
      end

      def delete(path, headers={})
        headers.merge!("User-Agent" => "google_oauth gem v#{GoogleOAuth::VERSION}")
        oauth_response = access_token.delete("#{@scope}#{path}", headers)
        JSON.parse(oauth_response.body)
      end
  end
end
   
