class Article < ActiveRecord::Base
  validates :name, presence: true
  attachment :image, type: :image

  # def presigned_url(expires_in = 7.days)
  #   byebug
  #   return nil if self.image_id.blank?
  #   obj = Aws::S3::Object.new('weclubdemo3', "cache/#{self.attachment_id}")
  #   obj.presigned_url(:get, expires_in: expires_in)
  # end
end
