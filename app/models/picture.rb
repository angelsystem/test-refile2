class Picture < ActiveRecord::Base
  belongs_to :blog, polymorphic: true
  attachment :file  
end
