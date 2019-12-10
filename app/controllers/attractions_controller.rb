class AttractionsController < ApplicationController
    helper_method :current_user

    def index
        @attractions = Attraction.all
        @user = current_user
    end

    def show
        @attraction = Attraction.find(params[:id])
        @user = current_user
    end

    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.create(attraction_params(:name, :happiness_rating, :nausea_rating, :tickets, :min_height))
        attraction.save
        redirect_to attraction_path(attraction)
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        attraction = Attraction.find(params[:id])
        attraction.update(attraction_params(:name, :happiness_rating, :nausea_rating, :tickets, :min_height))
        redirect_to attraction_path(attraction)
    end

    private

    def attraction_params(*args)
        params.require(:attraction).permit(*args)
    end

    def current_user
        User.find(session[:user_id])
    end
end