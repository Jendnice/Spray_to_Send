class ClimbsController < ApplicationController

    before_action :require_login
    before_action :find_climb, only: [:show]
   

    def index
        @climbs = Climb.all.alphabetical_order
    end

    def new
        @climb = Climb.new
        @climb.build_location
        locations
    end
 
    def create
        @climb = Climb.new(climb_params)
        if @climb.save
            redirect_to climbs_path
        else
            @climb.build_location
            locations
            render :new
        end
    end

    def show
        unless !(@climb == nil)
            redirect_to climbs_path
        end 
    end

    def ratings
        @climbs = Climb.grouped_ratings
    end

    def search
        @climbs = Climb.search(params[:query])
        render :index
    end

    private

    def climb_params
        params.require(:climb).permit(:name, :grade, :description, :location_id, location_attributes: [:name])
    end

    def find_climb
        @climb = Climb.find_by(id: params[:id])
    end

    def locations
        @locations = Location.all.alphabetical_order
    end

end

