class UsersController < ApplicationController

  # Muestra una vista con todos los usuarios.
	def index
      	@users = User.all

    	respond_to do |format|
      		format.html # index.html.erb
      		format.json { render json: @users }
    	end
  	end

    # Muestra información sobre el usuario cuyo id se pasa como parámetro.
  	def show
    	@user = User.find(params[:id])

    	respond_to do |format|
      		format.html # show.html.erb
      		format.json { render json: @user }
    	end
  end

end
