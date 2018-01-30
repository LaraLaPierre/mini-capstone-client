require 'paint'

MARGIN = 10

module ProductsViews
  def products_show_view(product)
    puts 
    puts " " * MARGIN + Paint["#{product.name} - Id: #{product.id}", :white]
    puts " " * MARGIN + Paint["-" * 40, '#CC00CC']
    puts 
    product.description_lines.each do |description_line|
      puts " " * MARGIN + description_line
    end
    puts
    puts " " * MARGIN + "Supplier: #{product.supplier_name}"
    puts
    puts " " * MARGIN + "Price".rjust(30) + product.formatted_price.rjust(10)
    puts " " * MARGIN + "Tax  ".rjust(30) + "+ #{product.formatted_tax}".rjust(10)
    puts " " * MARGIN + Paint["-" * 40, '#CC00CC']
    puts " " * MARGIN + "Total".rjust(30) + product.formatted_total.rjust(10)
    puts
  end

  def products_index_view(products)
    products.each do |product|
      puts " " * MARGIN + "=" * 40
      products_show_view(product)
    end
  end

  def products_id_form
    print "Enter product id: "
    gets.chomp
  end

  def products_new_form
    client_params = {}

    print "Name: "
    client_params[:name] = gets.chomp

    print "Description: "
    client_params[:description] = gets.chomp

    print "Price: "
    client_params[:price] = gets.chomp

    print "Image Url: "
    client_params[:image_url] = gets.chomp

    print "Supplier Id: "
    client_params[:supplier_id] = gets.chomp

    client_params
  end

  def products_update_form(product)
    client_params = {}

    print "Name (#{product.name}): "
    client_params[:name] = gets.chomp

    print "Description (#{product.description}): "
    client_params[:description] = gets.chomp

    print "Price (#{product.price}): "
    client_params[:price] = gets.chomp

    print "Image Url (#{product.image_url}): "
    client_params[:image_url] = gets.chomp

    print "Supplier Id (#{product.supplier_id}): "
    client_params[:supplier_id] = gets.chomp

    client_params.delete_if { |key, value| value.empty? }
    client_params
  end

  def products_errors_view(errors)
    puts
    puts "Errors"
    puts "=" * 60
    errors.each do |error|
      puts error
    end
  end

  def products_search_form
    print "Enter a name to search by: "
    gets.chomp
  end
end















