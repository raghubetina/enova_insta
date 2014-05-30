json.array!(@followings) do |following|
  json.extract! following, :id, :leader_id, :follower_id
  json.url following_url(following, format: :json)
end
