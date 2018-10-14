module ApiIntegration
  class << self

    def get_api_integration_instance(request)
      case request.headers['PATH_INFO']
      when '/welcome'
        ApiIntegration::Deliveroo.new
      when '/zomato'
        ApiIntegration::Zomato.new
      end
    end
  end
end
