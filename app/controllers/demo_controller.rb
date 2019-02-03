class DemoController < ApplicationController
  
  def index
    session[:id] = nil
    session[:type] = nil
  end
end
