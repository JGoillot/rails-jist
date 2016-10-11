class PlansController < ApplicationController
  def show
    @plan = Plan.find_by(name: "Premium")
  end
end
