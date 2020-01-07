require File.expand_path('../../spec_helper', __FILE__)

describe Movie do
    before(:each) do
        create_elasticsearch_index
        delete_all_nodes
    end

    context 'when creating a new movie' do
        subject { MovieFinder.new.find_by_id(@movie_id).properties }
        before(:each) do
            movie_node = Movie.new({
                name: 'Terminator 2',
                description: 'Arnold',
                itune_desc: 'itune description',
                other_desc: 'other description',
                initial_release_date: '2014-10-10',
                youtube_ids: ['youtube_id']
                })
            @movie_id = movie_node.create

        end

        # ,tags,poster,track_view_url,genres

        its(['movie_id']) { should eq @movie_id }
        its(['name']) { should eq 'Terminator 2' }
        its(['description']) { should eq 'Arnold' }
        its(['itune_desc']) { should eq 'itune description' }
        its(['other_desc']) { should eq 'other description'}
        its(['initial_release_date']) { should eq '2014-10-10'}
        its(['youtube_ids']) { should eq ['youtube_id']}
    end

    after(:each) do
        delete_elasticsearch_index
		delete_all_nodes
	end
end
