json.array!(@manager_votes) do |manager_vote|
  json.extract! manager_vote, :id
  json.url manager_vote_url(manager_vote, format: :json)
end
