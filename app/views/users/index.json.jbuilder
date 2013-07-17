json.array!(@users) do |user|
  json.extract! user, :name, :dob, :address, :bio, :user_image, :username, :password_digest
  json.url user_url(user, format: :json)
end
