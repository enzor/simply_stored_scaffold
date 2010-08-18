require File.dirname(__FILE__) + '/../spec_helper'
 
describe <%= name.camelize.pluralize %>Controller do
  fixtures :all
  integrate_views
  
  <%= controller_methods 'tests/rspec/actions' %>
end
