class Movie
    attr_reader :properties
    def initialize(properties = {})
        @properties = properties
    end

    def create
        movie_id = SecureRandom.uuid
        @properties['movie_id'] = movie_id

        $logger.info 'Add movie to neo4j'
        $logger.info "#{@properties}"

        movie_node = $neo_server.create_node(@properties)
        $neo_server.add_node_to_index("movie_index", "movie_id", movie_id, movie_node)

        $logger.info "Add movie to elasticsearch #{$elasticsearch_index}"

        $elasticsearch.index index: $elasticsearch_index,
            type: 'movie',
            id: movie_id,
            body: { description: @properties[:description] },
            refresh: true

        return movie_id
    end
end
