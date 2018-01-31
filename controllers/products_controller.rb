module ProductsController
  def products_index_action
    product_hashs = get_request("/products")
    products = Product.convert_hashs(product_hashs)

    products_index_view(products)
  end

  def products_show_action
    input_id = products_id_form

    product_hash = get_request("/products/#{input_id}")
    product = Product.new(product_hash)

    products_show_view(product)

    puts "Press enter to continue or type 'o' to order"
    user_choice = gets.chomp
    if user_choice == 'o'
      print "Enter a quantity to order: "
      input_quantity = gets.chomp
      client_params = {
                       quantity: input_quantity,
                       product_id: input_id
                      }
      json_data = post_request("/orders", client_params)
      puts JSON.pretty_generate(json_data)
    end
  end

  def products_create_action
    client_params = products_new_form
    json_data = post_request("/products", client_params)

    if !json_data["errors"]
      product = Product.new(json_data)
      products_show_view(product)
    else
      errors = json_data["errors"]
      products_errors_view(errors)
    end
  end

  def products_update_action
    input_id = products_id_form
    product_hash = get_request("/products/#{input_id}")
    product = Product.new(product_hash)

    client_params = products_update_form(product)
    json_data = patch_request("/products/#{input_id}", client_params)

    if !json_data["errors"]
      product = Product.new(json_data)
      products_show_view(product)
    else
      errors = json_data["errors"]
      products_errors_view(errors)
    end
  end

  def products_destroy_action
    input_id = products_id_form

    json_data = delete_request("/products/#{input_id}")
    puts json_data["message"]
  end

  def products_search_action
    print "Enter a name to search by: "
    search_term = gets.chomp

    product_hashs = get_request("/products?search=#{search_term}")
    products = Product.convert_hashs(product_hashs)

    products_index_view(products)
  end

  def products_sort_action(attribute)
    product_hashs = get_request("/products?sort=#{attribute}")
    products = Product.convert_hashs(product_hashs)

    products_index_view(products)
  end
end










