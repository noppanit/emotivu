require 'rubygems'
require 'neography'

# http://127.0.0.1:8475

def create_graph(port)
    Neography.configure do |config|
      config.protocol             = "http://"
      config.server               = "127.0.0.1"
      config.port                 = port
      config.directory            = ""  # prefix this path with '/'
      config.cypher_path          = "/cypher"
      config.gremlin_path         = "/ext/GremlinPlugin/graphdb/execute_script"
      config.log_file             = "neography.log"
      config.log_enabled          = false
      config.slow_log_threshold   = 0    # time in ms for query logging
      config.max_threads          = 20
      config.authentication       = nil  # 'basic' or 'digest'
      config.username             = nil
      config.password             = nil
      config.parser               = MultiJsonParser
      config.http_send_timeout    = 1200
      config.http_receive_timeout = 1200
    end

	neo = Neography::Rest.new

	movies = neo.create_node("name" => "Movies")

	movies_index = neo.create_node_index("movies_index")
	neo.add_node_to_index("movies_index", "name", "movies_index", movies)

end
