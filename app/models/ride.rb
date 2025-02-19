class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        if self.user.tickets >= self.attraction.tickets
            if self.user.height >= self.attraction.min_height
                self.user.tickets = self.user.tickets - self.attraction.tickets
                self.user.nausea = self.user.nausea + self.attraction.nausea_rating
                self.user.happiness = self.user.happiness + self.attraction.happiness_rating
                self.user.save
            else
                "Sorry. You are not tall enough to ride the #{attraction.name}."
            end
        else
            if self.user.height >= self.attraction.min_height
                "Sorry. You do not have enough tickets to ride the #{attraction.name}."
            else
                "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
            end
        end
    end
end
