require File.expand_path('../../spec_helper', __FILE__)

describe 'Server' do

    before(:each) do
        create_elasticsearch_index
        delete_all_nodes
    end

    let(:app) { Sinatra::Application }

    context '/suggestion' do
        before(:each) do
            Movie.new({name: 'Terminator 2', description: 'some text'}).create
        end

        it 'should have movie suggestion based on text' do
            post '/suggestion', { text: 'some text'}
            
        end
    end

    after(:each) do
        delete_elasticsearch_index
        delete_all_nodes
    end

end
