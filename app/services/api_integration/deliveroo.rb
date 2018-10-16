module ApiIntegration
  class Deliveroo
    def authenticate(request)
      webhook_secret = '8a10a0d9-3366-4486-a945-36c804572373'
      sequence_guid = request.headers['HTTP_X_DELIVEROO_SEQUENCE_GUID']
      payload = request.headers['action_dispatch.request.request_parameters']
      digest = OpenSSL::Digest.new('sha256')
      Rails.logger.info webhook_secret
      Rails.logger.info sequence_guid
      Rails.logger.info payload
      data = "#{sequence_guid} \n #{payload}"
      Rails.logger.info data
      Rails.logger.info request.headers['HTTP_X_DELIVEROO_HMAC_SHA256']
      request.headers['HTTP_X_DELIVEROO_HMAC_SHA256'] == OpenSSL::HMAC.hexdigest(
        digest,
        webhook_secret,
        data
      )
    end
  end
end
