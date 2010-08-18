Feature: Simply stored scaffold
  In order to scaffold a resource
  As a normal developer
  I want to generate model,controller and views to make rails work in rails 2.3.8

Scenario: generate a scaffold for couchdb
  Given a new Rails app
  When I run "script/generate simply_stored_scaffold book title:string description:text published:boolean"
  Then I should see the following files
	| app/models/book.rb |
	| app/controllers/books_controller.rb |
	| app/views/books/index.html.erb |
	| app/views/books/edit.html.erb |
	| app/views/books/_form.html.erb |
	| app/views/books/new.html.erb |
	| app/views/books/show.html.erb |
  And I should see "map.resources :books" in file "config/routes.rb"
  And I should see "property :title , :type => String" in file "app/models/book.rb"
  And I should see "property :description" in file "app/models/book.rb"
  And I should see "property :published , :type => :boolean" in file "app/models/book.rb"
  Then I should successfully run "rake test"




  
