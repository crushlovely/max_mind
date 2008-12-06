require File.dirname(__FILE__) + '/spec_helper.rb'

describe MaxMind::CityIspOrgService do
  
  it "base_path should be /f by default" do
    MaxMind::CityIspOrgService.base_path.should == '/f'
  end

  describe "response parsing" do
  
    before(:each) do
      @ip = '12.12.12.12'
      MaxMind::CityIspOrgService.license_key = '1234'
    end
  
    it "should return a hash of values if response is valid" do
      @valid_response = 'US,NY,Brooklyn,11222,40.728001,-73.945297,501,718,"Road Runner","Road Runner"'
      Net::HTTP.stub!(:get).and_return(@valid_response)
      @response = MaxMind::CityIspOrgService.fetch_for_ip(@ip)
      @response.should == {:latitude=>"40.728001", :longitude=>"-73.945297", :country=>"US", :city=>"Brooklyn", :postal_code=>"11222", :state=>"NY", :api_response => @valid_response}
    end

    ['WHAteVEr', 'g@rbag3', '432153'].each do |r|
      it "should return nil if response is invalid" do
        @invalid_response = ",,,,,,,,,,#{r}"
        Net::HTTP.stub!(:get).and_return(@invalid_response)
        @response = MaxMind::CityIspOrgService.fetch_for_ip(@ip)
        @response.should == {:api_response => @invalid_response}
      end
    end

  end

end
