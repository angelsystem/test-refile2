class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  attachment :file, type: :image
end
