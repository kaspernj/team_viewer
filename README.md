[![Code Climate](https://codeclimate.com/github/kaspernj/team_viewer/badges/gpa.svg)](https://codeclimate.com/github/kaspernj/team_viewer)
[![Test Coverage](https://codeclimate.com/github/kaspernj/team_viewer/badges/coverage.svg)](https://codeclimate.com/github/kaspernj/team_viewer)
[![Gem Version](https://badge.fury.io/rb/team_viewer.svg)](http://badge.fury.io/rb/team_viewer)

# TeamViewer

TeamViewer API for Ruby.

Original code found here:
https://gist.github.com/theinventor/9918950

## Install

Enter this in your Gemfile and bundle:
```ruby
gem 'team_viewer'
```

## Usage

```ruby
conn = ::TeamViewer::Connector.new(client_id: "client_id", client_secret: "client_secret")
client = conn.client
team_viewer = ::TeamViewer::Client.new(client, "access_token")
```

### Add a session

```ruby
response = team_viewer.session_add(
  groupname: "Test",
  end_customer: {
    name: "Some name",
    email: "customer@email.com"
  }
)
```

## Contributing to TeamViewer
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2014 kaspernj. See LICENSE.txt for
further details.

