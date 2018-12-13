json.extract! user, :id, :email, :pswd, :member_since, :created_at, :updated_at
json.url user_url(user, format: :json)
