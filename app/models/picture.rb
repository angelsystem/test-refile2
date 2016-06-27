class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  attachment :file, content_type: ["image/jpeg", "image/png", "image/gif"]

  validates_uniqueness_of :file_filename

  def file_name
    file_filename
  end

  def file_url
    uri = file.to_io.base_uri
    scheme = uri.scheme
    host = uri.host
    request_uri = uri.request_uri
    "#{scheme}://#{host}#{request_uri}"
  end
end
