json.array!(@depts) do |dept|
  json.extract! dept, :id, :name
  json.url dept_url(dept, format: :json)
end
