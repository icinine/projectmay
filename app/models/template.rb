class Template < ActiveRecord::Base
    mount_uploader :template, TemplateUploader
    validates :name, presence: true
end
