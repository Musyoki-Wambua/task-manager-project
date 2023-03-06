require 'rack/cors'

use Rack::Cors do
  allow do
    origins 'http://localhost:3000' # Update this with the URL of your React app
    resource '*', headers: :any, methods: [:get, :post, :patch, :delete, :options]
  end
end

require_relative './config/environment'
use Rack::JSONBodyParser

use TaskController
run UserController
