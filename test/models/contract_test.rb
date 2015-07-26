require 'test_helper'

class ContractTest < ActiveSupport::TestCase
   
   def setup
       #User variable declared in test as each time a contract is created it is assigned to a User
    @user = User.create(username:"bob", email:"bob@exampe.com")
    @contract =@user.contracts.build(desc: "Mathadone", region: "National", value: 100000, saving: 15000, supplier: "Schein", contact:"Shane", dept: "MSP", download: "Yes")    
   end
       
    test "desc should be valid" do
       assert @contract.valid? 
    end
    
    test "user_id should be present" do
        @contract.user_id=nil
        assert_not @contract.valid?
    end
    
    test "desc should be present" do
       @contract.desc=" "
       assert_not @contract.valid?
    end
    
    test "desc should not be too long" do
        @contract.desc = "a" * 501 # Desc should be less than 500 characters
        assert_not @contract.valid?
    end
    
    test "desc should not be too short" do
        @contract.desc = "aaaa"
        assert_not @contract.valid?
    end
end