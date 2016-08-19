class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      flash[:info] = "City Created!"
      redirect_to @city
    else
      render 'new'
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    if @city.update_attributes(city_params)
      flash[:success] = "City Updated!"
      redirect_to @city
    else
      render 'edit'
    end
  end

  def destroy
    City.find(params[:id]).destroy
    flash[:success] = "City deleted!"
    redirect_to cities_url
  end


    private

      def city_params
        params.require(:city).permit(:name, :country, :image_url)
      end

end
