require 'unirest'

response = Unirest.get('http://localhost:3000/all_products_url')
data = response.body

puts JSON.pretty_generate(data)