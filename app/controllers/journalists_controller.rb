class JournalistsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    words = research_params
    #@journalists = !(words.strip).empty? ? Product.pgsearch(words) : Journalist.all
    @journalists = Journalist.all
  end

  def show
  end

  private

  def research_params
    params.require(:research).permit(:words)
  end

end
