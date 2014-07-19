require 'rubygems'
require 'bundler'
require 'pp'

Bundler.require

require File.join(File.dirname(__FILE__), '..', "/lib/emotivu")
require File.join(File.dirname(__FILE__), '..', "/server")

require 'rspec'
require 'rack/test'

RSpec.configure do |conf|
    conf.include Rack::Test::Methods
end

def delete_all_nodes
    delete_query = 'START n = node(*) WITH n OPTIONAL MATCH n-[r]-() DELETE n, r;'
    $neo_server.execute_query(delete_query)
end
