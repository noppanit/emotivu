require File.expand_path('../../spec_helper', __FILE__)

describe Movie do
    before(:each) do
        create_elasticsearch_index
        delete_all_nodes
    end

    context 'when creating a new movie' do
        before(:each) do
            movie_node = Movie.new({name: 'Terminator 2', description: 'Arnold'})
            @movie_id = movie_node.create
            movie_manager = MovieFinder.new

            @found_movie = movie_manager.find_by_id(@movie_id)
        end

        it 'should have name Terminator 2' do
            expect(@found_movie.properties['name']).to eql "Terminator 2"
        end

        it 'should have movie id' do
            expect(@found_movie.properties['movie_id']).to eql @movie_id
        end

        it 'should have description Arnold' do
            expect(@found_movie.properties['description']).to eql 'Arnold'
        end

    end

    after(:each) do
        delete_elasticsearch_index
		delete_all_nodes
	end
end
