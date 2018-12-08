require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('pg')

DB = PG.connect({:dbname => 'volunteer_tracker'})

get ('/') do
  @projects = Project.all
  erb(:index)
end

patch ('/') do
  title = params.fetch("title")
  new_project = Project.new({:title => title})
  new_project.save
  @projects = Project.all
  erb(:index)
end

get ('/projects/:id') do
  id = params[:id].to_i
  @project = Project.find(id)
  @volunteers = @project.volunteers
  erb(:project)
end

patch ('/projects/:id') do
  id = params[:id].to_i
  name = params.fetch("name")
  volunteer = Volunteer.new({:name => name, :project_id => id})
  volunteer.save

  @project = Project.find(id)
  @volunteers = @project.volunteers
  erb(:project)
end

get ('/projects/:id/edit') do
  @project = Project.find(params[:id])
  @message = ''
  erb(:project_edit)
end

patch ('/projects/:id/edit') do
  @project = Project.find(params[:id])
  new_title = params.fetch(:title)
  @project.update({:title => new_title})
  @project.save
  @message = 'changes saved'
  erb(:project_edit)
end

delete ('/projects/:id/edit') do
  @project = Project.find(params[:id])
  @project.delete
  @message = 'project deleted'
  # visit('/')
  erb(:project_edit)
end

get ('/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id])
  @project = Project.find(@volunteer.project_id)
  erb(:volunteers)
end

patch ('/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id])
  new_name = params.fetch("name")

  @volunteer.update({:name => new_name})

  @project = Project.find(@volunteer.project_id)

  erb(:volunteers)
end
