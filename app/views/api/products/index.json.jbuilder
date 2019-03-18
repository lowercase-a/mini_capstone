json.array! @products.each do |product|
  json.name product.name
  json.price product.price
  json.description product.description
  json.discounted product.is_discounted?
  json.tax product.tax
  json.total product.total
end
