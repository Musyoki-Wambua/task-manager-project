class UserContoller < AppController 

    # before do 
    #     begin
    #         @user = user_data 
    #     rescue 
    #         @user = nill
    #     end
    # end
    
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
            [201, {message: "Success"}.to_json]
        rescue => exception
            [422, {
                error: "Failed: There was an error creating a new user"
            }.to_json]            
        end
    end

    get '/user/login' do 
        
    end

    # Login user the params 
    post '/login' do 
        begin
            user_data = User.find_by(email: @user["email"])
            if user_data.password == @user["password"]
                json_response(code: 200, data: {
                    id: user_data.id,
                    email: user_data.email
                })
                else 
                    json_response(code: 422, data: {message: "Your email or password is incorrect" })
            end            
        rescue => exception
            error_response( 422. exception)            
        end
    end

    private 

    # parse user JSON data
    def user_data 
        JSON.parse(request.body.read)
    end
    
end