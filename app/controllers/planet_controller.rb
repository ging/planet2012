class PlanetController < ApplicationController
	#GET/planet/index
  def index
  end
#GET/planet/contact
  def contact
  end
#GET/planet/ejemplo
  def ejemplo
  end
#GET/planet/author
  def author
  end

  def search
  	if params[:search].length >= 3
    @sites = Site.where("name like ? OR description like ?", "%#{params[:search]}%", "%#{params[:search]}%")
    @trips = Trip.where("name like ? OR description like ?", "%#{params[:search]}%", "%#{params[:search]}%")
   	else
      render action: "errorSearch"
    end
  end
  
end