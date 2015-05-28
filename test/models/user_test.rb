require 'test_helper'

class UserTest < ActiveSupport::TestCase
   
   def setup
    @user=User.new(username: "john", email:"john@example.com")
   end
   
   test "user  should be valid" do
       assert @user.valid?
   end
   
   test "username should be present" do
       @user.username = " "
       assert_not @user.valid?
   end
   
   test "username should not be too long" do
       @user.username = "a"*41
       assert_not @user.valid?
   end
   
   test "username should not be too short" do
        @user.username = "aa"
       assert_not @user.valid?
   end
    
    test "email should be present" do
       @user.email = " "
       assert_not @user.valid?
    end
    
    test "email name less than 100 characters" do
        @user.email="a"*101 + "@example.com"    
        assert_not @user.valid?
    end
    
    test "email should be unique" do
        dup_user = @user.dup
        dup_user.email = @user.email.upcase
        @user.save
        assert_not dup_user.valid?
    end    
    
    test "email validation should accept valid addresses" do
        valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@scsc.ie benny+jetts@joeblogg.com]
        valid_addresses.each do |a|
            @user.email=a
            assert @user.valid?, '#{a.inspect} should be valid'
        end
        
    end
    
     test "email validation should reject invalid addresses" do
        invalid_addresses = %w[user@eee,com user_at_eee.com user.name@example. aeae@I_am_.com fee@ee+aar.com]
        invalid_addresses.each do |b|
            @user.email = b
            assert_not @user.valid?, '#{b.inspect} should be invalid' 
        end
    end
        
        
        
        
        
        
end