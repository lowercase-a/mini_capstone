json.array! @products.each do |product|
  json.id product.id
  json.name product.name
  json.price product.price
  json.description product.description
  json.discounted product.is_discounted?
  json.images product.images
  json.tax product.tax
  json.total product.total
  json.categories product.categories
end
