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

  def to_hash 
    self.attributes
  end

end
