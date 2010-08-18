class SimplyStoredScaffoldGenerator < Rails::Generator::Base
  attr_accessor :name, :attributes
  
  def initialize(runtime_args, runtime_options = {})
    super
    usage if @args.empty?
    
    @name = @args.first
    @attributes = []
    
    @args[1..-1].each do |arg|
      if arg.include?(":")
        @attributes << [ arg.split(":")[0] , arg.split(":")[1] ]
      end
    end
    
  end
   
  def manifest
    record do |m|
      m.template('controller.rb', "app/controllers/#{name.underscore.downcase.pluralize}_controller.rb")
      m.template('helper.rb',"app/helpers/#{name.underscore.downcase}_helper.rb" )
      m.template('model.rb',"app/models/#{name.underscore.downcase}.rb")
      m.directory("app/views/#{name.underscore.downcase.pluralize}")
      m.template('views/index.html.erb',"app/views/#{name.downcase.underscore.pluralize}/index.html.erb")
      m.template('views/new.html.erb',"app/views/#{name.downcase.underscore.pluralize}/new.html.erb")
      m.template('views/edit.html.erb',"app/views/#{name.downcase.underscore.pluralize}/edit.html.erb")
      m.template('views/_form.html.erb',"app/views/#{name.downcase.underscore.pluralize}/_form.html.erb")
      m.template("views/show.html.erb", "app/views/#{name.downcase.underscore.pluralize}/show.html.erb")
      m.directory("spec/models")
      m.template("tests/rspec/model.rb","spec/models/#{name.underscore.downcase}_spec.rb")
      m.directory("spec/fixtures")
      m.template("fixtures.yml","spec/fixtures/#{name.underscore.downcase.pluralize}.yml")
      m.directory("spec/controllers")
      m.template("tests/rspec/controller.rb","spec/models/#{name.underscore.downcase.pluralize}_controller_spec.rb")
      m.route_resources name.downcase.pluralize
    end
  end
  
  def render_partial
      "<%= render :partial => 'form' %>"
  end
  
  #
  # => find the type to insert in the model for the fields. Need a little bit more of love, seeing that right now the only types
  # => parsed correctly are boolean, time and datetime, but i could be wrong.
  #
  
  def typize(type)
    case type
      when "boolean"              then ", :type => :#{type.downcase}"
      when "time","datetime","string"     then ", :type => #{type.camelize}"
    else
      nil
    end
  end
  
  
  ##
  ## find_field - actually a copy from the rails generator class.
  ## i needed it here since the Rails::Generator depends from activerecord. 
  ##
  
 def find_field(type)
     case type
       when "integer", "float", "decimal" then :text_field
       when "time"                        then :time_select
       when "datetime","timestamp"        then :datetime_select
       when "date"                        then :date_select
       when "string"                      then :text_field
       when "text"                        then :text_area
       when "boolean"                     then :check_box
     else
         :text_field
     end      
  end
  
  def controller_methods(dir_name)
    controller_actions.map do |action|
      read_template("#{dir_name}/#{action}.rb")
    end.join("  \n").strip
  end
  
  
  
end