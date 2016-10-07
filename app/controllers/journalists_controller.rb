class JournalistsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    words = session[:words]
    #@journalists = !(words.strip).empty? ? Product.pgsearch(words) : Journalist.all
    @journalists = current_user ? Journalist.all : Journalist.all[0...3]
  end

  def show
  end

  def research
    session[:words] = research_params[:words]
    redirect_to journalists_path
  end

  private

  def research_params
    params.require(:research).permit(:words)
  end

end
