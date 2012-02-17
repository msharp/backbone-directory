# Backbone.js Employee Directory #

"Backbone Directory" is a sample application built using [Backbone.js](http://documentcloud.github.com/backbone/) and
 [Twitter Bootstrap](http://twitter.github.com/bootstrap/). The application is an Employee Directory that allows you to
 look for employees by name, view the details of an employee, and navigate up and down the Org Chart by clicking the
 employee’s manager or any of his/her direct reports.

 This is a forked version of ccoenraets/backbone-directory with a Sinatra data service 

## Set Up: ##

1. Run bundle install to get the gemset.
2. Create a MySQL database name "backbone_directory".
3. Execute ./bootstrap.rb to create and populate the "employee" model

## Service: ##

The front-end backbone application uses a Ruby/Sinatra data service.
To run the app:

    ruby ./directory.rb

Then point your internet device at:

    http://localhost:4567


