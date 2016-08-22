class StaticPagesController < ApplicationController
  layout 'static_pages'

  def home
  end

  def visited
  	@locations = Location.all
  end


end
