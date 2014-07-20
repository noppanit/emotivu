class MovieFinder
    def initialize
    end

    def find_by_id(movie_id)
        found_movie_node = $neo_server.find_node_index("movie_index", "movie_id", movie_id)
        movie_properties = $neo_server.get_node_properties(found_movie_node)

        Movie.new(movie_properties)
    end

    def find_by_similarity(text)
        response = $elasticsearch.search index: $elasticsearch_index, q: text
        response = Hashie::Mash.new response

        return response.hits.hits.map{|movie| find_by_id(movie._id)}

    end
end
