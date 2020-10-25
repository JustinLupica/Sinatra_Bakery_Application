Assosciations:

Orders => belongs_to :customer
has_many :products

Products => belongs_to :orders

Customers => has_many :orders

Tux -- Create a customer with an order_id relating to the object of an order instance

Order object to relate to the product that was ordered and return the object instance of the product.
