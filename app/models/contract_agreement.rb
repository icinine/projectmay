class ContractAgreement < ActiveRecord::Base
   belongs_to :contract
   belongs_to :agreement_type
end