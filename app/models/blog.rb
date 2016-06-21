class Blog < ActiveRecord::Base
  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_attachments_for :pictures, append: true
  # accepts_nested_attributes_for :pictures, allow_destroy: true
end
