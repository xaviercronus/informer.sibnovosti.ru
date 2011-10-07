class StreamsController < ApplicationController
  def index
    @streams = Stream.all
  end
  
  def new
    @stream = Stream.new
  end
  
  def create
    @stream = Stream.create params[:stream]
    if @stream.save
      redirect_to streams_path, :notice => t(:stream_successfully_created)
    else
      render :action => :new
    end
  end
  
  def show
    @stream = Stream.find params[:id]
  end

end
