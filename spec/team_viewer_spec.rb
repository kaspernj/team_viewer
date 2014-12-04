require 'spec_helper'

describe "TeamViewer" do
  it "should autoload" do
    TeamViewer::Client
    TeamViewer::Connector
  end
end
