class ReviewsController < ApplicationController

    before_action :require_login

    def index
        if @climb = Climb.find_by_id(params[:climb_id])
            @reviews = @climb.reviews.all
        else
            @reviews = Review.all
        end   

    end

    def new
        if @climb = Climb.find_by_id(params[:climb_id])
            @review = @climb.reviews.build
        else
            @review = Review.new
        end    
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    private
    def review_params
        params.require(:review).permit(:stars, :title, :content, :climb_id)
    end


end
