class RidesController < ApplicationController
    def create
        user = User.find(session[:user_id])
        attraction = Attraction.find(params[:attraction_id])
        ride = user.rides.build(attraction_id: attraction.id)
        if ride.take_ride.class != String
            ride.save
            flash[:message] = "Thanks for riding the #{attraction.name}!"
        else
            flash[:message] = ride.take_ride
        end
        redirect_to user_path(user)
    end
end