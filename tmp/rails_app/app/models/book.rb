class Book
  include SimplyStored::Couch
  
    property :title , :type => String 
    property :description  
    property :published , :type => :boolean 
end
