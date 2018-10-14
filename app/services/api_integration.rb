module ApiIntegration
  include ApiIntegration::Deliveroo
  include ApiIntegration::Zomato
  class << self
    def request_info(request)
      Rails.logger.info '&' * 10
      request.headers.each { |key, value| Rails.logger.info %(#{key} : #{value}) }
      return true
    end

    def get_api_integration_instance(request)
      case request.headers['PATH_INFO']
      when '/welcome'
        ApiIntegration::Deliveroo.new
      when '/zomato'
        ApiIntegration::Deliveroo.new
      end
    end
  end
end
