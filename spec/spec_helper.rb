require 'rubygems'
require 'bundler'
require 'pp'

Bundler.require

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', "/lib/emotivu")
require File.join(File.dirname(__FILE__), '..', "/server")

require 'rspec'
require 'rack/test'

RSpec.configure do |conf|
    conf.include Rack::Test::Methods
end

def delete_all_nodes
    delete_query = 'START n0=node(0),nx=node(*) MATCH n0-[r0]-(),nx-[rx]-() WHERE nx <> n0 DELETE r0,rx,nx'
    $neo_server.execute_query(delete_query)
end

def create_elasticsearch_index
    $elasticsearch.indices.create index: $elasticsearch_index, body: { mappings: {
        movie: {
            properties: {
                description: { type: 'string', analyzer: 'snowball'}
            }
        }}}
end

def delete_elasticsearch_index
    $elasticsearch.indices.delete index: $elasticsearch_index
end
