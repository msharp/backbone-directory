require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'

require File.dirname(__FILE__) + '/models/directory'
require File.dirname(__FILE__) + '/models/employee'

set :static_cache_control, [:public, {:max_age => 1}]

before do 
  Directory.init
end

get '/' do
  content_type :html
  File.read(File.join('public', 'index.html'))
end

# api
get '/employees' do
  get_employees
end

get '/employees/:id' do
  get_employee params[:id]
end

get '/employees/:id/reports' do
  get_reports params[:id]
end

get '/employees/search/:query' do
  find_by_name params[:query]
end

def respond(r = {})
  content_type :json
  r.to_json
end

def get_employees
  respond Employee.all(:fields => [:first_name, :last_name, :title])
end

def get_employee(id)
  respond Employee.first(:id => id).to_hash
end

def get_reports(id)
  respond Employee.all(:manager_id => id)
end

def find_by_name(name)
  query = "%#{name}%"
  respond Employee.all(:first_name.like => query) + Employee.all(:last_name.like => query)  
end

