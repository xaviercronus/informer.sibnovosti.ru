require 'feedzirra'
require 'resque'

class Stream
  include Mongoid::Document

  field :title, :type => String
  field :url, :type => String

  validates_presence_of :title
  validates_presence_of :url
  validates_uniqueness_of :title, :case_sensitive => false

  attr_accessible :title,
                  :url
                  
  has_many :publications, :dependent => :destroy
  
  after_save :update_resque_schedule
  
  def update_resque_schedule
    # Resque.remove_schedule "some_job"
    Resque.set_schedule("StreamUpdater_#{self.id.to_s}", {
      :cron  => "*/1 * * * *",
      :class => "StreamUpdater",
      :queue => :snippets_queue,
      :args  => self.id
    })    
  end
  
  def update_stream
    self.publications.delete_all
    feed = Feedzirra::Feed.fetch_and_parse(self.url)
    feed.entries.each do |item|
      self.publications << Publication.create(:title => item.title, :link => item.url, :description => item.content)
    end
  end
end
