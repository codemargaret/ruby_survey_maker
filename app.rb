require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
require('./lib/question')
require('./lib/survey')
also_reload('lib/**/*.rb')
require("pg")
require('pry')

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

post("/") do
  title = params["title"]
  Survey.create({:title => title})
  redirect "/"
end

get('/surveys/:id') do
  @questions = Question.all()
  id = params[:id].to_i
  # binding.pry
  @survey = Survey.find(id)
  # binding.pry
  erb(:survey)
end

post('/surveys/:id') do
  @id = params[:id].to_i
  @questions = Question.all()
  # binding.pry
  @survey = Survey.find(@id)
  survey_id = @survey.id
  description = params.fetch("description")
  Question.create({:description => description, :survey_id => survey_id})
  # binding.pry
  # @questions = Question.all()
  erb(:survey)
end
