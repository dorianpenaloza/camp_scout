class SearchController < ApplicationController
  before_action :set_camp, only: [:show, :edit, :update, :destroy]

  # GET /camps
  # GET /camps.json
  #def search
  #  @camps = Camp.all
   # create_markers
  #end
  
 # def create_markers
 #   @all_camps = Camp.all
  #  @hash = Gmaps4rails.build_markers(@all_camps) do |camp, marker|
   #       marker.lat camp.latitude
    #      marker.lng camp.longitude
     #     marker.infowindow "<a href='/camps/"+"#{camp.name}, #{camp.address}</a>"
      #  marker.json({ title: camp.name})
       #   marker.picture({
        # "url" => "http://icons.iconarchive.com/icons/thehoth/seo/32/seo-web-code-icon.png",
       #  "width" =>  32,
        # "height" => 32})
    #  end
#  end

end
