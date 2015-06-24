class Region < ActiveRecord::Base
    validates :name, presence: true, length: { minimum: 2, maximum: 25 }
    has_many :contract_regions
    has_many :contracts, through: :contract_regions
end
