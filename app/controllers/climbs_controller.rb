class ClimbsController < ApplicationController

    before_action :require_login
    # before_action :find_climb, only: [:show, :edit, :update]
   

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

    def ratings
        @climbs = Climb.grouped_ratings
    end

    def show
        @climb = Climb.find_by_id(params[:id])
    end


    private

    def climb_params
        params.require(:climb).permit(:name, :grade, :description, :location_id, location_attributes: [:name])
    end

    # def find_climb
    #     @climb = Climb.find_by(id: params[:id])
    # end

end
