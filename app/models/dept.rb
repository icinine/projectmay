class Dept < ActiveRecord::Base
    has_many :contracts
end
