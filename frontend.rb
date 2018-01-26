require 'unirest'

require_relative 'controllers/products_controller'
require_relative 'views/products_views'
require_relative 'models/product'

class Frontend
  include ProductsController
  include ProductsViews

  def run
    system "clear"

    puts "Welcome to my Nerd Store"
    puts "make a selection"
    puts "    [1] See all products"
    puts "        [1.1] Search products by name"
    puts "        [1.2] Sort products by price"
    puts "    [2] See one product"
    puts "    [3] Create a new product"
    puts "    [4] Update a product"
    puts "    [5] Destroy a product"

    input_option = gets.chomp

    if input_option == "1"
      products_index_action
    elsif input_option == "1.1"
      print "Enter a name to search by: "
      search_term = gets.chomp

      response = Unirest.get("http://localhost:3000/products?search=#{search_term}")
      products = response.body
      puts JSON.pretty_generate(products)
    elsif input_option == "1.2"
      response = Unirest.get("http://localhost:3000/products?sort=price")
      products = response.body
      puts JSON.pretty_generate(products)
    elsif input_option == "2"
      products_show_action
    elsif input_option == "3"
      products_create_action
    elsif input_option == "4"
      products_update_action
    elsif input_option == "5"
      products_destroy_action
    end
    
  end
end