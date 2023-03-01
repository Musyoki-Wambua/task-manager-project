require_relative './config/environment'
use Rack::JSONBodyParser

# run ApplicationController

run TaskController
# run UserContoller