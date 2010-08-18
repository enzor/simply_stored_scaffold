require File.dirname(__FILE__) + '/../spec_helper'
 
describe <%= name.camelize.pluralize %>Controller do
  fixtures :all
  integrate_views
  
  it "create action should render new template when model is invalid" do
    <%= name.camelize %>.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    <%= name.camelize %>.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(<%= item_path_for_spec('url') %>)
  end
  
  it "destroy action should destroy model and redirect to index action" do
    <%= name.underscore %> = <%= name.camelize %>.first
    delete :destroy, :id => <%= name.underscore %>
    response.should redirect_to(<%= items_path('url') %>)
    <%= name.camelize %>.exists?(<%= name.underscore %>.id).should be_false
  end
  
  it "edit action should render edit template" do
    get :edit, :id => <%= name.camelize %>.first
    response.should render_template(:edit)
  end
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "show action should render show template" do
    get :show, :id => <%= name.camelize %>.first
    response.should render_template(:show)
  end
  
  it "update action should render edit template when model is invalid" do
    <%= name.camelize %>.any_instance.stubs(:valid?).returns(false)
    put :update, :id => <%= name.camelize %>.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    <%= name.camelize %>.any_instance.stubs(:valid?).returns(true)
    put :update, :id => <%= name.camelize %>.first
    response.should redirect_to(<%= item_path_for_spec('url') %>)
  end
  
end
