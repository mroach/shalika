json.array!(@articles) do |article|
  json.extract! article, :id, :title, :content, :published, :published_at, :author, :slug
  json.url article_url(article, format: :json)
end
