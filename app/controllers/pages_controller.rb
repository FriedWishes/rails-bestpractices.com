class PagesController < ApplicationController
  def show
    @page = Page.find_by_name(params[:name])
    unless @page
      render_404
    end
  end
end
