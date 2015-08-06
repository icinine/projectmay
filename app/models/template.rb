class Template < ActiveRecord::Base
    mount_uploader :attachment, TemplateUploader
    validates :name, presence: true
end
