class Picture < ActiveRecord::Base
  belongs_to :blog
  attachment :file
  # belongs_to :blog, polymorphic: true
end
