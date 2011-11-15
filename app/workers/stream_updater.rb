class StreamUpdater
  @queue = :snippets_queue
  def self.perform(stream_id)
    stream = Stream.find(stream_id.to_s)
    stream.update_stream if stream    
  end
end

#  *    *    *    *    *  command to be executed
#  ┬    ┬    ┬    ┬    ┬
#  │    │    │    │    │
#  │    │    │    │    │
#  │    │    │    │    └───── day of week (0 - 7) (Sunday=0 or 7)
#  │    │    │    └────────── month (1 - 12)
#  │    │    └─────────────── day of month (1 - 31)
#  │    └──────────────────── hour (0 - 23)
#  └───────────────────────── min (0 - 59)