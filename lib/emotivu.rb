$:.unshift File.dirname(__FILE__)

require 'bundler'
Bundler.require(:default, (ENV["RACK_ENV"]|| 'development').to_sym)

$logger = Logger.new('log.log')

enable :logging
configure :production do
    $logger.info 'Production environment'
    $elasticsearch_index = 'emotivu_movie_prod'
    $elasticsearch = Elasticsearch::Client.new log: true
    $neo_server = Neography::Rest.new(ENV['GRAPHENEDB_URL'] || "http://127.0.0.1:7477")
end

configure :staging do
    $logger.info 'Stage environment'
    $elasticsearch_index = 'emotivu_movie_stage'
    $elasticsearch = Elasticsearch::Client.new log: true
    $neo_server = Neography::Rest.new(ENV['GRAPHENEDB_URL'] || "http://127.0.0.1:7477")
end

configure :development do
    $logger.info 'Development environment'
    $elasticsearch_index = 'emotivu_movie_test'
    $elasticsearch = Elasticsearch::Client.new log: true
    $neo_server = Neography::Rest.new("http://127.0.0.1:8475")
end

configure :test do
    $logger.info 'Test environment'
    $elasticsearch_index = 'emotivu_movie_test'
    $elasticsearch = Elasticsearch::Client.new log: false
    $neo_server = Neography::Rest.new("http://127.0.0.1:8475")
end

$logger.info "Elastic search using #{$elasticsearch_index}"

require 'emotivu/models/movie'
require 'emotivu/managers/movie_finder'
