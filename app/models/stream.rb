class Stream
  include Mongoid::Document

  field :title, :type => String
  field :url, :type => String

  validates_presence_of :title
  validates_presence_of :url
  validates_uniqueness_of :title, :case_sensitive => false

  attr_accessible :title,
                  :url

end
