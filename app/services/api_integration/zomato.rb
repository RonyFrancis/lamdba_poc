module ApiIntegration
  class Zomato
    def authenticate(request)
      request.headers['PATH_INFO']
    end
  end
end
