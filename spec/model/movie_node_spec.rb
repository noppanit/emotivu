require File.expand_path('../../spec_helper', __FILE__)

describe "When using movie node" do
    before(:each) do

    end

    it "should create a movie" do
        movie_node = Movie.new
        movie_node.name = "Terminator 2"

        movie_node.create
        
    end
end
