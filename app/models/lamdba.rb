class Lamdba < ApplicationRecord
  require 'rest-client'
  def details(params)
    # RestClient.post ENV['url'], key: 1
    @lamdba = Lamdba.new
    @lamdba.key = params['key'].to_i
    @lamdba.save
    @response = RestClient::Request.execute(method: :post, url: ENV['url'],
                                            payload: {
                                              key: params['key'].to_i,
                                              id: @lamdba.id
                                            }.to_json,
                                            timeout: 10)

    response = JSON.parse(@response.body)
    # @lamdba = Lamdba.new
    # @lamdba.key = response['key'].to_i
    # @lamdba.square_value = response['square_value'].to_i
    # @lamdba.save
    response['key'].to_i
  end
end
