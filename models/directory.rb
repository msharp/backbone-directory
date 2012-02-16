require 'rubygems'
require 'bundler/setup'
require 'data_mapper'
require File.dirname(__FILE__) + '/employee'

module Directory

  EMPLOYEES = [[12,'Steven','Wells',4,'Software Architect','Engineering','617-000-0012','781-000-0012','swells@fakemail.com','Boston, MA','steven_wells.jpg','@fakeswells','http://coenraets.org'],[11,'Amy','Jones',5,'Sales Representative','Sales','617-000-0011','781-000-0011','ajones@fakemail.com','Boston, MA','amy_jones.jpg','@fakeajones','http://coenraets.org'],[10,'Kathleen','Byrne',5,'Sales Representative','Sales','617-000-0010','781-000-0010','kbyrne@fakemail.com','Boston, MA','kathleen_byrne.jpg','@fakekbyrne','http://coenraets.org'],[9,'Gary','Donovan',2,'Marketing','Marketing','617-000-0009','781-000-0009','gdonovan@fakemail.com','Boston, MA','gary_donovan.jpg','@fakegdonovan','http://coenraets.org'],[8,'Lisa','Wong',2,'Marketing Manager','Marketing','617-000-0008','781-000-0008','lwong@fakemail.com','Boston, MA','lisa_wong.jpg','@fakelwong','http://coenraets.org'],[7,'Paula','Gates',4,'Software Architect','Engineering','617-000-0007','781-000-0007','pgates@fakemail.com','Boston, MA','paula_gates.jpg','@fakepgates','http://coenraets.org'],[5,'Ray','Moore',1,'VP of Sales','Sales','617-000-0005','781-000-0005','rmoore@fakemail.com','Boston, MA','ray_moore.jpg','@fakermoore','http://coenraets.org'],[6,'Paul','Jones',4,'QA Manager','Engineering','617-000-0006','781-000-0006','pjones@fakemail.com','Boston, MA','paul_jones.jpg','@fakepjones','http://coenraets.org'],[3,'Eugene','Lee',1,'CFO','Accounting','617-000-0003','781-000-0003','elee@fakemail.com','Boston, MA','eugene_lee.jpg','@fakeelee','http://coenraets.org'],[4,'John','Williams',1,'VP of Engineering','Engineering','617-000-0004','781-000-0004','jwilliams@fakemail.com','Boston, MA','john_williams.jpg','@fakejwilliams','http://coenraets.org'],[2,'Julie','Taylor',1,'VP of Marketing','Marketing','617-000-0002','781-000-0002','jtaylor@fakemail.com','Boston, MA','julie_taylor.jpg','@fakejtaylor','http://coenraets.org'],[1,'James','King',0,'President and CEO','Corporate','617-000-0001','781-000-0001','jking@fakemail.com','Boston, MA','james_king.jpg','@fakejking','http://coenraets.org']]

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

  def self.bootstrap!
    Directory.init
    DataMapper.auto_migrate!
    EMPLOYEES.each do |e|
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

