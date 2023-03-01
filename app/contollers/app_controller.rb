class AppController < Sinatra::Base 
    set :default_content_type, 'application/json'


    get '/hello' do 
        "Our very first contoller"
    end
    
end