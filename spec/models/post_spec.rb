require 'spec_helper'

describe Post do
  it "should return the current amount of replys" do
    p = Factory.create(:post)
    p1 = Factory.create(:post)
    p.replys << p1
    p1.save
    p.replys.count.should 1
  end
  
  it "should return the correct amount of prefixes" do
    p = Factory.create(:post, :title => "[News] Hello how are you today?")
    p.prefixes.count.should == 1
  end
end