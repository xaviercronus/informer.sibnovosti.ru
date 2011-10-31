class Publication
  include Mongoid::Document

  field :title, :type => String
  field :link, :type => String
  field :description, :type => String
  
  attr_accessible :title,
                  :link,
                  :description
  
  belongs_to :stream
end
