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
    # Rails.logger.info 'a' * 10
    # Rails.logger.info request.original_url
    # Rails.logger.info request.remote_ip
    # Rails.logger.info request.raw_post
    # Rails.logger.info request.headers['HTTP_X_DELIVEROO_SEQUENCE_GUID']
    # Rails.logger.info request.headers['HTTP_X_DELIVEROO_HMAC_SHA256']
    # Rails.logger.info request.raw_post
    # Rails.logger.info 'a' * 10
    # Rails.logger.info params
    # Rails.logger.info 'v' * 10
    # request.headers.each { |key, value| Rails.logger.info %Q(#{key} : #{value}) }
    # Rails.logger.info 'b' * 10
    @api = ApiIntegration.get_api_integration_instance(request)
    status = @api.authenticate(request)
    # res = RestClient::Request.execute(method: :post,
    #                                   url: "https://developers.deliveroo.net/v1/orders/116504947708-5729/sync_status",
    #                                   user: 'SAPAAD_PTE_LTD_Test--0075e1ef-4fa4-46b5-8ee3-bb1cc243bb3f',
    #                                   password: '42c11fb4-d895-4529-9c3f-7de6332ef9a9',
    #                                   payload: {
    #                                     "occurred_at": Time.now,
    #                                     "status": 'failed',
    #                                     "reason": 'invalid_total_price',
    #                                     "notes": ''
    #                                   })
    Rails.logger.info status
    render json: { msg: status }
  end
  def sync_status
    Rails.logger.info params
    render json: { order_id: params[:order_id] }
  end
  def prep_stage
    render json: { order_id: params[:order_id]}
  end
end
