class CampsController < ApplicationController
  before_action :set_camp, only: [:show, :edit, :update, :destroy, :add_to_compare]

  # GET /camps
  # GET /camps.json
  def index
    @camps = Camp.all
    create_markers
  end



 # GET /camps/1
  # GET /camps/1.json
  def show
    @camps = Camp.find(params[:id])
    @hash = Gmaps4rails.build_markers(@camps) do |camp, marker|
          marker.lat camp.latitude
          marker.lng camp.longitude
          marker.infowindow "#{camp.name}"
          marker.json({ title: camp.name, id: camp.id})
          marker.picture({
         "url" => "http://icons.iconarchive.com/icons/thehoth/seo/32/seo-web-code-icon.png",
         "width" =>  32,
         "height" => 32})
        end
  end


def add_to_compare
  session[:cart] << @camp.id


  redirect_to '/compare'

end


def compare
   @hash = Gmaps4rails.build_markers(@cart.camps) do |camp, marker|
          marker.lat camp.latitude
          marker.lng camp.longitude
          marker.infowindow "#{camp.name}"
          marker.json({ title: camp.name, id: camp.id})
          marker.picture({
         "url" => "http://icons.iconarchive.com/icons/thehoth/seo/32/seo-web-code-icon.png",
         "width" =>  32,
         "height" => 32})
        end
end

  # GET /camps/new
  def new
    @camp = Camp.new
  end

  # GET /camps/1/edit
  def edit
  end

  # POST /camps
  # POST /camps.json
  def create
    @camp = Camp.new(camp_params)

    respond_to do |format|
      if @camp.save
        format.html { redirect_to @camp, notice: 'Camp was successfully created.' }
        format.json { render :show, status: :created, location: @camp }
      else
        format.html { render :new }
        format.json { render json: @camp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camps/1
  # PATCH/PUT /camps/1.json
  def update
    respond_to do |format|
      if @camp.update(camp_params)
        format.html { redirect_to @camp, notice: 'Camp was successfully updated.' }
        format.json { render :show, status: :ok, location: @camp }
      else
        format.html { render :edit }
        format.json { render json: @camp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camps/1
  # DELETE /camps/1.json
  def destroy
    @camp.destroy
    respond_to do |format|
      format.html { redirect_to camps_url, notice: 'Camp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


def search
    @location = params[:search]
    @distance = params[:miles]
    @camps = Camp.near(@location, @distance)

    if @location.empty?
     # gflash notice: "You can't search without a search term; please enter a location and retry!"
      redirect_to "/"
    else
      if @camps.length < 1
       # gflash notice: "Sorry! We couldn't find any farms within #{@distance} miles of #{@location}."
        redirect_to "/"
      else
        gmap(@camps)
        #create_markers
      end
    end
  end
  
private

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
        marker.infowindow "#{camp.name}, <br> #{camp.address}"
        marker.json({ title: camp.name, id: camp.id })
        marker.picture({
         "url" => "http://icons.iconarchive.com/icons/thehoth/seo/32/seo-web-code-icon.png",
         "width" =>  32,
         "height" => 32})
      end
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_camp
      @camp = Camp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camp_params
      params.require(:camp).permit(:name, :weeks, :cost, :telephone, :website, :address, :latitude, :longitude)
    end
end
