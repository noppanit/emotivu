require File.expand_path('../../spec_helper', __FILE__)

describe "When using movie node" do
    before(:each) do
        delete_all_nodes
    end

    it "should create a movie" do
        movie_node = Movie.new({name: 'Terminator 2'})

        movie_node.create

        

    end

    after(:each) do
		delete_all_nodes
	end
end
