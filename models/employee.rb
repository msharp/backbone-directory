require 'rubygems'
require 'bundler/setup'
require 'data_mapper'

class Employee
  include DataMapper::Resource
  
  property :id, Serial    

  property :first_name, String
  property :last_name, String
  property :manager_id, Integer
  property :title , String
  property :department, String
  property :office_phone, String
  property :cell_phone, String
  property :email, String
  property :city, String
  property :picture, String
  property :twitter_id, String
  property :blog_url, String

  # a couple of hacks here to serve the manager 
  # info that is needed by the backbone templates
  def to_hash(include_manager=true)
    r = self.attributes
    r[:manager] = manager.to_hash(false) if include_manager
    r
  end

  def manager
    manager_id > 0 ? Employee.first(:id => manager_id) : Employee.new(:id => 0, :manager_id => 0)
  end

end

