module ApiIntegration
  class Zomato
    def self.authenticate(request)
      request.headers['PATH_INFO']
    end
  end
end
