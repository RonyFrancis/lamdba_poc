module ApiIntegration
  class << self
    def request_info(request)
      Rails.logger.info '&' * 10
      request.headers.each { |key, value| Rails.logger.info %(#{key} : #{value}) }
      return true
    end
  end
end
