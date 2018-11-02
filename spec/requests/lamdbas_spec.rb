require 'rails_helper'

RSpec.describe "Lamdbas", type: :request do
  describe "post /prep_stage" do
    before(:each) do
      stub_request(:post, "https://4edi1hqmul.execute-api.us-east-2.amazonaws.com/sync_status2/prep-stage/771504902908-5729").
         with(
           body: {"occurred_at"=>Time.now.strftime('%FT%TZ'), "stage"=>"ready_for_collection"},
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip, deflate',
       	  'Authorization'=>'Basic U0FQQUFEX1BURV9MVERfVGVzdC0tMDA3NWUxZWYtNGZhNC00NmI1LThlZTMtYmIxY2MyNDNiYjNmOjQyYzExZmI0LWQ4OTUtNDUyOS05YzNmLTdkZTYzMzJlZjlhOQ==',
       	  'Content-Length'=>'63',
       	  'Content-Type'=>'application/x-www-form-urlencoded',
       	  'Host'=>'4edi1hqmul.execute-api.us-east-2.amazonaws.com',
       	  'User-Agent'=>'rest-client/2.0.2 (darwin17.7.0 x86_64) ruby/2.5.1p57'
           }).to_timeout
           # .to_return(status: 201, body: {}.to_json, headers: {'Content-Type'=>'application/json'})
           # .then.
           # to_return(status: 201, body: {}.to_json, headers: {'Content-Type'=>'application/json'}).then.
           # to_raise(StandardError)
      post v1_orders_111_prep_stage_path
    end
    it "works! (now write some real specs)" do
      expect(response).to have_http_status(200)
    end
    it 'should be json' do
      expect(response.headers['Content-Type']).to include('application/json')
    end
    it 'should return empty object' do
      expect(JSON.parse(response.body)).to eq('{}')
    end
    # it 'raise on 3 api call' do
    #   post v1_orders_111_prep_stage_path
    #   post v1_orders_111_prep_stage_path
    #   expect { response }.not_to raise_error
    # end
    it 'timeout' do

    end
  end
end
