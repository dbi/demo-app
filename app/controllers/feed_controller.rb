class FeedController < ApplicationController
  
  def index
    @list = MynewsdeskAPI.fetch
  end
  
end
