json.array!(@subjects) do |subject|
  json.extract! subject, :id, :title, :teacher
  json.url subject_url(subject, format: :json)
end
