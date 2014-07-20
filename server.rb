require 'lib/emotivu'

post '/suggestion' do
    content_type :json

    text = params['text']

    movies = MovieFinder.new.find_by_similarity(text)
    movies.to_json
end
