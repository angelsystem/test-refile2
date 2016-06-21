json.array!(@articles) do |article|
  json.extract! article, :id, :name, :body, :image_id, :image_filename
  json.url article_url(article, format: :json)
end
