class ReviewsController < ApplicationController

    before_action :require_login
    before_action :find_review, only: [:show, :edit, :update, :destroy]
    before_action :created_by_current_user, only: [:edit, :update, :destroy]

    def index
        if find_climb
            @reviews = @climb.reviews.all  
        else
            climbs
            @reviews = Review.all
        end   

    end

    def new
        if find_climb
            @review = @climb.reviews.build
        else
            climbs
            @review = Review.new
        end    
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            flash[:message] = "Thanks for the spray!"
            redirect_to review_path(@review)
        else
            climbs
            render :new
        end
    end

    def show
        unless !(@review == nil)
            redirect_to reviews_path
        end  
    end 

    def edit
        climbs
    end
  
    def update
        if review_params.present? && review_params[:climb_id].present?
          @review.update(review_params)
             review_save
        else
         flash[:message] = "Your spray is missing some necessary content! Please try again."
         climbs_for_render_edit
       end
    end

    def destroy        
        if @review
          @review.destroy
          flash[:message] = "The spray has been removed!"
          redirect_to reviews_path
        else
          flash[:danger] = "The spray could not be removed!"
          redirect_to review_path(@review)
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
          flash[:danger] = "You cannot change or remove this spray because you did not create it!"
          redirect_to review_path(@review)
        end
    end

    def climbs
        @climbs = Climb.all.alphabetical_order
    end 

    def climbs_for_render_edit
        climbs
        render :edit
    end 
    
    def review_save
        if @review.save
            flash[:message] = "'#{@review.title}' has been updated!"
            redirect_to review_path(@review)
        else
            climbs_for_render_edit
        end
    end 

end



