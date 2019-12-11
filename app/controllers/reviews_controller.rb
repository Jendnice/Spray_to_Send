class ReviewsController < ApplicationController

    before_action :require_login
    before_action :find_review, only: [:show, :edit, :update]
    before_action :created_by_current_user, only: [:edit, :update]

    def index
        if find_climb
            @reviews = @climb.reviews.all
        else
            @climbs = Climb.all.alphabetical_order
            @reviews = Review.all
        end   

    end

    def new
        if find_climb
            @review = @climb.reviews.build
        else
            @climbs = Climb.all.alphabetical_order
            @review = Review.new
        end    
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            flash[:message] = "Thanks for the spray!"
            redirect_to review_path(@review)
        else
            @climbs = Climb.all.alphabetical_order
            render :new
        end
    end

    def review
        @review = Review.find_by_id(params[:id])
        unless !(@review == nil)
            redirect_to reviews_path
        end 
    end

    def edit
        @climbs = Climb.all.alphabetical_order
    end
  
    def update
        if review_params.present? && review_params[:climb_id].present?
         @review.update(review_params)
             if @review.save
             flash[:message] = "'#{@review.title}' has been updated!"
             redirect_to review_path(@review)
             else
              @climbs = Climb.all.alphabetical_order
              render :edit
             end
       else
        flash[:message] = "Your spray is missing some necessary content! Please try again."
        @climbs = Climb.all.alphabetical_order
        render :edit
       end
    end

    private

    def review_params
        params.require(:review).permit(:stars, :title, :content, :climb_id)
    end

    def find_review
        @review = Review.find_by(id: params[:id])
    end

    def find_climb
        @climb = Climb.find_by_id(params[:climb_id])
    end

    def created_by_current_user
        unless @review.user_id == current_user.id
          flash[:danger] = "You cannot edit this spray because you did not create it!"
          redirect_to review_path(@review)
        end
    end


end
