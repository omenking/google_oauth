module GoogleOAuth
  class Client

    # Returns an HTTP 200 OK response code and a representation of the requesting user if authentication was successful; 
    # returns a 401 status code and an error message if not.
    def authorized?
      oauth_response = access_token.get('/feeds/api/users/default')
      return oauth_response.class == Net::HTTPOK
    end
    
    def profile(username='default')
      get("/feeds/api/users/#{username}")      
    end
   
    def uploads(username='default')
      json = get("/feeds/api/users/#{username}/uploads")['feed']['entry']
      json.collect{|i|i['media$group']}
    end
        
    def playlists(username='default')
      get("/feeds/api/users/#{username}/playlists")
    end
    
    def subscriptions(username='default')
      get("/feeds/api/users/#{username}/subscriptions")
    end

    def contacts(username='default')
      get("/feeds/api/users/#{username}/contacts")
    end

    def favorites(username='default')
      get("/feeds/api/users/#{username}/favorites")
    end
        
  end
end
