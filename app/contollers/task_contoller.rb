class TaskController < AppController 
    
    get '/tasks' do 
        begin
            tasks = user.tasks.to_json            
        rescue => exception
            [422, {
                error: "Unauthorized"
            }.to_json]
            
        end
        task = Task.all 
        task.to_json(only: [:id, :title, :description, :user_id, :due, :createdAt, :status])
    end

    get '/tasks/day' do 
        today = Time.now 
        tasks = Task.where(due: today)
        tasks.to_json(only: [:id, :title, :description, :due])
    end

    get '/tasks/:id' do 
        begin
            task = Task.find(params[:id])
            task.to_json(only: [:id, :title, :description, :due, :status])
        rescue => exception
            [422, {
                error: "No record in the Database"
            }.to_json]
            
        end

    end

    post '/tasks' do 
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
            title: params[:title],
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

    delete '/tasks/:id' do
        begin
            task = Task.find(params[:id])
            task.destroy 
            [201, {message: "Task deleted successfully"}.to_json]
        rescue => exception
            [422, {
                error: "Error occured while deleting the task"
            }.to_json]        
        end
    end

end