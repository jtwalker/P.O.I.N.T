json.array!(@users) do |user|
  json.extract! user, :id, :external_user_id, :provider, :account_type, :name
  json.url user_url(user, format: :json)
end
