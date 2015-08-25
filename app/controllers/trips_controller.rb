class TripsController < ApplicationController
    # include Enumerable
    before_action :find_trip, only: [:show, :edit, :update, :destroy]
   
    def index
        @trip = Trip.all.order("created_at DESC")
    end
    
    def show
    end
    
    def new
        @trip = Trip.new
    end
    
    def create
        @trip = Trip.new(trip_params)
        
        if @trip.save
            redirect_to @trip, notice: "Successfully create new trip"
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @trip.update(trip_params)
            redirect_to @trip
        else
            render 'edit'
        end
    end
    
    def destroy
        @trip.destroy
        redirect_to root_path, notice: "Successfully delete trip"
    end
    
    private
    
    def trip_params
        params.require(:trip).permit(:title, :description, :image, itineraries_attributes: [:id, :name, :_destroy] , addons_attributes: [:id, :name, :_destroy])
    end
    
    def find_trip
        @trip = Trip.find(params[:id])
    end
end
