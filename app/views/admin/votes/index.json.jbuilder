json.array!(@admin_votes) do |admin_vote|
  json.extract! admin_vote, :id
  json.url admin_vote_url(admin_vote, format: :json)
end
