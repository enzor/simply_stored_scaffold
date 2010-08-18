it "edit action should render edit template" do
  get :edit, :id => <%= name.camelize %>.first
  response.should render_template(:edit)
end
