# LamdbaController to communicate with lamdba function
class LamdbaController < ApplicationController
  skip_before_action :verify_authenticity_token
  require 'openssl'
  def create
    id = Lamdba.new.details(params['lamdba'])
    redirect_to lamdba_path(id)
  end

  def new
    @lamdba = Lamdba.new
  end

  def show
    @lamdba = Lamdba.find(params[:id])
  end

  def index
    @lambda = Lamdba.all
  end

  def welcome
    # request.headers.each { |key, value| Rails.logger.info %(#{key} : #{value}) }
    Rails.logger.info 'a' * 10
    Rails.logger.info params['order']['id']
    Rails.logger.info request.original_url
    Rails.logger.info request.remote_ip
    Rails.logger.info request.REMOTE_ADDR
    Rails.logger.info 'a' * 10
    # webhook_secret = '8a10a0d9-3366-4486-a945-36c804572373'
    # sequence_guid = request.headers["HTTP_X_DELIVEROO_SEQUENCE_GUID"]
    #  payload = parms
    # digest = OpenSSL::Digest.new('sha256')
    # data = "#{sequence_guid} \n #{payload}"
    # auth = OpenSSL::HMAC.hexdigest(digest, webhook_secret, data)

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
    render json: { msg: "welcome" }
  end
end
