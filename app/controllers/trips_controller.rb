 class TripsController < ApplicationController
    # include Enumerable
    before_action :find_trip, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
   
    def index
      if params[:category].blank?
        @trip = Trip.all.order("created_at DESC").page(params[:page]).per(6)
        @trip = Trip.where(["title LIKE ?", "%#{params[:search]}%"]).page(params[:page]).per(6)
      else
        @category_id = Category.find_by(name: params[:category]).id
        @trip = Trip.where(category_id: @category_id).order("created_at DESC").page(params[:page]).per(6)
      end
    end
    
    def show
    end
    
    def new
        @trip = current_user.trips.build
    end
    
    def create
        @trip = current_user.trips.build(trip_params)
        
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
        params.require(:trip).permit(:title, :description, :image, :category_id, itineraries_attributes: [:id, :name, :_destroy] , addons_attributes: [:id, :name, :_destroy])
    end
    
    def find_trip
        @trip = Trip.find(params[:id])
    end
end
