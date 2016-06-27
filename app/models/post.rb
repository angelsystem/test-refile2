class Post < ActiveRecord::Base
  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_attachments_for :pictures, append: true
  accepts_nested_attributes_for :pictures, allow_destroy: true
  # ,
  #                               reject_if: ->(attr) { JSON.parse(attr[:picture]).empty? }

  def create_pictures! picture_params
    transaction do
      picture_params.each do |picture_param|
        pictures.create!(file: picture_param)
      end
    end
  end
end
