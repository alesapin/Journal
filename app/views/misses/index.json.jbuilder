json.array!(@misses) do |miss|
  json.extract! miss, :id, :student_id, :pair, :hours
  json.url miss_url(miss, format: :json)
end
