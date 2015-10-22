class PagesController < ApplicationController
  def index

  end

  def landing
    @member = Member.find_by_id(params[:id])
    return redirect_to root_path if @member.nil?
  end
end
