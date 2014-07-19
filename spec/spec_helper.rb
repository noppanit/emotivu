require 'rubygems'
require 'bundler'
require 'pp'
Bundler.require

require 'rspec'

require File.join(File.dirname(__FILE__), '..', "/lib/emotivu")

def delete_all_nodes
    delete_query = 'START n = node(*) WITH n OPTIONAL MATCH n-[r]-() DELETE n, r;'
    $neo_server.execute_query(delete_query)
end
