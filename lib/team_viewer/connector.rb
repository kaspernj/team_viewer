class TeamViewer::Connector
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
