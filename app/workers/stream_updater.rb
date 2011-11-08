class StreamUpdater
  @queue = :snippets_queue
  def self.perform(stream_id)
    stream = Stream.find(stream_id.to_s)
    stream.update_stream if stream    
  end
end