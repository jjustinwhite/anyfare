class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      flash[:info] = "trip Created!"
      redirect_to @trip
    else
      render 'new'
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(trip_params)
      flash[:success] = "trip Updated!"
      redirect_to @trip
    else
      render 'edit'
    end
  end

  def destroy
    Trip.find(params[:id]).destroy
    flash[:success] = "trip deleted!"
    redirect_to trips_url
  end


    private

      def trip_params
        params.require(:trip).permit(:city_id, :bucket_id)
      end

end
