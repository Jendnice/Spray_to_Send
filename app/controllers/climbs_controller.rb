class ClimbsController < ApplicationController

    def index
        @climbs = Climb.all
    end

    def new
        @climb = Climb.new
        @climb.build_location
    end

    def create
        @climb = Climb.new(climb_params)
        if @climb.save
            redirect_to climbs_path
        else
            @climb.build_location
            render :new
        end
    end

    # def ratings
    #     @climbs = Climb.grouped_ratings
    # end

    private

    def climb_params
        params.require(:climb).permit(:name, :type, :description, :location_id, location_attributes: [:name])
    end

end
