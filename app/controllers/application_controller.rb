class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_types
  
  private #-----------------------
  
  def get_types
    @types = Type.find(:all)
  end
  
end
