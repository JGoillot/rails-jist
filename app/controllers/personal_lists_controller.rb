class PersonalListsController < ApplicationController
  def create
    PersonalList.create(user: current_user, journalist: Journalist.find(params[:journalist_id]))
    redirect_to journalists_path
  end

  def destroy
  end
end
