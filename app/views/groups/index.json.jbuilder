json.array!(@groups) do |group|
  json.extract! group, :id, :name, :course, :number_of_students
  json.url group_url(group, format: :json)
end
