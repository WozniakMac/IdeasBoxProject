json.array!(@manager_comments) do |manager_comment|
  json.extract! manager_comment, :id
  json.url manager_comment_url(manager_comment, format: :json)
end
