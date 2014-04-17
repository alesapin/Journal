json.array!(@pairs) do |pair|
  json.extract! pair, :id, :subject_id, :today
  json.url pair_url(pair, format: :json)
end
