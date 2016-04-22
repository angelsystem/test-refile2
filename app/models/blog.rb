class Blog < ActiveRecord::Base
  has_many :pictures, dependent: :destroy
  accepts_attachments_for :pictures, append: true
  accepts_nested_attributes_for :pictures, allow_destroy: true
  # has_many :pictures, as: :imageable
end
