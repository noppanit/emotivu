require File.expand_path('../../spec_helper', __FILE__)

describe Movie do
    before(:each) do
        delete_all_nodes
    end

    context 'when creating a new movie' do
        before(:each) do
            movie_node = Movie.new({name: 'Terminator 2'})
            @movie_id = movie_node.create
            movie_manager = MovieManager.new

            @found_movie = movie_manager.find_by_id(@movie_id)
        end

        it 'should have name Terminator 2' do
            expect(@found_movie.name).to eql "Terminator 2"
        end

        it 'should have movie id' do
            expect(@found_movie.movie_id).to eql @movie_id
        end

    end


    after(:each) do
		delete_all_nodes
	end
end
