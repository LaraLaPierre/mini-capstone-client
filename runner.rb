require 'unirest'

system "clear"

puts "Welcome to my Nerd Store"
puts "make a selection"
puts "    [1] See all products"
puts "    [2] See one product"
puts "    [3] Create a new product"
puts "    [4] Update a product"
puts "    [5] Destroy a product"

input_option = gets.chomp

if input_option == "1"
  response = Unirest.get("http://localhost:3000/products")
  products = response.body
  puts JSON.pretty_generate(products)
elsif input_option == "2"
  print "Enter product id: "
  input_id = gets.chomp

  response = Unirest.get("http://localhost:3000/products/#{input_id}")
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "3"
  client_params = {}

  print "Name: "
  client_params[:name] = gets.chomp

  print "Description: "
  client_params[:description] = gets.chomp

  print "Price: "
  client_params[:price] = gets.chomp

  print "Image Url: "
  client_params[:image_url] = gets.chomp

  response = Unirest.post(
                          "http://localhost:3000/products",
                          parameters: client_params
                          )
  product_data = response.body

  puts JSON.pretty_generate(product_data)
elsif input_option == "4"
  print "Enter product id: "
  input_id = gets.chomp

  response = Unirest.get("http://localhost:3000/products/#{input_id}")
  product = response.body

  client_params = {}

  print "Name (#{product["name"]}): "
  client_params[:name] = gets.chomp

  print "Description (#{product["description"]}): "
  client_params[:description] = gets.chomp

  print "Price (#{product["price"]}): "
  client_params[:price] = gets.chomp

  print "Image Url (#{product["image_url"]}): "
  client_params[:image_url] = gets.chomp

  client_params.delete_if { |key, value| value.empty? }

  response = Unirest.patch(
                          "http://localhost:3000/products/#{input_id}",
                          parameters: client_params
                          )
  product_data = response.body

  puts JSON.pretty_generate(product_data)
elsif input_option == "5"
  print "Enter product id: "
  input_id = gets.chomp

  response = Unirest.delete("http://localhost:3000/products/#{input_id}")
  data = response.body
  puts data["message"]
end
