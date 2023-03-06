class UserController < ApplicationController 

    before do 
      begin
        @user = user_data 
      rescue 
        @user = nil
      end
    end
    
    # List all Users
    get '/users' do 
      users = User.all
      users.to_json(only: [:id, :full_name, :email, :password_hash])
    end
  
    # Create a user during signup
    post '/register' do 
      begin
        user = User.create(
          full_name: params[:full_name],
          email: params[:email],
          password: params[:password]
        )
        [201, { message: "Success" }.to_json]
      rescue => exception
        [422, {
          error: "Failed: There was an error creating a new user"
        }.to_json]            
      end
    end
  
    # Login user with params 
    post '/login' do 
      begin
        user_data = User.find_by(email: @user["email"])
        if user_data && BCrypt::Password.new(user_data.password_hash) == @user["password"]
          {
            id: user_data.id,
            email: user_data.email
          }.to_json
        else 
          [422, { message: "Your email or password is incorrect" }.to_json]
        end            
      rescue => exception
        [422, exception.to_json]            
      end
    end
  
    private 
  
    # parse user JSON data
    def user_data 
      JSON.parse(request.body.read)
    end
    
  end
  