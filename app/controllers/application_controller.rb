# == En esta clase
# [clase ApplicationController] Definimos instrucción para posibles ataques al servidor.
class ApplicationController < ActionController::Base
    
  protect_from_forgery
end
