class PagesController < ApplicationController
  def index

  end

  def landing
    return redirect_to root_path unless params[:id] && @member=Member.find_by_id(params[:id])
  end
end
