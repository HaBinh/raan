json.product do
  json.partial! "products/product", product: @product, rate: @rate
end