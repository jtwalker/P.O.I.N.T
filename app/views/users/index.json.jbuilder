json.array!(@users) do |user|
  json.extract! user, :id, :uid, :provider, :account_type, :name
  json.url user_url(user, format: :json)
end
