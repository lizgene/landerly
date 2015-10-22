class MembersController < ApplicationController


  # PATCH/PUT /members/1
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def member_params
    params.require(:member).permit(:email, :first_name, :last_name, :preferences)
  end

end