module ProductsViews
  def products_show_view(product)
    puts 
    puts "#{product.name} - Id: #{product.id}"
    puts 
    puts product.description
    puts
    puts product.price
    puts product.tax
    puts "-------------------"
    puts product.total
  end

  def products_index_view(products)
    products.each do |product|
      puts "======================================"
      products_show_view(product)
    end
  end
end