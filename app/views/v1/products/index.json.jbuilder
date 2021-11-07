json.array! @products do |product|
  json.partial! 'v1/products/product', product: product
end
