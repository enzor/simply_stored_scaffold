it "show action should render show template" do
  get :show, :id => <%= name.camelize %>.first
  response.should render_template(:show)
end
