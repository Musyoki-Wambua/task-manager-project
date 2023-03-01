class UserContoller < AppController 

    get '/auth/users' do 
        users = User.all
        users.to_json(only: [:id, :full_name, :email, :password_hash])
    end

    post '/auth/create' do 
        begin
            user = User.create(
                full_name: params[:full_name],
                email: params[:email],
                password_hash: params[:password_hash]
            )
            [201, {message: "Success"}.to_json]
        rescue => exception
            [422, {
                error: "Failed: There was an error creating a new user"
            }.to_json]            
        end
    end
    
end