# LamdbaController to communicate with lamdba function
class LamdbaController < ApplicationController
  skip_before_action :verify_authenticity_token
  require 'openssl'
  def create
    puts params
    id = Lamdba.new.details(params['lamdba'])
    redirect_to lamdba_path(id)
  end

  def new
    puts "a"
    @lamdba = Lamdba.new
  end

  def show
    @lamdba = Lamdba.find(params[:id])
  end

  def index
    @lambda = Lamdba.all
  end

  def welcome
    Rails.logger.info params
    Rails.logger.info params.class
    # @api = ApiIntegration.get_api_integration_instance(request)
    # status = @api.authenticate(request)
    # res = RestClient::Request.execute(method: :post,
    #                                   url: "https://4edi1hqmul.execute-api.us-east-2.amazonaws.com/sync_status_new/orderid/136508448508-5729",
    #                                   user: 'SAPAAD_PTE_LTD_Test--0075e1ef-4fa4-46b5-8ee3-bb1cc243bb3f',
    #                                   password: '42c11fb4-d895-4529-9c3f-7de6332ef9a9',
    #                                   payload: {
    #                                     "occurred_at": Time.now,
    #                                     "status": 'failed',
    #                                     "reason": 'invalid_total_price',
    #                                     "notes": ''
    #                                   })
    # Rails.logger.info status
    render json: { msg: 'hi' }
  end
  def sync_status
    Rails.logger.info request.raw_post
    render json: { order_id: params[:order_id] }
  end
  def prep_stage
    res = RestClient::Request.execute(method: :post,
                                      url: "https://4edi1hqmul.execute-api.us-east-2.amazonaws.com/sync_status2/prep-stage/771504902908-5729",
                                      user: 'SAPAAD_PTE_LTD_Test--0075e1ef-4fa4-46b5-8ee3-bb1cc243bb3f',
                                      password: '42c11fb4-d895-4529-9c3f-7de6332ef9a9',
                                      payload: {
                                        "occurred_at": Time.now.strftime('%FT%TZ'),
                                        "stage": 'ready_for_collection'
                                      })

    puts res.code.inspect
    render json: res.body.to_json
  rescue
    render json: {}.to_json
  end
end
