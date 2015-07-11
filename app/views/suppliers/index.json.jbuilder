json.array!(@suppliers) do |supplier|
  json.extract! supplier, :id, :name, :phone, :email
  json.url supplier_url(supplier, format: :json)
end
