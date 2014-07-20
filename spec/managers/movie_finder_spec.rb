require File.expand_path('../../spec_helper', __FILE__)

describe MovieFinder do
    before(:each) do
        create_elasticsearch_index
        delete_all_nodes
    end

    context 'When finding movie by similarity' do
        before(:each) do
            Movie.new({name: 'Terminator 2', description: 'Arnold'}).create
            Movie.new({name: 'Top Gun', description: 'Tom cruise'}).create
            Movie.new({name: 'Terminator 1', description: 'Arnold'}).create

            @movie_finder = MovieFinder.new
        end

        it 'should give me movies based on similarity' do
            movies = @movie_finder.find_by_similarity('Arnold')
            expect(movies.size).to eql 2

        end
    end
    
    after(:each) do
        delete_elasticsearch_index
        delete_all_nodes
    end

end
