class PersonalListsController < ApplicationController
  def create
    raise
    Personal_list.create(user: current_user, journalist: Journalist.find(params[:journalist_id])
  end

  def destroy
  end
end
