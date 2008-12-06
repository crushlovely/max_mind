require File.dirname(__FILE__) + '/spec_helper.rb'

describe MaxMind::CountryService do
  
  it "base_path should be /a by default" do
    MaxMind::CountryService.base_path.should == '/a'
  end

  describe "response parsing" do
  
    before(:each) do
      @ip = '12.12.12.12'
      MaxMind::CountryService.license_key = '1234'
    end
  
    it "should return a hash of values if response is valid" do
      @valid_response = 'US'
      Net::HTTP.stub!(:get).and_return(@valid_response)
      @response = MaxMind::CountryService.fetch_for_ip(@ip)
      @response.should == {:country=>"US", :api_response => @valid_response}
    end

    ['WHAteVEr', 'g@rbag3', '432153'].each do |r|
      it "should return nil if response is invalid" do
        @invalid_response = "(NULL),#{r}"
        Net::HTTP.stub!(:get).and_return(@invalid_response)
        @response = MaxMind::CountryService.fetch_for_ip(@ip)
        @response.should == {:api_response => @invalid_response}
      end
    end

  end

end
