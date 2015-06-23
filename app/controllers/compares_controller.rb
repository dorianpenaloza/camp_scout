class ComparesController < ApplicationController

  before_action :set_camp, only: [:destroy, :create]


  def create
    session[:cart] << @camp.id
    redirect_to action: "index"
  end

  def destroy
   session[:cart].delete(@camp.id) 
   redirect_to action: "index"
  end

  def drop
    session[:cart] = []
    redirect_to action: "index"
  end


  def index
     @hash = Gmaps4rails.build_markers(@cart.camps) do |camp, marker|
            marker.lat camp.latitude
            marker.lng camp.longitude
            marker.infowindow "<a href='/camps/"+"#{camp.id}"+"'>#{camp.name}</a>"
            marker.json({ title: camp.name, id: camp.id})
            marker.picture({
           "url" => "http://icons.iconarchive.com/icons/thehoth/seo/32/seo-web-code-icon.png",
           "width" =>  32,
           "height" => 32})
          end
  end


  private

  def set_camp
    @camp = Camp.find(params[:id])
  end

  def create_markers
    @all_camps = Camp.all
    @hash = Gmaps4rails.build_markers(@all_camps) do |camp, marker|
          marker.lat camp.latitude
          marker.lng camp.longitude
          marker.infowindow "<a href='/camps/"+"#{camp.id}"+"'>#{camp.name}</a>"
          marker.json({ title: camp.name, id: camp.id})
          marker.picture({
         "url" => "http://icons.iconarchive.com/icons/thehoth/seo/32/seo-web-code-icon.png",
         "width" =>  32,
         "height" => 32})
      end
  end

  # sets up the map hash for gmaps4rails
  def gmap(camps)
    @camps = camps
    @hash = Gmaps4rails.build_markers(@camps) do |camp, marker|
        marker.lat camp.latitude
        marker.lng camp.longitude
        marker.infowindow "<a href='/camps/"+"#{camp.id}"+"'>#{camp.name}</a>, <br> #{camp.address}"
        marker.json({ title: camp.name, id: camp.id })
        marker.picture({
         "url" => "http://icons.iconarchive.com/icons/thehoth/seo/32/seo-web-code-icon.png",
         "width" =>  32,
         "height" => 32})
      end
    end


end
