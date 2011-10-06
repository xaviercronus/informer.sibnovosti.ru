class StreamsController < ApplicationController
  def index
    @streams = Stream.all
  end
end
