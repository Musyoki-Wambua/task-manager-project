class TaskController < AppController 
    
    get '/tasks' do 
        task = Task.all 
        task.to_json(only: [:id, :title, :description, :due, :createdAt, :status])
    end

    post '/tasks/create' do 
        # data = JSON.parse(request.body.read)

        begin
            # today = Time.now
            # data["createdAt"] = today
            task = Task.create(
                title: params[:title],
                description: params[:description],
                due: params[:due],
                createdAt: Time.now,
                status: params[:status]
            )
            [201, task.to_json]
        rescue => exception
            [422, {
                error: "Error occurred creating a new Task!"
            }.to_json]            
        end        
    end

    patch '/tasks/:id' do 
       begin
        task = Task.find(params[:id])
        task.update(
            description: params[:description],
            due: params[:due]
        )
        [201, {message: "Task updated successfully" }.to_json]        
       rescue => exception
        [422, {
            error: "Error occured updating a task"
        }.to_json]        
       end
    end
end