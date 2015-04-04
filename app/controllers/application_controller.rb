class ApplicationController < ActionController::Base
  #this Base gives method to inside controlles
  #you will be abla to use all is on this class
  protect_from_forgery with: :exception
end
