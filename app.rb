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
  @survey = Survey.find(id)
  @survey_id = @survey.id
  # binding.pry
  erb(:survey)
end

post('/surveys/:id') do
  @questions = Question.all()
  id = params[:id].to_i
  @survey = Survey.find(id)
  @survey_id = @survey.id
  description = params.fetch("description")
  Question.create({:description => description, :survey_id => @survey_id})
  # binding.pry
  erb(:survey)
end

post('/survey/:id/delete') do
  @survey = Survey.find(params[:id])
  @survey.delete
  redirect("/")
end

post('/surveys/:id/remove') do
  @questions = Question.all()
  id = params[:id].to_i
  @survey = Survey.find(id)
  @survey_id = @survey.id
  # description = params.fetch("description")
  @id_of_question = params.fetch("the_question_id").to_i
  @question = Question.find(@id_of_question)
  @question.delete
  # binding.pry
  # Question.create({:description => description, :survey_id => @survey_id})
  erb(:survey)
  # redirect("/surveys/:id")
end
