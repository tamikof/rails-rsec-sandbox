json.extract! post, :id, :title, :body, :tag, :status, :is_admin, :created_at, :updated_at
json.url post_url(post, format: :json)
