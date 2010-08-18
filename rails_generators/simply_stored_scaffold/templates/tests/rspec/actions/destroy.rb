it "destroy action should destroy model and redirect to index action" do
  <%= name.underscore %> = <%= name.camelize %>.first
  delete :destroy, :id => <%= name.underscore %>
  response.should redirect_to(<%= items_path('url') %>)
  <%= name.camelize %>.exists?(<%= name.underscore %>.id).should be_false
end
