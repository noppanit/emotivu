class Movie
    attr_reader :properties
    def initialize(properties = {})
        @properties = properties
    end

    def create
        movie_id = SecureRandom.uuid
        @properties['movie_id'] = movie_id

        movie_node = $neo_server.create_node(@properties)
        $neo_server.add_node_to_index("movie_index", "movie_id", movie_id, movie_node)

        return movie_id
    end
end
