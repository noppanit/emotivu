require File.expand_path('../../spec_helper', __FILE__)

describe 'Server' do

    let(:app) { Sinatra::Application }

    it 'should have hello world' do
        get '/'
        expect(last_response).to be_ok
    end
end
