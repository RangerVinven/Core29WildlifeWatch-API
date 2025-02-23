# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # You can specify your frontend domain here (e.g. 'http://localhost:3000')

    resource '/api/*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options],
      credentials: false  # Allow cookies to be sent with cross-origin requests
  end
end
