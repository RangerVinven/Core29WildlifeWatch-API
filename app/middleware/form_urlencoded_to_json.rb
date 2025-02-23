class FormUrlEncodedToJson
  def initialize(app)
    @app = app
  end

  def call(env)
    if env["CONTENT_TYPE"] == "application/x-www-form-urlencoded"
      req = Rack::Request.new(env)
      env["CONTENT_TYPE"] = "application/json"
      env["rack.input"] = StringIO.new(req.params.to_json)
    end

    @app.call(env)
  end
end
