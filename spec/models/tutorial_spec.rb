require 'spec_helper'

describe Tutorial do
  #pending "add some examples to (or delete) #{__FILE__}"
  
  it "has a valid factory" do
  	expect(build(:tutorial)).to be_valid
  end

  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:url) }

  it { should belong_to(:user) }
end