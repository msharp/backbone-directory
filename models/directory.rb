require 'rubygems'
require 'bundler/setup'
require 'data_mapper'
require File.dirname(__FILE__) + '/employee'

module Directory

  USER = 'root'
  PASS = 'root'
  HOST = 'localhost'
  DB   = 'bootstrap_directory'

  def self.init
    conn = "mysql://#{USER}:#{PASS}@#{HOST}/#{DB}?encoding=UTF-8" # mysql://user:pass@localhost/db_name?...
    DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, conn)
    DataMapper.finalize
  end

  def self.bootstrap!(emps)
    Directory.init
    DataMapper.auto_migrate!
    emps.each do |e|
      Employee.create({
        :id => e[0], 
        :first_name => e[1],
        :last_name => e[2],
        :manager_id => e[3],
        :title => e[4],
        :department => e[5],
        :office_phone => e[6],
        :cell_phone => e[7],
        :email => e[8],
        :city => e[9],
        :picture => e[10],
        :twitter_id => e[11],
        :blog_url => e[12]
      })
    end
  end

end

