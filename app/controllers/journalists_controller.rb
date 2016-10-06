class JournalistsController < ApplicationController
  def index
    words = research_params.join(" ")
    raise
    #@products = !(words.strip).empty? ? Product.pgsearch(words) : Product.all
    @products = Product.all
  end

  def show
  end

  private

  def research_params
    params.require(:research).permit(:words)
  end

end
