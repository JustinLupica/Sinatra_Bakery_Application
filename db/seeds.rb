Product.create(product_category: "Cupcakes", product_flavor: "Chocolate", product_size: "Dozen", quantity: 3)
Product.create(product_category: "Cakes", product_flavor: "Birthday Cake", product_size: "10 inch", quantity: 5)
Product.create(product_category: "Cheesecakes", product_flavor: "Marbled", product_size: "Dozen", quantity: 8)
Product.create(product_category: "Pies", product_flavor: "Cherry", product_size: "9 inch", quantity: 4)
Product.create(product_category: "Pies", product_flavor: "Apple", product_size: "9 inch", quantity: 6)

User.create(username: "test", password: "test")

Order.create(customer_id: 1, product_ordered: 3)