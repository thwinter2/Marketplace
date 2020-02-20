# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'admin', password: 'password', email: 'market5172020@gmail.com',
            phone: '123-456-7890', street_address: '123 Meeting St',
            city: 'Raleigh', state: 'North Carolina', zip: 27606, admin: true)
Item.create(name: 'Banana', brand: 'Chiquita', category: 'Produce', description: 'Yellow fruit that\'s high in' +
    'potassium.', image: 'https://balaskas.shop/cms/uploads/2018/05/0000020084.jpg', special_item: false,
            age_restricted: false, quantity: 30, cost: 0.49, tax_slab: 'No Tax')
Item.create(name: 'Apple', brand: 'Fuji', category: 'Produce', description: 'A red fruit known for its crunch',
            image: 'https://cdn.shopify.com/s/files/1/2336/3219/products/fuji_x850.jpg?v=1538674924',
            special_item: false, age_restricted: false, quantity: 45, cost: 1.5, tax_slab: 'No Tax')
