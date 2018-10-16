module ApiIntegration
  class Deliveroo
    def authenticate(request)
      webhook_secret = '8a10a0d9-3366-4486-a945-36c804572373'
      sequence_guid = request.headers['HTTP_X_DELIVEROO_SEQUENCE_GUID']
      payload = request.headers['action_dispatch.request.request_parameters']
      payload2 = request.raw_post
      digest = OpenSSL::Digest.new('sha256')
      Rails.logger.info webhook_secret
      Rails.logger.info sequence_guid
      Rails.logger.info payload
      Rails.logger.info payload2
      data = "#{sequence_guid} \n #{payload}"
      data2 = "#{sequence_guid} \n #{payload2}"
      Rails.logger.info data
      Rails.logger.info data2
      Rails.logger.info request.headers['HTTP_X_DELIVEROO_HMAC_SHA256']
      a= request.headers['HTTP_X_DELIVEROO_HMAC_SHA256'] == OpenSSL::HMAC.hexdigest(
        digest,
        webhook_secret,
        data
      )
      Rails.logger.info a
      request.headers['HTTP_X_DELIVEROO_HMAC_SHA256'] == OpenSSL::HMAC.hexdigest(
        digest,
        webhook_secret,
        data2
      )
    end
  end
end
