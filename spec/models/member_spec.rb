require 'rails_helper'

RSpec.describe Member, type: :model do
  
  it "has a valid factory" do
    expect(create(:member)).to be_valid
  end

  it "fails validation if email is not present" do  
    expect { FactoryGirl.create(:member, email: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
  

end

