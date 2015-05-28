class Contract < ActiveRecord::Base
    #validates the Contract model tests in contract_test.rb
    validates :desc, presence: true, length: { minimum: 5, maximum: 500 }
    

end