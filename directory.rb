require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'

require File.dirname(__FILE__) + '/models/directory'
require File.dirname(__FILE__) + '/models/employee'

before do 
  Directory.init
end

get '/' do
  content_type :html
  File.read(File.join('public', 'index.html'))
end

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

get '/favicon.ico' do
  ''
end

# assets, etc...
#get '/*' do
#  puts params[:splat]
#  File.read("public/#{params[:splat][0]}")
#end

def camelized(emp)
  if emp.is_a?(Array)
    new = []
    emp.each {|e| new << camelize_keys(e)}
  else
    new = camelize_keys(emp)
  end
  new
end

def camelize_keys(emp)
  r = {}
  emp.to_hash.each do |k,v|
    r[camelize(k)] = v
  end
  r
end
def camelize(s)
  k = s.to_s.split(//)
  k.each_with_index do |char,i|
    k[i+1].upcase! if char == "_" 
  end
  k.reject{|char|char=="_"}.join
end

def respond(r = {})
  content_type :json
  camelized(r).to_json
  #r.to_json
end

def get_employees
  respond Employee.all()
end

def get_employee(id)
  respond Employee.first(:id => id)
end

def get_reports(id)
  respond({"error" => "not implemented"})
end

def find_by_name(name)
  query = "%#{name}%"
  respond Employee.all(:first_name.like => query) + Employee.all(:last_name.like => query)
end
