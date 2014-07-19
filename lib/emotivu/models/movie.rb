class Movie
    attr_reader :name, :movie_id, :args
    def initialize(args = {})
        @args = args
        args.each { |k,v| instance_variable_set("@#{k}", v) }
    end

    def create
        movie_id = SecureRandom.uuid
        @args[:movie_id] = movie_id

        movie_node = $neo_server.create_node(@args)
        $neo_server.add_node_to_index("movie_index", "movie_id", movie_id, movie_node)

        return movie_id
    end
end
