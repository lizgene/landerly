class PagesController < ApplicationController
  def index
  end

  def admin
    @members = Member.all
  end

  def landing
    @member = Member.find_by_id(params[:id])

    @subjects = Subject.all

    return redirect_to root_path if @member.nil?
  end
end
