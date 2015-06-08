class Like < ActiveRecord::Base

belongs_to :user
belongs_to :contract

validates_uniqueness_of :user, scope: :contract
    
end
