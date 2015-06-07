class Contract < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
    #validates the Contract model tests in contract_test.rb
    validates :desc, presence: true, length: { minimum: 5, maximum: 500 }
    mount_uploader :picture, PictureUploader
    validate :picture_size
    
    private 
        def picture_size
            if picture.size > 5.megabytes
                errors.add(:picture, "Should be less than 5MB")
            end
        end
end