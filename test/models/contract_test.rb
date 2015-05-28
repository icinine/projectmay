require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
   
   def setup
    @contract = Contract.new(desc: "Mathadone", region: "National", value: 100000, saving: 15000, supplier: "Schein", contact:"Shane", dept: "MSP", download: "Yes")    
   end
       
    test "desc should be valid" do
       assert @contract.valid? 
    end
    
    test "desc should be present" do
       @contract.desc=" "
       assert_not @contract.valid?
    end
    
    test "desc should not be too long" do
        @contract.desc = "a" * 501
        assert_not @contract.valid?
    end
    
    test "desc should not be too short" do
        @contract.desc = "aaaa"
        assert_not @contract.valid?
    end
end