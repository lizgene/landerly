class MembersController < ApplicationController
before_action :set_member, only: [:update]


  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to thankyou_path, notice: 'Member was successfully updated.' }
      
      else
        @error = @member.errors.full_messages.to_sentence
        format.html { redirect_to landing_path(id: @member.id), alert: "Something went wrong. #{@error}" }
      end
    end
  end


  private

    # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find_by_id(params[:id])
  end

  def member_params
    params.require(:member).permit(:email, :first_name, :last_name, :phone, 
    # {"preferences"=>{"subjects"=>"[\"math\", \"science\"]", "region"=>"[1, 2]", "price"=>"[\"free\"]", "start_date"=>""}

    #create a constant, loop through everything on the front-end
    {preferences: [ {subjects: []}, {region: []}, {price: []}, {start_date: []}]} 
    )
  end

end