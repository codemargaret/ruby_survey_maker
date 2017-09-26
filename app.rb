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
