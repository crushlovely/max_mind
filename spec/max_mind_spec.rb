require File.dirname(__FILE__) + '/spec_helper.rb'

describe MaxMind do

  it "should specify version as a constant" do
    MaxMind::VERSION.should_not be_nil
  end
  
end
