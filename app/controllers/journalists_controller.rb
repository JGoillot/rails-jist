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

  def favorite
    @journalists = current_user.journalists
  end

  def export
    @exported_jists = export_params[:jists][1..-1].map { |id| Journalist.find(id) }
    raise
  end

  private

  def research_params
    params.require(:research).permit(:words)
  end

  def export_params
    params.require(:export).permit!
  end

end
