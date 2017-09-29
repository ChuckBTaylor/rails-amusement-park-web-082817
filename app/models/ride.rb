class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def take_ride
    if enough_tickets? && tall_enough?
      self.change_user
      response = "Thanks for riding the #{self.attraction.name}!"
    else
      response = "Sorry. "
      response += enough_tickets? ? "" : "You do not have enough tickets to ride the #{self.attraction.name}. "
      response += tall_enough? ? "" : "You are not tall enough to ride the #{self.attraction.name}. "
      response.strip!
    end
  end

  def enough_tickets?
    self.user.tickets >= self.attraction.tickets
  end

  def tall_enough?
    self.user.height >= self.attraction.min_height
  end

  def change_user
    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.happiness += self.attraction.happiness_rating
    self.user.save
  end
end
