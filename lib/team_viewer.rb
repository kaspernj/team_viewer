module TeamViewer
  class Connector
    attr_reader :client

    def initialize(args)
      @args = args
      @client = connection(credentials)
    end

    def credentials
      {
        base_url: 'https://webapi.teamviewer.com',
        client_id: @args[:client_id],
        client_secret: @args[:client_secret]
      }
    end

    def connection(credentials)
      OAuth2::Client.new(credentials[:client_id], credentials[:client_secret],
        site: credentials[:base_url],
        authorize_url: '/api/v1/oauth2/authorize',
        token_url: '/api/v1/oauth2/token'
      )
    end
  end

  class Client
    attr_reader :access_token

    def initialize(client, token_str)
      @client = client
      @access_token = token(token_str)
    end

    def token(str)
      OAuth2::AccessToken.new(@client, str)
    end


    #------------#
    #--- Ping ---#
    #------------#

    def ping
      get 'ping'
    end


    #-------------#
    #--- Users ---#
    #-------------#

    def users(params = nil)
      get 'users', params
    end

    def user_add(data)
      post 'users', data
    end

    def user_get(id)
      get "users/#{id}"
    end

    def user_update(id, data)
      put "users/#{id}", data
    end


    #----------------#
    #--- Sessions ---#
    #----------------#

    def sessions(params = nil)
      get 'sessions', params
    end

    def session_add(data)
      post 'sessions', data
    end

    def session_get(code)
      get "sessions/#{code}"
    end

    def session_update(code, data)
      put "sessions/#{code}", data
    end


    #--------------------------#
    #--- Connection Reports ---#
    #--------------------------#

    def reports(params = nil)
      get 'reports/connections', params
    end

    def report_update(id, data)
      put "reports/connections/#{id}", data
    end

    def report_delete(id)
      delete "reports/connections/#{id}"
    end


    #----------------#
    #--- Meetings ---#
    #----------------#

    def meetings(params = nil)
      get 'meetings', params
    end

    def meeting_get(id)
      get "meetings/#{id}"
    end

    def meeting_invitation(id, params)
      get "meetings/#{id}/invitation", params
    end

    def meeting_add(data)
      post 'meetings', data
    end

    def meeting_update(id, data)
      put "meetings/#{id}", data
    end

    def meeting_delete(id)
      delete "meetings/#{id}"
    end

  private

    def full_path(resource)
      "api/v1/#{resource}"
    end

    def get(resource, params = nil)
      response = @access_token.get(full_path(resource), params: params)
      response.parsed
    end

    def post(resource, data)
      response = @access_token.post(full_path(resource), body: data)
      response.status == 200 ? response.parsed : response.status
    end

    def put(resource, data)
      response = @access_token.put(full_path(resource), body: data)
      response.status
    end

    def delete(resource)
      response = @access_token.delete( full_path(resource) )
      response.status
    end
  end
end
