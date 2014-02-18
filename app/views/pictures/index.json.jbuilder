json.array!(@pictures) do |picture|
  json.extract! picture, :id, :user, :poi
  json.url picture_url(picture, format: :json)
end
