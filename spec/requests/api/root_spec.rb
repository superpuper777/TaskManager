# require 'spec_helper'
#
# describe TaskManager::Base do
#   include Rack::Test::Methods
#
#   def app
#     OUTER_APP
#   end
#
#   context 'GET /api/:version/projects' do
#     it 'returns list of projects' do
#       get '/api/v1/projects'
#       expect(last_response.status).to eq(200)
#       expect(JSON.parse(last_response.body)).to eq []
#     end
#   end
#
# end
