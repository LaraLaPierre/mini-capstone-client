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
    puts "        [1.3] Sort products by name"
    puts "        [1.4] Sort products by description"
    puts "    [2] See one product"
    puts "    [3] Create a new product"
    puts "    [4] Update a product"
    puts "    [5] Destroy a product"
    puts "    [6] Show all orders"

    input_option = gets.chomp

    if input_option == "1"
      products_index_action
    elsif input_option == "1.1"
      products_search_action
    elsif input_option == "1.2"
      products_sort_action("price")
    elsif input_option == "1.3"
      products_sort_action("name")
    elsif input_option == "1.4"
      products_sort_action("description")
    elsif input_option == "2"
      products_show_action
    elsif input_option == "3"
      products_create_action
    elsif input_option == "4"
      products_update_action
    elsif input_option == "5"
      products_destroy_action
    elsif input_option == "6"
      orders_hashs = get_request("/orders")
      puts JSON.pretty_generate(orders_hashs)
    end
  end

private
  def get_request(url, client_params={})
    Unirest.get("http://localhost:3000#{url}", parameters: client_params).body
  end

  def post_request(url, client_params={})
    Unirest.post("http://localhost:3000#{url}", parameters: client_params).body
  end

  def patch_request(url, client_params={})
    Unirest.patch("http://localhost:3000#{url}", parameters: client_params).body
  end

  def delete_request(url, client_params={})
    Unirest.delete("http://localhost:3000#{url}", parameters: client_params).body
  end
end








