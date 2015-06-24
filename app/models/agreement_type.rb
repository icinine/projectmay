class AgreementType < ActiveRecord::Base
    validates :doctype, presence: true, length: { minimum: 2, maximum: 25 }
    has_many :contract_agreements
    has_many :contracts, through: :contract_agreements
end
