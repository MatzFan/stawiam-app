class App
  helpers do
    def protected!
      return if App.development? || authorized?
      headers["WWW-Authenticate"] = "Basic realm=\"Restricted Area\""
      halt 401, "Not authorized\n"
    end

    def authorized?
      @auth ||= Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? && @auth.basic? && @auth.credentials &&
        @auth.credentials == [AppConfig.authentication.username, AppConfig.authentication.password]
    end
  end
end
