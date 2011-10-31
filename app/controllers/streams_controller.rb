class StreamsController < ApplicationController
  load_and_authorize_resource
  
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
  
  def edit
    @stream = Stream.find params[:id]
  end
  
  def update
    @stream = Stream.find params[:id]
    
    if @stream.update_attributes params[:stream]
      redirect_to streams_path, :notice => t(:stream_successfully_updated)
    else
      render :action => :edit
    end
  end
  
  def destroy
    Stream.find(params[:id]).delete
    redirect_to streams_path
  end
  
end
