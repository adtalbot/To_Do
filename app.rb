require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/task')

  get('/') do                                  #index route
  @tasks = Task.all()                          #instance variable to hold all tasks returned from the Task.all method
  erb(:index)
end

post('/tasks') do                              #tasks post route
  description = params.fetch('description')    #fetches description from form
  task = Task.new(description)                 #creates a new task and passes in the description as the argument
  task.save()                                  #calls the save method the save the new instance of task into the @@all_tasks array
  erb(:success)                                #renders the success page to show when task has been completed
end