class HomeController < ApplicationController
  def index
    redirect_to streams_path
  end

end
