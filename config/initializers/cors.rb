Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
      # change to more rescritive origin in production
      origins '*'
      resource '*', headers: :any, methods: [:get, :post]
  end
end