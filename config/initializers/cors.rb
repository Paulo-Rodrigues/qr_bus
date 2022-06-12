Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '/bus_lines/', headers: :any, methods: [:get]
  end
end
