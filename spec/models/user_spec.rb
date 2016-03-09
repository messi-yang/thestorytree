require 'rails_helper'

describe User do
  it "New User dont have it's id" do
    user = User.new(:email=>"hello@gmail.com")
    expect(user.id).to eq(nil) 
  end
end
